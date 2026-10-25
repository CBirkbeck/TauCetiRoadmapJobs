<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1169#issuecomment-6399180772 -->
Red team round 1 pass b (claude) of 6d65613

Verdict: needs changes

1. **F01** (P2) statable Layer 4 headline absent from `Suggested.lean` and unnamed in its docstring

   **Location.** `Suggested.lean:10–30` (the docstring's list of non-statable headlines) and README §4.1, lines 443–449 ("Dyadic Witt coordinates").

   **Claim.** The module docstring enumerates, layer by layer, which headline theorems are not statable and what each lacks, and the file states one theorem (`arf_trace_classifies`). §4.1 — the roadmap's "explicit Witt arithmetic over ℚ₂" named in the Summary (line 3) as the input to Layer 5 — is listed neither as stated nor as not statable: W(ℚ₂) = ℤ/8·u ⊕ ℤ/2·v ⊕ ℤ/2·c with u=⟨1⟩, v=⟨1,−2⟩, c=⟨1,3⟩, the ideal (c)=⟨c,4u⟩ and the annihilator ann(c)=⟨2u,c⟩.

   **Witness.** Every carrier exists at the pin: `TauCeti.WittRing K` for `[Field K] [Invertible (2 : K)]` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:218`), `TauCeti.wittClass : RegularFormClass K →+* WittRing K` (line 288), diagonal presentations `TauCeti.RegularFormPresentation K := Σ n, Fin n → Kˣ` (`RegularFormClass/Basic.lean:88`) with `Quotient.mk (regularFormSetoid K)`, and `ℚ_[2]` with `Invertible (2 : ℚ_[2]) := invertibleOfNonzero two_ne_zero` (the pin's `PadicTwo.lean:60` builds exactly this, as a private instance, so the file must restate it). Ownership by object: QuadraticFormInvariants on main (Layers 4 and 6) states no computation of W(ℚ₂); `roadmaps grep 'ℤ/8'` over main and every open head returns no Witt-ring hit; the README's own Scope (line 11) claims the presentation for this roadmap. The brief's rule: a headline statable at the pins but absent is P2; the docstring must at least name it.

   **Repair.** Add to `Suggested.lean`, under a `/-! ## Layer 4: explicit dyadic Witt arithmetic -/` section comment, with the pinned Tau Ceti module imported (`import TauCeti.LinearAlgebra.QuadraticForm.Witt.Ring` after `import Mathlib`), a local `instance : Invertible (2 : ℚ_[2]) := invertibleOfNonzero two_ne_zero`, a one-line `noncomputable def diag {n : ℕ} (w : Fin n → ℚ_[2]ˣ) : TauCeti.WittRing ℚ_[2] := TauCeti.wittClass (Quotient.mk (TauCeti.regularFormSetoid ℚ_[2]) ⟨n, w⟩)` (a specialisation of a library notion, allowed by the acceptance-test rules), and

   ```lean
   /-- W(ℚ₂) = ℤ/8·⟨1⟩ ⊕ ℤ/2·⟨1,−2⟩ ⊕ ℤ/2·⟨1,3⟩, with the coordinate function of README §4.1
   (CDHHLMNNS-III-v4, Example 2.3.13, p. 46; Lam-2005, VI Theorem 2.29). -/
   theorem wittRing_padicTwo_coordinates :
       ∃ e : ZMod 8 × ZMod 2 × ZMod 2 ≃+ TauCeti.WittRing ℚ_[2], ∀ a b c,
         e (a, b, c) = (a.val : ℤ) • diag ![1] + (b.val : ℤ) • diag ![1, Units.mk0 (-2) (by norm_num)]
           + (c.val : ℤ) • diag ![1, Units.mk0 3 (by norm_num)] := by
     sorry
   ```

   together with `theorem wittRing_padicTwo_mul_c : ∀ x, x * diag ![1, Units.mk0 3 _] = 0 ↔ x ∈ AddSubgroup.closure {2 • diag ![1], diag ![1, Units.mk0 3 _]}` (the annihilator of c, README §4.1) if the repair worker wants the ideal statement too. If the worker judges these not headline-grade, the minimal repair is one docstring bullet naming §4.1 as statable-but-omitted with the reason; silence is the defect. Add the new name to README §4.1.

2. **F02** (P3) §4.1 Check gives the Hasse sign of c·v in a convention the roadmap does not consume

   **Location.** README line 460: "For v, the tensor c·v has diagonal ⟨1,3,−2,−6⟩, signed determinant a square and stabilized Hasse sign −1; it is the nonzero class 4u."

   **Claim.** The sign is stated against the "Hasse invariant" the section says it consumes from Tau Ceti (`TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq`, README line 47 and §4.1 Needs).

   **Witness.** The pinned `TauCeti.RegularFormClass.localHasse` is the product Π_{i<j}(aᵢ,aⱼ) of Hilbert symbols of a diagonal presentation (`TauCeti/NumberTheory/LocalField/QuadraticForm/Hasse.lean:91`, docstring on that definition). Computed with Serre's formula (the README's own line 47): for ⟨1,3,−2,−6⟩ the three nontrivial symbols are (3,−2)=+1, (3,−6)=−1, (−2,−6)=−1, product **+1**; for 4u=⟨1,1,1,1⟩ the product is **+1**; for the hyperbolic 2H=⟨1,−1,1,−1⟩ it is (−1,−1)=**−1**. So under the consumed convention c·v and 4u share the sign +1 and it is the zero class that has −1; the Check as written would identify c·v with 0 and contradict its own conclusion. The value −1 is the Clifford (Witt) invariant c(q)=s(q)·(−1,−d) in dimension 4, which the roadmap defines nowhere.

   **Repair.** Replace "stabilized Hasse sign −1" by "Hasse sign +1 in the consumed Π_{i<j} convention, whereas the hyperbolic four-form ⟨1,−1,1,−1⟩ has Hasse sign (−1,−1)=−1". Optionally add one sentence to Conventions (line 31) fixing "Hasse invariant" as Π_{i<j}(aᵢ,aⱼ), so that the §4.3 Check "diagonalization gives ⟨2,3/2⟩ and the local class c+4u" (which I recomputed: (2,3/2)=(2,6)=−1 and the six-dimensional stabilisations agree) reads in the same convention.

