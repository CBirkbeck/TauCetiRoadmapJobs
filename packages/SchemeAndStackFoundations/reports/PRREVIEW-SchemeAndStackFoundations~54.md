# Review of SchemeAndStackFoundations (pull request #1276 at dc479b5)

**Verdict:** needs changes

This is an incremental re-review of the 22 README lines changed since 7a1c656 (the two contract pin lines and §4.3's `PredeformationFunctor.map` and `tangent_eq_derivations` glosses with two new Checks). `Suggested.lean` and every file outside the folder are unchanged. The previous R03 is repaired and the new locators and Checks verify. Two P3 findings are carried, nothing is new and nothing blocks:

- The contract still names main's library pins while this head's `lake-manifest.json` pins the older revisions, and the Tau Ceti lift §4.3 cites exists only at the newer pin.
- The order with the four open pull requests that conflict on this folder is still not stated.

## R01 (P3) — The contract says `lake-manifest.json` pins `1b1ccf4b`/`2fd255d9`; at this head it pins `f6090c70`/`358314d4`, where the cited derivation lift does not exist

Carried from r48 R01 (partly repaired: the wording was changed, the merge was not done). The new wording makes the claim directly checkable against the file it names, and at this head it is false.

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:355` "**From Mathlib** (`1b1ccf4b`, the pin in `lake-manifest.json`)"; `:396` "**From Tau Ceti** (`2fd255d9`, the pin in `lake-manifest.json`)"; `:411`, `:5134`, `:5139` "`derivationToTrivSqZeroExtEquivLift`".

**Claim.** The pins the two contracts name are those of `lake-manifest.json`, and the Tau Ceti lift §4.3 consumes exists at the pin this folder is elaborated against.

**Witness.** At dc479b5, `lake-manifest.json:8` reads `358314d4ab97…` (Tau Ceti) and `:18` reads `f6090c7095e1…` (Mathlib). At Tau Ceti `358314d4` the directory `TauCeti/RingTheory/Derivation/` holds `DualNumber.lean`, `Idempotent.lean`, `Localization.lean`, `Nilpotent.lean` and no `TrivSqZeroExt.lean`; `derivationToTrivSqZeroExtEquivLift` is declared only at `2fd255d9` (`TauCeti/RingTheory/Derivation/TrivSqZeroExt.lean:79`), as r48 recorded.

**Repair.** Merge `origin/main` (now `19d2a1c7`) into the branch, then run the push gate so its targeted build elaborates `Suggested.lean` at the pins the README names. The merge is conflict-free: `git diff --stat a0ad405e origin/main -- TauCetiRoadmap/SchemeAndStackFoundations` is empty (main has not touched the folder since the merge base), the branch changes nothing outside the folder, and main's only relevant change is `lake-manifest.json` (129 insertions, 106 deletions). No README edit is needed; do not revert the name to `derivationToDualNumberEquivLift`, which is absent at main's pin (main's own `README.md:396` and `:5161` still cite it and will be wrong at merge; this branch's rename is the fix).

**Tested on the refuting instance.** After the merge the manifest pins are exactly the two hashes the README names, so lines 355 and 396 become true, and `derivationToTrivSqZeroExtEquivLift` resolves at `TrivSqZeroExt.lean:79`. r48 checked statically that all nine `TauCeti.*` imports of `Suggested.lean` exist at `2fd255d9` and that the one declaration those modules lose (`finrank_cohomology_zero_trivial_eq_one`) is unused; the file is unchanged since.

## R02 (P3) — The order with the four open pull requests that conflict on this folder is still unstated

Carried from r48 R02 (not repaired).

**Location.** The pull-request description, which names "the separate relative-Proj proposal #1163" and no other pull request.

**Claim.** This head and the other open heads on this folder can merge in either order.

**Witness.** `roadmaps overlaps SchemeAndStackFoundations` (index 2026-11-09T02:40:34Z) lists four heads that conflict with dc479b5:

- #1656: `README.md` and `Suggested.lean`.
- #1807: `README.md`.
- #1808: `README.md` and `Suggested.lean`.
- #1854: `README.md`.

The heads of #1807, #1808 and #1854 still cite `derivationToDualNumberEquivLift` (their `README.md:396`/`:390`, `:5161`/`:5354` and `:5164`/`:5357`), the name this branch replaces.

**Repair.** In the description, state the order with one line per pull request. For #1656: it rebases on this pull request after merge, which its own review already presumes. For #1807, #1808 and #1854: which side rebases, and that the rebased side keeps `derivationToTrivSqZeroExtEquivLift`. No file changes.

**Tested on the refuting instance.** A description naming the four numbers with an order satisfies the overlap rule. The current description names none of them.

## Previous findings

- R01 — partly repaired: lines 355 and 396 now read "the pin in `lake-manifest.json`", but `lake-manifest.json` at this head still pins `f6090c70`/`358314d4` and the lift exists only at `2fd255d9`. Carried as R01.
- R02 — not repaired: the description still names only "the separate relative-Proj proposal #1163"; #1656, #1807, #1808 and #1854 still conflict on this folder. Carried as R02.
- R03 — repaired: `README.md:5134–5136` "`tangent_eq_derivations` (for `h_R`, `T = Der_Λ(R, k)` through Tau Ceti's `derivationToTrivSqZeroExtEquivLift` for the tower `Λ → R → k` … Example 90.11.11 (06IC))". The locator is right (below).

## Verified sound

### Scope

- The change set is `README.md` only: lines 355 and 396 (two words each), 5130–5136 (the `PredeformationFunctor.map` and `tangent_eq_derivations` glosses) and 5161–5167 (two new Checks replacing the one-line Check "`T_{h_R} ≅ Der_Λ(R, k)`").
- `git diff --stat 7a1c656 HEAD -- TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` is empty.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- No changed line adds a pull-request number, a process word, LaTeX, a `set_option`, a forbidden supplier or a copied passage. The two Checks are prose computations and name no Lean counterpart.

### Gate and dependency check

- The worker's gate at dc479b5 reports every counter 0 and `OK`, including `build=0`, `readme-ids-missing=0`, `depcheck=0` and `outside-folder=0`.
- The requested direction check printed:

```text
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

There is no `UPWARD`, `CYCLE` or `moved:` line.

### Elaboration, signatures and padding

- `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`, run from the worktree at its pins (`f6090c70`/`358314d4`), exits 0 with 73 `declaration uses sorry` warnings and no other diagnostic.
- The file is byte-identical to the one r41 probed at the same pins, so r41's one-tactic probe (73 of 73 refuse) and its `#check` comparison (157 signatures, none losing a section binder; the entry `on` is the extractor reading the module docstring at `Suggested.lean:47`) stand. The change touches no Lean statement.

### Source locators of the changed lines (Stacks book `book.pdf`, cached text)

| README citation | Cached text | Printed page | What the text says | Agrees |
|---|---|---|---|---|
| Example 90.11.11 (06IC), `:5136` | line 313324 | 6551 | For `F = h_S`, `S ∈ Ĉ_Λ`: `T_F = Mor(S, k[ε]) = Der_Λ(S, k)`, and `F(k[V]) = Der_Λ(S, V)`; `f ↔ D` via `f(s) = q(s) + D(s)` | yes |
| Definition 90.12.3 (06II), `:5132` | line 313387 | 6553 | the differential `dφ : T_F → T_G` is `φ` evaluated at `A = k[ε]` | yes |
| Lemma 90.12.4 (06IJ), `:5133` | line 313390 | 6553 | if `F` and `G` both satisfy (S2), `dφ` is `k`-linear | yes: the README's `H2` is Stacks's (S2) for set-valued functors (`README.md:5120–5121`, Remarks 90.10.3 and 90.16.9) |

The Stacks correspondence `f = q + D` at line 313331–313334 is the Tau Ceti lift `a ↦ inl (algebraMap A B a) + inr (d a)` (`TrivSqZeroExt.lean:68` at `2fd255d9`) with `A = R`, `B = M = k`; the subtype condition `(fstHom R B M).comp ψ = IsScalarTower.toAlgHom R A B` is the README's "`ρ_{k[ε]} ∘ f = ρ_R`" (`:5136`), since `fstHom` is the augmentation `k[ε] → k`.

### Library declarations opened

- `TauCeti.derivationToTrivSqZeroExtEquivLift` (`TauCeti/RingTheory/Derivation/TrivSqZeroExt.lean:79` at `2fd255d9`, main's `.lake`), forward map at `:68`; absent at `358314d4`, whose `Derivation/` directory has `DualNumber.lean` (`derivationToDualNumberEquivLift:71`), `Idempotent.lean`, `Localization.lean`, `Nilpotent.lean`.
- `DualNumber` is `abbrev … := TrivSqZeroExt R R` (`Mathlib/Algebra/DualNumber.lean:46` at both Mathlib pins), so "`TrivSqZeroExt k k` is `k[ε]`" (`:5135`) is definitional.

### Consumers and overlaps

- §4.3 keeps its number and heading; AlgebraicModuliForArithmeticGeometry cites "SchemeAndStackFoundations §4.3" (its `README.md:10066`) and still resolves. §4.4 (`:5195–5217`) consumes `H1`–`H4` and `T_F` unchanged.
- `scratch/overlaps.md`: no dropped id, no id defined only by an open revision, no id of this folder that other roadmaps cite and this pull request drops. The four conflicting heads are R02.
- The change introduces no new object; ownership is as r41 found it.

### Seeded sample

Of the fifteen seeded targets (0.5, 0.8, 0.20, 0.25, 0.27, 0.30, 1.12, 2.14, 2.17, 2.18, 2.22, 4.3, 4.14, 4.15, 5.7) only 4.3 falls in the changed lines; its three new locators are verified above. The others are untouched text that earlier reviews passed and were not re-read. No README locator is flagged unverified.

### Adversarial table: the changed statements, with computed values

| Statement | Instances tried | Values on each side / excluded model | Result |
|---|---|---|---|
| Contract pins (`:355, :396`) | the hashes against each manifest | README `1b1ccf4b`/`2fd255d9`; main's manifest (19d2a1c7) `1b1ccf4b…`/`2fd255d9…` (equal); head's `lake-manifest.json:18, :8` `f6090c70`/`358314d4` (different) | R01 |
| Merge conflict-freeness (R01 repair) | `a0ad405e..origin/main` on the folder; branch outside the folder | both diffs empty; main's `lake-manifest.json` +129/−106 | repair stands |
| `tangent_eq_derivations` (`:5134–5136`) | `Λ = ℤ_p`, `R = ℤ_p[[x]]`, `k = 𝔽_p` | `h_R(k[ε]) = {x ↦ aε}`: `p` points (any `f` is local, `f(x) ∈ kε`); `Der_Λ(R, k)` kills `m_R² + m_Λ R = (p, x²)`, so `≅ (x)/(x²) ≅ 𝔽_p` via `D(x)`: `p = p` | Pass |
| same, `p = 2`, ramified | `R = ℤ₂[π]/(π² − 2)`, `k = 𝔽₂` | `D(π² − 2) = 2π D(π) = 0` in `k`: `Der ≅ 𝔽₂`; points `π ↦ aε`, `(aε)² = 0 = f(2)`: `2 = 2` | Pass |
| same, `R = Λ` | `Λ = ℤ_p` | `Der_Λ(Λ, k) = 0`; `h_Λ(k[ε])` is the structure map alone: `1 = 1` | Pass |
| Lift gloss "lying over the tower's point" (`:5135–5136`) | `A = 𝔽₂[x]`, `B = M = 𝔽₂`, point `x ↦ 0` | with the condition: `x ↦ aε`, 2 points = `Der`, 2; wrong model without it: `x ↦ c + aε`, 4 ≠ 2, excluded by the subtype | Pass |
| Check `:5161–5163` (`T_{h_R}` versus the Zariski cotangent dual) | `R = ℤ_p[[x]]`: `m = (p, x)`, `m² = (p², px, x²)` | `R/m²` has `p³` elements (`a + bx`, `a ∈ ℤ/p²`, `b ∈ 𝔽_p`), so `m/m²` has `p²` elements with basis `p, x`; its dual `p²` ≠ `|T| = p`. The wrong model `T = (m_R/m_R²)^*` is refuted | Pass |
| Check `:5164–5167` (differential opposite to `f`, `t ↦ u²`) | `Λ = k`, `f : k[[t]] → k[[u]]`, point `u ↦ aε` | `h_S ⟶ h_R` is `g ↦ g ∘ f`; `t ↦ f(t) ↦ (aε)² = a²ε² = 0`: every point goes to the base point, `dφ = 0`; for `t ↦ u`: `t ↦ aε`, `dφ = id_k ≠ 0`. `T_{h_S} = Der_k(S, k) → Der_k(R, k)`, `D ↦ D ∘ f`, is contravariant in `f` as stated | Pass |
| same, degenerate | `f = id`; `S = k` (so `h_S` the one-point functor) | `dφ = id`; `T_{h_k} = 0 → T_{h_R}` is the zero map | Pass |
| `PredeformationFunctor.map` linearity (`:5131–5133`) | `F = h_{k[[t]]}`, `G = F/(t ↦ −t)` (`char k ≠ 2`), `φ` the quotient | `G` fails `H2` (`:5159–5160`); `T_G = k/±1` carries no vector-space structure, so `dφ` has no linearity to assert: the `H2` hypothesis on both functors is needed and is Stacks's (S2) in Lemma 90.12.4 | Pass |
| §4.3 *Needs:* (`:5138–5139`) | `DualNumber`, the lift | `DualNumber` at both Mathlib pins (`:46`); the lift at `2fd255d9` only | R01 |

### Adversarial table: rows carried from r48 and r41

These statements are unchanged at dc479b5. The values are those of r48 (which carried r41's).

| Statement | Instances | Values | Result |
|---|---|---|---|
| Tau Ceti contract at the named pin | 38 contract, 53 "Tau Ceti `…`", 37 qualified names | `2fd255d9`: all resolve; `358314d4`: all but the lift | R01 (r48) |
| Mathlib contract at the named pin | 82 names, 6 files | all resolve at `1b1ccf4b` and `f6090c70` | Pass (r48) |
| Lift gloss, `M ≠ B` (`:411–413`) | `A = 𝔽₂[x]`, `B = 𝔽₂`, `M = 𝔽₂²` | `Der = M`, 4; points `x ↦ (0, m)`, 4 | Pass (r48) |
| §0.30 `isDomain_stalk'` (`:2012–2013`, `Suggested.lean:390`) | `Spec(k × k)`; `Spec k[t]`; `Spec k[x]/(x²)` | stalks `k`; `k[t]_(t)`; not normal, excluded by the class field | Pass (r48) |
| `Henselization.existsUnique_lift` | `(ℤ,(5)) → (ℤ₅,(5))`; `(k,0)` | `g(I·R^h) = f(I)S ⊆ J`; one lift for `(k,0)` | Pass (r41) |
| `Henselization.fixed_of_henselian` | `(k[[t]],(t))`; `(ℤ,0)` | the unit is bijective; the colimit is `ℤ` | Pass (r41) |
| `Groups.artinBootstrap` | `F = h_X`, `a = 𝟙`; empty presheaf | the conclusion equals the hypothesis; `IsAlgebraicSpace ∅` holds | Pass (r41) |
| `Formal.grothendieck_existence`, `_fullyFaithful` | `A = k[[t]]`, `M = N = O`, `g_n = a_n` | kernels `(t^{n+1})`; `(a₀,a₁) = (0,1)` violates `hg` | Pass (r41) |
| `Formal.algebraize_hom` | `Y = 𝔸¹_A`, `(g₀,g₁) = (0,1)` | fails `hcompat` at `n = 0` (`1 ≠ 0`) | Pass (r41) |
| `DeJong.alteration_theorem` | `ℙ¹_k`, `Z` a point; `Z = ⊥` | identity alteration with `n = 1`; `Z = ⊥` excluded | Pass (r41) |
| `DeJong.semistable_alteration_theorem` | `ℙ¹_{k[[t]]}`, `Z = X_s`; `Z = ∅` | `R₁ = R`, `H = ∅`; `Z = ∅` fails `hZspecial` | Pass (r41) |
| `weil_bound` | `ℙ¹/𝔽₂`, `ℙ¹/𝔽₃`; `y² = x³ − x` over `𝔽₃` | `0 ≤ 0`; `|4 − 4| = 0 ≤ 2√3` | Pass (r41) |
| `Coherent.DQCoh.affineEquiv` | `A = ℤ`; `ℤ[0]`, `(ℤ/2)[0]` | `Ext¹(ℤ, ℤ/2) = 0` on both sides; `j_!O_U[0]` outside the essential image | Pass (r41) |
| `Picard.lineBundleClass_spec_equiv_pic` | `R = k`; Dedekind `R` with non-principal `P` | trivial groups; `P~ ↦ [P] ≠ 1`, refuting the inverse convention | Pass (r41) |
| `Curve.vectorBundleDegree_pullback` | `t ↦ u²`, `O(m)` | `finrank = 2`, `deg = 2m`; constant map excluded | Pass (r41) |
| `Chow.CH_coprod`, `coprodOver`, `coprod_locallyOfFiniteType` | `∐ 𝔸¹_κ`, `Σ[0_n]`; `∐ Spec κ`; `I = ∅` | `Σ div(t_n) ∈ RatEquiv`; `RatEquiv = 0` on points; the empty scheme is locally of finite type | Pass (r41) |
| §2.7 local cohomology | `I = 0`, `I = A`, `R/(π²)`; `K ⊗ K/R` | images `M`, `0`, all of `R/(π²)`; the map is `0 → 0` | Pass (r41) |
| §0.23 nil kernel and affine criterion | `k[x_i]/(x_i^i)`; `𝔽_{p²}/𝔽_p`; the cusp | `x_{m+1}^m ∈ I^m ∖ 0`; two `𝔽̄_p`-points against one | Pass (r41) |
| §5.9–§5.11 pairings | blow-up of `ℙ¹_R`; `E × E`; `ℙ¹ × ℙ¹`; symbolic `g, q` | `E² = −1`, kernel `(1,1)`; `ρ = 4, 6, 3`; signature `(1,1)`; `Γ₀·Δ₀ = N − q − 1` | Pass (r41) |
| Checks of §§0.12, 0.18, 1.5, 1.6, 1.14, 2.17, 2.20, 2.23, 3.2, 4.14, 4.20, 5.12 | r41 rows 110–126 | as computed in r41 | Pass (r41) |
| `Curve.cohomologyDim` junk value | infinite-dimensional `H¹` | guarded by `FiniteDimensional` | Pass (r41) |

### Headline theorems

Unchanged, as listed in r41 and r48: `Henselization.henselian`, `existsUnique_lift`, `fixed_of_henselian`; `Groups.artinBootstrap`; `Formal.grothendieck_existence`, `grothendieck_existence_fullyFaithful`, `algebraize_hom`; `DeJong.alteration_theorem`, `semistable_alteration_theorem`; `weil_bound`. The module docstring still names the theorems not statable at the pins with the carrier each lacks; §4.4 Schlessinger is one of them (`Suggested.lean:44–47`), consistent with §4.3's lift being cited in the README only.

### Remarks on untouched or changed text that ask for no change

- `instance IsNormalScheme.isDomain_stalk'` (`Suggested.lean:390`) has no docstring (noted in r48).
- Check `:5161–5163` ends "so the derivations are taken relative to `Λ`". The refuted wrong model is the Zariski cotangent dual `(m_R/m_R²)^*`, as the Check computes; absolute derivations `R → 𝔽_p` also kill `ℤ_p` (`D(p) = p·D(1) = 0`, `D(pb) = 0`) and give the same `p`, so the clause distinguishes `T_{h_R}` from the cotangent dual, not from `Der_ℤ(R, k)`. The sentence as written is true.

## Not verifiable

- I did not elaborate `Suggested.lean` at the pins the README names (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): this review may run Lean only in the pull request's worktree, which has the older pins. The static checks of r48 are what was done; the gate's build after the merge is the test.
- The fourteen seeded targets outside the changed lines (0.5, 0.8, 0.20, 0.25, 0.27, 0.30, 1.12, 2.14, 2.17, 2.18, 2.22, 4.14, 4.15, 5.7) were not re-read: an incremental review reads the changed passages.
- Hartshorne 1977, Liu 2002, Fulton 1998, Kleiman 1966 and Grothendieck 1957 are settled as uncertified or have no legal text, as recorded in r41. None is cited by the changed lines.
- Ownership against open pull requests was checked through `roadmaps overlaps` and through `roadmaps grep` for `derivationToDualNumberEquivLift` (main and #853, #1807, #1808, #1854 cite it; nothing else). I did not read every open README.

## Source issues

- none
