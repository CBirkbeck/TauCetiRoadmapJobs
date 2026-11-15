# Review of ArithmeticGaloisDuality (pull request #858 at 77ae83a)

**Verdict:** needs changes

Incremental re-review of the 102 lines changed since `c47fce6`, plus the pull request's title and description. "README" and "Suggested" mean `TauCetiRoadmap/ArithmeticGaloisDuality/README.md` and `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean`. Both README repairs are correct and the reworded passages are sound; the verdict comes from the push gate, which fails at this head on `statement-hygiene` (six hits in Suggested, which the diff did not touch), and from one sentence of the description.

## R01 (P3) — `letI` in the signatures of the two function-field Sha statements

**Location:** Suggested:223–224 and 249–250, "letI : ∀ v : TauCeti.Place k F, Field v.Completion := fun _ => inferInstance" and "letI : ∀ v : TauCeti.Place k F, Algebra F v.Completion := fun v => v.completionEmbedding.toRingHom.toAlgebra".

**Claim:** The gate's `statement-hygiene` rule refuses `letI` in a theorem signature (four hits: `sha_duality`, `centralObstruction_localization`); no acceptance while it fails.

**Witness:** Gate at `77ae83a`: `statement-hygiene=6 … FAIL`, lines 223, 224, 249, 250. Deleting the `letI` lines alone fails: `failed to synthesize (v : TauCeti.Place k F) → Field v.Completion`.

**Repair:** Use a named family with instances, as `AllPlace.Completion` already does, and pass it to `tateShafarevich`. Before `sha_duality`, inside `namespace GlobalFunctionField`:

```lean
/-- The completions of a global function field at its places, as a family. -/
def Completion (v : TauCeti.Place k F) : Type := v.Completion

instance (v : TauCeti.Place k F) : Field (Completion k F v) :=
  inferInstanceAs (Field v.Completion)

/-- Each completion is an algebra over the function field through the supplied embedding
`TauCeti.Place.completionEmbedding`. -/
instance (v : TauCeti.Place k F) : Algebra F (Completion k F v) :=
  v.completionEmbedding.toRingHom.toAlgebra
```

Then delete the four `letI` lines and replace each `(fun v : TauCeti.Place k F => v.Completion)` by `(Completion k F)`. Tested on a scratch copy: it elaborates with the twelve `sorry` warnings only, and both theorems keep every binder (`[Finite k]`, `[FunctionField k F]`, `0 < n`, `IsUnit (n : F)`, `n • x = 0`, the trivial-action hypothesis). Name `GlobalFunctionField.Completion` in the README where `GlobalFunctionField.sha_duality` is introduced (README:4173) and in the module docstring's list of supporting constructions.

## R02 (P3) — `letI` in the signature of `tate_vanishing`

**Location:** Suggested:263–264, "letI : TopologicalSpace (AddCommGroup.primaryComponent (AddCircle (1 : ℚ)) p) := ⊥" and "letI : DiscreteTopology (…) := ⟨rfl⟩".

**Claim:** Same gate rule, two hits.

**Witness:** Gate at `77ae83a`, `statement-hygiene`, lines 263 and 264.

**Repair:** Replace the two `letI` lines by instance binders before the colon:

```lean
theorem tate_vanishing (k F : Type) [Field k] [Finite k] [Field F] [Algebra (RatFunc k) F]
    [FunctionField k F] (p : ℕ) [Fact p.Prime] (hp : (p : k) ≠ 0)
    [TopologicalSpace (AddCommGroup.primaryComponent (AddCircle (1 : ℚ)) p)]
    [DiscreteTopology (AddCommGroup.primaryComponent (AddCircle (1 : ℚ)) p)] :
    Subsingleton (continuousCohomology 2 (TopRep.of (ContRepresentation.trivial ℤ
      (Field.absoluteGaloisGroup F) (AddCommGroup.primaryComponent (AddCircle (1 : ℚ)) p)))) := sorry
```

