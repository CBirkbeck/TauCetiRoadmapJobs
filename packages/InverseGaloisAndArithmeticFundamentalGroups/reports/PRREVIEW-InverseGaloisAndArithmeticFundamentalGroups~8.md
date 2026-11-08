# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at b275043)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since 7a351f7 (one file path in the *Needs:* line of
*Reduced Schur covers*). That repair is correct. The push gate, run now with the brief's command,
fails on its `dropped` rule. The 16 README citations of LocalFiniteGroupTheory are no longer allowed:
the project's dropped-names list gained that roadmap after the gate record kept for this head was
made. That failure is R01.

## R01 (P2) — The gate refuses LocalFiniteGroupTheory as a supplier (16 citations)

**Location.** README.md, the 16 lines the gate reports: 142, 264, 266, 423, 456, 3318, 3327, 3630,
4187, 4200, 4207, 4219, 4823, 4829, 4838, 5279. For example, README:140–143: “conjugacy of coprime
complements … and the Fitting subgroup … (**LocalFiniteGroupTheory**, L1 and L2); what Layer IG.4
keeps is the passage to profinite groups and the Fitting supplement theorem”.

**Claim.** Schur–Zassenhaus conjugacy for finite groups (with N or G/N solvable) and the Fitting
subgroup `F(G)` (nilpotence, characteristic, maximality, `Φ(G) ≤ F(G)`) come from LocalFiniteGroupTheory
L1 and L2. They are consumed by *Coprime semidirect products and admissible inertia* (3),
*Coprime profinite complements* and *Fitting supplements for solvable groups*.

**Witness.** The brief's gate command at b275043 prints `dropped=16 … FAIL`, starting with
`dropped: line 142: … (**LocalFiniteGroupTheory**, L1 and L2)`. The project configuration's
`gates.dropped_names_file` lists `LocalFiniteGroupTheory` among “names our roadmaps never cite as
suppliers”.

The worker's recorded gate (`dropped=0`) was cached for this head before the entry was added, so it
does not show this. The scan is the regex `\bLocalFiniteGroupTheory\b` over README.md and
Suggested.lean; Suggested.lean has no hit, and README.md has exactly these 16.

**Why owning them here is the repair.** The list describes its entries as other authors' pull
requests whose material the project owns itself. No roadmap on main or at the open heads states
either theorem apart from LocalFiniteGroupTheory: FiniteGroupInvariants (README:30, 320) and
OddOrderTheorem (README:67) both cite LocalFiniteGroupTheory L1–L2. The pinned libraries do not
state either theorem:

- Mathlib 1b1ccf4 has existence (`Subgroup.exists_right_complement'_of_coprime`) and the
  abelian-kernel transitivity `Subgroup.exists_smul_eq` (`GroupTheory/SchurZassenhaus.lean:103`),
  but no general conjugacy and no Fitting subgroup.
- Tau Ceti 2fd255d has no Fitting subgroup and no complement-conjugacy theorem (searched by object).

The review of 506a7ed raised these inputs as having two owners. The dropped-names entry now decides
that in favour of stating them here.

**Repair.** Own the two finite-group inputs again, as README targets only, with no Suggested.lean
declarations (the 506a7ed declarations were an API catalogue):

1. Restore *Conjugacy of coprime complements* in IG.3.4, immediately before *Coprime semidirect
   products and admissible inertia*, as it stood at 506a7ed (README:3273–3303 there):
   - Hypotheses: `N ⊴ G`, `Nat.Coprime (Nat.card N) N.index` (which forces `N = 1` or `N = G` for
     infinite `G`), and `N` or `G/N` solvable.
   - Conclusion: any two complements are conjugate by an element of `N`.
   - Proof route: induction, through `Subgroup.QuotientDiff` and `Subgroup.exists_smul_eq` for
     abelian `N`.
   - Locator: Ribes–Zalesskii Theorem 2.3.15.
   - Checks: `N = 1` and `N = G`; the four complements of `V₄` in `A₄`, permuted transitively by
     `V₄`; `C₂ × C₂` with `N = C₂ × 1` as the non-coprime negative control.
   - Drop its `*Lean:*` line.
