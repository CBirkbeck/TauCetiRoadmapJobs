<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1597#issuecomment-6447570196 -->
Red team round 2 pass a (codex) of 1db8b48

Verdict: needs_changes

1. **F01** (P1) The pre-Tate diagonal does not send 2 to the scalar 4

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:466`: “the space-level power on π₀ sends 2 to 4”.

   **Claim:** For X=Hℤ, the pre-Tate lift into π₀((Hℤ⊗Hℤ)^(hC₂)) has value 4 on 2.

   **Witness:** Applying can gives 2∈ℤ₂ by §§4.2 and 3.4, whereas can(4·1)=4∈ℤ₂. Only restriction to the underlying tensor has value 4.

   **Exact repair text:** Replace that Check by: “For X=Hℤ and p=2, write u for the unit in π₀((Hℤ⊗Hℤ)^(hC₂)). The pre-Tate diagonal sends 2 to 2u+Nm(1). Restriction to π₀(Hℤ⊗Hℤ)=ℤ sends this to 4, whereas can sends it to 2∈π₀T₂(Hℤ)=ℤ₂. In particular it is neither 2u nor 4u. This detects nonadditivity before Tate.”

   **Repair test:** restriction(Nm(1))=2 and can(Nm(1))=0. Thus the repaired two images are 4 and 2. The additive candidate 2u has restriction 2, while the scalar candidate 4u has Tate image 4. The HA multiplication in §4.4 is a further map and does not repair this earlier identification implicitly. Source support: ns18 lines 4920–4959 (space diagonal and norm splitting); bmms86 VIII.1's sum formula.

2. **F02** (P1) The repaired Singer route cites the homotopy Tate sequence for a homological comparison

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:298,306`: “the Tate spectral sequence of the tower is multiplicative”; “KTheoryFiniteLocalFields §4.5”.

   **Claim:** The cited supplier provides the unit-detection spectral sequence used to identify the continuous-cohomology map with the Singer augmentation.

   **Witness:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:718` supplies Ĥ^(−s)(G,π_tT) ⇒ π_(s+t)T^(tG). The argument adapted from lnr12 line 2059 instead uses Ĥ^(−s)(G,H_t(T;𝔽_p)) ⇒ H^c_(s+t)(T^(tG);𝔽_p).

   **Exact repair text:** Add an explicit construction target before the unit-detection argument: “For every finite group G, prime p, and bounded-below, mod-p finite-type G-spectrum T, construct the homological Tate spectral sequence of its Greenlees tower, with E²_(s,t)=Ĥ^(−s)(G,H_t(T;𝔽_p)), converging strongly to continuous homology lim_(k→−∞) H_(s+t)(T^(tG)[k];𝔽_p), together with the continuous-cohomology dual comparison. For equivariant ring spectra construct its unital multiplicative pairing and prove that the unit is represented by 1⊗1 in bidegree (0,0). For G=C_p and T=B^(⊗p), compare this homological filtration with the continuous Singer identification of §2.6. Source: lnr12 §4.4, Propositions 4.14–4.17, especially lines 1474,1488,1608.” Cite this target in §2.6. Retain KTheoryFiniteLocalFields §4.5 for its actual homotopy Tate sequence. Alternatively declare this exact additional comparison as a supplier gap with matching plan and README entries.

   **Repair test:** At T=S, p=2, the homological sequence has E²=𝔽₂[s±¹] and continuous homology has one 𝔽₂ in every degree; ordinary H_*(S₂^∧;𝔽₂) has only degree zero. At T=(H𝔽_p)^(⊗p), the unit in the homological sequence detects the dual Singer class Σx⁻¹ or Σxy⁻¹ used in the proof. Substituting π_*T for H_*T does not establish that dual-class assertion. Applying the supplier to H𝔽_p⊗T would also require proving the filtration/continuous-homology comparison; it cannot be an unstated interchange of smash and homotopy limit.

3. **F03** (P3) The power-operation Checks still admit wrong operations

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:508–511,672–675`: “P_p(0)=0 and P_p(1)=1”; “P_p^0 agrees with P_p”.

   **Claim:** These definitions have three discriminating Checks, including operation values beyond coefficient powers and their declared target types.

   **Witness:** The wrong operation P′(x)=pr_X*(x^p) passes every §4.4 Check. In §5.3, keeping P_p^0 but making every nonzero-degree operation zero passes all four Checks, with the correct target twists.

   **Exact repair text:** Replace the unit-only §4.4 Check with: “At (R,X,p)=(KU,*,2), P₂(2)=3·1+sign in KU⁰(BC₂), whereas pr*(2²)=4·1; their transposition characters are 2 and 4.” In §5.3 replace the zero and definition-restatement Checks by: “For R=H𝔽₂, n=1 and u∈H¹(ℝP∞;𝔽₂), the Thom-oriented restriction to C₂ is u²+ub, where b generates H¹(BC₂;𝔽₂); both monomials are nonzero.” “For R=KU, n=−2 and β∈KU^(−2)(*), restriction to the trivial subgroup sends P₂^(−2)(β) to β²≠0 in KU^(−4)(*); the untwisted coefficient β² is a unit.” “At n=0, R=KU, X=* and p=2, the value on 2 is 3·1+sign, with transposition character 2.” Keep the two representation/inverse-twist controls.

   **Repair test:** The first wrong model gives character 4 instead of 2. The zero positive-degree model gives 0 instead of u²+ub, and the zero negative-degree model gives 0 instead of β². These are README Checks, not new Suggested.lean declarations. The §4.4 portion makes r1b F04 only partly repaired: the new 𝔽₄ test excludes pullback of x but still accepts pullback of x^p.

4. **F04** (P3) The completeness supplier sections are interchanged

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:323,333,419,429`: “§7.15 (mod-p detection for complete spectra)”; “§7.16 (closure of complete spectra)”.

   **Claim:** These section numbers identify the two consumed completeness theorems in the current StableHomotopyKTheory supplier.

   **Witness:** `TauCetiRoadmap/StableHomotopyKTheory/README.md:2445` is §7.15, closure; line 2453 is §7.16, mod-p detection. Both results exist, with the needed hypotheses, but at the opposite locators.

   **Exact repair text:** At all four listed lines replace “StableHomotopyKTheory §7.15 (mod-p detection for complete spectra)” with “StableHomotopyKTheory §7.16 (mod-p detection for complete spectra)”. At lines 419 and 429 replace “StableHomotopyKTheory §7.16 (closure of complete spectra)” with “StableHomotopyKTheory §7.15 (closure of complete spectra)”. The range citation §§7.14–7.18 needs no change.

   **Repair test:** The actual §7.16 applies to the completed source and complete Tate target in §§2.7 and 3.4. For the identity on H𝔽_p the fiber and its mod-p reduction are both zero; Hℚ has zero mod-p reduction but is not complete. The actual §7.15 supplies closure for the fibers used by this test.

5. **F05** (P3) The KU/Johnson–Wilson comparison is cited in the wrong section

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:923,935`: “BordismFormalGroups §F6.4 (smashing and the E(1)/KU Bousfield comparison)”.

   **Claim:** §F6.4 supplies both inputs used to identify the localization in §7.5.

   **Witness:** `TauCetiRoadmap/BordismFormalGroups/README.md:1275` supplies smashing. Its KU comparison is instead in F3, lines 294–306: ku_(2)≃BP⟨1⟩ and the Bott-compatible odd-prime Adams splitting. F6.4 never mentions KU.

   **Exact repair text:** Replace the cited phrase at both locations by “BordismFormalGroups §F6.4 (smashing) and F3 (the Bott-compatible ku/BP⟨1⟩ comparison, giving KU_(2)≃E(1) after periodic localization)”. Add the F3 input to the first sentence of the §7.5 proof route.

   **Repair test:** At p=2, F3 identifies ku_(2) with BP⟨1⟩; inverting the specified Bott/v₁ classes gives KU_(2)≃E(1), so their Bousfield classes agree. F6.4 then gives L₁X≃L₁S⊗X. No additional supplier or new construction is required.