Tested on the same scratch copy: it elaborates, and the explicit form shows `ContRepresentation.trivial` taking the bound topology, not the subtype topology. The statement is unchanged in content, since the discrete topology on a type is unique.

## R03 (P3) — The description's dependency sentence points the wrong way and repeats a name

**Location:** Pull request description, "…are those of the README's supplier contracts and of the merge-order block above. Generic module-derived tensor, tower, Matlis and spectral-sequence inputs come from DerivedModuleAlgebra (DerivedModuleAlgebra (on main));"

**Claim:** The merge-order block follows this paragraph, it is not above it; and the parenthesis repeats the roadmap's name inside itself.

**Witness:** In the description the paragraph beginning "Dependencies" precedes both the `depends-on` and the `merge-order` blocks; "DerivedModuleAlgebra (DerivedModuleAlgebra (on main))" is the text as posted.

**Repair:** "…are those of the README's supplier contracts and of the merge-order block below. Generic module-derived tensor, tower, Matlis and spectral-sequence inputs come from DerivedModuleAlgebra (on main); …"

## Previous findings

- R01 — repaired: README:215–216, 537–538 and 6145–6146 now read "the elliptic identification `a ↦ O([−a] − [0])` that §A2.2 states in prose"; `AbelianScheme.dual_elliptic` no longer occurs. The supplier's §A2.2 Check at its head (its README:1131) carries the identification.
- R02 — repaired: README:199, 204, 529, 4861–4862 and 6577 cite DerivedModuleAlgebra by `§1.1`, `§1.3`, `§1.5`; "DerivedModuleAlgebra Layer 1" no longer occurs, and the resolver lists no cross-roadmap citation as found nowhere.

## Verified sound

| Statement (changed or cited by the change) | Instances and values on each side | Result |
| --- | --- | --- |
| Reciprocity for the S-idele classes, reworded proof sketch (README:2518–2526) | `ℚ`, `S = {p, ∞}`: `U_{ℚ,S} = ∏_{ℓ≠p} ℤ_ℓ^×`, compact; `C_S = ℝ_{>0} × ℤ_p^×`, `D_S = ℝ_{>0}` divisible, quotient `ℤ_p^× = G_S^ab`. `S` all places: `U = 1`, sequence is `0 → D_K → C_K → G_K^ab → 0`. Image of compact `U_{K,S}` is closed and contains each inertia group, whose sum is dense in it. | Same route as `milne-adt` lines 1943–1958; each step holds. |
| Tate's duality theorem for a class formation, reworded statement (README:2991–3005) | `M = ℤ`: `r = 2` gives `inv_G`; `r = 1` both sides 0; `r = 3` target `H^{−1} = 0` and `Ext³ = H³(G, C)(ℓ) = 0`; `r = 0` gives `C^G → G^ab`. (c) keeps the hypothesis of (b): `milne-adt` lines 1037–1039 say "in addition". | Agrees with `milne-adt` lines 1031–1039 (Theorem 1.13, PDF p. 33, printed p. 25); no hypothesis lost or added. |
| Poitou–Tate nine-term sequence, reworded statement and table (README:3443–3469) | Table against the source's grid read along the arrows (its middle row runs right to left): `r = 0`: finite, compact, compact; `r = 1`: discrete, locally compact, compact; `r = 2`: discrete, discrete, finite. `ℚ`, `S = {3, ∞}`, `ℤ/3`: `H⁰ = ℤ/3`, `P⁰ = ℤ/3 × Ĥ⁰(ℝ) = ℤ/3 × 0`, `H²(G_S, μ₃) = 0`, `β⁰` bijective. Infinite `S`: `P⁰` a full product (compact), `P²` a direct sum (discrete), `P¹` restricted (locally compact). | Agrees with `milne-adt` lines 2139–2160 (Theorem 4.10, PDF p. 64–65, printed p. 56–57); the middle row is not reversed. |
| Grothendieck local duality, `*Needs:*` line (README:4858–4864; seeded sample) | DerivedModuleAlgebra on main: `### 1.3 The derived completion reflector` (its README:2064, `DerivedDeRham.derivedCompletion` at 2083), `### 1.5 When ordinary quotient towers compute completion` (2160), `### 1.M.2` (2757). | Every cited section and name exists where cited. |
| Abelian-variety Ext Check (README:6145–6149) | `P` of order three: `[−P] ≠ [P]`, so `O_E((−P) − (O))` and `O_E((P) − (O))` differ; supplier's §A2.2 Check states the same order-three separation. | Convention agrees with the supplier. |
| `GlobalFunctionField.sha_duality`, `centralObstruction_localization`, `tate_vanishing` (R01, R02) | Repaired forms elaborated on a scratch copy: twelve `sorry` warnings, no error; elaborated types keep all binders; `𝔽₇(t)`, `M = ℤ/3`: `Ш²(M) = 0` while `H²(F, M) ≠ 0`, unchanged by the repair. | Repair changes form only. |

