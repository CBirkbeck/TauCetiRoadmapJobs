# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 1b8b367)

**Verdict:** needs changes

Incremental re-review of the 65 README lines changed since 13ba9e1 (`Suggested.lean` is
unchanged). The previous review's only finding is repaired. The gate passes, the dependency check is
clean, and `Suggested.lean` elaborates with `sorry` as its only diagnostic. Every supplier section and
Tau Ceti declaration that the repair adds resolves where it is cited. One P3 remains: a gloss
added by the repair mislabels two of the four SchemeAndStackFoundations sections it annotates.

## R01 (P3) — The new IG.0 dependency gloss calls §§2.11 and 2.16 "intersection products"

**Location.** README:989–993, *Layer IG.0 → Dependencies*: "SchemeAndStackFoundations §§2.11,
2.16, 5.6, 5.9 (intersection products on smooth varieties and the intersection pairing on
surfaces)".

**Claim.** The parenthetical describes all four sections as intersection theory. Only §§5.6 and
5.9 are intersection theory. §2.11 and §2.16 supply the Kummer sequence and `𝔾_m` on curves. The
finite-level comparison `H¹(C_k̄, ℤ/ℓⁿ) ≅ Hom(J_C[ℓⁿ](k̄), ℤ/ℓⁿ)` in IG.0.T1 (README:512–514) uses
those two sections, not intersection products. Each of the other two clauses in the same sentence
names the content of every section it lists.

**Witness.** SchemeAndStackFoundations on main has `### 2.11 Hilbert 90, the Kummer and
Artin–Schreier sequences, finite pushforward` at its README:3656 and `### 2.16 Tsen's theorem, 𝔾_m
on curves and proper hypercoverings` at :3896. Its consumer note (README:7388–7390) says that
`VanishingCycles.curveEndomorphismTrace` consumes §§2.11, 2.16, 5.6 and 5.9.

**Repair.** Replace the parenthetical with "(the Kummer sequence, Tsen's theorem and `𝔾_m` on
curves for the finite-level `H¹`–Jacobian comparison; intersection products on smooth varieties
and the intersection pairing on surfaces for the graph–diagonal formula)". Tested on the instance
above: each of the four cited sections now has its content named, and the assignment matches the
IG.0.T1 *Needs:* line (README:520) and SchemeAndStackFoundations README:3656, 3896, 6921 and 7129.

## Previous findings

- R01 — repaired: README:380 adds "Proper-submersion trivialization | Supplied by
  ComplexComparisonPartII §C5.2 / `ehresmannFibration`". README:186 and 415–417 add
  DifferentialGeometry Layer 3, and README:7119–7121 adds it to the IG.5 Dependencies.
  README:278, 282 and 283 add `orderOf_sigma`, `permHom`, `pureSubgroup`, `prodMulEquiv`,
  `cast_map_prod_mul` and `isIso`.

The repair goes further than R01 asked, and these additions are correct too:
- JacobianChallenge Layers A–D, AbelianSchemesAndArithmeticModuli §§A3.2, A4.1, A6.10–A6.11 and
  SchemeAndStackFoundations §§5.1, 5.6, 5.9 are now in the Scope list (README:187–191) and the
  supplier contracts (418–420, 430–435).
- `TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup` (README:284, 2544–2546) and the file of
  `nonempty_splitting_iff_cohomologyClass_eq_zero` (README:281) are now listed.
- The IG.1, IG.2, IG.3 and IG.4 Dependencies paragraphs now name their Tau Ceti and SchemeAndStackFoundations inputs.
Every name and section these additions cite was checked; see below.

## Verified sound

**Gate, build, dependency check.**
- The worker's gate at 1b8b367: every counter 0, `OK`. I ran the gate again with
  the brief's moved merge order (`--order`) and `--build`: `set_option=0 … depcheck=0 … build=0 OK`, exit 0.