6. **F06** (P3) Two source locators use the wrong result labels

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:873,881,1024`: “Example IV.1.14”; “Propositions IV.3.1–IV.3.2 … pp.347–355”.

   **Claim:** These identify the labeled statements and printed pages in the corrected publisher edition of ns18.

   **Witness:** ns18 line 5067 is Remark IV.1.14, printed p.331. ns18 line 5615 is Lemma IV.3.1, beginning on printed p.345, outside the stated pp.347–355 range.

   **Exact repair text:** At lines 873 and 881 replace “Remark IV.1.13 and Example IV.1.14” with “Remarks IV.1.13–IV.1.14”. At line 1024 replace the IV.3 locator with “IV.3 Lemma IV.3.1, Proposition IV.3.2, Corollary IV.3.3 and Theorem IV.3.7 with proof, pp.345–355”. Make the same IV.3 locator replacement in the existing ns18 entry of sources.toml, without creating another source key.

   **Repair test:** Remark IV.1.14 contains the line-bundle argument L↦L²; Lemma IV.3.1 contains the cyclic-bar Frobenius lift. For a point the latter gives S→S^(hC_p)→S^(tC_p). The corrected labels and page range locate these exact statements.

Six findings: two P1 mathematical/proof-contract defects and four P3 Check/locator defects.

## Verification of the nine earlier findings

The repair report accepts all nine original findings. None of their package-local content is settled as “not actionable.” The two requested changes to other roadmaps remain outside this package; they are not re-raised here. Quoted repaired text below is from the current README.

| Earlier finding | Status | Repaired passage and location | Independent witness and repair regression test |
|---|---|---|---|
| r1a F01, genuine norm prerequisite | Repaired as to the original norm omission; new proof dependency S02 | §2.6, line 298: “Then work with the imported Δ_p itself; no genuine equivariant norm and no Segal equivalence enter.” | lnr12 lines 2046–2076 give factorization through ε, unit, suspension and representability. AInfCohomology AI.7.2 supplies exact Δ. U_n(ΣB)=ΣU_(n−1)(B) for n≥1. At H𝔽_p, ε(Σx⁻¹)=1 or ε(Σxy⁻¹)=1; A_p-linearity determines g on A_p. No norm is needed, but the continuous homological unit comparison is not the cited supplier's homotopy sequence (S02). |
| r1a F02, finite Steenrod Hopf chain | Repaired, conditional on declared gap | Lines 63,85: “they are the BordismFormalGroups gap below”; “What BordismFormalGroups must provide (gap:steenrod-finite-hopf-chain)” | Same slug, supplier and section in plan.json. BordismFormalGroups F6.3 lines 1003–1017 still supplies E(Q_i),T_t instead. AGM lines 214–239,290 give the required chain/freeness route. Dimensions at n=−1,0 are 1,2; A₂(1) has dimension 8, A₃(1) dimension 12, versus 4 for E(Q₀,Q₁). |
| r1a F03, integral splitting scalars | Repaired | §6.1, line 751: “For Hℤ they are splittings of Hℤ-modules through const, obtained from the complete cyclic resolution decomposed into two-term complexes with differential p” | [ℤ→ᵖℤ] has homology ℤ/p in one degree. At p=2 the Tate target has π₀=𝔽₂,π₁=0. Between even shifts, Ext^(2k−2j)_ℤ(ℤ/p,ℤ/p) is 𝔽_p for k=j and zero otherwise. The nonexistent map H𝔽_p→Hℤ is no longer used. |
| r1a F04, AInf sphere Check attribution | Repaired | Line 102: “The sphere Check of the Tate diagonal fixes the map S→S^(hC_p)→S^(tC_p); its identification as the p-completion of S is proved in §2.7 here” | AInfCohomology AI.7.2, spectral Tate-diagonal Checks, specifies the map but no completion theorem. Unit 1↦1 is the supplied normalization; π₀ target=ℤ_p is the new §2.7 consequence. |
| r1a F05, suspension Checks | Repaired | Lines 692–693: “as the identity on (S^ρ⊗R)^(tC₂)”; “For R=Hℤ, p=2 and n=1” | The sign-coordinate reflection fixes the fixed sphere; its free cofiber disappears under Tate, so it acts as +1 on π₁=ℤ₂, despite underlying degree −1. Hℤ gives (π₀,π₁)=(0,𝔽₂) for ΣHℤ^(tC₂), versus (𝔽₂,0) for Σ²Hℤ^(tC₂). |
| r1b F01, imported sphere fixpoint counterexample | Repaired | Line 930: “The sphere counterexample to the Tate fixpoint lemma follows from §2.7.” | ns18 lines 623–635 use precisely the norm triangle, orbit lemma, trivial residual action and completion invariance. Residual Tate of the orbit term is 0; the remaining term is S_p^∧, π₀=ℤ_p. Lines 106,935 no longer consume a supplier's Segal consequence as a premise. |
| r1b F02, spherical Witt overlap | Repaired within this package | Lines 7,1014: “§4.8 owns the spherical lift SW(k)”; “import §4.8 for the finite-field case W(k) rather than constructing SW(k) again” | HabiroCohomologyFoundationsPartII §0.1 line 146 still includes perfect δ-rings B=W(k). It is later in ORDER.txt. Here SW(𝔽_p)=S_p^∧ and SW(𝔽₄) has rank 2; the earlier owner is explicit. Updating that later roadmap is the maintainer action already recorded in the repair report. |
| r1b F03, pinned Witt identification | Repaired | Line 37: “this identification is not part of the supplier gap below” | Mathlib/RingTheory/WittVector/Compare.lean:199 is WittVector.equiv. Both gap entries use that identification, asking only for finite étaleness, rank and reduction of endomorphisms. At d=1 the identification and identity Frobenius are pinned. At d=2,p=2 the new input is rank 2 and a↦a+1. |
| r1b F04, nondiscriminating definition Checks | Partly repaired; S03 | Lines 191,283,510: “every class dies at the next stage”; “bottom cell in degree p+1”; “P_2(a)=a²=a+1” | The zero-transition tower has H_c=0 but ⊕H*≠0. U₀(ΣS) has bottom degree 3 at 2, versus 2 for ΣU₀(S). The 𝔽₄ Check excludes pullback of a, but all §4.4 Checks still accept pullback of a^p. S03 supplies a KU value that separates them and treats the untested §5.3 operations. |

## Statement and adversarial-instance ledger

All 1,034 README lines and all 62 Suggested.lean lines were read. There are 37 numbered target sections and one additional derived theorem in the Layer 7 Examples. The bold “Summary”, “Checks” and reference labels are not additional mathematical declarations. The following rows cover every numbered target, including its definitions, identities, API consequences and Checks. Values refer to the displayed maps or objects, rather than a claim that a build establishes truth. Z_p denotes the p-adic integers, H_c uses the stated tower, and all vector-space dimensions are over 𝔽_p unless specified otherwise.

| Statement / context | Instances tried | Computed values on the compared sides | Result / change |
|---|---|---|---|
| §1.1 cyclic coefficients, prime p; trivial action | p=2,3; generator b↦2b at 3; integral coefficients | At 2 each Tate degree is 𝔽₂; integrally degrees 0,1 give (𝔽₂,0). At 3, β(b/u)=1; b↦2b gives t↦2t,e↦e,t²↦t². W-invariant integral degrees are multiples of 4. e has weight 1 and b=t⁻¹e has weight a⁻¹; replacing e by −e gives βe=−1, excluded by βe=1. | Correct; inverse conjugation convention agrees with ns18 lines 5111–5115. |
| §2.1 tower cohomology, arbitrary countable tower | Constant H𝔽_p; zero transitions on Σ^(−n)H𝔽_p; sphere Singer tower | Constant comparison is identity. Zero-transition colimit is 0, whereas the direct sum has a nonzero class in degree −n for every n. Singer H_c has nonzero negative classes whereas H^q(S_p^∧;𝔽_p)=0 for q<0. | Correct tower dependence and comparison direction. |
| §2.2 inverse-limit Adams, each stage bounded below and finite type | Zero tower; constant H𝔽_p; sphere U_n with decreasing lower bounds | E₂=0 in the zero case; Ext_A(A,𝔽_p)=𝔽_p at (0,0), zero elsewhere. At 2, U_n(S) bottom degrees are 1,0,−1 for n=0,1,2; a common lower bound is unavailable and not assumed. | Correct; compact dual-limit argument is required, not arbitrary inverse-limit exactness. |
| §2.3 Singer functor and augmentation, any graded left A_p-module | M=0,𝔽_p; p=2,3; negative upper and lower binomials; odd suspension | R_+(0)=0. ε(Σx⁻¹)=1 at 2; ε(Σxy⁻¹)=1 at 3. Sq¹x⁻¹=x⁰ because binom(−1,1)=1 mod 2; negative lower entries contribute 0. Odd β(xy⁻¹)=1 and β(y^r)=0; ε(Σ1)=−β and the suspension sign makes ε A-linear. | Correct; ordinary diagonal tensor action would not give the displayed twist. |
| §2.4 Singer Tor/Ext equivalence; bounded-below finite-type second Ext argument only | M=0; M=𝔽_p; shifts of the target; A_p(−1),A_p(0),A_p(1) | Zero Tor groups map 0→0. Hom_A(R_+𝔽_p,𝔽_p) has dimension 1 and ε sends its specified unit class to 1. For N=Σ⁻¹𝔽_p the corresponding scalar graded-Hom component moves to degree −1 on both sides (dimension 1 there, not at degree 0). Finite-chain dimensions at 2 are 1,2,8; at 3 are 1,2,12. | Correct conditional on the declared chain gap; no boundedness imposed on M. |
| §2.5 U_n and Greenlees tower | B=S,ΣS; n=0,1,2; p=2,3 | Bottom degree U_n(S)=1−(p−1)n: (1,0,−1) at 2 and (1,−1,−3) at 3. U₀(ΣS) begins at p+1, versus 2 for ΣU₀(S). U₁(ΣS)=ΣU₀(S), with bottom 2. U₀(S)=ΣΣ∞_+BC_p starts in degree 1, whereas D_(C_p)(S) starts in degree 0. | Correct; bracket index is filtration, not suspension. |
| §2.6 continuous Singer comparison and Δ-induced ε | B=0,H𝔽_p,ΣH𝔽_p; p=2,3; wrong map −Δ at 3 | Zero gives 0→0. Unit generator Σx⁻¹ or Σxy⁻¹ maps to 1; wrong −Δ maps it to −1=2 at 3. Reindexing gives the suspended unit. For B=S the continuous homology has one coefficient in every degree, ordinary homology only degree zero. | Statement sound; proof input S02 missing. |
| §2.7 finite-type Segal | B=S,H𝔽_p,Hℚ | Sphere π₀ target=Z_p and negative groups=0. H𝔽_p target has π₀=𝔽_p and all other groups=0, unit map=id. Hℚ has completion=0 and tensor Tate=0 though source π₀=ℚ. | Correct conditional on earlier proof; locator S04. |
| §3.1 finite inverse systems | Constant ∅; constant two points; {a,b}←{a}←⋯; binary strings of length n | Limits have cardinalities 0,2,1,2^ℵ₀ respectively. In the third system first-stage eventual image={a}, not {a,b}. Binary-string projections cannot become injective; its limit is not finite. | Correct empty/nonsurjective treatment and finite-limit hypothesis. |
| §3.2 bounded fixed-point approximation | 0; H𝔽_p; H𝔽_p⊕H𝔽_p; n<0 | Zero gives zero at each stage. The unit-normalized limit has degree 0=𝔽_p and other degrees=0. In the two-summand expansion mixed words are induced; their Tate image=0, leaving two diagonal coefficients. Negative Postnikov truncations of a connective tensor are 0. | Correct; total truncation conventions checked. |
| §3.3 arbitrary-dimensional vector inputs | dimensions 0,1,2,κ with κ uncountable | π₀ comparison is respectively 0→0, 𝔽_p→𝔽_p, 𝔽_p²→𝔽_p² and ⊕_κ𝔽_p→⊕_κ𝔽_p, each identity; other groups=0. Product 𝔽_p^κ permits infinite support, unlike both sides here. | Correct uniform finite-system step; no countability restriction on basis. |
| §3.4 bounded-below Segal, all small cardinalities | S; Σ⁻¹H𝔽_p; H(⊕_κ𝔽_p); KU at 2 | S gives π₀=Z_p. Shifted input and target have exactly π₋₁=𝔽_p. Arbitrary basis gives the direct sum, not product. KU₂^∧/2 has 𝔽₂ in each even degree while T₂(KU)/2=0. | Correct boundary and excluded input; locator S04. |
| §4.1 Weyl refinement | p=2,3; unit; rescale cyclic generator | W has orders 1 and 2; unit maps to 1, invariant coefficients at 3 are t^(2j),e·t^(2j). Conjugating b↦2b leaves e and t² fixed. In S[ℕ], z maps to z^p; at p2 its basis exponent is 2 rather than 1. | Correct unique monoidal refinement; scalar rescaling cannot preserve the unit. |
| §4.2 pre-Tate diagonal | X=0,S,Hℤ; p=2; scalar 2 | Zero maps to zero and the unit to unit. At Hℤ, D(2)=2u+Nm(1); restriction=4, can=2∈Z₂. The asserted scalar 4 has can=4. | False Check; S01. |
| §4.3 norm obstruction | X=0; X=H𝔽₂ at p=2 | Zero sequence is 0→0→0. For H𝔽_p kernel and quotient both have p elements, hence the middle group has p² elements. The displayed π₀ sequence for H𝔽₂ is 0→𝔽₂→ℤ/4→𝔽₂→0, with kernel {0,2}. A homomorphic section would send 1 to an order-2 lift, but both lifts 1,3 have order 4. | Correct; a space-level lift need not be additive. |
| §4.4 classical degree-zero power | Hℤ scalar 2,p=2; H𝔽₄ scalar a; KU scalar 2; 0,1 | Outputs 4,a+1,3·1+sign,0,1 respectively. Restriction of KU value has rank 4 but transposition character 2; pullback of x² has character 4. | Definition correct; existing Checks admit pullback of x^p (S03). |
| §4.5 Young-transfer quotient | Hℤ,X=*,p=2,3,5; H𝔽_p | Young indices at 5 are 5,10,10,5, generating (5). Defect 2⁵−2=30 vanishes mod 5, not mod 120. At 2 and 3 indices generate (2),(3). H𝔽_p coefficient transfer ideal=0 and Frobenius is additive. | Correct quotient by Young transfers; trivial-subgroup transfer alone fails. |
| §4.6 degree-zero Frobenius comparison | Hℤ scalar 2,p=2; H(𝔽₃[z]) scalar z; empty X | Hℤ gives 4 mod 2=0=φ(2); polynomial gives z³ on both sides, not z. Empty-space represented cohomology is 0 on both sides. | Correct; multiplication after Δ is essential. |
| §4.7 ordinary and finite-complete coefficients | A=0,𝔽₄,ℚ; finite sphere unit; p-inversion diagram | π₀ Tate of HA is A/pA: 0,𝔽₄,0. For A=ℤ,p3 the value at 2 is 8 mod 3=2. Frobenius sends a↦a+1 in 𝔽₄. Finite-complete sphere unit maps 1↦1. Completed p-inversion colimit is 0 whereas colim π₀ maps from S_p^∧ is ℚ_p. | Correct; finite/dualizable scope replaces a false compactness identification. |
| §4.8 spherical finite-field Witt lift | d=1; p=2,d=2,k=𝔽₄; inverse automorphism control | SW(𝔽_p) has rank 1 and Frobenius=id; SW(𝔽₄) has rank 2, [a]↦[a²]=[a+1], square=id. In 𝔽₈ with a³=a+1, Frobenius gives a² whereas its inverse gives a⁴=a²+a, and its cube fixes a. | Correct conditional on precise finite-étale Witt gap; marked π₀ map fixes the lift. |
| §5.1 virtual Thom and represented twists | rank 0,1,−1; real Möbius line; swaps of degrees 1,2 | For V of ranks 0,1,−1, the negative Thom objects are X_+,Σ⁻¹X_+,ΣX_+. At a point R^(−1)(*)=π₁R, so R=ΣHℤ gives ℤ rather than π₋₁R=0. Möbius local coefficients over S¹ give H¹=ℤ/2 versus ℤ for the trivial line. Swap signs are −1,+1. | Correct; rank alone does not specify the twist. |
| §5.2 equivariant suspended coefficients | n=0,1,−1,2; p=2,R=Hℤ | n=0 is ordinary Borel cohomology. At p2,n=−1 restriction gives π₂R: for R=ΣHℤ it is 0 (rank−1 error: ℤ); for R=Σ²Hℤ it is ℤ (rank−1 error: 0). Swap signs at n=1,2 are −1,+1. | Correct representation target and negative inverse. |
| §5.3 all-integer powers | n=0,1,−2; H𝔽₂ and KU; wrong nonzero-degree zero operations | Degree 1 on u is u²+ub≠0 after Thom orientation. Degree −2 KU restricts to β²≠0. Degree 0 on 2 in KU gives 3+sign. The old zero-input and n0-unit values are 0 and 1. The wrong zero operation gives 0 in both new nonzero-degree tests but satisfies the old carrier-only Checks. | Construction correct; S03. |
| §5.4 Tate untwisting | p=2,n=1; reflection; R=S,Hℤ; n=−1+1 | Reflection on S^ρ has underlying degree −1 but Tate degree +1 on π₁=Z₂. Correct Hℤ target has (π₀,π₁)=(0,𝔽₂), while trivial Σ² target gives (𝔽₂,0). Inverse twists multiply to S⁰; using a second positive ρ instead gives rank 4 at p2. | Repaired Checks sound and discriminating. |
| §5.5 extended powers of virtual Thom objects | V=0; rank 1; rank −1; p=2 | V=0 over a point gives Σ∞_+BΣ₂. For rank 1, the pulled-back negative Thom bundle is −ρ of rank −2 and determinant −1; a trivial rank-two sphere has determinant +1. V of rank −1 has negative Thom object ΣS, whose extended power uses +ρ; the original virtual twist is −ρ. | Correct virtual-bundle generality and equivariance. |
| §5.6 all-degree Frobenius/power equality | n=0,1,−1; Hℤ,H𝔽₂ | Scalar 2 at Hℤ,p2 gives 0 on both Tate sides. For u∈H¹(RP∞;𝔽₂), normalized total value is u+u²s; degrees 1 and 2−1 both equal 1. Negative and positive representation shifts cancel to 0. | Correct; all integer degrees retained. |
| §6.1 coefficient splittings | p=2,3; integral/mod-p; shifts k=j,j±1 | Integral p2 π₀=𝔽₂,π₁=0. Odd invariant shifts at 3 are 4j and 4j+1. Integral Ext in differences 0,±2 is 𝔽_p,0,0. One summand per degree makes sum→product an equivalence on all π_i. | Correct repaired scalar structure; no H𝔽_p→Hℤ map used. |
| §6.2 Euler-normalized powers | p=3 on v∈H²(CP∞); p=3 on degree-one x,z; p=5 factorial | At p2 the Euler power u(u+b)=u²+ub divided by b gives u+u²s. At p3 the Euler product v(v+u)(v+2u)=v³−vu²; dividing by −u² gives v−v³t². Degree-one value x−β(x)e. Product gives xz+(β(x)z−xβ(z))e. At 5, (2!)²=4=−1 fixes the same sign. | Correct right-coefficient and Euler signs; unsigned source formula fails. |
| §6.3 total Steenrod Frobenius | unit; v at p3; x and xz; negative indices | Unit has only identity component 1. Even component i=1 on v is −v³. Odd component i=0 on x is −βx; on xz it is βx·z−x·βz. Negative-index components are 0. At p2 the degree-zero unit has Sq⁰=1 and positive squares 0, whereas Sq¹u=u²≠0 on RP∞. | Correct; stable left-suspension β_L is explicitly distinguished from degreewise β. |
| §7.1 Atiyah cyclic power | actual rank 2; virtual rank −1; line bundle; p2 | Rank 2 yields 3+sign (dimension 4, nontrivial character 2). Virtual −1 yields sign (dimension 1, nontrivial character −1). A line L gives L² with trivial factor permutation. Zero and unit give 0 and 1. | Correct; naïvely additive tensor extension fails. |
| §7.2 periodic KU Tate coefficients | p=2,3; r=1,2; x=0; Weyl invariants | At 2 coefficients are ℚ₂ for r1 and ℚ₂⊕ℚ₂(i) for r2, dimensions 1,3. At 3 dimensions 2,8; W-invariants for r1 have dimension 1. (1+x)^p−1 at x0 is 0, while (x−1)^p−1 is −2 at odd p. | Correct completed Euler inversion and series sign. |
| §7.3 KU Frobenius/Adams | β=L−1 on S²; β⁻¹; 0,1,−1 | β²=0 on S² so L^p−1=pβ. In periodic coefficients β↦pβ and β⁻¹↦p⁻¹β⁻¹, product=1. Integer coefficients are fixed. | Correct localized codomain; an integral unital self-map cannot invert pβ. |
| §7.4 unbounded orbit counterexample | KU,p=2,3; rational coefficient control | Source/target even coefficient dimensions 3/1 at 2 and 8/2 at 3; all odd groups=0 and the p3 dimension difference is 6. Hℚ Tate=0 on both sides. | Correct; residual action is coherent, not replaced by a guessed split extension. |
| §7.5 unbounded tensor-diagonal counterexample | KU,p2; L₁S; bounded sphere control | T₂KU is rational, hence T₂KU/2=0; KU₂^∧/2 has π_(2j)=𝔽₂. Sphere completion has π₀=Z₂ and is not rational. | Correct height-one route, corrected F3 supplier locator in S05. |
| Layer 7 Example, sphere fixpoint failure | trivial C_(p²)-sphere; p2,p3; zero input | Residual Tate of the orbit term=0. Residual Tate of the fixed term has π₀=Z₂ or Z₃, not 0; zero input gives 0. | Correct derivation from §2.7; no use of supplier's Segal consequence. |
| §8.1 free-loop totalization | Y=*; S²; S¹ negative control; infinite wedge of S² | Point gives S on both sides. For S² the reduced normalized fibers have bottom degrees n,n+2: (1,3),(2,4). For S¹ the lower bound remains 0 instead of tending to infinity. Infinite S² wedges retain the same lower bounds. | Correct simply-connected arbitrary-cardinality scope. |
| §8.2 controlled Tate/limit comparison | constant tower; fibers Σ^nH𝔽_p; G=e,C_p | Constant comparison fibers=0. Increasing fibers have lower degree n, retained after orbits, so each fixed π_k stabilizes. For G=e norm=id and both Tate objects=0; for C_p norm is the same compatible comparison on both sides. | Correct; no claim that arbitrary orbits preserve inverse limits. |
| §8.3 free-loop Segal and genuine fixed points | Y=*; S²; n=0,1,2 | Point Frobenius has π₀ ℤ→Z_p. Genuine sphere C_p-fixed π₀ is A(C_p)=ℤ²; homotopy-fixed π₀ is its augmentation completion ℤ⊕Z_p, so these are not integrally isomorphic. Their p-completions are both Z_p². n=0 comparison=id; n1 and n2 use one and two restriction pullbacks after completion. S² inherits fiber bounds from §8.1. | Correct distinction of genuine and Borel objects and all n≥1. |

These tests also cover the empty space, zero spectrum, zero ring, unit, negative ranks and negative binomial indices. The theorem domains exclude p=1, nonprimes, arbitrary non-finite G in the finite-norm statements, and non-simply-connected Y in §8.1. A DVR, inseparable field extension, non-quasi-separated scheme or nonreduced scheme is not an input to these spectral targets; imposing such extra hypotheses would change their subject. The finite-field gap has d≥1, so a rank-zero “field” cannot enter it. Nonabelian behavior is tested at G=S₃ in the extended-power contract below.

## Supplier, pin and acceptance-test audit

The supplier citations were resolved against current main or the supplied new-roadmap heads, not against the earlier review's remembered section numbers. Revising pull requests were not used as suppliers. There are 10 named roadmap supplier contracts in the inventory below; their explicit section ranges and repeated Needs/Dependencies occurrences were compared to the same resolved targets. S02 concerns a different spectral sequence, and S04–S05 concern wrong section locators. No consumed target was found to require a later roadmap once the explicitly excluded Segal consequences are removed.

| Supplier and current sections checked | Concrete source locations and result |
|---|---|
| StableHomotopyKTheory Layer 5; §§7.9,7.14–7.19,7.21–7.26 | Current new-roadmap head 125e666. Spectrum, ordinary cohomology, smash and connectivity are in Layer 5; Milnor is §7.9; closure/detection at README lines 2445/2453, not in the cited order (S04); exponent/completion, rationalization and exact-couple/strong-convergence targets follow in the stated ranges. |
| GeneralizedCohomology G2.8,G3.8,G3.9,G4.2,G5.3,G5.4 | Main README lines 432,785,878,1214,1536,1559. Free commutative spectral algebra supplies extended-power summands; G3 gives coherent homotopy limits and function-spectrum completion; G4/G5 ordinary Thom diagrams; G5.4 gives commutative ku,KU and Bott compatibility. |
| TangentialBordism B4 items 1,2,7,8 | Current supplied head, README lines 549–590,632–683. Item 2 has mod-2 operation algebra, Milnor dual and Adams convergence; item 7 supplies the signed odd-prime operation algebra and graded Ext; item 8 extends Adams to odd primes. Its exterior-Milnor freeness does not supply the exhaustive finite A_p(n) chain. |
| BordismFormalGroups F6.1,F6.3,F6.4,F6.5 | Main README lines 555,760,1003,1248,1526,2508. Localization, Margolis pieces, smashing, finite-action norm/Tate/transfer and raw finite-height Tate descent exist. The KU/E(1) input is F3 lines 294–306, so S05 repoints it. Finite Hopf chain is the declared gap, not claimed already proved. |
| KTheoryFiniteLocalFields §§4.0,4.4,4.5 | Current new-roadmap head afe02e8, README lines 602,672,706–728. Genuine cyclic models, restriction comparison, algebraic Tate and homotopy Tate sequence exist. The latter has π_tT coefficients and conditional convergence; the continuous homological comparison needed in §2.6 is absent (S02). |
| AInfCohomology AI.7.2 | Current new-roadmap head b47987b, spectral Tate-diagonal target and Checks at README lines 3813–3864; circle-action/Tate target supplies orbit vanishing with boundedness and residual action. Sphere Check supplies the canonical map, not its Segal equivalence. |
| RefinedTraceMethods §§2.1,2.3–2.6,2.8,2.10–2.13,2.16,5.1,5.3,6.1 | Supplied head c47abe4. README lines 484,555,590,625,642,831,875,915,995,1039,1109,1223,2380,2458,2486. Verified precise parametrized, Frobenius, representation-sphere, free-loop-model, restriction-pullback, stable Adams and étale-lifting contracts. Its sphere Segal conclusions at lines 567,579,694 remain explicitly excluded as inputs here. |
| EnhancedDerivedSheaves E3,E5:abstract | Main README lines 1121–1153 and 1436–1490, with the later E3 adjoint formalism. Kan extensions, coherent stable categories, operadic algebras/modules and relative tensor are present with the required universes and colimit hypotheses. |
| AlgebraicTopology Stage 6 | Main README line 946 onward, especially its ordinary cup/relative comparison targets; no replacement cochain model is introduced here. |
| TopologicalKTheory T1–T5, specifically T2.5 and T4 | Main README lines 163,613,701,754,816,886. Bundles, relative K, Newton/Adams operations and Bott/Thom use the same tautological-line convention. Stable localized Adams maps are separately owned by RefinedTraceMethods §5.1. |

The native declaration inventory was checked at Mathlib revision `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` from lake-manifest.json. The citation resolver's host did not have the pinned Lake packages; its name-resolution result was therefore supplemented by these direct source reads.

| Pinned API | Context actually read; discriminating values |
|---|---|
| CategoryTheory.Functor.sections, Mathlib/CategoryTheory/Types/Basic.lean:222 | `Set (∀ j, F.obj j)` with transition equations. No finiteness or nonempty field. Constant empty stages give no sections; the empty indexing category has one section. |
| eventualRange; isMittagLeffler_of_exists_finite_range, Mathlib/CategoryTheory/CofilteredSystem.lean:125,230 | Intersection of all incoming images, and the finite-image Mittag–Leffler criterion. {a,b}←{a} has eventual image {a}; infinite binary prefixes do not yield finite limit. |
| toEventualRangesSectionsEquiv; surjective_toEventualRanges, same file:255,262 | Genuine equivalence of compatible sections, surjectivity under Mittag–Leffler. Original first transition misses b; eventual-range transition is onto {a}. |
| nonempty_sections_of_finite_cofiltered_system, same file:79 | Category universes retained; finite nonempty stages and cofiltered-or-empty indexing. Constant singleton has one section; constant ∅ violates nonemptiness. |
| eval_section_surjective_of_surjective; eventually_injective, same file:312,323 | Finite stages and surjective maps; eventual injectivity also requires nonempty indexing and finite section type. Constant two points gives an injective projection; binary prefixes have infinite limit and never injective projections. |
| frobenius, Mathlib/Algebra/CharP/Lemmas.lean:321 | CommSemiring with ExpChar, not arbitrary rings without a characteristic assumption. At 3 in 𝔽₃[z], z↦z³; in ℤ the cube map fails additivity since 2³=8≠2. |
| WittVector; WittVector.frobenius; coeff_frobenius_charP; frobenius_zmodp | Mathlib/RingTheory/WittVector/Basic.lean and Frobenius.lean, ring map at line 218 and subsequent characteristic-p coefficient formulas. Coefficient formula needs CharP; Frobenius on W(𝔽₄) is nonidentity, while on W(𝔽_p) it is identity. |
| WittVector.equiv, Mathlib/RingTheory/WittVector/Compare.lean:199 | Explicit prime binder/Fact; W(ZMod p)≃+*ℤ_[p]. Rank-one base identification is already supplied; it does not itself assert finite étaleness/rank d for arbitrary finite k. |

The 20 supplier Check bullets were separately recomputed:

| Contract / Check groups | Values computed |
|---|---|
| GeneralizedCohomology, 3 bullets | k≥1: D_G(0)=0, k0: empty tensor S; k1: D₁E=E; G=S₃: D_GS=Σ∞_+BS₃, π₀=ℤ; swaps in degrees 1,2 give −1,+1. |
| TangentialBordism, 8 bullets | Sq¹u=u², Sq²u=0, Sq⁰u=u; at p3 P¹v=v³ of degree6,P²v=0; βx=y,βy=0,βxz=yz−xw; Sq¹Sq¹=0,Sq¹Sq²=Sq³,P¹P¹=2P²; dual dimensions at2 are 1,1,1; odd τ₀,ξ₁ have degrees1,4. Zero Adams tower has all pages0; HFp has E₂ only 𝔽_p at(0,0); sphere has positive-filtration Ext (e.g. h₀), unlike coefficient-field Ext. |
| BordismFormalGroups, 6 bullets | Trivial norm=id, Tate0; induced Tate0. Trivial Hℤ,C₂ norm on π₀=2, Tate π₀=ℤ/2. Height1→E(0)=Hℚ, height2→E(1). Chain dimensions 1,2,8 at2 and1,2,12 at3. Sq¹ sends 1→Sq¹→0 and Sq²→Sq³→0, giving homology0 in degrees0–3; trivial 𝔽₂ module instead has homology𝔽₂. |
| RefinedTraceMethods, 3 bullets | W(𝔽_p) rank1,F=id; W(𝔽₄) rank2,F(a)=a+1,F²a=a. ψ²(β)=2β,ψ²(β⁻¹)=β⁻¹/2, product1. Free-loop model Y=* gives S, with unit1→1 under the canonical map. |

Both declared gaps have identical slugs and matching needs in design/plan.json and under the named README supplier. The finite-Witt gap excludes the pinned W(𝔽_p) identification as new work; searches in the pinned WittVector files found no finite-étale/rank-d/endomorphism classification for W(k). The Hopf-chain gap differs from existing E(Q_i)/T_t targets, as the dimension tests show. Both gaps are owned, precise contracts for earlier suppliers; no finding is raised merely because they remain unimplemented.

Ownership was searched by object through `roadmaps grep`, main active/completed roadmaps, board packages and the supplied open-head checkouts. The general spectrum, Thom, extended-power, Steenrod, Adams, Tate, K-theory and étale-lifting constructions remain with their named suppliers. The Singer functor/tower comparison, arbitrary-cardinality Segal proof and all-degree power/Frobenius comparisons have no earlier duplicate owner found. HabiroCohomologyFoundationsPartII §0.1 includes the finite-Witt spherical case and is later; the package now records this earlier ownership. Its future import is the already-recorded maintainer action. Suggested.lean has no declaration that can collide with another fully qualified name. Open work outside the supplied/indexed heads was not independently sought.

The dependency gate was run read-only against the current ORDER.txt with the required name and --movable. Exit status 0; complete output:

```text
depcheck: 149 roadmaps, 1002 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Local Needs edges go to earlier targets; the Layer 3 KU counterexample is expressly a negative-control consequence of §7.5, not a premise of the bounded-below proof. The repaired Singer argument does not take a Segal equivalence or genuine norm as input. The one newly unowned proof bridge is S02.

