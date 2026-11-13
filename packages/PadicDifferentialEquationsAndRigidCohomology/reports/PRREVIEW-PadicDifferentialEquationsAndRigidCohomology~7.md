# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at d97f4a5)

**Verdict:** needs changes

## R01 (P3) — RD.1.6 still derives the cyclic-vector theorem that FormalConnectionsOpers §6.2 owns

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:2472` “Over a characteristic-zero differential field with `∂≠0` … Hence the Katz cyclic-vector theorem applies with `δt=1`.” Also line 2480 (step 3), line 164 “the rescaling of a nonzero derivation (§§RD.1.3–RD.1.6;” and line 4226.

**Claim:** This is the residue of the previous R01, which is otherwise repaired. RD.1.6 rescales `∂` and then applies the Katz candidates. Its conclusion is that every characteristic-zero field with `∂ ≠ 0` has cyclic vectors. That is `exists_cyclicVector`, and nothing here or in another roadmap uses RD.1.6.

**Witness:** FormalConnectionsOpers `README.md:2171–2178` at `4b3f57b` owns `exists_cyclicVector` for `∂ ≠ 0` and Katz's explicit form over fields. In this README, only RD.1.6's own heading and the line-164 range mention §RD.1.6.

**Repair:**
- Delete §RD.1.6.
- At line 164, replace “with their local cyclicity and the rescaling of a nonzero derivation (§§RD.1.3–RD.1.6;” with “with their local cyclicity (§§RD.1.3–RD.1.5;”.
- At line 4226, delete the two sentences from “For a nonzero field derivation, choose `t`” to “a genuine nonzero-derivation hypothesis.”
- At line 4226, replace the next sentence with: “A zero connection on `K²` with zero coefficient derivation has no cyclic vector, which is why FormalConnectionsOpers §6.2 assumes `∂ ≠ 0`.”

## R02 (P3) — RD.7.4 restates §RD.6.24 and DeligneWeightsAndPurity §4.4

**Location:** `README.md:13927` “this roadmap proves the local Fatou theorem (b), after Milne, Lemma 27.10, and recovers the supplied global theorem in (c). (a) Descent of rationality. Let `k ⊂ L` be fields and `f ∈ k[[t]]`.”

**Claim:** Only (b) is new.
- (a) is §RD.6.24 of this roadmap, proved a second time by the same Hankel argument without citing it.
- (c) is the normalized integral numerator/denominator theorem. The same paragraph assigns it to DeligneWeightsAndPurity §4.4, and this target then plans it again.

**Witness:**
- `README.md:12039` (§RD.6.24): “Let `k ⊆ L` be fields and `f ∈ k[[t]]`. If `f = P/Q` in `L[[t]]` … then `f = P_0/Q_0`”.
- DeligneWeightsAndPurity `README.md:1383–1384` at `5930b27`: “prove the normalized integral numerator/denominator theorem for rational series”.

**Repair:**
- Retitle the target “RD.7.4 Local Fatou: the normalised coprime numerator and denominator of an integral series are integral”.
- Make the statement (b) alone, keeping the label (b), which WeilConjectures cites. After it, add: “Rationality descent along `k ⊆ L` is §RD.6.24. The global integral numerator/denominator theorem, which gives unique coprime `A, B ∈ 1 + tℤ[t]` with `f = A/B` for `f ∈ 1 + tℤ[[t]] ∩ ℚ(t)`, is DeligneWeightsAndPurity §4.4. §RD.7.5 uses both with (b).”
- Delete proof steps 1 and 3, the hypothesis bullets for (a) and (c), and the last Check.
- In *Needs*, replace ClassicalArithmeticCompletion §6.44 with §RD.6.24.

## R03 (P3) — RD.0.39(c) is narrower than Arabia's Théorème 2.2.2, and its Check does not test it

**Location:** `README.md:1754` “if `h_0, h_1 : S → B` agree modulo `I` and `H̄ : S →` (`B`/IB)`[T]` is a homotopy between their reductions”. Line 1778: “the linear homotopy `(1 − T)h_0(x) + T h_1(x)` has the required endpoints.”

**Claim:**
- The source only requires the two reductions to be homotopic. Requiring that `h_0` and `h_1` agree modulo `I` states (c) more narrowly than the source.
- The Check's linear homotopy reduces to the constant homotopy, not to the prescribed `H̄`, so it does not witness (c).

**Witness:** Arabia, Comment. Math. Helv. 76, Théorème 2.2.2, p. 633, takes two morphisms whose reductions modulo `I` are homotopic, equal reductions being only an example. For `S = R[x]` and `H̄(x) = h̄_0(x) + T(T − 1)`, the linear homotopy does not reduce to `H̄`.

**Repair:**
- At line 1754, replace “agree modulo `I` and `H̄ : S →` (`B`/IB)`[T]` is a homotopy between their reductions” with “have reductions modulo `I` joined by a homotopy `H̄ : S → (B/IB)[T]`”.
- Replace the Check with: “For `S = R[x]` no neighbourhood is needed in (c). Lift `H̄(x)` to `G ∈ B[T]`. Then `G − (1 − T)(G(0) − h_0(x)) − T(G(1) − h_1(x))` has endpoints `h_0(x)` and `h_1(x)`, and it reduces to `H̄(x)` because both corrections lie in `IB[T]`.”

## R04 (P3) — RD.0.39 cites the wrong pages for Arabia §§1.1–1.3

**Location:** `README.md:1770` “Arabia, *Relèvements des algèbres lisses et de leurs morphismes*, Comment. Math. Helv. 76 (2001), §§1.1–1.3, pp. 610–620”

**Claim:** §1 and §1.1 begin on p. 614, and §1.3 runs to p. 623. Pages 610–613 hold §0 (notation and smoothness).

**Witness:** Arabia, Comment. Math. Helv. 76: §1 opens under the page header 614, right after the end of a §0.2 proof. Théorème 1.3.1 is on p. 620 and §1.4 begins on p. 623.

**Repair:** Replace “§§1.1–1.3, pp. 610–620” with “§§1.1–1.3, pp. 614–623”.

## R05 (P3) — Section letters, a decimal and the Katz formulas are split across code spans

**Location:** `README.md:90` “EtaleCohomologyFoundations §`F`.0.2”; line 8171 “Definition `B`.1, Remark `B`.2”; line 12140 “`2·log_3 4 ≈ 2`.52”; line 2396 “define `c`(e,x)`=Σ₀≤j<n (x^j/j!) Σ₀≤k≤j (−1)^k binom`(j,k) `D^k(e_(j−k))`”.

**Claim:** This is the residue of the previous R06; the reference-list initials and the French words are fixed. These spans hold a locator letter rather than mathematics, cut a number in two, or split one formula into fragments.

**Witness:** `grep -nE '§+`F`\.|`F`\.0\.A2|Layer `F`|`B`\.[0-9]|≈ 2`\.52' README.md` finds 28 lines. Lines 2396, 2400, 2405, 2427, 2433, 2448 and 4226 split the Katz formulas.

**Repair:**
- Write §F.0.2, §§F.0.2, F.0.A2, JacobianChallenge Layer F and B.1–B.7 without backticks.
- Write line 12140 as `2·log_3 4 ≈ 2.52`.
- Make each Katz formula one span. For example, line 2396 becomes `c(e, x) = Σ_{0≤j<n} (x^j/j!) Σ_{0≤k≤j} (−1)^k binom(j, k) D^k(e_{j−k})`, line 2400 `D(rv) = ∂(r)v + rD(v)`, line 2448 `c(e, t − a)` and line 4226 `Dc = e₁`.

## Verified sound

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| Previous R01 (cyclic vectors) | Lines 164, 2493; `Suggested.lean` | `CyclicFor` and `katz_cyclic_vector` are gone. RD.1.7 cites FCO §6.2. The RD.1.5 sentence is deleted, but RD.1.6 still concludes the field theorem | Partly repaired; R01 |
| Previous R02 (Christol–Dwork locator) | Lines 2602, 2607 | “Section 2.3, p. 676”. The §2.3 heading is on p. 675 and `R(M, r)` is defined on p. 676 | Repaired |
| Previous R03 (Tau Ceti Poincaré lemma) | Lines 430–431, 7950, 7955 | `primitive_mem_washnitzerAlgebra`, `exists_pderiv_eq_iff` and `existsUnique_pderiv_eq`, with their files, are cited in step 2 and in *Needs* | Repaired |
| Previous R04 (`O[t]` not henselian), line 6743 | `O = ℤ₂`, `π = 2` | `s² + s − 2t ≡ s(s+1)`: simple roots 0 and −1. Root `x − x² + 2x³ − 5x⁴ + …` with `x = 2t`, radius 2 > 1 | Repaired |
| Previous R05 (repeated Checks) | Lines 905–912, 2612–2618 | Each formerly repeated bullet now occurs once | Repaired |
| Previous R06 (code spans) | References (line 14639 on) | 0 single-initial spans, 0 `` `d'` `` or `` `à` `` spans; 28 locator/decimal spans remain | Partly repaired; R05 |
| Previous R07 (description) | Description | #785, #1126 and #1199 dropped; #1056 (FormalConnectionsOpers §6.2) added | Repaired |
| RD.7.13 (Lemma) | `Q = x³+x+1`, `p = 5`, `m = 0`, `B = 1`; `p = 3`, `B = x²` | `b = (2/5)x + 3/5`, `F = (2/5)x`, factor `5^⌊log₅9⌋ = 5`. `F = (2/9)x³ + (4/45)x + 2/9` and `b = −(2/15)x − 1/5` need 9 | Pass; Kedlaya Lemmas 2–3, p. 5 (arXiv v2) |
| RD.1.5 (Theorem) | `R` local with `t − a ∈ m`; `R` a field; `n = 1` | `P(t−a) ≡ P(0) = 1` mod `m`, a unit. Over a field `t = a` contradicts `∂t = 1`, so `N` candidates are used; `N = 1` | Pass; Katz not verifiable |
| RD.1.7 (Theorem) | `F_ρ` with `De₁ = 0`, `De₂ = e₁/t`; rank 0; `∂ = 0`, `D = 0` on `F²` | `e₂, e₁/t` form a basis; the empty basis; `v, Dv = 0` are dependent | Pass; Swan I Lemma 1.1.5, p. 3; Christol–Dwork Prop. 3.1, p. 680 |
| RD.3.27, `rigid_quillen_suslin` | `n = 0, 1`; `ρ = p^{1/m}` | `W₀ = K`, free. `K⟨t⟩_ρ` is a PID. Radii `p^{1/m} → 1` with `ρ^m ∈ |K^×|` are cofinal | Pass; FF Lemma 6.1 p. 12, 6.2–6.3 p. 13, Props. 6.4–6.5 p. 14, 6.6 and Thm. 6.7 p. 15 |
| RD.0.42, `exists_frobenius_lift_weakCompletion` | `S = O[x]`; `S = O`; `f = 0`; `S = 0` | `φ(x) = x^q`. `φ = σK` with `σK(a) − a^q ∈ πO`. `φ = id` when `σK = id`. `φ = 0` | Pass; Arabia 3.3.2(b) pp. 636–637 and 3.3.4(a) p. 637; van der Put (2.4.4)(ii), p. 37 |
| RD.0.39(a), `arabia_controlled_lifting` | `I = 0`; `I = R`; `R = B = ℤ`, `I = (7)`, `S = ℤ[x, 1/(2x)]/(x²−2)` | `E = B`, `hE = hbar`. `E` is an étale neighbourhood of `ker p` with `E/(ker p)E ≅ C`. `3² ≡ 2` mod 7, lift on `S[1/(x+3)]` | (a) passes; Arabia 2.1.2 p. 625, 2.1.3 p. 632, 2.2.2 p. 633; (c) R03; pages R04 |
| RD.0.26 (Theorem) | `x ∈ m_R`; `K = ℚ_p` | `|x|_a < 1` for `a` near 1, so `1 + x` is a unit. `w(Σ c_i t^i) = min w(c_i)`, a DVR with uniformiser `p` | Pass; overview Lemma 3.5.2 and Remark 3.5.3, p. 15; monodromy §2.3, pp. 12–13 |
| RD.1.2 (Definition) | `F = K(t)`, `∂ = d/dt`; `∂ = 0`; `SkewPolynomial` | `T²t = tT² + 2T`. `F{T} = F[T]`. `Ta − aT = ∂a`, not of the form `(φ(a) − a)T` | Pass; Swan I Defs. 1.1.2 (p. 2), 1.1.4 and 1.1.8 (p. 3) |
| Finite cyclic-vector calculation | Horizontal rank-two basis; `n = 0, 1` | `D(e₀ + xe₁) = e₁`, `c ∧ Dc = e₀ ∧ e₁`, Wronskian 1. `n = 0` gives 0, `n = 1` gives `e₀` | Pass; rescaling sentences R01 |
| RD.1.6 (Comparison) | `D′ = s⁻¹D`, `δ = s⁻¹∂` | `D′²v = s⁻²D²v + s⁻¹∂(s⁻¹)Dv`: triangular. The conclusion is `exists_cyclicVector` | True; duplicate (R01) |
| RD.2.7 (Theorem) | `K = ℚ_p(√p)`, `F(v) = √p·v`; `R(0) ⊕ R(1)` | Slope 1 here and 1/2 in the supplier; `F(v) = p·v` has slope 2. `M₁ = R(0)` with slopes `0 < 1` | Pass; SFR Thm. 6.4.1 p. 65, Cor. 6.4.2 p. 66; monodromy Thm. 1.2 p. 5, Thm. 6.10 p. 77 |
| RD.2.31 (Theorem) | Dwork line in `y⁻¹`; cover `zᵖ − z = y` | `z = −Σ y^{pʲ} ∈ k[[y]]`, so that cover splits; `zᵖ − z = y⁻¹` is needed | Pass; monodromy Thm. 1.1 p. 4 and §6.4 pp. 79–80 (arXiv v4) |
| RD.5.89 (Theorem) | `ℙ¹` minus `N` points; `E ∖ {O}` | `H¹ = K(−1)^{N−1}` and `H¹_c = K^{N−1}` pair to weight `q`. Eigenvalue `α` pairs with `q/α = β` | Pass; Finiteness Thm. 1.2.3, p. 4, proof p. 65 (v6) |
| RD.7.8 (Theorem) | `ℙ¹ × E` | `H³ = H²(ℙ¹) ⊗ H¹(E)` has eigenvalues `qα, qβ`, so the factor is `P₁(E, qt)` | Pass; Notes on isocrystals Thm. 10.3, p. 27 |
| RD.7.4 (Supplier contract) | (b): `f = 1/(1−t)`; `G = H = 1 − t/ℓ`; (c): `ℙ¹` | A root of absolute value exactly 1. `|1/ℓ|_ℓ = ℓ > 1`. `B = (1−t)(1−qt) ∈ 1 + tℤ[t]` | True; Milne L. 27.9 pp. 156–157 and L. 27.10 p. 158; Weil I pp. 276–277; duplicate (R02) |
| RD.5.76 (headline, finiteness) | `ℙ¹` minus `N ≥ 1` points; `ℙ¹` | Dimensions 1, `N−1`, 0; and 1, 0, 1 | Pass; Finiteness Thm. 1.2.1 p. 3, Remark 9.2.1 p. 63 |
| RD.6.85 (headline, Weil II) | `G_m`, constant coefficients | `H¹_c` has weight `0 ≤ 0 + 1`; `H¹` has weight `2 ≥ 0 + 1` | Pass; Weil II Thm. 6.6.2, p. 50 |
| `HasFiniteFreeResolutionLE`, `HasFiniteFreeResolution` | `ℤ/2` over `ℤ`; zero ring; `ℚ` over `ℤ` | Length ≤ 1 holds and length 0 fails. Length 0 trivially. None, since `ℚ` is not finite | Pass |
| `.extension`, `.kernel`, `.cokernel` | `0 → 2ℤ → ℤ → ℤ/2 → 0` | Lengths 0, 0, 1. The mapping cone gives a stably free `Z₁`, absorbed into `C₁` | Pass |
| `.isStablyFree`, `hasFiniteFreeResolution_iff_isStablyFree` | `I = (2, 1+√−5)`; tangent module `P` on `S²` | `I` is projective and not stably free, so it has no FFR. `0 → R → R³ → P → 0` has length 1 | Pass |
| `.baseChange_of_flat` | `ℤ → ℚ` with `ℤ/2`; `ℤ → ℤ/4` | `ℚ ⊗ ℤ/2 = 0`. Over `ℤ/4`, `ℤ/2` has no FFR, so flatness is needed | Pass |
| `.baseChange_of_isSMulRegular` | `ℤ[t] → ℤ⟦t⟧`, `g = t`, `N = ℤ`; `A = ℤ[t]/(t²)` | `0 → A →t A → ℤ → 0`. With `t·t = 0`, `hgA` fails | Pass |
| `hasFiniteFreeResolution_polynomial` | `ℤ[t]/(2, t)`; base `ℤ/4` | Koszul ranks 1, 2, 1. The hypothesis fails at `ℤ/2` | Pass |
| `UnimodularEquiv`, `HasUnimodularExtension` | `(2, 5)` over `ℤ`; `C(S², ℝ)` | `[[3,−1],[−5,2]]` has det 1 and sends `(2,5)` to `(1,0)`. `(x₀, x₁, x₂)` is not completable | Pass |
| `unimodularEquiv_C_eval_zero_of_monic` | `(t²+1, t)` over `ℤ`; `n = 1`; `n = 0` | Two elementary moves reach `(1, 0) = f(0)`. A monic unit of `B[t]` is 1. `n = 0` is vacuous | Pass |
| `hasUnimodularExtension_iff` | `ℤ`; `C(S², ℝ)`; zero ring | Both sides true; both false; both true | Pass |