3. **F03** (P3) locator: Remark 2.2.8 is on page 39, not page 40

   **Location.** README line 420: "(CDHHLMNNS-III-v4, Remark 2.3.15, p. 47; Remark 2.2.8, p. 40; CDHHLMNNS-III-v4 line 2206.)"

   **Witness.** CDHHLMNNS-III-v4 line 1807 begins Remark 2.2.8; the page-40 marker is at line 1811 (page 39 begins at line 1763). Remark 2.3.15 at line 2206 on p. 47 is correct.

   **Repair.** "Remark 2.2.8, p. 39".

4. **F04** (P3) §5.5 proof route omits the degree-one boundary step that its kernel claim needs

   **Location.** README line 595: "Use the completion pullback in degree zero: ⟨u⟩∩⟨t⟩=0 makes its kernel zero."

   **Claim.** Wq(R) is the kernel of Wq(O)⊕Ws(R)→Ws(O).

   **Witness.** The Mayer–Vietoris sequence of the pullback Lq(R)→Lq(O) over Ls(R)→Ls(O) has the term Ls₁(O)=Ws(𝔽₄)=ℤ/2 before Lq₀(R); the kernel identification needs Lq₁(O)⊕Ls₁(R)→Ls₁(O) onto, i.e. Ls₁(R)→Ls₁(O) an isomorphism (CDHHLMNNS-III-v4 line 2070, step iv of the proof of Proposition 2.3.9). The roadmap has the inputs — §1.2 gives Ls₁(R)=⊕_{p|2}Ws(kₚ)=Ws(𝔽₄) and the map is the dyadic projection — but the route does not say so, and the conclusion Wq(R)=0 (which I confirmed independently: Wq(R)↪W(K) lands in the even-rank part {0,2u} of ⟨u⟩, and 2u⊗O∉{0,t}) is stated as if the intersection computation alone gave it.

   **Repair.** After "makes its kernel zero" insert: "the preceding boundary Ls₁(O)→Lq₀(R) vanishes because Ls₁(R)=Ws(𝔽₄)→Ls₁(O) is the identity by §1.2, so Lq₀(R) is exactly that kernel".