| Suggested.lean declaration inventory | Section / variables / instances | Typed result and one-tactic probe |
|---|---|---|
| No declarations (0 theorems, 0 definitions, 0 instances, 0 examples) | Empty TauCetiRoadmap.StableHomotopyKTheoryPartII namespace; no variables or include blocks | No signatures can lose binders, no sorry'd data, no placeholders, no padding. Single import Mathlib. No Lean command or build was run; #check @name comparison has an empty domain. |

| README headline | Suggested.lean module-docstring coverage; pin obstacle |
|---|---|
| §2.4 Singer Tor-equivalence | Lines10–12; actual graded Steenrod operation algebra and Singer module missing. |
| §2.2 inverse-limit Adams | Lines13–15; spectrum/Adams tower and continuous-cohomology comparison missing. |
| §2.6 continuous Singer comparison | Lines16–18; cyclic spectral extended powers and Singer carrier missing. |
| §2.7 finite-type Segal | Lines19–21; spectral tensor action, Tate and completion missing. |
| §3.4 arbitrary bounded-below Segal | Lines22–24; same spectral carriers, no cardinality shortcut. |
| §4.1 monoidal Weyl refinement | Lines25–26; coherent spectral actions and diagonal missing. |
| §5.6 all-integer Frobenius/power comparison | Lines27–29; ring spectra and represented virtual twists missing. |
| §4.8 spherical Witt Frobenius | Lines30–33; connective sphere algebras and spectral étale comparison missing. |
| §6.3 total Steenrod Frobenius | Lines34–38; spectral Tate and actual stable operation algebra missing. |
| §7.3 KU Frobenius/Adams | Lines39–41; KU spectrum and localized stable Adams map missing. |
| §§7.4–7.5 unbounded counterexamples | Lines42–44; KU, spectral Tate and Bousfield localization missing. |
| §8.1 simply-connected free-loop totalization | Lines45–47; suspension spectra and derived totalization missing. |
| §8.2 controlled Tate commutation | Lines48–50; coherent finite-group spectral action, norm and connectivity missing. |
| §8.3 free-loop Segal/genuine comparison | Lines51–54; cyclotomic free-loop spectrum and genuine fixed points missing. |

