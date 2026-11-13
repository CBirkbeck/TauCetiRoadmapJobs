# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at e5f4918)

**Verdict:** needs changes

## R01 (P2) — The RD.7 denominator-bound headline is statable but neither stated nor named as not statable

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:44`: the RD.7 headline targets include “denominator and coefficient-congruence bounds”. `Suggested.lean:46–49`: the RD.7 list of absent carriers omits them.

**Claim:** RD.7.13(b) is a headline by the README's own table, and it is statable at the pins. On `y² = Q`, with `y` invertible, the identity `B·y^{2m+1} dx = b dx/y + d(Fy)` is equivalent to the polynomial identity `B·Q^{m+1} = b + F′·Q + F·Q′/2`. The theorem is neither in `Suggested.lean` nor named in its docstring.

**Witness:** The statement below elaborates inside a copy of `Suggested.lean` at the pins, with 14 `sorry` warnings and nothing else. For `p = 5`, `Q = x³+x+1`, `B = 1` it gives `b = (2/5)x + 3/5` and `F = (2/5)x`, so the factor `5^⌊log₅ 9⌋ = 5` is needed.

**Repair:**
- Before the final `end` of `Suggested.lean`, add the block below.
- In the module docstring, change “and the rigid-analytic Quillen–Suslin theorem over the Monsky–Washnitzer algebra (RD.3.27)” to “the rigid-analytic Quillen–Suslin theorem over the Monsky–Washnitzer algebra (RD.3.27), and Kedlaya's corrected denominator bound for hyperelliptic reduction (RD.7.13(b))”.
- In the README, append “(`hyperelliptic_reduction_denominator_bound`)” to RD.7.13(b) after “makes both `b` and `F` integral”.

```lean
/-! ## Layer RD.7: Coefficient comparisons and Weil factors -/

namespace RD7

open Polynomial