Scope of this pass: the whole of `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md` (648 lines, 23 targets, 101 Checks) and `Suggested.lean` (69 lines, one declaration), every cross-roadmap citation resolved at the heads named in the brief or by `roadmaps show`, every library name at the pins (Mathlib 6b7abb3, Tau Ceti a91d3aa), every certified source locator against the cached extractions, and the arithmetic recomputed (the 32-class table of W(ℚ₂), the Eisenstein transfer, the E₈ reduction). Pass a was not read. No P1 finding. One P2 (a statable headline missing from the acceptance test), three P3.

## Verified sound

Counts: 1 declaration read (every binder in its own signature, no section variables, so no binder can drop; elaborated type compared with README §0.4 by reading, not built); 23 targets read; 36 locators verified against the cached texts (30 in CDHHLMNNS-III-v4, 3 in Wall-1970, 2 in CMM, 1 in CDHHLMNNS-II-v5); 101 Checks read and 94 recomputed; 35 sibling section citations resolved; 29 pinned declarations located (17 Mathlib, 12 Tau Ceti, every quoted line number exact: Cyclotomic `Basic.lean:126`, `PID.lean:34`, `Three.lean:50`, `Ideal.lean:291,311`); 3 declared gaps checked for precision, minimality and declaration.

Dependency gate (run as the brief prescribes, `--movable`): `depcheck: 52 roadmaps, 589 edges, 0 problem(s)`. No UPWARD or CYCLE line. All suppliers precede line 113 of the merge order (SchemeAndStackFoundations 2, StableHomotopyKTheory 4, GeneralAlgebraicKTheory 5, GeometryOfNumbersAndQuadraticArithmetic 80, HermitianKTheoryOfPoincareCategories 81, KTheoryFiniteLocalFields 82, ArithmeticKTheory 112) or are on main (QuadraticFormInvariants, GlobalQuadraticForms, IntegralLattices, Completed/IntegralLattices).

Policy: the pull request changes only the package folder; no `lemma` (the only hit is the prose phrase "kernel/cokernel lemma"), no `set_option`, no pull-request numbers or process words, single `import Mathlib`, `theorem` throughout, every target has a locator. README and Lean agree: `arf_trace_classifies` is the only own backticked name and it is declared.