At the pins, algebraic prime spectra, analytical spectra, categorical spectral-sequence pages and the Eilenberg–Steenrod homology-theory axioms are not the stable homotopy category or the KU/Steenrod carriers these headlines require. Searches checked objects as well as names. No statable missing headline was identified. The native finite inverse-system and Witt identities are supporting arguments/Checks, not replacement acceptance theorems.

## Source locator ledger

All 11 cited works already have one legal cached source entry. No additional work or network fetch was needed. This table resolves 41 locator groups against the supplied text; 35 groups were readable enough to check the claimed support, while six scan groups have the limitations stated below. “Verified” here includes a source formula checked and found erroneous: the corrected mathematics is recorded in the instance ledger and Source issues, not silently attributed to the source.

| ID | Locator group inspected | Extraction witness and result |
|---|---|---|
| L01 | ns18 I.1, p.218 | ns18 lines 583–603: norm cofiber and EM/classical Tate comparison; parity and module-scalar support verified. |
| L02 | ns18 I.2, Example I.2.3, pp.219–220 | ns18 lines 618–665: sphere and KU counterexamples; residual action and differing cyclotomic-field dimensions verified; series misprint below. |
| L03 | ns18 I.2, Lemmas I.2.6–I.2.9, pp.222–224 | ns18 lines 726–807: truncation comparisons, invert-p vanishing, bounded-below completion invariance verified. |
| L04 | ns18 II.4, Lemma II.4.1, pp.260–261 | ns18 lines 2214–2232: residual norm comparison; actual boundedness retained. |
| L05 | ns18 II.4, Corollary II.4.9, p.265 | ns18 lines 2357–2372: all iterated geometric-fixed inputs required; the cyclotomic specialization verifies §8.3's use. |
| L06 | ns18 III.1, Definition III.1.4/Remark III.1.5, pp.286–287 | ns18 lines 3236 onward: unit-normalized exact Tate diagonal; comparison is supplied, not a Segal premise. |
| L07 | ns18 III.1, Theorem III.1.7 and proof, pp.287–290 | ns18 lines 3271–3348: bounded below without finite-type restriction; truncation, arbitrary-vector step and KU negative control verified. |
| L08 | ns18 III.1, Lemma III.1.8, p.289 | ns18 lines 3331–3337: finite limit implies pro-constant; empty inverse limits are explicitly treated. Starting a tower at 0 instead of 1 is a harmless reindexing, not an erratum. |
| L09 | ns18 IV.1, Definition IV.1.1 and Example IV.1.2, pp.324–325 | ns18 lines 4836–4865: multiplication-after-diagonal, ordinary-ring Frobenius and marked spherical Witt example. Compactness wording has the error below. |
| L10 | ns18 IV.1, Lemma IV.1.3, Corollaries IV.1.4–IV.1.5, Remark IV.1.6, pp.325–326 | ns18 lines 4868–4917: Weyl/normalizer refinement, monoidal uniqueness and suspension-monoid factorization verified. |
| L11 | ns18 IV.1, Lemma IV.1.7, p.327 | ns18 lines 4920–4928: underlying-space factorization, with no multiplication on arbitrary X. This confirms S01's distinction. |
| L12 | ns18 IV.1, Corollary IV.1.8, p.327 | ns18 lines 4929–4952: positive homotopy splitting and degree-zero exact sequence. Read the extracted inequality with its proof's positive-degree context. |
| L13 | ns18 IV.1, Corollaries IV.1.9–IV.1.10, p.328 | ns18 lines 4955–4971: multiplicative-space operation and representable degree-zero comparison verified. |
| L14 | ns18 IV.1, Remark IV.1.11, p.328 | ns18 lines 4972–4985: both transfer-quotient problems below are present. The roadmap's Young-subgroup version passes p=5. |
| L15 | ns18 IV.1, equation (11), Proposition IV.1.12 and Remarks IV.1.13–IV.1.14, pp.329–331 | ns18 lines 4990–5092: coefficient field, compact-space hypothesis, Bott multiplier and localized codomain verified; labels corrected by S06. |
| L16 | ns18 IV.1, coefficient displays and Theorem IV.1.15, p.332 | ns18 lines 5098–5154: Weyl weights verified; missing factor 2 in odd-primary suspensions recorded below. |
| L17 | ns18 IV.1, Proposition IV.1.16 and its proof, pp.333,339–340 | ns18 lines 5155–5170,5420–5465: right-coefficient unsigned formula fails the Euler/product tests. Roadmap signs are independently supported by its Euler computation. |
| L18 | ns18 IV.1, equation (12) and Lemma IV.1.17, pp.333–334 | ns18 lines 5174–5215: representation sphere retains permutation action, n ranges over ℤ, relative tensor Tate is exact. |
| L19 | ns18 IV.1, Lemma IV.1.18, p.335 | ns18 lines 5216–5255: suspension/Frobenius comparison supports §5.6, including the direction of the target equivalence. |
| L20 | ns18 IV.1, Lemma IV.1.19, pp.336–338 | ns18 lines 5256–5337: parametrized Thom adjunction supports virtual ranks and both Kan adjunctions. |
| L21 | ns18 IV.1, Lemma IV.1.20, pp.338–339 | ns18 lines 5338–5396: Thom/extended-power and diagonal comparison; negative Thom sign retained. |
| L22 | ns18 IV.1, Theorem IV.1.21, p.339 | ns18 lines 5397–5419: all-degree comparison verified; no boundedness restriction on R added. |
| L23 | ns18 IV.3, Lemma IV.3.1, Proposition IV.3.2, Corollary IV.3.3, pp.345–351 | ns18 lines 5615–5647,5699–5707,5848–5857: actual loop/bar Frobenius model; supplied model is distinct from the later Segal equivalence. |
| L24 | ns18 IV.3, Theorem IV.3.7 and proof, pp.354–355 | ns18 lines 5978–6020: simply-connected Y, totalization and orbit-connectivity step; no finite-type hypothesis. |
| L25 | ns19-correction, pp.215–218 | All 166 extraction lines read; the p.325 diagonal diagram is corrected at ns19-correction lines 104–121. It does not correct the scalar, sign, compactness or quotient issues listed below. |
| L26 | lnr12 §2.1, Proposition 2.2 and proof, pp.866–869 | lnr12 lines 265–399: stages individually bounded below/finite type; exact inverse limits use compact dual groups, not arbitrary groups. |
| L27 | lnr12 §2.2 Definition 2.3 and §4.3 Definition 4.7/Remark 4.8 | lnr12 lines 400 onward,1269–1285: continuous cohomology is a colimit of stage cohomology; tower comparison/cofinal independence checked. |
| L28 | lnr12 §3.1, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876 | lnr12 lines 641–721: Laurent/exterior carriers, twisted actions, suspension and augmentation signs verified. |
| L29 | lnr12 Proposition 3.3, Theorem 3.4, Corollary 3.5, pp.876–877 | lnr12 lines 722–756: Tor-equivalence and bounded-below finite-type Ext target verified. |
| L30 | lnr12 §4.3, Definition 4.3 and Lemmas 4.4–4.6, pp.885–887 | lnr12 lines 1148–1266: Greenlees filtration index and finite-type approximation, not a shift of the full Tate spectrum. |
| L31 | lnr12 §4.4, Propositions 4.14–4.17, pp.892–895 | lnr12 lines 1474–1625: homological/continuous comparison and multiplicativity are a separate bridge, establishing S02. |
| L32 | lnr12 §5.1 Lemma 5.1/Theorem 5.2; §5.2 Proposition 5.7/Theorem 5.9; §5.3 Definition 5.10–Theorem 5.13 | lnr12 lines 1646–1770,1935–2150: extended-power homology, shift, tower and augmentation/Segal proof verified. The new Δ identification still needs the bridge in S02. |
| L33 | agm85 §1 Proposition 1.2/Theorem 1.3; §2 Lemmas 2.1–2.2 and proof, pp.436,438–441 | agm85 lines 68–90,214–307: arbitrary M in Tor, bounded target in Ext, finite Hopf chain and freeness use verified. |
| L34 | bmms86 VIII.1, Propositions 1.1–1.4, scan pp.130–132 | bmms86 lines 4297–4399: result headings, power construction and mixed-transfer sum formula located. Two-page interleaving prevents full certification of every formula from this extraction alone. |
| L35 | bmms86 VIII.2, Propositions 2.1–2.4 and normalization, scan pp.133–135 | bmms86 lines 4414–4515: the exponent pattern at line4481 and χ,ω normalization at line4501 support the Euler calculation; some symbols elsewhere are illegible. Partial scan verification only. |
| L36 | bmms86 VIII.4, Theorem 4.1, Proposition 4.2, Lemma 4.3, scan pp.141–142 | bmms86 lines 4664–4698: K-theory power comparison located; interleaved OCR does not certify its full proof. ns18 lines 5023–5060 independently support the use here. |
| L37 | milnor58 §§2–3,5,8, Appendix 1, pp.153–162,169–171 | milnor58 lines 154–180,245–260,406–509,770–848: Hopf algebra, dual basis, triangular pairing and p2 polynomial variant located and checked. Coproduct OCR is imperfect, so its individual printed symbols are not fully certified. |
| L38 | cartan55-I exposé14 §§2–6, pp.14-01–14-12 | cartan55-I lines 131–218,247 onward: representability and operations theorem locations verified; several formulas lost in OCR. Partial scan verification only. |
| L39 | cartan55-II exposé15 §§3–5/Theorems1–3 and cartan55-III exposé16 §§2–4/Theorems1,1bis | cartan55-II lines 153–275 and cartan55-III lines 114–235: stable/additive operations and triangular-basis argument located. Damaged inequalities/formulas prevent full certification from extraction. |
| L40 | kuhn04 §6 Definitions6.1, Theorems6.2,6.6, preprint pp.15–16 | kuhn04 lines 596–646: finite-complex input and circle comparison verified against the cited preprint numbering. Arbitrary Y is not attributed to this finite case alone. |
| L41 | malkiewich17 §2.5 Proposition2.22 and proof, preprint pp.14–15 | malkiewich17 lines 609–650: simply-connected arbitrary Y and reduced normalized fibers Ω^nΣ∞Y^∧n and Ω^nΣ∞Y^∧(n+1) verify the extension and connectivity route. |