- The gate command from the brief without `--order` uses the configured order. There it reports
  `depcheck=3`: UPWARD to ArithmeticGaloisDuality (#59), ArithmeticGaloisRepresentations (#56) and
  SieveMethodsAndPrimePatterns (#55), because that order lists this roadmap at #52. The same order
  with `--movable` prints `moved: InverseGaloisAndArithmeticFundamentalGroups moved in the merge
  order from #52 to #59, right after its last supplier ArithmeticGaloisDuality …` and `depcheck:
  239 roadmaps, 2370 edges, 0 problem(s)`. This is the move the worker makes on submission, not a
  defect.
- The dependency check from the brief (moved order, `--movable`), output in full:
  `depcheck: 239 roadmaps, 2370 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line. In
  that order, JacobianChallenge is at line 1, ComplexComparisonPartII at 39,
  AbelianSchemesAndArithmeticModuli at 41 and this roadmap at 59. DifferentialGeometry,
  JacobianChallenge and SchemeAndStackFoundations are on main (fb998610).
- `lake env lean Suggested.lean`: exit 0, 18 diagnostics, all `declaration uses sorry`, at lines 78,
  82, 89, 104, 112, 119, 127, 181, 236, 256, 263, 279, 304, 326, 345, 370, 377 and 387. These are the
  same as at 13ba9e1.
- `git diff --stat origin/main...HEAD` outside the folder: empty. `git diff --stat 13ba9e1 HEAD`:
  only `README.md`.
- `#check @name` audit: the scratch copy with 36 `#check @` lines elaborates (exit 0, 36 types
  printed). The binders are unchanged from the previous round: `shafarevich` keeps
  `[Group.IsSolvable G]`; `hasRegularRealization_of_rigid` keeps `[CharZero K]`, `[Finite G]` and
  `center G = ⊥`; `abhyankar_affine_curve` keeps `[IsAlgClosed k]`, `[CharP k p]` and `D.Nonempty`.
  Nothing changed.
- Padding probe and headline list: carried from the previous report, since the Lean file is
  unchanged. It found no padding. The seven statable end theorems are stated, and the Hurwitz,
  trace-formula, local-system, pro-étale `π₁`, Brauer–Manin, Property E and patching headlines are
  named as not statable in the docstring.

**Tau Ceti declarations opened at 2fd255d (8 new contract descriptions checked against the source).**
- `GroupTheory/SpecificGroups/Braid/Basic.lean`:
  - `orderOf_sigma` (:136) is `orderOf (sigma i) = 0`, i.e. infinite order.
  - `permHom` (:358) is `BraidGroup n →* Equiv.Perm (Fin n)`.
  - `pureSubgroup` (:504) is `(permHom n).ker`.
- `GroupTheory/GroupExtension/Character/Basic.lean:129`,
  `characterTransgression_injective_of_range_inl_le_commutator`: hypotheses `hA` (trivial action
  on `A`) and `hstem : (inl α).range ≤ commutator α.Extension`. The docstring says "No finiteness
  or divisibility assumption is needed", and the README row (281) says the same.
- `GroupTheory/GroupExtension/Cohomology.lean:319`: `nonempty_splitting_iff_cohomologyClass_eq_zero`.
- `AlgebraicTopology/FundamentalGroup/Product.lean:58`: `TauCeti.FundamentalGroup.prodMulEquiv`
  is `π₁(X × Y, (x, y)) ≃* π₁(X, x) × π₁(Y, y)`.
- `AlgebraicTopology/FundamentalGroup/TopologicalMonoid.lean:110`: `cast_map_prod_mul` is in
  namespace `FundamentalGroup` (no `TauCeti` prefix, as the README says), for
  `[MulOneClass M] [ContinuousMul M]`, which includes topological monoids.
- `AlgebraicGeometry/AffineGroupScheme/SimplyConnected.lean`:
  - the property (:76) quantifies over central isogenies `H ⟶ G` from semisimple `H`;
  - `isIso` (:98) concludes `IsIso f` when the *target* `G` is simply connected, which matches
    "onto a simply connected one".
- `Topology/Algebra/Group/Generation.lean:261`: `of_openSubgroup` assumes `[CompactSpace G]`. In
  IG.2.8 (README:2475–2480) it is applied to `H` open in a closed subgroup `N` of the profinite
  `Γ_k`, so `N` is compact.

**Cross-roadmap citations of the changed text, resolved.**
- ComplexComparisonPartII (#848), `### C5.2 Families, Ehresmann and the Gauss–Manin connection`:
  - The target "Prove `ehresmannFibration`" (its lines 3109–3139) covers a proper surjective
    holomorphic submersion of finite-dimensional Hausdorff second-countable complex manifolds. It
    gives componentwise local triviality, and its trivializations after base change are the
    pullbacks of the chosen ones. This is exactly the README:380 row.
  - Its ownership table (line 146) says later roadmaps consume the holomorphic application from
    C5.2. So C5.2, not SmoothBundlesConnections B1.5, is the right owner.
  - ComplexComparisonPartII names this roadmap only as a downstream consumer (lines 114, 4966,
    4988).
- DifferentialGeometry on main, `### Layer 3: flows` (README:371): 3.2 maximal flow, 3.3
  completeness of compactly supported fields, 3.5 time-dependent flows. These match the gloss at
  README:415–416. At the head of the open revision (#886), Layer 3 is still `### Layer 3: flows`
  (its line 844), with 3.3 `isCompleteVectorField_of_isCompact` and 3.5 at line 888. It is for
  boundaryless manifolds (its line 172), which is the IG.5.4 case.
- JacobianChallenge on main: Layers A (line bundles, divisors, Picard, degree), B (coherent
  cohomology, Riemann–Roch, Serre duality), C (relative cohomology and base change) and D (relative
  Picard functor and Jacobian) are at README:111, 135, 143 and 218. These match README:418–420.
- AbelianSchemesAndArithmeticModuli (#849):
  - `### A3.2 Multiplication maps and prime-to-characteristic torsion density`,
    `### A4.1 The integral Tate module` (`AbelianTate`),
    `### A6.10 The characteristic polynomial and the trace` (`End.trace`) and
    `### A6.11 The characteristic polynomial on the Tate module` (`charpolyTate`).
  - Its lines 241–252 and 3929–3937 name this roadmap's IG.0.T1 as a downstream consumer only,
    so there is no cycle.
- SchemeAndStackFoundations on main: §2.11 (:3656), §2.16 (:3896), §5.1 *Rational equivalence,
  Chow groups and the divisor class comparison* (:6567), §5.6 (:6921) and §5.9 (:7129). The IG.4
  use of §5.1 is in the *Needs:* line of *Collectively coprime realization degrees* (README:4848),
  and README:5371 repeats it.
- Internal targets named by the new Dependencies sentences exist in the layer they are attributed
  to:
  - *Pointed finite étale covers of semisimple groups* (README:1471, IG.1; its *Needs:* at
    1505–1506 lists the three Tau Ceti names);
  - *Normal subgroups of absolute Galois groups* (2462, IG.2.8);
  - *Reduced Schur covers* (3100, IG.3.4; *Needs:* at 3126);
  - *General-genus Hurwitz comparison* (5808, IG.5.4; *Needs:* at 5832–5834);
  - *Configurations and punctured-disc groups* (5460, IG.5.1; *Needs:* at 5477–5478).

**Overlap leads.** "PolynomialGaloisGroups Layer 9 dropped by #763 and #986" is still a false
positive. Both heads add new folders whose first lines continue the completed roadmap.
`Completed/PolynomialGaloisGroups/README.md:1385` is still `### Layer 9: Sₙ as a Galois group over
ℚ`. No open pull request changes this roadmap. The change adds no owned object; it only adds
consumptions. Ownership against the sibling checkouts is as in the previous report.

**Seeded sample.** None of the 15 sampled targets lies in the changed lines; they start at
README:614, 779, 881, 1026, 1213, 1436, 2930, 3170, 3990, 4419, 5037, 6266, 6417, 6945 and 7433.
I grepped each target from its heading to its **Checks.** for the changed contract names
(`BraidGroup.*`, `characterTransgression*`, `prodMulEquiv`, `cast_map_prod_mul`,
`simplyConnected*`, `of_openSubgroup`, `ehresmannFibration`, DifferentialGeometry,
JacobianChallenge, AbelianSchemesAndArithmeticModuli, §5.1/5.6/5.9, *Reduced Schur covers*). There
was no match, so none of them depends on a changed passage, and their locator checks stand from the
earlier rounds. The README flags no locator as unverified (`grep -i unverified`: 0). The changed
text cites no source.

**Adversarial pass.** New rows for the changed contract statements, with computed values:

| Statement (README line) | Instances and values | Result |
| --- | --- | --- |
| `orderOf_sigma`, `permHom`, `pureSubgroup` (278) | `n = 2`: `B₂ ≅ ℤ` on `σ₀`, `orderOf σ₀ = 0` (Mathlib's value for infinite order); `permHom σ₀ = swap 0 1`; `pureSubgroup 2 = ⟨σ₀²⟩` of index `2 = |S₂|`. `n = 3`: `permHom` onto `S₃`, index `6`. `n = 0, 1`: `Fin (n − 1) = Fin 0`, no generators, `B_n = 1` | Holds |
| Transgression injectivity (281) | Stem `Q₈ → C₂ × C₂`, kernel `{±1} = [Q₈, Q₈]`, `A = ℂ^×`: sign ↦ nonzero class of `H²(C₂², ℂ^×) ≅ ℤ/2` (`Q₈` is a Schur cover), trivial ↦ 0, so injective. Non-stem `C₄ → C₂`, `A = ℂ^×`: `[C₄, C₄] = 1`, `H²(C₂, ℂ^×) = 0`, sign extends (`1 ↦ i`), both ↦ 0, not injective: hypothesis needed. Same `C₄`, `A = C₂`: `1 ↦ ±1` forces `2 ↦ 1`, sign does not extend, injective anyway. The README claims only sufficiency | Holds |
| `prodMulEquiv` (282) | `S¹ × S¹`: `ℤ²`; `pt × Y`: `1 × π₁(Y)` | Holds |
| `cast_map_prod_mul` (282) | `M = S¹ ⊂ ℂ^×`, loops `e^{2πiat}`, `e^{2πibt}`: pointwise product winds `a + b`, the product in `π₁ = ℤ`. Wrong model (figure-eight, `π₁ = F₂`): no continuous unital multiplication, excluded by `[ContinuousMul M]` | Holds |
| Simply connected `isIso` (283) | `id : SL₂ → SL₂`: iso. `SL₂ → PGL₂` (kernel `μ₂`) is central, not iso; its target is not simply connected, so this is no counterexample. The reversed reading "from a simply connected group" would make it an iso, which is false, and the README says "onto" | Holds |
| `of_openSubgroup` (284) | `ẑ` generated by `1`; open `nẑ` generated by `n`. Discrete `F₂` is finitely generated, but `[F₂, F₂]` is open and of infinite rank, so compactness is needed and stated | Holds |
| `ehresmannFibration` row (380) | `ℂ² ∖ {0} → ℂ`, `(x, y) ↦ x`: surjective submersion, fibres `ℂ^×` at 0 and `ℂ` elsewhere, not locally trivial; it is not proper, so excluded. A family with fibres `P¹` over one component and an elliptic curve over another has non-diffeomorphic fibres: "over each connected component" is needed. `P¹ × S → S`: pullback chart is the product chart | Holds |
| DifferentialGeometry Layer 3 (415) | `v = 1` on `ℝ`: flow `x + t`, complete. `v = x²` from 1: `1/(1 − t)`, defined for `t < 1`, incomplete; a compactly supported (bump-cut) field is complete, which is the case IG.5.4 uses | Holds |
| IG.0.T1 inputs (418–420, 433–435, 520) | `ℙ¹`: `H¹ = 0`, `Δ·Γ_φ = 1 + deg φ`. `E : y² = x³ + x` over `𝔽₃` (disc `−4 ≢ 0`): points `(0,0)`, `(2,±1)`, `∞`, total 4, so `Tr(F | T_ℓ) = 1 + 3 − 4 = 0` (supersingular, `3 ≡ 3 mod 4`). Translation by `P ≠ O`: `1 − 2 + 1 = 0` fixed points. Identity on genus `g`: `Δ² = 2 − 2g = 1 − 2g + 1` | Holds |
| §5.1 zero-cycles in IG.4 (432, 4848, 5371) | Degrees `2, 3`: `3·1 + 2·(−1) = 1` with signed coefficients, gcd 1 | Holds |

The rows for statements the diff leaves untouched are carried from the previous report
(the review at 13ba9e1, *Adversarial pass*), unchanged:
- Lisse-part comparison: `𝔾_m` monodromies, nodal monodromy `p`, no stable lattice.
- Bounded lattice schemes: `2m+1` lattices.
- Pro-étale `π₁`: nodal surjection onto `ℤ`.
- Henselian base: `ℤ_(5)[i]` loses connectedness.
- Reduced denominators: `T/T² = T⁻¹ ∉ R₀`; `D(T⁻¹Y + T⁻¹) = T²`.
- Simultaneous avoidance over `𝔽₂`.
- Thin-set count: squares `⌊√N⌋ + 1`.
- Rigid `S₃` cover: one orbit of size 6, `disc = 27(4 − x²)`.
- Coprime semidirect products: `S₃` versus `C₆`.
- Torus types: `Pic(PGL₂, k̄) = ℤ/2`.
- Coprime degrees: `n = 0` excluded.
- Mod-ℓ Hurwitz comparison: `n = ℓ = 2` fails without `ℓ > n`.
- Harbater: quasi-`p` and `(ℤ/ℓ)²`.
- `Sₙ`: `X³ − 3X + 1` gives `C₃`.
- `IsHilbertian`: `𝔽₂` and `𝔽₂(S)`.
- `infinite_full_group`: `Y² − T`.
- Weissauer and normal subgroups: `ℚ(μ_{2^∞}, ∛2)`, `Γ_ℝ = C₂`.
- Rigidity: `(2A, 2A, 3A)`, `C₂` with `r = 1`, `Multiplicative ℤ`.
- Lifting invariant: `C₂`, `G = 1`.
- Shafarevich: `C₄ → C₂` excluded.
- Supersolvable: `A₄`, `C₈` at 2.
- Abhyankar: `g = 0`, `D = ∅` excluded.
- Disjoint realizations: `t = 3, 8, 6`.
- Characteristic-`p` Artin–Schreier Check.
- Frobenius normalisation on `C₃`.
- `ℚ(√−35)` adapter.
- Euler characteristics: `y² − y = x` at `ℓ = 3`.
- Serre's growth formula.
- Hyperelliptic coordinate group.
- Cyclotomic twist: `C₅`, `S₃`.

**Remarks on untouched text (no change requested).** The source issues recorded in the previous
report still stand: kedlaya-liu Remark 1.4.4, wood-lifting Theorem 2.5, wood-moments Conjecture
5.1, lwzb Corollary 12.9 and the HOPS `d′ = md` misprint.

## Not verifiable

- No new source is cited in the changed text, so this round has nothing new to verify.
- Carried from the previous report, cited by locator only: Serre's *Topics in Galois Theory* (no
  legal open copy); Fried–Jarden, *Field Arithmetic*; Poonen §8.2; Kollár IV.6.10; Huppert and
  Ribes–Zalesskii (uncertified in the manifest).

## Source issues

- none