- **Gate.**
  - The worker's gate at `d97f4a5` passes.
  - My rerun with the default order reports only `depcheck: UPWARD: PadicDifferentialEquationsAndRigidCohomology (#120) -> CongruenceSpectralGap (#157)`, which is the move the worker makes.
  - The prescribed depcheck on the moved order prints `depcheck: 206 roadmaps, 1916 edges, 0 problem(s)`.
  - The diff outside the folder is empty.
- **Elaboration.**
  - `lake env lean` gives 13 `declaration uses sorry` warnings and nothing else.
  - The one-tactic probes (`rfl | simp | infer_instance | trivial | aesop | decide`) fail on all 13 theorems.
  - I compared the 17 elaborated `#check @` types with the README: no binder is dropped, and the generality matches.
- **Sources.** I checked 47 locators against 14 texts; only R04's is wrong. The texts: Kedlaya-FF, Arabia (CMH 2001), van der Put (MSMF 23), Christol–Dwork, Kedlaya's Swan I, overview, monodromy, SFR, Finiteness, Weil II, Notes on isocrystals and hyperelliptic papers, Milne LEC v2.21 and Weil I.
- **Library declarations opened at the pins.**
  - Mathlib:
    - `Algebra/Module/StablyFree/Basic.lean:34`: the complement must be finite free.
    - `LinearAlgebra/Unimodular.lean:46`.
    - `Algebra/SkewPolynomial/Basic.lean:95`.
    - `Analysis/Normed/Field/Dense.lean:46`: `CharZero` only; RD.0.33 extends it.
  - Tau Ceti:
    - `WeakCompletion/Basic.lean:190`: needs `Algebra.FiniteType`, which `Algebra.Smooth` supplies.
    - `WashnitzerAlgebra.lean:115`.
    - `PseudoCoherent/FiniteProjectiveDimension.lean:69`: projective resolutions.
    - `Homology/ModuleCat/FiniteFreeResolution.lean:268`: quasi-isomorphisms, not finite length.
  - Neither pin has finite free resolutions, the unimodular extension property or Quillen–Suslin.
