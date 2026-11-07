# Review of CongruenceSpectralGap (pull request #1504 at 77c3e7b)

**Verdict:** needs changes

## R01 (P3) — “1+Nℤ̂” is not the congruence subgroup the repaired contract equates it with

**Location:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:98` (“whose congruence subgroup `ideleCongruenceSubgroup` is ℝ_(>0)×(1+Nℤ̂) … ℚ^×ℝ_(>0)\𝔸^×/(1+Nℤ̂)≅(ℤ/N)ˣ … trivial on ℝ_(>0) and on 1+Nℤ̂”), and the same notation at line 302 (“trivial on ℝ_(>0) and on det K(N)=1+Nℤ̂”).

**Claim:** The set 1+Nℤ̂ = {1+Nx : x∈ℤ̂} is not a subgroup of the finite ideles. At every prime p∤N its component 1+Nℤ_p is all of ℤ_p, which contains p, and at N=1 it is ℤ̂ itself, which contains 0. The group meant is U(N) = {x∈ℤ̂^× : x≡1 mod N}. The repair of the previous R02 turned this notation into an equation with a pinned Tau Ceti subgroup, and as written the equation is false. The sentence's own N=1 clause shows this: ℝ_(>0)×ℤ̂ is not a set of ideles. The unit condition at p∤N is what produces φ(N). The pinned `ideleCongrOneSubgroup` (`TauCeti/NumberTheory/NumberField/Global/Ideles/Congruence.lean:103`) omits that condition. It contains the idele with entry p at the place p for each p∤N, whose class is p⁻¹ mod N, and these classes fill (ℤ/N)ˣ. With that subgroup the quotient is trivial: at N=5 it leaves one character instead of four.

**Witness:** Pinned `TauCeti.GlobalNumberFields.ideleCongruenceSubgroup` (`TauCeti/NumberTheory/NumberField/Global/Ideles/Congruence.lean:193`) requires valuation one at every p∤𝔪. At modulus ∞ it is therefore ℝ_(>0)×ℤ̂^×, not ℝ_(>0)×ℤ̂. AdelicAlgebraicGroups (its README lines 4947 and 5458) writes U(N)=ℤ̂^×∩(1+Nℤ̂).

**Exact repair:**
- At line 98, define U(N)={x∈ℤ̂^× : x≡1 mod N}. Then write `ideleCongruenceSubgroup` at N·∞ as ℝ_(>0)×U(N), the quotient as ℚ^×ℝ_(>0)\𝔸^×/U(N), and the condition as “trivial on ℝ_(>0) and on U(N)”.
- At line 302, write det K(N)=U(N), which is AdelicAlgebraicGroups §5.2's description.
- Add a negative-control Check to §0.5c: dropping the unit condition at the primes not dividing N makes the quotient trivial, so at N=5 it gives one character instead of φ(5)=4.

Tested:
- N=1: U(1)=ℤ̂^×, and ℝ_(>0)×ℤ̂^× is the pinned subgroup at modulus ∞. The quotient is trivial, leaving one character.
- N=3: ℤ̂^×/U(3)≅𝔽₃^× gives two characters, agreeing with the N=3 Check.
- N=5: four characters.

## Previous findings

- R01 — repaired: `packages/CongruenceSpectralGap/sources.toml` now has the key `rs96` (Duke 81, DOI 10.1215/S0012-7094-96-08115-6, “Appendix §5.2, (5.4)–(5.14), Lemma 5.1 …, manuscript pp. 52–55”, institutional, certified). There are seven references and seven keys.
- R02 — repaired: `README.md:98` now reads “Layer 7 … supplies the ray-class quotient `rayClassQuotient` … onto with kernel `raySubgroup` … Layer 10 supplies `RayClassGroup (ratModulus n h) ≃* (ZMod n)ˣ`”. Lines 306, 321 and 363 cite Layers 7 and 10. Its new identity with `ideleCongruenceSubgroup` is this report's R01.
- R03 — repaired: `README.md:318` now reads “the image of Γ(3) in PSL₂(ℤ), isomorphic to Γ(3) because −I∉Γ(3), has index 12 and every cusp of Γ(3) has width 3”.

## Verified sound

:robot: Independent AI incremental re-review of **10 changed lines since 03c49e7**: 5 insertions and 5 deletions, all in `README.md`. `Suggested.lean` is byte-identical to the previous head, and nothing outside the folder changed.

I checked:
- the three previous findings;
- every changed passage: the GlobalNumberFields contract (line 98), the §0.5c route (line 306), the §0.5c N=3 Check (line 318), the §0.5c *Needs* line (321) and the Layer 0 Dependencies (363);
- what depends on them: §0.5c's residual bullet (line 302) and its N=1 and N=2 Checks, and §0.6's reduction of the φ(N) residual functions to the constants;
- the GlobalNumberFields citations on main, at the head of its open revision and in pinned Tau Ceti;
- the gate, the dependency check, the elaboration and the `#check` probe;
- the declared gaps;
- the seeded sample, which falls in none of the changed passages, so its cached locators were spot-checked.

The adversarial tables add **12 fresh rows** with computed values and carry **101 rows** forward. The one finding is P3; there is no P1 or P2 finding.

**Gate and dependency direction.** I reran the gate at this head; it includes the targeted build:

```text
gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The prescribed dependency command returned:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The diff adds no new supplier. GlobalNumberFields was already cited, and it is on main as a completed roadmap (`Completed/GlobalNumberFields`), so it is a legal supplier with no merge-order constraint. `git diff --stat origin/main...HEAD` outside the folder is empty, and the worktree is clean.

**Elaboration, signatures and padding.**
- `lake env lean` on `TauCetiRoadmap/CongruenceSpectralGap/Suggested.lean` succeeded. Its only output was the three `sorry` warnings, at lines 52, 63 and 79.
- A scratch copy with `#check @name` for all four declarations elaborated. The types are identical to the previous report's and to the README:
  - `hyperKloosterman : (F : Type u_1) → [Field F] → [Finite F] → {K : Type u_2} → [CommRing K] → ℕ → AddChar F K → Fˣ → K`;
  - the two numerical bounds, with `1 ≤ k`, `ψ ≠ 1` and `2 < q`;
  - `congruence_eigenvalue_bound`, with `IsCongruenceSubgroup Γ`, `ContDiffOn ℝ 2`, Γ-invariance, boundedness and nonconstancy.