2. Restore *The Fitting subgroup* in IG.4.3, immediately before *Fitting supplements for solvable
   groups*, as at 506a7ed (README:4195–4236 there):
   - Content: `F(G)` as the supremum of the nilpotent normal subgroups; Fitting's theorem for
     `N ⊔ M`; characteristic; contains every nilpotent normal subgroup; nilpotent for finite `G`;
     `Φ(G) ≤ F(G)` via `frattini_nilpotent`.
   - Locator: Huppert, Kap. III §4.
   - Checks: `p`-groups and `F(A₄) = V₄`; two order-2 subgroups of `S₃` as the
     normality control; the restricted product of the `D_{2^n}` as the finiteness control.
   - Drop its `*Lean:*` line and write `F(G)` without a backticked Lean name of this roadmap's
     own.
3. Rewrite the 16 lines to cite these targets (Layer IG.3 *Conjugacy of coprime complements*,
   Layer IG.4 *The Fitting subgroup*). Specifically:
   - Make the scope bullet at 140–143 and the sentences at 262–266 and 455–456 statements of
     ownership.
   - Replace the supplier clause at 423–427 by the two target names.
   - Put the two targets in the *Needs:* lines at 3326–3327, 4218–4220 and 4838–4839.
   - Delete the *From other roadmaps* bullet at 5279–5280.

Tested on the failing instance: once these 16 lines are rewritten, the regex matches nothing, so
`dropped` counts 0. The dependency check is unaffected, because LocalFiniteGroupTheory is in
neither the merge order nor its edges. The description's *Depends on* and *Merge order* lists name
#1634, and that entry goes with the citations.

## Previous findings

- R01 — repaired: README:3116–3117 “`TauCeti.FactorSet.characterTransgression_injective_of_range_inl_le_commutator`
  (`TauCeti/GroupTheory/GroupExtension/Character/Basic.lean`)”. At Tau Ceti 2fd255d that file exists
  and declares the theorem at line 129; the repair introduces nothing new.

## Verified sound

**Gate, elaboration, dependency check.**

- The brief's gate command, run on b275043: every counter is 0 except `dropped=16` (R01). That
  covers `set_option`, `sorry-data`, `imports`, `mathlib-subimports`, `statement-hygiene`,
  `readme-ids-missing`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty` and
  `outside-folder`.
- `lake env lean` on `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/Suggested.lean`
  exits 0 in 17 s with 18 diagnostics, all `declaration uses sorry`, at lines 78, 82, 89, 104, 112,
  119, 127, 181, 236, 256, 263, 279, 304, 326, 345, 370, 377 and 387. These are the same lines as at
  7a351f7.
- `Suggested.lean` is byte-identical to 7a351f7 (`git diff 7a351f7 HEAD` touches README.md only), and
  the pins are unchanged (Mathlib 1b1ccf4, Tau Ceti 2fd255d). So the 36 elaborated types in
  `scratch/signatures.md` and the previous `#check @` comparison still hold; nothing changed. The
  one-tactic padding probe of the previous report also stands: 17 of 18 sorried theorems resist it,
  and the 18th is Hilbert's theorem.