The rows for untouched statements stand as in the previous review, of `c47fce6`.

- Source locators checked against the text: 3 (`milne-adt` Lemma 4.5 at lines 1943–1958, Theorem 1.13 at 1031–1039, Theorem 4.10 at 2139–2160); the page arithmetic printed = PDF − 8 holds at all three.
- Cross-roadmap citations resolved for the changed passages: DerivedModuleAlgebra §§0.2, 1.1, 1.3, 1.5, 1.T.1, 1.M.1, 1.M.2, S.1 on main; AbelianSchemesAndArithmeticModuli §A2.2 at its open head; HeightsAndUnits is on main under `Completed/`, as the description says.
- Dependency check: `depcheck: 245 roadmaps, 2222 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Gate at `77ae83a`: every check 0 except `statement-hygiene=6` (R01, R02); `build=0`. `lake env lean` on Suggested: twelve `declaration uses sorry` warnings (lines 60, 93, 101, 110, 120, 137, 182, 204, 218, 241, 261, 278), nothing else.
- Signatures: the three "dropped binder" leads are the `[IsScalarTower k (RatFunc k) F]` section variable, which no statement needs; `tate_vanishing` rebinds `k`, `F` itself.
- No file changed outside the folder; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Title and description against the head: the title matches the README's; the summary block and the prose list match the eight layers and the README's Summary; InverseGaloisAndArithmeticFundamentalGroups and SelmerIwasawaCohomology cite this roadmap and are not cited as suppliers here. Only R03 is wrong.
- Remark, no change asked: the merge order lists InverseGaloisAndArithmeticFundamentalGroups (54) before this roadmap (62) although its README consumes §§R02.3.0d–R02.4.6 of this one; that is for the merge order, not this folder.

Overlap check: read SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, EulerSystemsAndKolyvaginSystems, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticGaloisRepresentations, ProfiniteCohomology, ClassFieldTheory, DerivedModuleAlgebra (the lists of `overlaps.md`; the third list is empty) for the changed passages; nothing shared. The overlap tool reports no dropped id, no second copy and no other pull request changing this roadmap.

Source independence: changed passages only; 3 passages compared with 1 source (`milne-adt`), none shared (the reworded statements share no run of words with lines 1031–1039 or 2139–2160 beyond formulas, and the topological table is in the roadmap's own indexed form); by lines naming a source, Nekovář 57 and Milne 45 of about 120 parenthesised locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- Nothing in the changed passages. Neukirch–Schmidt–Wingberg and Rubin, cited elsewhere in untouched text, remain unread as recorded in the review of `c47fce6`.

## Source issues

- **Misprint** in milne-adt at Theorem 4.10(b), printed p. 57: the source says the image of `β^r` for `M` equals the kernel of the map `γ^r` labelled with `M^D`, whose domain is the local group of `M^D`; it should name the `γ^r` whose domain is `P^r_S(K, M)`; affects nothing.

## For the human reviewers

- none