- No section binder is lost.
- The file is unchanged, so the previous one-tactic probe stands: `simp` left all three goals open, and there is no padding.

**Seeded sample.** No sampled target is in a changed passage. Each is carried with its previous rows, and where a cached text exists its locator was re-read at this head.

| Seeded target | Treatment at this head |
| --- | --- |
| 0.1 Hyperbolic quotient measure | Unchanged. Its rows are carried (π/3 at level one, 2π at Γ(2)). FuchsianOrbifolds Layers 0, 2, Layer 4 item 5 and Layer 6 item 1 are on main, as in the earlier reports. |
| 0.3 Mean-zero Hilbert subspace | Unchanged. teschl Theorem 4.10 (min-max) is at teschl line 5044, inside §4.3 “The min-max theorem” (heading at teschl line 4991), on printed p.119. The form-domain version is at teschl line 5053. Together they support the infimum on the constant complement. |
| 0.5b Principal-level cusp compactness | Unchanged; rows carried. The lrs95 §1 locator is uncertified. |
| 0.7 Rayleigh and clipped spectrum comparison | Unchanged. teschl line 5044 and line 5053 support equality of the operator-domain and form-domain infima. The carried rows give .25 and .21. |
| 1.1 Exceptional cuspidal dictionary | Unchanged; the row r=0, .2, .5 is carried. lrs95 §1 is uncertified. |
| 1.3 Exceptional adjoint parameters | Unchanged; rows carried (2/3, 1, 3/2; {.4, 0, −.4}). lrs95 is uncertified. |
| 2.2 Archimedean trivial zero | Unchanged; the row β₀=.4 is carried. Opened `Complex.Gammaℝ_eq_zero_iff` (`Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:75`, zero exactly at −2n) and `Gammaℝ_residue_zero` (`:104`, sΓℝ(s)→2), which match the Conventions. |
| 3.1 Mellin cutoff kernel | Unchanged. `mellin` (`Mathlib/Analysis/MellinTransform.lean:90`, integrand t^(s−1)) and `mellinInv` (`:95`, prefactor 1/(2π)) match the Conventions. |
| 3.2 Dual Mellin kernel | Unchanged. `mellin_comp_inv` (`:153`, `mellin (f ∘ inv) s = mellin f (−s)`) matches the s↦−s convention. lrs95 (3.7) and Lemma 3.1 are uncertified. |
| 3.3 Mellin cutoff estimates | Unchanged; rows carried (pole order 5; ε′<1−β₀). |
| 4.2 Even nonprincipal orthogonality | Unchanged; the q=5 row is carried. lrs95 (3.11)–(3.12) is uncertified. |
| 4.2a Raw hyper-Kloosterman sums over every finite field | Unchanged. katz-gkm line 1845 and line 1871 (§4.0, pp.47–48) carry the convolution table and the product-fibre sum over x₁^(b₁)⋯xₙ^(bₙ)=a. The Lean carrier is unchanged. |
| 4.2b Kloosterman sheaves and the general Deligne estimate | Unchanged. katz-gkm line 1902 (Theorem 4.1.1, p.49) gives rank Σbᵢ, purity of weight n−1 and trace (−1)^(n−1)Kl at the inverse of the standard generator, i.e. geometric Frobenius. It also gives total wildness at ∞ with Swan 1 and tameness at 0, which agrees with the carried sign and Swan rows. |
| 5.3 Congruence spectral gap | Unchanged. bms02 line 245 (Corollary 2.10, p.7) is essential self-adjointness of D⁎D for a complete metric, as cited. lrs95 Theorem 1.1 is uncertified. |
| 5.4 Congruence Rayleigh inequality | Unchanged. teschl line 5053 is the form-domain version. The carried rows (0 ≤ 0, .21 = .21, .84 = .21·4) are rechecked. |

**Fresh adversarial computations** (the changed statements and those that depend on them):