- Dependency check (the brief's command), output: `depcheck: 244 roadmaps, 2477 edges, 0 problem(s)`,
  with no UPWARD, CYCLE or `moved:` line.
- The worktree is clean. The diff outside the folder (`origin/main...HEAD`) is empty. The folder diff
  since 7a351f7 is the one README line.

**The changed line and what it names (opened at the pins).**

- `TauCeti.FactorSet.characterTransgression_injective_of_range_inl_le_commutator`,
  `TauCeti/GroupTheory/GroupExtension/Character/Basic.lean:129`:
  - Context: `namespace TauCeti.FactorSet` (line 47), with variables
    `{G M A : Type} [Group G] [CommGroup M] [CommGroup A] [MulDistribMulAction G M] [MulDistribMulAction G A]`,
    `α : FactorSet G M`, and `hA : ∀ g a, g • a = a` brought in by `include hA` (line 89).
  - Statement: `(hstem : (inl α).range ≤ commutator α.Extension) → Function.Injective (α.characterTransgression (A := A))`.
  - The transgression is `Additive (equivariantCharacterSubgroup G M A) →+ H2 (Rep.ofMulDistribMulAction G A)`
    (line 57), sending `χ` to the class of `χ ∘ α`.
  - This is exactly the README's “`χ ↦ χ_*[S]` is injective because `A ⊆ [S, S]`”, with the trivial
    action on `ℂˣ`.
- `CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`, `GroupTheory/FiniteAbelian/Duality.lean:63`
  (namespace `CommGroup`, line 28):
  - Hypotheses: `[CommGroup G] [Finite G] [CommMonoid M]` and `HasEnoughRootsOfUnity M (Monoid.exponent G)`.
  - Conclusion: `∃ φ : G →* Mˣ, φ a ≠ 1` for `a ≠ 1`.
  - This is the “characters of the finite group `A / im τ_S` separate its points” step.
- `AddCommGrpCat.injective_of_divisible`, `Algebra/Category/Grp/Injective.lean:54`: an instance
  under `[DivisibleBy A ℤ]`. This is the vanishing of `Ext(−, ℂˣ)`.
- Locator of *Reduced Schur covers*: wood-lifting lines 84–89 (the definition of `H₂(G, c)` and of
  a reduced Schur cover, printed p. 3), 90–105 (Lemma 2.2) and 106–113 (Lemma 2.3). Wood's
  definition of a Schur covering group (lines 69–74: a stem extension of maximal order, equivalently
  one whose class map is an isomorphism) is the equivalence the target proves for `|ker π| = |M(G)|`.
  Correct.

**Seeded sample, where it falls in the changed passage.** None of the 15 seeded targets is
*Reduced Schur covers*. Three of them depend on it, and those three were checked:

| Target (README line) | Source text read | Result |
| --- | --- | --- |
| The marked fibre product and the computation of `U(G, c)` (3231) | wood-lifting lines 61–81 (§2.1, p. 2), 84–121 (definition, Lemmas 2.2–2.4, p. 3), 124–160 (Thm 2.5 and proof, pp. 3–4) | Locator, hypotheses (finite `G`, `c` generating) and conclusion correct. The `φψ⁻¹` correction is right, and the source's `φ·ψ` at line 151 is the misprint below. |
| Tame central lift after adjoining roots (4998) | wood-moments lines 432–441 (Def. 3.1 setting, p. 388), 471–476 (Lemma 3.2: `4 ∣ |μ_L|`, `f^{|μ_L|} = 1`, tame, inertia in `c ∪ {1}`), 477–517 (proof, pp. 389–390, Poitou–Tate duality and Grunwald–Wang with `μ₄ ⊂ L`) | Locator and hypotheses correct. `L = K(μ_{4|S_c|})` gives both hypotheses of Lemma 3.2. The README states it for number fields, the scope the roadmap gives its class-field-theory statements. |
| The global arithmetic lifting invariant (5033) | wood-moments lines 432–463 (Def. 3.1, pp. 388–389: `z`, `β_v` in inertia matching `u` in the tame abelian exponent-`|S_c|` quotient, product over finite places, value in `A[|μ_K|]`), 625–635 (Lemma 3.10 end, Lemma 3.11, p. 393) | Correct. The README writes the matching condition in the local quotient `Q_v`; that implies Wood's condition in the global quotient. |

The other 12 seeded targets lie outside the changed passage and are untouched since the full review
of 7a351f7.

**Adversarial pass.** First the rows for the changed statement and its sampled dependents,
computed this round:

| Statement (line) | Instances and values on each side | Result |
| --- | --- | --- |
| *Reduced Schur covers*, comparison `τ_S : M(G) ≅ ker π` (3090) | `Q₈ → C₂²`: stem, `|A| = 2 = |M(C₂²)|`, `τ_S⟨i, j⟩ = iji⁻¹j⁻¹ = (ij)² = k² = −1`. `χ(−1) = −1` does not extend, since `−1 = i²` dies in `Q₈^{ab} = C₂²`, so its transgression is nonzero. `D₈ = ⟨r, s⟩`: `[r, s] = r·(sr⁻¹s⁻¹) = r² ≠ 1`, an isomorphism. `C₄ × C₂ → C₂²`: `[E, E] = 1 ⊉ A = ⟨(2, 0)⟩`; `χ` extends as `(a, b) ↦ i^a`, so its transgression is `0` and `τ = 0`; `hstem` is needed. Identity `C₂² → C₂²`: stem with `A = 1`, `τ : C₂ → 1` onto but not injective, so `|A| = |M(G)|` is needed | Holds; both hypotheses are necessary |
| *Reduced Schur covers*, `S_c` and its Checks (3106–3130) | `c = ∅`: `Q_∅ = 0`, `S_c = S`. `c = C₂² ∖ {1}`: `Q_c ∋ ⟨x, y⟩` generates `M`, so `S_c = Q₈/{±1} = D₈/⟨r²⟩ = C₂²`. `S_c^{ab} = Q₈^{ab} = C₂² = G^{ab}` | Checks correct |
| Marked fibre product (3231) | `G = C₂`, `c = {g}`: `M = 0`, `S_c = C₂`, `L = ℤ`, `δ(n) = gⁿ`, `P = {(gⁿ, n)} ≅ ℤ = U`. `G = C₂²`, `c = ∅`, `S_c = Q₈`, `L = 0`: `P = ker = {±1} ≅ C₂`, while `U(G, ∅) = 1` (no generators); no comparison, as `c` does not generate. Kernel `ℤ/3`, `k_x = 1`: `φψ⁻¹` gives `1 − 1 = 0`, `φψ` gives `1 + 1 = 2` | Checks correct |
| Tame central lift (4998) | `F = C₂`, `K = ℚ`: `M(C₂) = 0`, `S_c = C₂`, `L = ℚ(μ₈)`, and the lift is `φ|_{Γ_L}`. `F = S₆`, `ε = sign`: `(12)` and `(12)(34)(56)` are both odd involutions of different cycle type, so there are two classes and the datum is excluded. Trivial `φ` lifts trivially | Checks correct |
| Global arithmetic lifting invariant (5033) | `F = C₂`, `K = ℚ`, `n = 2`, `L = ℚ(ζ₈)`. `17 ≡ 1 (mod 8)` splits, so `L_v = ℚ₁₇` and `Q_v = ℚ₁₇ˣ/(ℚ₁₇ˣ)² ≅ C₂ × C₂` (all quadratic extensions tame, `p` odd), not cyclic. Over `2`: a tame quadratic extension of `ℚ₂(ζ₈)` is unramified, so `Q_v = C₂`, inertia maps to `1` and `β_v = 1` is allowed. `u = 1`: `β_v = 1` at every `v`, so `I = 1` | Checks correct |

Then the rows for the statements the diff leaves untouched, carried from the report on 7a351f7 with
its computed values:

| Statement (Lean line) | Values (report on 7a351f7) | Result there |
| --- | --- | --- |
| `IsHilbertian` (71) | Over `𝔽₂`: `Y² + Y + T` and `Y² + Y + T + 1` share no good `t`. Over `ℂ`: `Y² − t` always splits | Discriminates |
| `isHilbertian_ratFunc` (78) | Over `𝔽₂(S)(T)` at `t = S`: `Y² + Y + S` and `Y² + Y + S + 1` are irreducible (Artin–Schreier) | Holds |
| `hilbert_irreducibility` (89) | `r = 0` trivial. `r = 1`, `Y² − T₀`, `g = T₀`, `t = 3`: `Y² − 3` is irreducible | Holds |
| `infinite_full_group` (104) | `(Y² − 2)(Y² − T)`: at `t = 3` the group is `C₂²`; at `t = 8` it is `C₂` (excluded) | Holds |
| `of_isGalois_of_one_lt_finrank` (112) | `M = ℚ(μ_{2^∞})`, `L = M(∛2)`: degree 3. `L = M = ℚ̄` is excluded | Holds |
| `not_isTopologicallyFinitelyGenerated` (119) | `ℚ` has quotient `C₂^r`. `ℝ` has `C₂` and is not Hilbertian | Holds |
| `normal_subgroup_absoluteGaloisGroup_eq_bot` (127) | `ℝ` with `N = Γ_ℝ` is excluded by `hK`. `ℚ` with `N = Γ_{ℚ(i)}` is not finitely generated | Holds |
| `IsRationalClass`, `IsRigid`, `hasRegularRealization_of_rigid` (154–181) | `C₃` with `{a}` is not rational. `S₃` with classes (2A, 2A, 3A): 6 triples, one orbit. `G = 1` with `r = 0` is rigid. `C₂` with `r = 1` is not | Holds |
| `HasRegularRealization` (171) | `L = ℚ(i)(T)` is rejected as a constant extension | Discriminates |
| `degree`, `stable_classification` (206, 236) | For `C₂` with `c = {g}`, `deg [g]ⁿ = n` and there is one orbit per `n`. For `G = 1` with `c = ∅`, `U = 1`. For `1 ∈ c`, `[1]` is central | Holds |
| `exists_proper_solution_of_split_nilpotent` (256) | Kernel `1`: `β = s ∘ π`. `C₄ → C₂` over `ℚ(i)/ℚ` has no section and is excluded | Holds |
| `shafarevich` (263) | `S₃`: `ℚ(∛2, ω)`. `A₅`: no claim | Holds |
| `IsSupersolvable` (270) | `S₃`, `Q₈`: chains exist. `A₄`: `V₄` is not cyclic, so there is none | Discriminates |
| Grunwald, supersolvable and quaternion (279, 304) | `C₈` at `2` is excluded (`8 ∈ (2)`, Wang). `QuaternionGroup 2, 4, 8` have orders `8, 16, 32` | Holds |
| `exists_realizations_coprime_degrees` (326) | `G = 1`: `n = 1`. `n = 0`: the gcd is `0 ≠ 1` | Holds |
| `abhyankar_affine_curve` (345) | `g = 0`, `D = {∞}`: bound `0`. `C_ℓ`, `ℓ ≠ p`: no cover. `D = ∅` (junk value `0 − 1 = 0`) is excluded by `hD` | Holds |
| `exists_realization`, `exists_disjoint_realizations`, `inverseGaloisProblem_of_regular` (370–387) | `ℚ(T)(√T)` at `T = 2`. `M = ℚ(√2)`: `t = 3` works, `t = 8` is avoided | Holds |
| README targets (859, 1065, 1100, 1714–1762, 2122, 2226, 2635, 2741, 3033, 3316, 3475, 3840, 4093, 4184, 4456, 4815, 4850, 5091, 5188, 5941, 6421, 7004, 7178) | Values as tabulated in that report; none of these passages changed | Holds |

**Overlap leads (`scratch/overlaps.md`), re-checked.**

- PolynomialGaloisGroups Layer 9, said to be dropped by #763 and #986: both heads change only
  `TauCetiRoadmap/PolynomialGaloisGroups/{README.md, Suggested.lean, metadata.toml}`, a new folder
  with insertions only. The cited roadmap is `Completed/PolynomialGaloisGroups` on main eaf17b1, whose
  line 1385 is “### Layer 9: `Sₙ` as a Galois group over `ℚ`” and which neither pull request
  touches. This is a false positive.
- No open pull request changes this roadmap.
- `scratch/citations.md` lists no unresolved cross-roadmap citation. Its 51 Lean-name leads are the
  same as at 7a351f7 and lie outside the changed line.

**Ownership against open work.** I searched main and the 476 open heads with the roadmap tool for
Schur–Zassenhaus and the Fitting subgroup (results under R01). No new owner appeared for the objects
of the changed passage (reduced Schur covers, character transgression); Tau Ceti owns the
transgression theorem, and the roadmap cites it.

## Not verifiable

- Nothing in this round's scope. Restoring the two R01 targets brings back two locators that are
  not readable legally: Ribes–Zalesskii, *Profinite Groups*, Theorem 2.3.15 (seen only as cited at
  lwzb arXiv v2 p. 10), and Huppert, *Endliche Gruppen I*, Kap. III §4. Their mathematics is standard
  and was checked against the Checks above.
- These items from the report on 7a351f7 are outside the changed passage and unchanged: Serre,
  *Topics in Galois Theory*; Fried–Jarden; McCullough–Wanderley; Kollár IV.6.10.

## Source issues

- **Misprint** in wood-lifting at the proof of Theorem 2.5, p. 4: the source multiplies the lift `φ`
  by the discrepancy homomorphism `ψ` to fix the marked generators; it should multiply by `ψ⁻¹`,
  since `φ` sends each marked generator to `[x]k_x`; affects the proof.
- **Error** in wood-moments at Conjecture 5.1, p. 411: the conjecture lets `u` be any root of unity
  of the cyclotomic field, including `u = 1`, where the invariant is always trivial; `u` should be a
  generator of that group of roots of unity; affects a stated result.