## Verified sound

Read counts: 0 Lean declarations in 62 lines; 37 numbered README targets plus the Layer 7 sphere consequence in 1,034 lines; 143 Check bullets evaluated (123 local,20 supplier); 41 source-locator groups resolved,35 fully readable and6 scan-limited as above; 10 current roadmap supplier contracts checked, including their explicit section/item ranges; 14 named pinned declarations read; 2 declared gaps matched; 9 previous findings rechecked. The package has six findings, not six false headline theorems: S01 is a false Check, S02 an unowned proof bridge, S03 deficient Checks, and S04–S06 locator errors.

The target hypotheses and computed controls support the bounded-below, all-prime, all-cardinality generalized Segal statements; the distinction of spectral from algebraic tensor; virtual negative twists; corrected Steenrod Euler signs; localized KU Bott action; and simply-connected free-loop scope. These conclusions remain conditional on the two declared supplier gaps and the S02 bridge. There is no missing statable acceptance headline or padding declaration at these pins.

The read-only git diff against origin/main contains eight changed paths, all under packages/StableHomotopyKTheoryPartII. The reviewed head is 1db8b48. README and Suggested.lean contain no pull-request numbers/process narrative, no set_option, no local machine paths, no lemma declaration or computational algorithm. Every numbered target has a source locator. The only files written during this pass are the report and scratch notes; no Lean build, git mutation or external post was made. No suspicious instruction embedded in read material was followed.