Sibling citations, each resolved at the head named: GeometryOfNumbersAndQuadraticArithmetic (`roadmaps show`, 3836 lines) §§6.2–6.5 (lines 2781–3082), §6.8a (3343; contains `residueDualizingModule`, `symmetricHeartLTheory`, `PoincareVerdierSequence`, stable GW/L), §6.9.1–6.9.3 (3480–3506; `R_S` by valuations in 6.9.2, the GW localisation sequence with the uniformiser shift in 6.9.3), §6.10a (`integralLTheoryCalculations`: Ls(ℤ)=ℤ,ℤ/2,0,0; Lq(ℤ)=ℤ,0,ℤ/2,0; signature and signature/8), §6.11. HermitianKTheoryOfPoincareCategories §1.6 with `bordism_invariant_periodicity` (line 316), §3.4, §4.5, §4.6, §6.6 (line 1047), §7.9 (1214; W(K),0,0,0 for char≠2, 2-periodic Ws/Wq for char 2, Arf over 𝔽₂ with the two planes). KTheoryFiniteLocalFields §1.7 (identifies every symmetric line with ⟨1⟩ over perfect characteristic-two k). GeneralAlgebraicKTheory §§11.3, 11.4, 11.15. StableHomotopyKTheory §§5.5, 5.7, 5.8, 5.9. ArithmeticKTheory at rev 1418 §§1.1–1.3, §2.2 (inverse-ideal convention), §3.5 (`quadraticWitt_to_symmetric_injective`, `dedekindSymmetricLTable`, `dedekindQuadraticLTable`, `quadraticL_oddExtension`, Pic(R)/2 for global K, the localization–completion square). QuadraticFormInvariants Layers 4, 6, 9 (main). GlobalQuadraticForms §4.4, §§8.1–8.3 (main). Completed/IntegralLattices Layers 1–2 and 5 (half-norm convention, E₈ self-dual), IntegralLattices line 1556 (signature ≡ 0 mod 8). SchemeAndStackFoundations §§0.14, 0.15, 0.21.

Gaps: the three slugs in `design/plan.json` match the README's contracts verbatim. `derived-localization-completion-square` and `poincare-change-of-rings-criterion`: §6.8a of the supplier has neither a localisation–completion square nor the Ore/Tate criterion (its only "completion" hits are idempotent completion), so neither asks for what exists; the second restates CDHHLMNNS-II-v5 Proposition 4.5.5 (lines 5253–5274) condition by condition — long but single and precise. `quadratic-extension-witt-exactness`: QuadraticFormInvariants Layer 9 on main has transfer and the projection formula but no restriction–transfer exact sequence; the pinned `Transfer/Witt.lean` has `scharlauTransfer`, `scharlauTransfer_baseChange_mul`, `scharlauTransfer_comp`, no kernel or image theorem; `Witt/Extension.lean` is Witt's extension theorem. Not already provided.