| Statement | Instances tried and values on both sides | Result / change |
| --- | --- | --- |
| Line 98: `ideleCongruenceSubgroup` at N·∞ over ℚ equals “ℝ_(>0)×(1+Nℤ̂)” | Pinned definition: principal units of level v_p(N) at p∣N, valuation one at p∤N, positive at ∞. N=1: pinned ℝ_(>0)×ℤ̂^×; literal ℝ_(>0)×(1+ℤ̂)=ℝ_(>0)×ℤ̂ contains (1,0), not an idele. N=3 at p=2: pinned ℤ₂^×; literal 1+3ℤ₂=ℤ₂ contains 2. | False as written → R01. |
| Line 98: ray class group at N·∞ ≅ (ℤ/N)ˣ | 𝔸^× = ℚ^×·ℝ_(>0)·ℤ̂^× with ℚ^×∩ℝ_(>0)ℤ̂^× = {1}, so C_ℚ ≅ ℝ_(>0)×ℤ̂^× and C_ℚ/(ℝ_(>0)×U(N)) ≅ ℤ̂^×/U(N) ≅ (ℤ/N)ˣ. Orders for N=1, 2, 3, 4, 5, 12: 1, 1, 2, 2, 4, 4. Pinned `ratModulusEquivZMod` (`…/Global/RayClass/Rat.lean:202`) gives the same groups. | Correct with U(N). |
| Line 98: N=1 clause | `ratModulus 1 hn` is the modulus ∞, and (ZMod 1)ˣ has one element (ZMod 1 is the zero ring). The narrow class group of ℚ is trivial, so the only character is the constant one; φ(1)=1. | Correct. |
| Line 98: wrong model without the unit condition | Pinned `ideleCongrOneSubgroup` at N=5: the idele eₚ with p at the place p is ≡ p⁻¹ at ∞ and at every ℓ≠p modulo ℚ^×, with class p⁻¹ mod 5. p = 2, 3, 11, 19 give 3, 2, 1, 4, which is all of (ℤ/5)ˣ, so the quotient is trivial: 1 character instead of 4. | The README names the right subgroup; the notation does not → R01's negative-control Check. |
| Line 98: Hecke ↔ Dirichlet characters | τ trivial on ℝ_(>0)U(N) is trivial on `raySubgroup` (N·∞), so τ is `HeckeCharacter.ofRayClassCharacter` of some η (`…/Global/HeckeCharacter/Basic.lean:97`), and η corresponds to a Dirichlet character by `ratDirichletEquiv` (`…/Global/RayClass/Character/Dirichlet.lean:74`). N=4: {1, χ₄} with χ₄ odd, both counted, φ(4)=2. | Both parities and imprimitive characters included; agrees with “primitive or not”. |
| Line 306: residual route through Layers 7 and 10 | det SO(2)={1}. det K(N)={x∈ℤ̂^×: x≡1 mod N} (AdelicAlgebraicGroups §5.2, its README line 5458), so ideleCongruenceSubgroup(N·∞)=ℝ_(>0)×det K(N). Orthogonality: ⟨χ₁∘det, χ₂∘det⟩ ∝ Σ_(d∈(ℤ/N)ˣ) χ₁(d)·conj χ₂(d) = 0 for χ₁≠χ₂, since the components have equal volume. At N=3: 1·1+1·(−1)=0. | Correct; the citations resolve. |
| Line 318: N=3 Check | SL₂(ℤ)→SL₂(𝔽₃) is onto and \|SL₂(𝔽₃)\|=24. −I≡diag(2,2)≢I mod 3, so −I∉Γ(3) and the image in PSL₂(ℤ) ≅ Γ(3), of index 24/2=12. Each cusp has width 3 (stabilizer ⟨T³⟩), so c(3)=12/3=4. Genus 1+12/12−0−0−4/2=0. h₃=2·4=8. Components {1,2}: 1∘det=(1,1), χ₃∘det=(1,−1). | Correct; the quotient notation of the previous R03 is gone. |
| Line 318: full-Borel negative control | −1∈ℚ^× maps onto −1∈𝔽₃^×, so GL₂(𝔸_f)=GL₂(ℚ)K(3). GL₂(ℚ)∩K(3)=Γ(3), since det ±1 with det ≡ 1 mod 3 forces det = 1. B(ℚ)\GL₂(ℚ)/Γ(3)=Γ(3)\ℙ¹(ℚ) has 4 points, against 8 for B(ℚ)⁺. The O(2) quotient has (ℤ/3)ˣ/{±1}, i.e. 1 component. | Correct (unchanged clause of the edited sentence). |
| §0.5c N=2 Check (uses line 98) | 1+2ℤ₂=ℤ₂^×, so U(2)=ℤ̂^×=U(1) and the quotient is trivial; φ(2)=1, and the only character has conductor 1. | Consistent. |
| §0.6 constants (uses the residual count) | Restricting to the identity component (det class 1) sends each τ∘det to the constant τ(1)=1, so the φ(N) functions give one line: at N=5, 4 → 1. | Consistent with “the residual weight-zero subspace is exactly the constants”. |
| Lines 321 and 363: *Needs* and Dependencies | GlobalNumberFields Layers 6, 7, 9 and 10 are on main at `Completed/GlobalNumberFields/README.md:439`, 459, 508 and 531, and at its open revision's head at 673, 694, 746 and 769. The revision adds Layer 3G and renumbers nothing. Each layer is used: density (6), ray quotient (7), Hecke characters, shift and pullback (9), the `ratModulus` identification and character types (10). | Consistent; no dangling layer. |
| Repair of the previous R01: rs96 entry | The manifest key `rs96` has sha 393cd6ad…, which names the cached text. rs96 line 3181 (p.52), line 3254 (p.53), line 3302 (p.54, Lemma 5.1) and line 3339 (p.55) lie on manuscript pp.52–55 as the locator states. | Repaired. |

**Carried adversarial rows.** These are the previous report's rows for statements the diff leaves untouched. Each is attributed:
- `[r3]` marks rows computed by the previous report.
- `[r2 via r3]` marks rows that report carried from the one before it.

They are not re-derived here. The previous report's rows for the §0.5c residual dimension and the N=3 Check are replaced by the fresh rows above. Pipes inside cells are escaped.

[r3]: packages/CongruenceSpectralGap/reports/PRREVIEW-CongruenceSpectralGap~3.md
[r2 via r3]: packages/CongruenceSpectralGap/reports/PRREVIEW-CongruenceSpectralGap~2.md