- **Citations resolved.**
  - FormalConnectionsOpers §6.2 `exists_cyclicVector` (#1056 at `4b3f57b`, `Suggested.lean:163`).
  - CrystallineCohomology §CR.6.4, target *Rigid cohomology of smooth strata* (#857, line 11047).
  - NoncommutativeAndEquivariantIwasawa §F.6 stages 1–2 (#1307), whose consumer table names RD.0.1, RD.2.20, RD.2.25 and RD.2.31–RD.2.33.
  - DeligneWeightsAndPurity §§1.10 and 4.4 (#929).
  - On main: LocalFieldsRamification (`Completed/`), ClassicalArithmeticCompletion §6.44, AlgebraicKTheory and 17 others.
  - All 17 open suppliers are open and named in the description. The 3 `roadmaps resolve` leads are this file's own names.
- **Overlap check.**
  - Read: CrystallineCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AInfCohomology and RelativeFarguesFontainePartII (open); AdicSpacesPartIV, NewtonPolygons and ClassicalArithmeticCompletion (main). The third list is empty.
  - Also read by object: FormalConnectionsOpers, NoncommutativeAndEquivariantIwasawa, DeligneWeightsAndPurity, ColemanIntegration, WeilConjectures and VectorBundlesAndIsocrystals.
  - Owners of shared objects:
    - smooth constant-coefficient rigid cohomology: CR §CR.6.4 (cited);
    - Robba carriers, slope filtration and finite-field local monodromy: NEI §F.6 (cited); this roadmap extends them to general `K` and `k`;
    - RD.0.1–RD.0.3, RD.0.18, RD.0.27 and RD.0.54: this roadmap (PadicHodgeTheory and RelativeFarguesFontainePartII consume);
    - Frobenius lifts on weak completions (RD.0.42): this roadmap (ColemanIntegration consumes);
    - dagger algebras: AdicSpacesPartIV F1 with the Tau Ceti carriers;
    - the field cyclic-vector theorem: FCO §6.2 (R01);
    - the integral numerator/denominator theorem: DWP §4.4 (R02).
  - AInfCohomology shares nothing.
  - WeilConjectures cites §RD.7.4(b), which R02 keeps.
- **Description.** The prose matches the head: the cyclic-vector import, the 17 open suppliers and the Lean contents. Nothing to change.

## Not verifiable

- Katz, *A simple algorithm for cyclic vectors* (RD.1.3–RD.1.6): the sources service reaches only the JSTOR page; I found no legal open copy.
- Magid, *The cyclic vector lemma* (RD.1.7): the sources service found no legal copy.
- Lang, *Algebra*, Chapter XXI (RD.0.55, RD.0.56): there is no legal open copy. The numbering is cross-checked against Kedlaya-FF §6, lines 545–578.
- Edixhoven's Leiden notes and Harvey (RD.7.13): not fetched this round. Kedlaya's Lemmas 2–3 were checked.
- The published Annals pagination of Kedlaya's local monodromy paper (RD.2.31 “Section 6.4, p. 180”; RD.2.7 “p. 97”): I did not read the published version. In arXiv v4, §6.4 is on pp. 79–80.

## Source issues

- **Error** in Kedlaya, *Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology*, at Lemma 3, p. 5 (arXiv v2): the source bounds the denominators of the reduction of `A(x)y^{2m+1}dx` by `p^{⌊log_p(2m+1)⌋}`; it should be `p^{⌊log_p((2g+1)(2m+3))⌋}`, since `Q = x³+x+1`, `p = 5`, `m = 0` needs 5; affects a stated result.
- **Error** in Kedlaya, *Swan conductors for p-adic differential modules, I*, at Lemma 1.1.5, p. 3: the source gives every differential module a cyclic vector, and its Hypothesis 1.1.1 allows `∂ = 0`; it should assume `∂ ≠ 0`, since `D = 0` on `F²` has none; affects a stated result.
- **Misprint** in Milne, *Lectures on étale cohomology* v2.21, at Lemma 27.10, proof, p. 158: the source concludes that each reciprocal root has `ℓ`-adic absolute value `< 1`; it should be `≤ 1`, since `f = 1/(1−t)` has root 1; affects nothing.
- **Gap** in Kedlaya-FF at Propositions 6.4–6.5, p. 14: the source applies Lemma 6.2, which is stated for complete discrete valuation fields, to any complete nontrivially valued `K`; it should state Lemma 6.2 for such `K`; affects the proof.