/-- Kedlaya's corrected positive-power denominator bound (RD.7.13(b)). On `y² = Q(x)` the
identity `B·y^{2m+1} dx = b dx/y + d(F y)` reads `B·Q^{m+1} = b + F'·Q + F·Q'/2`; for the
reduced `b` (degree `< 2g`) the multiplier `p^⌊log_p((2g+1)(2m+3))⌋` makes `b` and `F`
integral. -/
theorem hyperelliptic_reduction_denominator_bound {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    {n : ℕ} (g m : ℕ) (Q B : (WittVector p (GaloisField p n))[X]) (hQ : Q.Monic)
    (hQdeg : Q.natDegree = 2 * g + 1)
    (hQsq : Squarefree (Q.map (WittVector.constantCoeff (p := p))))
    (hB : B.natDegree ≤ 2 * g)
    (b F : (FractionRing (WittVector p (GaloisField p n)))[X]) (hb : b.degree < (2 * g : ℕ))
    (h : (B * Q ^ (m + 1)).map (algebraMap _ _) =
      b + derivative F * Q.map (algebraMap _ _) +
        C (1 / 2) * F * derivative (Q.map (algebraMap _ _))) (i : ℕ) :
    ((p : FractionRing (WittVector p (GaloisField p n))) ^
        Nat.log p ((2 * g + 1) * (2 * m + 3)) * b.coeff i ∈
        (algebraMap (WittVector p (GaloisField p n)) _).range) ∧
      ((p : FractionRing (WittVector p (GaloisField p n))) ^
        Nat.log p ((2 * g + 1) * (2 * m + 3)) * F.coeff i ∈
        (algebraMap (WittVector p (GaloisField p n)) _).range) := by
  sorry

end RD7
```

## R02 (P3) — RD.5.8 step 3 takes the p-adic completion of a ring in which p is invertible

**Location:** `README.md:8839`: “`E` is a `(σ,∇)`-module `M` over `R = O⟨x_1`..`x_n⟩†[1/p]`; a twist `M(ℓ)` is defined over `R` and free by §RD.3.27; a Frobenius-invariant horizontal `v` over the p-adic completion `R^∧`”.

**Claim:**
- With `1/p ∈ R`, the p-adic completion `R^∧` is zero.
- “a twist `M(ℓ)` is defined over `R`” says nothing.
- The step needs the integral ring, the integral (discretely valued) form of §RD.3.27, and the π-adic completion of that ring.

**Witness:** Kedlaya-FF lines 616–622 (p. 16): `R = O⟨x_1,…,x_n⟩†`, `M` is a module over `R[1/p]`, the twist `M(ℓ)` is defined over `R` and free by Theorem 6.7, and `R^∧` is the π-adic completion of `R`.

**Repair:** Replace the quoted text with: “`E` is a `(σ,∇)`-module `M` over `R[1/p]`, where `R = O⟨x_1, …, x_n⟩†`; a twist `M(ℓ)` has a model over `R`, free by the integral form of §RD.3.27 (`K` discretely valued); a horizontal `v ∈ M(ℓ) ⊗_R R^∧` with `F v = q^ℓ v`, `R^∧` the π-adic completion of `R`,”.

## R03 (P3) — RD.7.7 and RD.7.8 omit their ℓ-adic inputs from *Needs*

**Location:** `README.md:13991` and `README.md:14014`, the *Needs* lines of RD.7.7 and RD.7.8. Step 1 of RD.7.7 uses “InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4 … DeligneWeightsAndPurity §0.10”. Step 3 of RD.7.8 says “Purity alone does not give that trace formula.”

**Claim:**
- Neither *Needs* line lists §IG.0.T4 or §0.10, although the supplier contract (line 455) says that §IG.0.T4 is used in §RD.7.7 and §RD.7.8.
- RD.7.8's route is “identical to the projective case” and uses §RD.6.86. Its *Needs* line lists neither §RD.7.7 nor §RD.6.86.

**Witness:** The RD.7.8 *Needs* line (`README.md:14014`) lists exactly §RD.7.6, §RD.7.1 and DeligneWeightsAndPurity §7.15.

**Repair:**
- Append to both *Needs* lines: “; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4; DeligneWeightsAndPurity §0.10 *The characteristic power series `det(1 − tF)` and traces of powers*”.
- Append to RD.7.8's *Needs* line: “; §RD.7.7; §RD.6.86 *Purity of rigid cohomology of smooth proper varieties*”.

## R04 (P3) — The two Lean headlines' *Needs* lines carry unused dagger-algebra items

**Location:** `README.md:1848` (RD.0.42) and `README.md:6343` (RD.3.27). Both open with the same six AdicSpacesPartIV items, including “§F1.9 *The module of (universally finite) differentials*” and “§F1.4 *Rational localisation `A⟨f/g⟩†`*”.

**Claim:**
- Neither statement nor proof sketch uses differentials or rational localisation.
- RD.3.27 also uses no dagger tensor product.
- The listed items make the Frobenius lift and Quillen–Suslin wait for Layer F1.9 and F1.4.

**Witness:** The same six-item block opens 23 *Needs* lines (1744, 1848, 1933, 5864, 6343, …, 11769). The RD.3.27 route (steps 1–5) uses only Weierstrass theory, §RD.0.55, §RD.0.56, §RD.3.26 and the fringe limit.

**Repair:**
- From both lines, delete “AdicSpacesPartIV §F1.9 *The module of (universally finite) differentials `Ω^1_A` of a dagger algebra and the exterior derivative*” and “AdicSpacesPartIV §F1.4 *Rational localisation `A⟨f/g⟩†` of a dagger algebra and its universal property*”.
- From line 6343, also delete “AdicSpacesPartIV §F1.4 *The dagger (overconvergent completed) tensor product `A_1 ⊗†_B A_2`*”.
- Check the other 21 lines against their routes.

## R05 (P3) — The RD.5.7 Check on 𝔾_m implies the wrong characteristic and computes nothing

**Location:** `README.md:8824`: “`X = G_m: x ↦ x + x^{-1}…` is not étale in characteristic 2; an Artin–Schreier-type map exists by the theorem”.

**Claim:** The Check suggests that `x + x⁻¹` fails only in characteristic 2, and it gives no map that works.

**Witness:** The derivative `1 − x⁻²` vanishes at `x = ±1` in every characteristic. The map `y = xᵖ + x⁻¹` makes `k[x, x⁻¹] = k[y][x]/(x^{p+1} − yx + 1)`, which is finite, and the derivative `−x⁻¹` of that relation is a unit.

**Repair:** Replace the quoted text with: “`X = G_m`: `x ↦ x + x^{−1}` is finite but ramified at `x = ±1` in every characteristic; in characteristic `p`, `y = xᵖ + x^{−1}` is finite étale, since `x^{p+1} − yx + 1` is monic in `x` with `x`-derivative `−x^{−1}`”.

## R06 (P3) — The numbering sentence is false

**Location:** `README.md:46–47`: “target `RD.k.n` is the `n`-th target of layer RD.`k`.”

**Claim:** Labels are not ordinal positions.

**Witness:**
- No headings exist for RD.1.6, RD.3.49, RD.3.50, RD.4.54 or RD.5.75.
- 13 lettered labels exist (RD.2.25a, RD.3.20a, RD.3.34a, RD.3.43a, RD.5.8a–c, RD.5.78a, RD.5.110a–b, RD.5.112a, RD.6.52a, RD.7.21a).
- RD.1.7 is the sixth target of RD.1.

**Repair:** Replace the quoted sentence with “target `RD.k.n` is a target of layer RD.`k`, and its label orders it within the layer.”

## R07 (P3) — 230 code spans swallow a semicolon and the prose around it

**Location:**
- `README.md:1759`: “No nilpotence, completeness or noetherian hypothesis on `I; S` is finitely presented”.
- Line 2400: “`(n−1)!` is invertible when `n>0; x=t−a` with”.
- Line 1776: “Non-example for `B_ε = B: R = B = ℤ, I = (7), S = …, C = 0`”.

**Claim:**
- Previous R05 is repaired as listed.
- The same defect remains wherever the semicolon is prose punctuation: one code span joins two formulas and the text between them.
- Spans like these also appear in headings (line 1406) and in *Needs* titles.

**Witness:** Splitting each line on backticks and keeping the code spans that contain “; ” finds 230 spans on 209 lines; NewtonPolygons and AdicSpacesPartIV on main have 0.

**Repair:**
- Split each such span at the semicolon so that the punctuation and the words are outside, for example `I`; `S` and `n>0`; `x=t−a`.
- Write line 1776 as “Non-example for `B_ε = B`: `R = B = ℤ`, `I = (7)`, `S = ℤ[x, 1/(2x)]/(x² − 2)`, `C = 0`;”.

## Verified sound

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| Previous R01 (RD.1.6) | Headings; lines 164, 4204 | No `### RD.1.6`; line 164 reads “§§RD.1.3–RD.1.5”; line 4204 ends “why FormalConnectionsOpers §6.2 assumes `∂ ≠ 0`” | Repaired |
| Previous R02 (RD.7.4) | Lines 13903–13920 | (b) alone; (a) is cited as §RD.6.24, (c) as DeligneWeightsAndPurity §4.4; *Needs* has Mathlib only | Repaired |
| Previous R03 (RD.0.39(c)) | Statement; Check | “reductions modulo `I` joined by a homotopy”; `G − (1−T)(G(0)−h₀) − T(G(1)−h₁)` has endpoints `h₀, h₁` and reduces to `H̄` | Repaired |
| Previous R04 (Arabia pages) | Line 1769 | “pp. 614–623”: §1 starts on printed p. 614, §1.4 on p. 623 | Repaired |
| Previous R05 (code spans) | Lines 90, 2396, 12118 | §F.0.2; Katz formula one span; `2·log_3 4 ≈ 2.52` | Repaired as listed; R07 |
| Sample: Lemma RD.2.29 | `ℓ²/2`, `uℓ − u`; recursion | `d/du(ℓ²/2) = ℓ/u`, `d/du(uℓ−u) = ℓ`; `u^lℓ^m = d(u^{l+1}ℓ^m/(l+1)) − (m/(l+1))u^lℓ^{m−1}` | Pass; Kedlaya-FF p. 7, lines 286–288 |
| Sample: Lemma RD.5.1 | `A=2, D=3, B=5, σ=id` | README `X=5`: `5+10−15=0`. Source (1) gives `X=−15`, block `5−30+45=20≠0` | Pass; Lemma 3.2 p. 6, Prop. 3.3 p. 7 |
| Sample: Theorem RD.5.4 | Rank one, trivial structure | `c^σ = c`, `dc = 0` forces `c` constant, in `Γ_con` | Pass; Kedlaya-FF Thm 5.1 p. 11 |
| Sample: Uniform estimates (RD.1 Examples) | `q=2, n=1, v₀(u₀)=−1`; corner `t=(2/3)2^{−5}` | `h(t)=−32/3`; `(0,−5)∈S`, `s=0`, length `−5`; `l=0` unique minimum iff `1/(q−1)<ρτ<q/(q−1)` | Pass; monodromy Lemma 4.12, arXiv v4 pp. 52–54 |
| Sample: Definition RD.6.46 | `p=2`; odd `p` | `π=−2`, `θ(1)=−1≡1+π` mod 4; `θ_{−π}=θ_π^{−1}` since `(−π)^{p−1}=−p` | Pass |
| Sample: Theorem RD.5.8 | Kedlaya-FF hypotheses | `k` of char `p`, `K` mixed-characteristic DVF, `X` smooth separated of finite type: as in Thm 1.1, p. 2 | Statement passes; sketch R02 |
| Sample: Example RD.5.97 | `y²=x³−x/𝔽₅`; ℙ¹ minus `N` points | `#E=8`, `a=−2`, `#U=7`; `H¹` eigenvalues `q/α=β`; `χ=−1`; `χ_c=2−N` | Pass |
| Sample: Theorem RD.5.7 | `A¹ ⊔ Spec k[x,ε]/(ε²)` | Pure dimension 1 with a smooth point, but no dense open is étale over `A¹`: the README's added “geometrically reduced” is needed | Pass; Lemma 7.1 p. 16; Check R05 |
| Sample: Theorem RD.0.40 | `y=x+πy²`; `y²=x` | Root `x+πx²+2π²x³+…` is weakly convergent; `y²=x` has rank 2 and is not an isomorphism mod π | Pass; Arabia 3.2.5 pp. 635–636 |
| Sample: Construction RD.3.37 | `j^*(L_π)` | Multiplier `exp(π(t^p−t))` equals RD.6.48(i) with `ε=+1` and the RD.6.42 construction | Pass; Berthelot (4.1) p. 25, (4.2) p. 26 |
| Sample: Theorem RD.0.43 | `B[T]→B×B`; interpolation | `1=T−(T−1)`, kernel `T(T−1)`; linear interpolation sends `X²` to `T²≠T` | Pass; Arabia 2.2.2 pp. 633–634, 3.3.4(b) p. 637 |
| Sample: Theorem RD.0.45 | `𝔾_m`, `φ₁(x)=x^q(1+πx)` | `φ₁^*(dx/x) = q·dx/x + d log(1+πx)`; the log series converges for `ρ<|π|⁻¹` | Pass; van der Put (2.4.4)(iii) pp. 37–38 |
| Sample: Lemma RD.1.62 | `b₁=−Σπ^kσ^{nk}(B)` | `πσⁿ(b₁)−b₁=B`; oriented `b₂` telescopes to `T_N−T_0` for `N<0` | Pass; arXiv v4 pp. 52–54 |
| Sample: Theorem RD.5.8b | Étesse's statements | Thm 6 on printed p. 598; Prop. 6 with Cors. 1–2 on p. 586; Props. 9′–10′ on pp. 590–592 | Pass |
| Sample: Definition RD.1.25 | `[[0,1],[p,0]]`; `diag(1,p)` | det `−p`: degree 1, slope 1/2; degree 1, slope 1/2 | Pass; SFR Def. 3.4.1, Lemma 3.4.2 p. 36, Prop. 3.4.4 pp. 36–37 |
| `arabia_controlled_lifting` (RD.0.39(a)) | `I=0`; `I=R`; `ℤ, (7), x²=2` | `E≅B`, `hE=hbar`; henselian lifting along `ker p`; `(IB∩ker p)² ⊆ IB·ker p` gives the square-zero step; `S[1/(x+3)]` | Pass; Arabia 2.1.2(b) p. 625 |
| `exists_frobenius_lift_weakCompletion` (RD.0.42) | `S=O[x]`; `f=0`; `x=s+πy` | `φ(x)=x^q`; `σK≡id` gives `φ≡id`; `σK(π)∈πO` gives `φ(x)−x^q∈πS†` | Pass; Arabia 3.3.2(b), 3.3.4(a) p. 637; vdP (2.4.4)(ii) p. 37 |
| RD.0.55 (definitions and theorems (a)–(d)) | `ℤ/2`; `ℚ`; `(2,1+√−5)`; `ℤ→ℤ/4`; `ℤ[t]→ℤ⟦t⟧` | Length 1, not 0; none; not stably free; `Tor₁=ℤ/2` blocks base change; `0→A→A→ℤ→0` | Pass |
| RD.0.56, `hasUnimodularExtension_iff` | `(2,5)`; `(t²+1,t)`; `C(S²,ℝ)` | `[[3,−1],[−5,2]]`, det 1, gives `(1,0)`; `(1,t)` then `(1,0)`; both sides false | Pass |
| `rigid_quillen_suslin` (RD.3.27) | `n=0`; `n=1`; non-discrete `K` | `washnitzerAlgebra (Fin 0) K = ⊤`; `K⟨t⟩_ρ` is a PID; the Lemma 6.2 unit step needs only `|y|<|c|` | Pass; FF pp. 13–15 |
| RD.2.7 slope filtration | `R(0)⊕R(1)`; `[[0,1],[π,0]]` | `M₁=R(0)`, slopes `0<1`; isoclinic of slope 1/2, one step | Pass |
| RD.2.31 local monodromy | Dwork `M_f`, `f=t⁻¹`; `∇e=e dt` | Unipotent after `zᵖ−z=t⁻¹`; without Frobenius, not quasi-unipotent | Pass |
| RD.5.76 / RD.5.89 | ℙ¹ minus `N` points; `𝔾_m` | Dimensions `1, N−1, 0`; pairings `1·q` and `q·1` equal `q^d`, `d=1` | Pass |
| RD.6.85 Weil II | `𝔾_m`, `w=0` | `H¹_c` weight `0≤1`, `H²_c` weight `2≤2`, `H¹` weight `2≥1` | Pass |
| RD.7.8 Weil factors | `ℙ¹×E`, `E: y²=x³−x/𝔽₅` | `P₁=1+2t+5t²`, `P₃(t)=P₁(5t)=1+10t+125t²` | Pass; *Needs* R03 |
| RD.7.13(b) | `p=5, B=1`; `p=3, B=x²` | `b=(2/5)x+3/5`, factor 5; `9F=2x³+(4/5)x+2` integral, `3F` not | True; R01 |
| RD.7.16 Check | `y²=x⁵+x+3/𝔽_{7^k}` | Brute force: `#C=11, 55, 371`, `r_k=0`; `e₂=(9+5)/2=7`, matching `T⁴+3T³+7T²+21T+49` | Pass |

- **Gate.**
  - The worker's gate at `e5f4918` passes.
  - My rerun against the default order fails only on `depcheck: UPWARD: PadicDifferentialEquationsAndRigidCohomology (#120) -> CongruenceSpectralGap (#157)`, which is the worker's move.
  - The prescribed depcheck on the moved order prints `depcheck: 206 roadmaps, 1916 edges, 0 problem(s)`.
  - The diff outside the folder is empty.
- **Merge order.**
  - The move puts this roadmap at #157, below four of its consumers: PadicHodgeTheory (#122), VectorBundlesAndIsocrystals (#123), WeilConjectures (#125) and ColemanIntegration (#139). Their depchecks now print UPWARD to #157.
  - CongruenceSpectralGap's last supplier is EtaleDualityAndPerverseSheaves (#107). Moving CongruenceSpectralGap above #120 instead clears all five edges.
- **Elaboration.**
  - `lake env lean` gives 13 `sorry` warnings and nothing else.
  - The one-tactic probes (`rfl | simp | infer_instance | trivial | decide | simp_all`) fail on all 13 theorems.
  - I compared the 17 `#check @` types with the README: no binder is lost.
- **Sources.** I checked 44 locators against 8 texts: Kedlaya-FF, Arabia-CMH, Milne-LEC (Lemma 27.10 on p. 158), Kedlaya's monodromy paper (arXiv v4), SFR (arXiv v4), van der Put and Berthelot (both Mém. SMF 23), and Étesse (Ann. ENS 35).
- **Library declarations opened at the pins.**
  - Mathlib:
    - `Algebra/Module/StablyFree/Basic.lean:34`: the complement must be finite free; `M` need not be finite.
    - `LinearAlgebra/Unimodular.lean:46`.
    - `RingTheory/WittVector/Basic.lean:343`.
  - Tau Ceti:
    - `RingTheory/Dagger/WashnitzerAlgebra.lean:115` and `:192`.
    - `RingTheory/Dagger/WeakCompletion/Basic.lean:190`.
  - AlgebraicKTheory on main has stable range only, not Quillen–Suslin.
- **Citations resolved.**
  - The README cites 17 open suppliers, all named in the description, and 21 roadmaps on main.
  - CrystallineCohomology (#857): the §CR.6.4 target *Rigid cohomology of smooth strata* is at line 11048 and §CR.3:Frobenius-isogeny.1 at line 3533.
  - Other roadmaps cite 64 RD ids, and all exist except RD.1.6. Only the scope remark “RD.1.1–RD.1.6” at PCurvature (#1747) line 40 uses it, and that range now ends at RD.1.5.
- Overlap check: read CrystallineCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AInfCohomology and RelativeFarguesFontainePartII (open), and AdicSpacesPartIV, NewtonPolygons and ClassicalArithmeticCompletion (main); the third list is empty. Shared objects and their owners:
  - Constant-coefficient rigid cohomology of smooth strata: CrystallineCohomology §CR.6.4 (cited).
  - Robba carriers over discretely valued `K`: NoncommutativeAndEquivariantIwasawa §F.6 (cited).
  - Dagger algebras: AdicSpacesPartIV F1 (cited).
  - RD.0.1–RD.0.3, RD.0.51 and RD.0.54: this roadmap (PadicHodgeTheory and RelativeFarguesFontainePartII consume them).
  - RD.1.27 and RD.1.32: this roadmap (VectorBundlesAndIsocrystals consumes them).
  - AInfCohomology shares nothing.
- **Description.** It matches the head: the 17 open suppliers, the FormalConnectionsOpers §6.2 import and the Lean contents. Nothing to change.

## Not verifiable

- Lang, *Algebra*, Chapter XXI (RD.0.55, RD.0.56): there is no legal open copy. Its use is cross-checked against Kedlaya-FF lines 545–581.
- The published Annals pagination of Kedlaya's local monodromy paper (RD.1.62, “pp. 148–151”): I read arXiv v4 only.
- Xu–Zhu, Crew and Fresán–Sabbah–Yu (RD.6.46); Crew 1998 and Kedlaya's Weil II §2.6 (RD.5.97): not fetched this round.
- Monsky–Washnitzer, *Formal cohomology I* (RD.0.40): Annals, no open copy found.

## Source issues

- **Misprint** in Kedlaya-FF at Proposition 3.3, proof, equation (1), p. 7: the source sets `−X + AX^σD⁻¹` equal to `B`; it should be `−BD⁻¹`, since the conjugated block is `B + AX^σ − XD`; affects the proof.
- **Misprint** in Kedlaya-FF at Proposition 3.3, proof, p. 8: the source chooses `μ_iU_ij^σ − λ_jU_ij = V_ij`; it should be `μ_iU_ij − λ_jU_ij^σ = −V_ij` for `z_i = y_i − ΣU_ij v_j`; affects the proof.
- **Error** in Kedlaya-FF at Lemma 7.1, p. 16: the source allows any separated pure-dimensional `X`; it should assume `X` geometrically reduced, since `A¹ ⊔ Spec k[x,ε]/(ε²)` has no dense open étale over `A¹`; affects a stated result.
- **Misprint** in Kedlaya-FF at Lemma 6.2, proof, p. 13: the source takes the tuple that minimizes `|a_I|ρ^I`; it should be the one that maximizes it, which gives the leading term; affects nothing.
- **Gap** in Kedlaya-FF at Lemma 6.2, p. 13: the source states it for complete discrete valuation fields but applies it to any complete nontrivially valued `K`; the unit argument works for rank-one valuations; affects the proof.
- **Misprint** in Kedlaya, *A p-adic local monodromy theorem*, Lemma 4.12, proof, p. 53 (arXiv v4): the source says `U_t` surjects onto `U_f(t)` and bounds `w_s` by `l v_p(π) + r q^{−l}t`; it should be `U_h(t)` and `s q^{−l}t`; affects nothing.
- **Gap** in Kedlaya, *A p-adic local monodromy theorem*, Lemma 4.12, proof, pp. 53–54 (arXiv v4): the source sums `b₂` from `j = 1` to `i+l−s`, which is `−5` for `q = 2`, `n = 1`, `v₀(u₀) = −1` at the corner `t = (2/3)2^{−5}`; it should use oriented sums; affects the proof.