| Statement | Instances and computed sides | Result / change |
| --- | --- | --- |
| Title and scope, lines 1 and 7 | AutomorphicSpectralTheory's own Part II is AutomorphicSpectralTheoryPartII (merge order line 290), which cites this roadmap at `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md:103` and 387 (quotient Laplacian from §§0.1–0.2, compact cuspidal resolvent from §0.5b). A second “Part II” of the same base would have two Part-II owners. | Standalone title is consistent with the existing consumer; no change. [r3] |
| AST contract, line 80: level-one expansion only | AST §4.8 at its head (line 2403) displays the one-cusp formula on PSL₂(ℤ)\ℍ and says a level subgroup has one family per cusp, without stating it; grep of the AST head for `K(N)` and “principal level” returns nothing. | §0.5c's specialization is new work, owned here; no re-plan. [r3] |
| §0.5c residual Casimir | τ∘det is right-SL₂(ℝ)-invariant; the 𝔰𝔩₂ Casimir differentiates along SL₂(ℝ), so Ω_N(τ∘det) = 0 on all φ(N) functions. A hypothetical value 1/5 would contradict this, as §0.6's third Check says. | Correct. [r3] |
| §0.5c continuous multiplicity, real factor | B(ℝ)∩SO(2) = {±I}; T(ℝ)/T(ℝ)⁰ = {±1}², modulo ±I two classes. diag(−1,1) (det −1) swaps them; diag(a,b) with ab > 0 has signs (+,+) or (−,−) = −I·(+,+) and fixes them. | The reduction to B(ℚ)⁺ is right. [r3] |
| §0.5c strong approximation step | For g ∈ GL₂(𝔸_f), gK(N)g⁻¹∩N_B(𝔸_f) is an open subgroup V of 𝔸_f and ℚ+V = 𝔸_f, so N_B(𝔸_f)gK(N) = N_B(ℚ)gK(N). At N = 1, g = 1: V = ℤ̂ and ℚ+ℤ̂ = 𝔸_f. | Density input used correctly (GlobalNumberFields Layer 6, line 679 at its head). [r3] |
| §0.5c cusp count h_N | GL₂(𝔸_f)/K(N) = ⊔_(ℤ/N)ˣ GL₂(ℚ)⁺/Γ(N) (K(N) normal in GL₂(ℤ̂), representatives there); B(ℚ)⁺\GL₂(ℚ)⁺ = ℙ¹(ℚ) with stabilizer of ∞ equal to B(ℚ)⁺ (SL₂(ℚ) is already transitive). So #X = φ(N)·#(Γ(N)\ℙ¹(ℚ)): N = 1, 2, 3 give 1, 3, 8. | Formula h_N = φ(N)c(N) verified; equals the cusp count of ⊕_(ℤ/N)ˣ L²(Γ(N)\ℍ). [r3] |
| §0.5c N = 2 Check | φ(2) = 1, c(2) = 3 (index 6 in PSL₂(ℤ), widths 2); the only character mod 2 is the trivial one, conductor 1, imprimitive. | Correct. [r3] |
| §0.5c N = 1 Check versus AST §4.8 | AST line 2403 displays (4π)⁻¹∫_ℝ⟪E(·,1/2+it),f⟫E(z,1/2+it)dt. The integrand is even in t (E(z,1/2−it) = φ(1/2−it)E(z,1/2+it) with \|φ\| = 1 on the line), so (4π)⁻¹∫_ℝ = (2π)⁻¹∫_(t>0); treating ±t separately would double the multiplicity. | Matches AST's displayed normalization. [r3] |
| §0.5c symmetric-family norm | AST §4.1 (line 2298) defines the norm Σ_P n_P⁻¹∫‖F_P‖² with n_P = Σ_Q \|W(𝔞_P,𝔞_Q)\|; for the Borel of GL₂, n_B = 2 and the Check at line 2309 says a reflected section has half the full integrated norm. With F(−λ) = M(w,λ)F(λ) and M unitary, (1/2)∫_ℝ‖F‖² = ∫_(t>0)‖F(it)‖². | The unitary equivalence with L²((0,∞),V) is normalization-consistent. [r3] |
| §0.5c spherical vector | −y²(∂ₓ²+∂ᵧ²)y^s = −y²·s(s−1)y^(s−2) = s(1−s)y^s; at s = 1/2+it this is 1/4+t², at t = 0 it is 1/4; s(s−1) would give −1/4−t² ≤ −1/4. 1/4 is in the spectrum but not an eigenvalue: the level set {t : 1/4+t² = 1/4} = {0} has measure zero. | Correct. [r3] |
| §0.5c sum over χ equals #X | ⊕_χ I_B(χ)^(K(N)SO(2)) is the Peter–Weyl decomposition under the compact group T(ℚ)T(ℝ)⁰\T(𝔸) ≅ (ℤ̂^×)² of the functions on the finite set X; dimension #X. At N = 1 only χ = 1 contributes, dimension 1. | The “dim V is the number of points of …” step is justified. [r3] |
| §0.5c adelic Iwasawa input | AdelicAlgebraicGroups §3.1 at its head, line 2730: `G(𝔸_F) = P(𝔸_F)K = N_P(𝔸) M_P(𝔸)^1 A_P(ℝ)^0 K`, surjective and open (line 2693). For B ⊂ GL₂ this is the displayed factorization. | Citation resolves. [r3] |
| §0.5c residual blocks input | AST §4.14a (line 2508) works at a fixed unitary central character; §4.6 (line 2381) restricts the decomposition to a fixed central character and twists by unitary characters. L²([GL₂]¹) is the Hilbert sum over the characters of the compact ℚ^×\𝔸^(×,1), so the blocks with d = 1, ν = 2 of all ω give exactly the τ∘det with τ² = ω. | Route inputs exist; the all-central-character passage is covered by §4.6. [r3] |
| §0.5c projections and reduction | AST §4.4 `projection_equivariant` (line 2358): projections commute with the right action and integrated Hecke actions; the averaging idempotent of K(N)·SO(2) is such an operator, so H_N = ⊕ of the three parts. Reducing Ω_N: the cuspidal part by §0.5a, the residual part (finite-dimensional, in the domain, Ω_N = 0), the continuous part as the complement of two reducing subspaces. | Consistent. [r3] |
| §0.5b route without the adelic input | Model λ_n = n on the cuspidal space: (A+1)⁻¹ has eigenvalues 1/(n+1) → 0, compact. Tail bound: frequency 2πn/w, n ≠ 0, gives ∫\|u\|²y⁻² ≤ R⁻²∫\|u\|² ≤ (w/(2πR))²∫\|∂ₓu\|² on y ≥ R; widths 1 and 3 give constants 1/(4π²R²) and 9/(4π²R²). The zero mode has ∂ₓu = 0 and positive mass. | Geometric compactness no longer presupposes the finite-multiplicity contract; the transport to the adelic cusp space goes through §0.5a. [r3] |
| §0.5b *Needs* versus §0.5c *Needs* | §0.5b needs §§0.1–0.2, 0.5a; §0.5c needs §§0.5a–0.5b; §0.6 needs §§0.2, 0.5a–0.5c. The build order 0.5a < 0.5b < 0.5c < 0.6 has no cycle. | No cycle. [r3] |
| §0.6 after the change | At level N the restriction to the identity component is the average of multiplications by τ∘det over (ℤ/N)ˣ, which preserve the three parts (AST §4.6 twisting). Residual: φ(N) componentwise constants restrict to one constant line; continuous: c(N) channels per component; Γ/Γ(N)-invariant channels ↔ Γ-orbits of cusps of Γ(N) = cusps of Γ (Γ(2): 3 → 3 at Γ = Γ(2); 3 → 1 at Γ = SL₂(ℤ)). | Correct. [r3] |
| §4.2b Euler–Poincaré descent | Over 𝔽₃ remove the degree-two point x²+1 = 0: one closed point of degree 2, two geometric points over 𝔽₉, each with Swan 1 for Lψ(1/(x²+1)); grouped sum 2·1 = 2 = 1+1; χ_c = (2−2)−2 = −2. Over 𝔽₂ with k = 𝔽₂: x²+x+1 is irreducible, degree 2, same count. | Residue-degree grouping by Galois orbits is correct for perfect k. [r3] |
| §4.2b imperfect-field Check | k = 𝔽_p(s): x^p−s = (x−s^(1/p))^p over k̄, one geometric point of residue degree p; U⊗k̄ = 𝔸¹, χ_c = 1 for the constant rank-one sheaf; the weighted formula would give 2−p (−1 at p = 3). | Negative control is correct and discriminates perfectness. [r3] |
| §4.2b coefficient extension step | For a lisse E_λ-sheaf, L⊗ℚ̄_ℓ has the same rank, the same dimensions of H^i_c (flat base change of coefficients) and the same Swan conductors (AGR §3.1 at its head, line 2635: invariance under extension of coefficients). Tame rank-one Kummer sheaf on 𝔾_m: 0 = 0 both before and after. | Inputs named and exist. [r3] |
| §4.2b owner EtaleDualityAndPerverseSheaves §5.2 | At its head, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4922`–4941: `curveEulerPoincareSwan` for a smooth connected curve U with smooth proper completion C over algebraically closed k, ℓ invertible in k, lisse ℚ̄_ℓ-sheaf L; includes the finite coefficient-field form and compatibility with coefficient extension; no characteristic restriction; U = C allowed (C∖U empty gives χ_c = r(2−2g)). EDPS does not cite CongruenceSpectralGap. | Single owner earlier in the order (line 96 < 147); the former two-owner situation is gone. [r3] |
| `hyperKloosterman` with `Finite F` | 𝔽₂, k = 2, r = 1: tuples (1,1) only, ψ(0) = 1, value 1 ≤ 2·2^(1/2). 𝔽₃, k = 2, r = 1: (1,1),(2,2) give ζ²+ζ = −1, norm 1 ≤ 2√3. 𝔽₄, k = 1: ψ(r) of norm 1 ≤ 1. `Nat.card 𝔽₄ = 4` so the bound at k = 2 is 2·2 = 4 ≥ 3. | Instance change preserves values and bound. [r3] |
| `hyperKloosterman_bound` nontriviality guard | Trivial ψ on 𝔽₅, k = 3: value (5−1)² = 16 > 3·5 = 15. | `hψ` remains essential; carried value re-checked. [r3] |
| Conventions; 0.1 effective area | Signature (0;2,3;1 cusp) gives 2π(−2+1+1/2+2/3) = π/3; projective index 6 at Γ(2) gives 2π. | Counts ±I once; keep. [r2 via r3] |
| 0.1 finite measure/nonzero level | Γ(1) mass π/3 > 0; Γ(2) mass 2π > 0; Γ(0) is the identity subgroup, infinite area. | N ≠ 0 necessary. [r2 via r3] |
| 0.2 positive expression | Δ1 = 0; Δy² = −2y²; s(1−s) = 1/4+t². Opposite sign gives +2y². | Sign fixed. [r2 via r3] |
| 0.2 closed realization/cover | Torsion-free cover levels 3, 6 at N = 1, 2; cutoff beyond R loses mass ∝ w/R and energy ∝ w/R. | Constants survive the closure. [r2 via r3] |
| 0.2 nonzero operator | A nonconstant bump in a free chart has ∫\|∇u\|² > 0. | Excludes the zero realization. [r2 via r3] |
| 0.3 complex mean zero | Integrals of 1 and i are V and iV; v−(∫v)/V integrates to 0. | Real-part kernel would keep i. [r2 via r3] |
| 0.3 integral bound | \|∫c\| = \|c\|V = √V·(\|c\|√V); zero-integral bump gives 0 with positive norm. | Keep. [r2 via r3] |
| 0.4 Rayleigh definition | diag(0,.21,.25): e₂ gives .21/1; 2ie₂ gives .84/4 = .21; norm-only denominator .42. | Correct scaling. [r2 via r3] |
| 0.4 infima/core | Full infimum 0; constant-complement infimum .21; truncation of e₂ is 0 for R < .21. | Keep. [r2 via r3] |
| 0.5 clipped infimum | ∅, {.21}, {1/3} give .25, .21, .25. | Keep. [r2 via r3] |
| 0.5 lower-bound guard | S = {−n} has no real lower bound. | Bounded-below premise kept. [r2 via r3] |
| 0.5a measure isometry | Constant 1 on a component with c_N dA has norm² c_N V; image √c_N has c_N V; unscaled gives V. | Factor necessary. [r2 via r3] |
| 0.5a components/right action | N = 3: SO(2) gives 2 components, O(2) gives 1. N = 5, det 2 moves support 1 → 2⁻¹ = 3. | Convention matches supplier. [r2 via r3] |
| 0.5a level-changing maps | Conjugating [[1,1],[0,1]] by diag(p,1)^∓ gives entry 1/p. | Only GL₂(ℤ̂) acts at fixed level. [r2 via r3] |
| 0.5b cusp tail | Widths 1, 3 give 1/(4π²R²), 9/(4π²R²). | Width cannot be suppressed. [r2 via r3] |
| 0.5b zero-mode exclusion | x-constant tail has positive mass, zero x-energy. | Cuspidality essential. [r2 via r3] |
| 0.6 spectral channels | Γ(1) one channel, Γ(2) three; t = 0, 1 give .25, 1.25. | Not a universal one-channel expansion. [r2 via r3] |
| 0.6 residual removal | Componentwise constants have dimension φ(N) = 4 at N = 5; classical constant line is one. | Component restriction present. [r2 via r3] |
| 0.7 spectral/clipped equality | No exceptional eigenvalue: both .25; with .21: both .21; keeping the constant would give 0. | Right complement. [r2 via r3] |
| 1.1 exceptional parameter | r = 0, .2, .5 give λ = .25, .21, 0. | Open range; parity irrelevant. [r2 via r3] |
| 1.2 unitary monomial branch | Norm shift σ gives central modulus exponent 2σ; σ = 1 at norm 2 gives 4. | Real shift must vanish. [r2 via r3] |
| 1.2 archimedean temperance | Unitary induction bounded; diag(2,1/2) unbounded. | Excludes complementary model. [r2 via r3] |
| 1.3 adjoint normalization | a = 2, b = 3: adjoint weights 2/3, 1, 3/2 (product 1); raw Sym² gives 4, 6, 9. | Central inverse needed. [r2 via r3] |
| 1.3 exceptional lift | r = .2 gives {.4, 0, −.4}. | Spherical GL₃ specialization agrees. [r2 via r3] |
| 2.0 ramified positivity | (1−T)⁻¹ coefficients 1,1,1; deleting the factor gives 1,0,0. | All-prime target necessary. [r2 via r3] |
| 2.0 supercuspidal/logarithm | e = 2: coefficients 1,0,1; log 0,1. e = 1: log 1, 1/2. | Nonnegative. [r2 via r3] |
| 2.0 Steinberg blocks | (1−T)⁻¹(1−T/2)⁻¹: linear 3/2, quadratic 7/4; 5/8+(3/2)²/2 = 7/4. | Agrees. [r2 via r3] |
| 2.0 character transport | η(p) = −1 sends 1 → −1; conductor exponent 2 gives multiplier 1. | Includes ramified pairs. [r2 via r3] |
| 2.0 primitive-twist epsilon | m = 2 ratios 1, a/b, b/a, 1; \|τ\|⁴q⁻² = 1. | Degree m². [r2 via r3] |
| 2.1 functional equation normalization | f = 4, q = 5, m = 2: conductor 2500, numerator norm 50, 50/√2500 = 1. | Unit root number. [r2 via r3] |
| 2.1 gamma/analytic adapter | μ = ±.2: shifts .4, 0, 0, −.4; at Re s = 1 smallest real part .6. | No boundary pole. [r2 via r3] |
| 2.1 excluded twist cases | Primitive twist changes inertia; odd χ has sign −1. | Real hypotheses. [r2 via r3] |
| 2.2 forced zero | β₀ = .4: maximal gamma argument 0; sΓ_ℝ(s) → 2. | No division by a pole value. [r2 via r3] |
| 3.1 cutoff tail | Bump in [1,2]: F₁(.5) = 1, F₁(3) = 0; doubling gives Mellin mass 2. | Normalization fixes the kernel. [r2 via r3] |
| 3.1 Mellin normalization | Indicator of [1,2]: log 2 versus 1; contour factor (2π)⁻¹. | Correct measure. [r2 via r3] |
| 3.2 dual kernel | G = 1, bump in [3,4]: x = .2 gives 1, x = 2 gives 0. | Inversion at 1/x. [r2 via r3] |
| 3.2 differential sign | G(w) = w: βT−a versus βT+a, difference 2a. | Minus sign kept. [r2 via r3] |
| 3.3 pole collision | d = 4: pole order 5, log⁴, absorbed by x^ε. | ε-loss. [r2 via r3] |
| 3.3 small-x integrability | σ = .5, β₀ = .4, ε′ = .1: exponent −.5, integral 2; at ε′ = .6 diverges. | ε′ < 1−β₀. [r2 via r3] |
| 3.4 two-kernel equation | β = .5: both n^(−.5); Y → 2Y doubles nY/(fq^d). | Reciprocal scale. [r2 via r3] |
| 4.1 finite average | Q = 3 gives q = 5, total 1; fπ = 5 removes it. | Indexing verified. [r2 via r3] |
| 4.2 even orthogonality | q = 5: residues give 0,1,−1,−1,1; q = 3 gives 0. | Principal subtraction required. [r2 via r3] |
| 4.2 main n = 1 coefficient | q = 5: (q−1)/2−1 = 1. | Passes. [r2 via r3] |
| 4.2a rank zero/one | 𝔽₃, k = 0: r = 1 gives 1, r = 2 gives 0; k = 1 gives ψ(r). | Empty product handled. [r2 via r3] |
| 4.2a coefficient ring | 𝔽₃, k = 2, r = 2 raw sum 2; mod 2 gives 0; zero ring 0 = 1. | General coefficients allowed. [r2 via r3] |
| 4.2a additive scaling | a = −1, k = 2: same values; k = 1 sends ψ(r) to ψ(−r). | Direction correct. [r2 via r3] |
| 4.2a eliminated-variable comparison | 𝔽₃, k = 2, r = 1: ζ²+ζ = −1 both ways; r = 2: 2. | Agrees. [r2 via r3] |
| 4.2b additive sheaf | 𝔽₃: trace ζ at 1; over 𝔽₉ trace ζ². | Geometric Frobenius fixed. [r2 via r3] |
| 4.2b tensor phases | Characteristic 2: phase 2x = 0, trace 1, Swan 0. | Phase addition. [r2 via r3] |
| 4.2b Euler–Poincaré, tame/proper | Constant rank r on 𝔾_m: 0; on ℙ¹: 2r; Kummer sheaf H_c = 0,0,0. | Empty boundary and characteristic zero covered. [r2 via r3] |
| 4.2b Euler–Poincaré, wild | Phase x: χ_c = 0; phase x² (odd p): −1. | Rank alone insufficient. [r2 via r3] |
| 4.2b perfect-base degrees | 𝔽₃, degree-two point: 2·1 = 2, χ_c = −2. | Residue degrees necessary. [r2 via r3] |
| 4.2b geometric components | ℙ¹ over 𝔽_(q²) viewed over 𝔽_q: χ_c = 4. | Geometric connectedness kept. [r2 via r3] |
| 4.2b Swan-constancy criterion | Lψ(tx): conductor 2 → 1, H_c² rank 0 → 1; constant ℙ¹ family ranks 1,0,1. | Jumping and empty-boundary cases. [r2 via r3] |
| 4.2b boundary rank term | x² = t: 2 → 1 geometric points; χ_c 0 → 1 with Swan 0. | Boundary rank term kept. [r2 via r3] |
| 4.2b properness | Missing special fibre: top rank 1 → 0; proper constant family rank 1. | ULA and proper conclusion distinct. [r2 via r3] |
| 4.2b rational coefficients | p invertible in ℓ-adic coefficients; nodal loop ℓ^a → ℓ^(a+1). | No global lattice assumed. [r2 via r3] |
| 4.2b convolution rank/Swan | (2,1)*(3,1): rank 5, Swan 1, χ_c = −5; product guess 6. | Formula discriminated. [r2 via r3] |
| 4.2b convolution iteration/purity | Kl₁*Kl₁: rank 2, Swan 1, weight 1; Kl₂*Kl₁: rank 3, weight 2. | Rank k, weight k−1. [r2 via r3] |
| 4.2b Kummer descent | p = 2, N = 3, coefficients 𝔽₃: 1/N undefined. | Non-semisimple case retained. [r2 via r3] |
| 4.2b wild/unipotent control | (1+N)² = 1+2N in characteristic 3; (1+N)³ = 1+N in characteristic 2. | Triviality for p ≠ ℓ. [r2 via r3] |
| 4.2b trace sign | 𝔽₃, k = 2: raw −1, trace +1; 𝔽₂: raw +1, trace −1. | (−1)^(k−1) required. [r2 via r3] |
| `hyperKloosterman_bound` | 𝔽₂: 1 ≤ 1, 1 ≤ 2√2; 𝔽₄: maxima 1 ≤ 1, 3 ≤ 4, 5 ≤ 12. | Includes p ∣ k. [r2 via r3] |
| 4.3 Gauss identity | q = 3, r = 1: 0 = −1−(−1), 0 = 1−1; q = 5, k = 2: 5 = 5, −5 = −5. | Both directions. [r2 via r3] |
| `gauss_power_even_average_bound` | q = 5, k = 2: 5 ≤ 8√5+1; q = 3: 0 ≤ 4√3+1; k = 0 would give 2 > 1. | Positive rank needed. [r2 via r3] |
| 4.4 balanced errors | d = 4, Y = Q^(5/2): both exponents 1.25 at σ = .9. | Scale matches. [r2 via r3] |
| 4.4 prime main term | Leading coefficient 3/2, halved to 3/4. | No missing factor. [r2 via r3] |
| 4.4 divisor boundary | n = 1: n−1 = 0; n = 2: τ(1) = 1. | n = 1 split off. [r2 via r3] |
| 4.5 strict nonvanishing region | d = 9: σ = .8 exponent 2, σ = .9 exponent 1.5. | Strict inequality. [r2 via r3] |
| 4.5 complex finite sum | 1+i and −1 sum to i ≠ 0. | At least one nonzero twist. [r2 via r3] |
| 5.1 parameter endpoint | m = 2: .3; m = 3: .4; β₀ = .8 boundary. | Weak endpoint. [r2 via r3] |
| 5.2 exceptional arithmetic | r = 0, .2 give .25, .21; r = .3 violates 2r ≤ .4; r = −1 gives −.75. | Both hypotheses needed. [r2 via r3] |
| 5.3 clipped gap | Empty: .25 ≥ .21; extremal .21 = .21; gain 9/400 over 3/16. | No assumed exceptional eigenvalue. [r2 via r3] |
| `congruence_eigenvalue_bound`, nonconstancy | u ≡ 1 has λ = 0; without hnc the theorem would assert .21 ≤ 0. | Carried explicitly. [r2 via r3] |
| Same, congruence | Identity subgroup, u = exp(iz): λ = 0, nonconstant, bounded. | Native hypothesis excludes it. [r2 via r3] |
| Same, domain/mean zero route | λ∫u = 0 for λ ≠ 0; Rayleigh quotient λ. | Connected to the quotient objects. [r2 via r3] |
| 5.4 form inequality | u = 0: 0 ≤ 0; e₂: .21 = .21; 2ie₂: .84 = .21·4; constant fails mean zero. | Consistent. [r2 via r3] |
| 5.5 curvature scaling | κ = 4: quotient .84 = 21/25, threshold 1. | Matches. [r2 via r3] |

**Pinned-library declarations opened this round.** The manifest pins are unchanged.

Tau Ceti, in `TauCeti/NumberTheory/NumberField/Global/`, namespace `TauCeti.GlobalNumberFields`:

| Declaration | File:line | What it says |
| --- | --- | --- |
| `ideleCongruenceSubgroup` | `Ideles/Congruence.lean:193` | Valuation one at p∤𝔪, principal units at p∣𝔪, positive at the selected real places. |
| `ideleCongrOneSubgroup` | `Ideles/Congruence.lean:103` | No condition at p∤𝔪. |
| `raySubgroup` | `Ideles/Ray/Subgroup.lean:63` | Image of `ideleCongruenceSubgroup`. |
| `rayClassQuotient` | `Ideles/Ray/ClassQuotient.lean:203` | Map from the idele class group to the ray class group. |
| `rayClassQuotient_surjective` | `Ideles/Ray/ClassQuotient.lean:229` | Surjectivity. |
| `ker_rayClassQuotient` | `Ideles/Ray/ClassQuotient.lean:305` | Kernel `raySubgroup 𝔪`. |
| `ratModulus` | `RayClass/Rat.lean:73` | Binder `hn : n ≠ 0`. |
| `ratModulusEquivZMod` | `RayClass/Rat.lean:202` | `RayClassGroup (ratModulus n hn) ≃* (ZMod n)ˣ`. |
| `ratDirichletEquiv` | `RayClass/Character/Dirichlet.lean:74` | Ray class characters of (n)·∞ ≃* `DirichletCharacter ℂ n`. |
| `HeckeCharacter.ofRayClassCharacter` | `HeckeCharacter/Basic.lean:97` | Pullback of a ray class character. |
| `HeckeCharacter.shift` | `HeckeCharacter/Shift.lean:209` | Real norm shift. |
| `HeckeCharacter.unitaryPart` | `HeckeCharacter/Shift.lean:273` | Unitary part. |

The contract's backticked names `rayClassQuotient`, `raySubgroup` and `ideleCongruenceSubgroup` are the pinned names. `Completed/GlobalNumberFields/COMPLETION.md` maps Layers 6, 7, 9 and 10 to these files.

Mathlib:

| Declaration | File:line | What it says |
| --- | --- | --- |
| `mellin` | `Mathlib/Analysis/MellinTransform.lean:90` | Integrand t^(s−1). |
| `mellinInv` | `Mathlib/Analysis/MellinTransform.lean:95` | Prefactor 1/(2π). |
| `mellin_comp_inv` | `Mathlib/Analysis/MellinTransform.lean:153` | `mellin (f ∘ inv) s = mellin f (−s)`. |
| `Complex.Gammaℝ_eq_zero_iff` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:75` | Zero exactly at −2n. |
| `Complex.Gammaℝ_residue_zero` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:104` | sΓℝ(s)→2. |
| `CongruenceSubgroup.IsCongruenceSubgroup` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163` | `∃ N ≠ 0, Gamma N ≤ Γ`. |
| `gaussSum` | `Mathlib/NumberTheory/GaussSum.lean:72` | Gauss sum. |
| `ZMod.stdAddChar` | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | Standard additive character. |