## Not verifiable

- The six scan-limited locator groups L34–L39 are legally cached but partly illegible/interleaved. Their locations and legible formulas were checked; a full independent reading of every printed formula/proof was not possible with the available extraction. No source was treated as missing merely because its OCR is imperfect, and no new source key or fetch request was created.
- No Lean elaboration was run, as required by the read-only review. Suggested.lean has no named declaration; the requested mechanical signature comparison is therefore vacuous, not an unperformed nonempty test. Pinned supplier signatures were read directly, not rebuilt.
- Actual implementations of the two declared gaps and other planned supplier targets do not exist merely because their contracts were verified. Acceptance remains conditional on those contracts; missing implementations are not reported as defects.
- Ownership checking is limited to main, board packages, the supplied sibling checkouts and the indexed open-head material. No unseen/private roadmap work was searched. The later spherical-Witt overlap still requires the already-recorded maintainer update outside this package.

## Source issues

- **Misprint** in ns18 at Example I.2.3(iii), printed p.220 (ns18 lines 649,660): the source says the multiplicative series is (x−1)^(p^r)−1; it should be (1+x)^(p^r)−1 for x=L−1, with constant term zero; affects a stated result.
- **Misprint** in ns18 at the displays before Theorem IV.1.15 and its odd-prime targets, printed p.332 (ns18 lines 5120–5154): the source says invariant suspensions use j(p−1); it should be 2j(p−1), and 2j(p−1)+1 for odd components; affects a stated result.
- **Error** in ns18 at Proposition IV.1.16, printed p.333 (ns18 lines 5155–5170): the source says the normalized total power has unsigned reduced-power and Bockstein coefficients; it should be (−1)^iP^i and (−1)^(n+i)βP^i for the roadmap's right-coefficient normalization; affects a stated result.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325 (ns18 lines 4852–4858): the source says the p-complete sphere exemplifies categorical compactness in p-complete spectra; it should be a finite or dualizable p-complete object, since the p-inversion diagram disproves compactness; affects the proof.
- **Misprint** in ns18 at Remark IV.1.11, printed p.328 (ns18 lines 4973–4974): the source says the quotient ring has only BΣ_p as its space variable; it should be R⁰(X×BΣ_p), retaining X; affects a stated result.
- **Error** in ns18 at Remark IV.1.11, printed p.328 (ns18 lines 4974–4985): the source says the trivial-subgroup transfer image makes P_p additive integrally; it should be the Young-subgroup transfer ideal, or require p-local coefficients; affects a stated result.
- **Error** in ns18 at Proposition IV.1.12(i), printed p.329 (ns18 line 5007): the source says KU⁰(X)→KU⁰(X)⊗ℚ_p is an inclusion; it should be the natural coefficient map, which kills torsion, for example the nonzero reduced class on ℝP²; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1db8b48503601a4d5d564d43e3c53f6ad175536c", "job": "RT-StableHomotopyKTheoryPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