Ownership by object (main, board packages, every open head via `roadmaps grep`): the Arf invariant is owned over 𝔽₂ by HermitianKTheoryOfPoincareCategories §7.9 (`arfInvariantF2`, `arfInvariantF2_classifies`), cited; the absolute-trace coordinate over 𝔽_{2^r} and its degree law appear nowhere else. No roadmap states W(ℚ₂) or the Eisenstein Witt/L-groups (hits for "Eisenstein integers" are ClassicalArithmeticCompletion's primary elements, unrelated).

### The computed pass (one row per statement; values on each side)

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions line 47, Hilbert formula | (−1,−1), (2,5), (−1,2) | ε(−1)²=1; ω(5)=3≡1; ω(−1)=0 | −1, −1, +1 as stated; matches `hilbertSymbol_padicTwo` (ε(u)ε(v)+αω(v)+βω(u)) |
| Conventions line 25, sign shift | ℤ, degrees 0 and 2 | L⁻ₙ=L⁺ₙ₋₂: L⁻₂(ℤ)=L⁺₀=ℤ, L⁻₀=L⁺₋₂=L⁺₂=0 | agrees with §1.2 Check and Remark 2.3.3 |
| §0.1 inverse of σ when 2 is a unit | b=xy over ℚ | half-diagonal x²/2, polar at (1,1) = 1; x² gives 2 | Check true |
| §0.1 ℤ[√−5] example | I=(2,1+√−5) | I²=(4,2+2√−5,−4+2√−5)∋6−4=2, so I²=2R; adjoint I→Hom(I,R)=I/2 is x↦x/2 | perfect on a nonfree rank-one projective; Check true |
| §0.1 characteristic two | x²+xy+y² over 𝔽₂ | Arf 1; polar alternating ⇒ 0 in Ws(𝔽₂) | σ not injective in char 2; Check true |
| §0.2 injectivity Ws(R)→Ws(K) | ℤ, 𝔽₂[t], R=K | ⟨1⟩ signature 1; polar of xy alternating ⇒ 0 while ⟨1⟩ has rank parity 1; identity for a field | Checks true; source line 2226–2235 sketches the strict-Lagrangian argument |
| §0.3 residues at 2 | ⟨3⟩, ⟨2⟩, ⟨4⟩ over ℤ₍₂₎ | v(3)=0 ⇒ 0; v(2)=1 ⇒ ⟨1⟩≠0; v(4)=2 ⇒ 0 | Checks true (Lemma 2.2.9, line 1840) |
| §0.3 residue at 3 and 5 | ⟨6⟩ π=3; ⟨5⟩ π=5 and π′=10 | ⟨2⟩, 2 nonsquare mod 3; ⟨1⟩ then ⟨2⁻¹⟩=⟨3⟩, 3 nonsquare mod 5 | Checks true; v̄⁻¹ rule of line 27 consistent |
| §0.3 ramified ℤ→ℤ[i] | prime 2 | 2=−i(1+i)² ⇒ ⟨2⟩ becomes a unit line ⇒ residue map ℤ/2→ℤ/2 is 0 | Check true; source Remark 2.2.6 (line 1794) says exactly this |
| §0.4 Arf values | xy, x²+xy+y² over 𝔽₂; over 𝔽₄ | Tr(0)=0; Tr(1)=1 over 𝔽₂; Tr_{𝔽₄/𝔽₂}(1)=1+1=0 and (ζ,1) is a zero; x²+xy+ζy²: Tr(ζ)=ζ+ζ²=1 | all seven Checks true |
| §0.4 raw sum basis dependence | q=xy over 𝔽₄, basis ((1,1),(ζ,ζ²)) | det=ζ²+ζ=1≠0; b=ζ+ζ²=1; raw sum 1·1=1, trace 0 | Check true |
| §0.4 zero-dimensional form | q=0 against xy and against the Arf-one plane | traces 0,0 and L=line in the 2-space; traces 0,1 and no isotropic vector | both directions true |
| `arf_trace_classifies` (Lean) | n=m=0; n=1,m=0 with q=x²+xy+y² over 𝔽₂ and q′=0; k=𝔽₄ same q | empty sums, L=0, 2·0=0: iff holds; traces 1 vs 0, no L of dim 1 on which q vanishes (anisotropic): iff holds; traces 0 vs 0, L=⟨(ζ,1)⟩: iff holds | true as typed: the six basis conditions give polar matrix [[0,I],[I,0]], so q⊥q′ is nonsingular; a half-dimensional totally singular L makes it hyperbolic, Arf 0; conversely equal Arf gives Arf(q⊥q′)=0, hyperbolic over a finite field |
| §1.1 characteristic-two table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic=0 ⇒ odd groups 0; no primes for a field; the t-prime is inverted | Checks true; Corollary 2.3.4 (line 1936) |
| §1.2 DVR tables | ℤ₍₂₎, ℤ₍₃₎, 𝔽₂[[t]] | ∂⟨2⟩=⟨1⟩ generates ℤ/2; Ls₂(𝔽₃)=0; char-2 DVR odd groups 0 | Checks true; Remark 2.3.5 (line 1960) |
| §1.2 global | ℤ (d=1, Pic/2=0), 𝔽₃[t] (d=0) | ℤ,ℤ/2,0,0 and Ws(R),0,0,0 | matches Corollary 2.3.2 (line 1904) |
| §2.1 completion | ℤ, ℤ[1/2], ℤ[ζ₃], ℤ[i], ℚ, ℤ₍₃₎ | one factor ℤ₂; empty product 0; one factor with residue 𝔽₄ (t²+t+1 has values 1,1 at 0,1); (2)=(1+i)², one factor; (2)=unit ideal ⇒ 0 | all six Checks true |
| §2.2 fracture square | ℓ=1; ℤ/4, ℓ=2; even-Euler subcategory | completion 0; completion ℤ/4 and ℤ/4[1/2]=0; K₀ image 2ℤ, [k]=1 outside | Checks true; hypotheses match Proposition 2.3.6 (line 1976: bounded ℓ^∞-torsion, c=im K₀) |
| §2.3 lifting | xy over ℤ₂; the two planes; J=0; 𝔽₂[ε]; lines ⟨1⟩,⟨3⟩ | det −1; Arf 0 vs 1 so no residue isometry; identity; J²=0; 3∉ℚ₂² (3≢1 mod 8) | Checks true; Wall-1970 Theorem 2 at line 132 (p. 428), Lemma 1 at line 104 (p. 427) |
| §2.4 rigidity | ℤ₂ with J=(2); 𝔽₂[ε]; J=0, J=R; symmetric comparison | Lq(𝔽₂)=ℤ/2,0,ℤ/2,0; identity; R=0; |Ws(ℤ₂)|=16≠2 | Checks true; Proposition 2.3.7 (line 2000); Wall-1973 inputs at lines 2019–2021 |
| §2.5 henselian pairs | (ℤ₂,(2)), (𝔽₂[ε],(ε)), J=0 | same as §2.4; (2) not nilpotent yet henselian | Checks true; Remark 2.3.8 (line 2023) is for commutative rings, as the README states; CMM Remark 5.6 lines 1659–1674, Theorem 3.15 line 892 |
| §3.1 quotient by two images | (ℤ/2)^d with diagonal and 0; ℤ/4 with 2D and 0, then D; 2 a unit | 2^{d−1}; ℤ/2 then 0 (intersection would leave ℤ/4); C=0 | all six Checks true |
| §3.2 number-field table | ℤ, ℤ[1/2], ℤ[ζ₃] | d=1 ⇒ Lq₂=ℤ/2; d=0 ⇒ 0; d=1 with A=ℤ/4 | Checks true; Corollary 2.3.10 (line 2072) |
| §3.3 parity quotient | d=2,3,1,0; R=ℤ[t]₍₂₎[(1+√17)/2] | 2, 4 cosets; 1; 0; disc 17 a unit, x²−x−4 irreducible over ℚ(t), reduces to x(x+1): two primes, residue 𝔽₂(t) infinite and imperfect, quotient ℤ/2 | Checks true; Remark 2.3.12 (line 2099) |
| §3.4 nondyadic localisation | S=∅; S={(3)}; S={(2)} (negative control); infinite S | identity; residue Lq(𝔽₃); Lq₃(𝔽₂)=0 and Lq₂(ℤ[1/2])=Ls₂=0 would force Lq₂(ℤ)=0≠ℤ/2; finite support | Checks true; Remark 2.3.15 (line 2206) |
| §4.1 the 32 classes | all (a,b,e)∈ℤ/8×ℤ/2×ℤ/2 | pairwise distinct by (rank parity, det, Π_{i<j}) after hyperbolic stabilisation; 8u=0, 4u≠0; 2v=2c=0 | presentation true |
| §4.1 products | c·u, c·v, c·c; ⟨1,−5⟩; ⟨1,−3⟩ | c; ⟨1,3,−2,−6⟩=4u (det square, Π_{i<j}=+1, 2H has −1); ⟨1,3,3,9⟩=2c=0; −5·3⁻¹≡1 mod 8 ⇒ c; ⟨1,−3⟩⊥H and ⟨1,1,1,3⟩ both det 3, Π=+1 ⇒ 2u+c | all true |
| §4.1 ideal and annihilator | multiplication by c on all 32 classes | image {0,c,4u,c+4u}; kernel = {a even, b=0}, 8 elements = ⟨2u,c⟩ | (c)≅(ℤ/2)², ann(c)≅ℤ/4⊕ℤ/2 true; v∉ann(c) since cv=4u≠0 |
| §4.1 Check line 460 | c·v | Π_{i<j}=+1 | sign stated as −1: R02 |
| §4.2 E₈ reduction | 256 vectors of 𝔽₂⁸, Dynkin T₂,₃,₅ (arms 1,2,4 beyond the branch) | zeros 136 = 2⁷+2³ | Arf 0; q(eᵢ)=1, q(eᵢ+eⱼ)=1 for adjacent roots; consistent with Lq₀(ℤ)→Lq₀(ℤ₂) zero and the kernel {(0,8k)} of (x,y)↦σ(x)−y |
| §4.3 Ws(ℤ₂) | second residue on u,v,c | residues 0,1,0 ⇒ kernel ⟨u,c⟩ of order 16 = ℤ/8⊕ℤ/2; ⟨−1,2⟩=−v=v of order 2 | true; polar [[2,1],[1,2]] diagonalises to ⟨2,3/2⟩, (2,6)=−1 ⇒ ≠c, and after stabilisation =c+4u; ⟨u,c+4u⟩=⟨u,c⟩ ⇒ A(ℤ)=0 |
| §5.1 Eisenstein place | t²+t+1 mod 2; disc −3; ℚ(√−7) control; units | no root ⇒ 𝔽₄; odd disc and derivative 1; t²+t+2≡t(t+1) splits; six norm-one solutions, μ₆²=μ₃ of index 2 | Checks true; `inertiaDeg_eq_of_not_dvd` gives orderOf(2 : ZMod 3)=2, `ramificationIdx_eq_of_not_dvd` gives 1 |
| §5.2 Ws(ℤ[ζ₃])=ℤ/4 | u, 2u, 4u in W(K) and W(E) | −1=ζ+ζ²=(ζ)²+(ζ²)² so level 2 ⇒ 4u=0; −1∉K², −1∉E² (ℚ₂(i) ramified, E unramified) ⇒ 2u≠0; (parity, signed det) of 0,u,2u,3u = (0,1),(1,1),(0,−1),(1,−1) | true; unit square classes ±1 since ζ=(ζ²)² |
| §5.3 restriction to E=ℚ₂(√−3) | ker, coker | ker θ′=(c)=(ℤ/2)² (Lam VII.3.5 with a=−3), coker≅ann(c) of order 8; |W(E)|=4·16=64=8·8 consistent; snake lemma with identity on ℤ/2 gives ker θ=(c)⊂Ws(ℤ₂), coker θ≅ann(c) | true; image of Ws(ℤ₂) is ⟨u⟩ of order 4, kernel order 4 |
| §5.4 the class t | polar [[2,1],[1,2ζ]] | det 4ζ−1, signed det 1−4ζ=3−2√−3, norm 9+12=21≡5 mod 8 not a ℚ₂ square; 2u has signed det −1 of norm 1 | t∉⟨u⟩, ⟨u⟩∩⟨t⟩=0 true; Wq(ℤ₂)→Wq(O) is zero (degree 2) |
| §5.5 transfer and A | λ(1)=0, λ(s)=1, basis (1,s,·) | Gram matrix recomputed entry by entry = the README's table; det 21; diagonalisation ⟨1,−1,4,−21/4⟩; after H: ⟨1,−21⟩ with −21·3⁻¹=−7≡1 mod 8 ⇒ =c; equals c (not 4u, not c+4u) by invariants | A=ann(c)/⟨c⟩=⟨2u⟩≅ℤ/4 true |
| §5.5 tables | Mayer–Vietoris in degrees 3,2,1,0 | Lq₃=coker(Wq(O)⊕Ws(R)→Ws(O)) since Lq₃(O)=Ls₃(R)=Ls₃(O)=0; Lq₂=Lq₂(O)=ℤ/2; Lq₁=0 since Ls₁(R)→Ls₁(O) is iso; Lq₀=0 (R04) | symmetric ℤ/4,ℤ/2,0,0 and quadratic 0,0,ℤ/2,ℤ/4 true; the source's ℤ/2 and ℤ/4⊕ℤ/2 are wrong (Source issues) |
| Worked examples table | the three rows | consistent with §§4.3, 3.2, 5.5 | true |

Convention witnesses recomputed in every supplier that uses the same object: the uniformiser residue ∂⟨πu⟩=⟨ū⟩ (GeometryOfNumbers 6.9.1 and 6.9.3 Checks agree, including the ℤ→ℤ[i] zero map); the sign shift L⁻=Σ²L⁺ (HermitianKTheory §7.9(b)); the Arf planes over 𝔽₂ (HermitianKTheory §7.9 Checks); signature and signature/8 (GeometryOfNumbers §6.10a); the inverse-ideal-class residue convention of ArithmeticKTheory §2.2, which the README correctly notes is invisible modulo 2.

## Not verifiable

- Lean elaboration: not built. Neither the worker's board checkout nor its content checkout has a Lake environment (`content/lakefile.toml` exists but no `.lake`), and the brief forbids builds elsewhere; `#check @arf_trace_classifies` was therefore not run. The signature was compared by reading: `Module.Basis (Fin n × Bool) k V` (pinned `Module.Basis`, `LinearAlgebra/Basis/Defs.lean:89`), `QuadraticMap.polar` (`QuadraticForm/Basic.lean:96`), `QuadraticMap.prod` (`Prod.lean:55`), `Algebra.trace` (`Trace/Defs.lean:70`); the `Algebra (ZMod 2) k` instance is a free argument but unique (any ring hom out of ZMod 2 is determined), so the trace is well defined.
- Wall-1973 (Corollary 1, Lemma 1, Proposition 4, Lemma 5), Lam-2005 (VII Theorem 3.5, VI Theorem 2.29, VI Remark 2.31) and Scharlau-1985 (Chapter 6 §6, Theorem 6.11) are settled as uncertified; cited by locator only. The §4.1 and §5.3 claims attributed to them were verified by direct computation instead, as recorded above.
- The real-place-free reciprocity step in §5.2 (dyadic Hasse sign forced by the product formula) was checked only at the level of invariants (four classes, four distinct invariant pairs), not by exhibiting the global forms.
- Ownership against open pull requests whose files the brief does not provide was checked only through `roadmaps grep` over their heads (by object: Arf invariant, W(ℚ₂), Eisenstein Witt groups), not by reading them.

## Source issues

- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, p. 46 (lines 2160–2163) with consequences at lines 2178 and 2202–2205: the diagram's vertical arrow on the quadratic ℤ/2 factor Lq₀(ℤ∧2)→Lq₀(R∧2) is marked as the identity; it is zero, since the Arf invariant is multiplied by the residue degree 2 under 𝔽₂→𝔽₄ (x²+xy+y² acquires the zero (ζ,1)); it should give Lq₀(R)=0 and Lq₋₁(R)=A=ℤ/4 rather than ℤ/2 and ℤ/4⊕ℤ/2; affects a stated result.
- **Error** in CDHHLMNNS-III-v4 at Example 2.3.14, p. 47 (lines 2180–2181): the annihilator of ⟨1,3⟩ in W(ℚ₂) is said to be generated by 2⟨1⟩ and ⟨1,−2⟩; but ⟨1,−2⟩·⟨1,3⟩=⟨1,3,−2,−6⟩=4⟨1⟩≠0, so ⟨1,−2⟩ is not in it; it should be 2⟨1⟩ and ⟨1,3⟩ (equivalently ⟨1,−3⟩); affects nothing (the group ℤ/4⊕ℤ/2 is right).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6d65613", "job": "RT-GeometryOfNumbersAndQuadraticArithmeticPartII~1b", "model": "fable", "worker": "fable-rt41"} -->