Each of these agrees with the README's Conventions as stated.

**Cross-roadmap citations resolved for the changed passages.**

| Supplier | Passage resolved |
| --- | --- |
| GlobalNumberFields (main, `Completed/GlobalNumberFields/README.md`) | Layer 6 at line 439: `IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap`, ideles, norm one. Layer 7 at line 459: `ideleCongruenceSubgroup 𝔪`, `raySubgroup 𝔪`, and at line 469 `rayClassQuotient` with surjectivity and kernel. Layer 9 at line 508: `ofRayClassCharacter`, `shift`, `unitaryPart`, and the dictionary over ℚ. Layer 10 at line 531, with `RayClassGroup (ratModulus n h) ≃* (ZMod n)ˣ` for (n)·∞ at line 566. |
| GlobalNumberFields (its open revision) | The same layers at lines 673, 694, 746 and 769. The revision adds Layer 3G and drops no id the README cites. This roadmap cites the roadmap as it is on main, as the policy requires. |
| AdelicAlgebraicGroups (its open head) | §5.2 principal level at README line 5457: det K(N)={x∈ℤ̂^×: x≡1 mod N} at line 5458. U(N)=ℤ̂^×∩(1+Nℤ̂) at line 4947. These are used in R01's witness and repair. |

`roadmaps overlaps` lists no other pull request changing this folder, no dropped id and no revision-only id. `roadmaps resolve` reports nothing unresolved.

**Ownership.** The diff introduces no new owned object. The ray-class dictionary over ℚ has one owner, GlobalNumberFields, and is implemented at the pin; this roadmap only specializes it at the modulus N·∞. The previous report's object-level ownership search over open heads is unaffected and is carried. Its closest roadmaps were AutomorphicSpectralTheory, MaassForms, AutomorphicLFunctionsAndLocalFactors, GL2AutomorphicRepresentationsAndTransfer and UnboundedOperators; principal-level K(N)·SO(2) decomposition was found only here, and `curveEulerPoincareSwan` only in EtaleDualityAndPerverseSheaves.

**Declared gaps.** These are unchanged since the previous report. Six contracts are stated under Exact supplier contracts with their slugs:

| Slug | README line |
| --- | --- |
| `form-rayleigh-core` | 76 |
| `principal-level-classical-constituents` | 86 |
| `all-prime-self-pair-positivity` | 108 |
| `self-pair-local-character-transport` | 110 |
| `finite-rs-polynomial-strips` | 112 |
| `additive-character-sheaf-weight` | 126 |

`design/plan.json` lists these six and `all-level-spectral-realization`. §0.5c owns the latter specialization, so the intake can retire that announcement on AutomorphicSpectralTheory's job. This is not a finding, as recorded before.

**Pull-request text (not a folder finding).** The description still calls the roadmap “the single home of the curve Euler–Poincaré formula with Swan conductors, imported by EtaleDualityAndPerverseSheaves”. That is the reverse of the README: EtaleDualityAndPerverseSheaves §5.2 owns `curveEulerPoincareSwan`, and §4.2b descends it. The worker should correct the sentence when posting.

**Shape.** The changed lines add no process narrative, pull-request number or LaTeX delimiters (`prnum=0`, `round-labels=0`, `latex=0`). The N=3 Check keeps its two negative controls, and §0.5c still has four discriminating Checks. No source passage was copied into the roadmap or into this report, and nothing read instructed a different course of action.

## Not verifiable

- `lrs95` is settled as uncertified (paywalled). The sampled locators in 0.5b, 1.1, 1.3, 2.2, 3.1–3.3, 4.2, 5.3 and 5.4 that point into it are cited by locator only and were not read:
  - Theorem 1.1 p.387;
  - §1 pp.389–390;
  - proof p.395;
  - Lemma 3.1 p.396;
  - (3.7);
  - (3.11)–(3.12) p.397.
- The declared supplier contracts are future constructions. The roadmaps cited by the changed passages were resolved at main, at the open heads and at the pin, not as compiled code beyond the Tau Ceti declarations listed.
- The build tests elaboration, not the truth of the three admitted headlines. The carried rows are earlier reports' computations, attributed, not a second full audit of unchanged material.

## Source issues

- none
