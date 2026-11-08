# Review of ArithmeticKTheory (pull request #1418 at 56413ae)

**Verdict:** needs changes

This is a full review: 499 lines of the folder changed since a58ed88. The previous review's R02–R06 are repaired. R01 is repaired in substance, but the new scope sentence hands the stable stems to a roadmap that disclaims them (R01 below). All nine findings are P3; none is blocking. The fifteen seeded targets were checked against their sources, and the adversarial table is under Verified sound.

## R01 (P3) — Scope hands the stable stems to GeometryOfNumbersAndQuadraticArithmetic §6.1a, which disclaims them

**Location.** `TauCetiRoadmap/ArithmeticKTheory/README.md` lines 75–79: “The stable stems as the colimit of the homotopy groups of spheres, their composition product and their comparison with the homotopy of the sphere spectrum belong to GeometryOfNumbersAndQuadraticArithmetic §6.1a”.

**Claim.** GeometryOfNumbersAndQuadraticArithmetic §6.1a owns the stable stems.

**Witness.** At #851 (head 04dd46e), its README line 44 lists among excluded objects “the stable stems of spheres are not part of this roadmap … no target of Layer 6 uses the stable stems”. Its §6.1a (line 2069 on) builds spectra and C₂-actions, not sphere stems.

**Repair.** Replace the sentence at lines 75–79 with: “No target here uses the stable stems as a colimit of unstable homotopy groups of spheres, their composition product or their comparison with π_*S.” Keep the following sentence, “The 2-primary fourth stem and every other stable-stem calculation are outside the present scope.”

**Tested.** §7.5 uses only π₄(S_(p)) of GeneralizedCohomology's sphere spectrum at odd p (lines 4007–4012). No line of the README uses a stable-stem colimit. With the replacement, no ownership claim about another roadmap remains.

## R02 (P3) — K3BlochGroups still reads π₄S=0 and the d₃ from §7.5, which this head no longer supplies

**Location.** `README.md` lines 4888–4894, Downstream consumers. It lists what K3BlochGroups takes from §7.5: “the structure formulas, sparseness, the zero line and E₂^(1,2)=ℤ/2·α₁”.

**Claim.** The consumer's use is fully covered by the targets kept.

**Witness.** At #1430 (head d0c9190), K3BlochGroups' README line 111 says §7.5 “also proves π₄S=0 and that d₃ maps onto E₃^(4,8)=ℤ/2·α₁⁴”. Its line 1367 uses that d₃ in a Check. This head dropped stableStemFour_eq_zero and the d₃ clause, and records no replacement.

**Repair.** In Downstream consumers, after “E₂^(1,2)=ℤ/2·α₁.”, add: “The integral vanishing π₄S=0 and the 2-primary differential d₃ onto E₃^(4,8) are not supplied here; §7.5 proves only π₄(S)⊗ℤ[1/2]=0.” The worker should relay this to K3BlochGroups. That roadmap has to repoint its line 111 and its Check at line 1367, for example to Ravenel, the paragraph before Theorem 4.4.47, p. 145.

**Tested.** `roadmaps grep` over main and all open heads finds the dropped ids (stableStemFour_eq_zero, eta_pow_four_eq_zero, sphereSuspensionHom, stableStemSphereSpectrumIso, subsingleton_homotopyGroup_sphere_add_four) cited nowhere. Only the K3BlochGroups prose at lines 111 and 1367 relies on the dropped content.

## R03 (P3) — The README's contract for gap:connective-c2-homotopy-orbit-spectral-sequence asks for more than the declared gap

**Location.** `README.md` lines 276–281: “This Layer 7 contract includes the same construction for every finite group G … and compatibility with subgroup induction and finite-cover transfer.” Also §3.5, lines 1535–1543, and its Check at lines 1601–1603 (G=S₃).

**Claim.** The declared gap supplies what §3.5 uses.

**Witness.** `design/plan.json` declares only C₂: “For every connective spectrum E with a coherent C₂-action, the natural strongly convergent spectral sequence H_p(C₂;π_q E) ⇒ π_(p+q)(E_hC₂), with its skeletal filtration.” The intake announces only that sentence. §3.5 applies the result only to “the coherent duality C₂-action on K(O)” (line 1543).

**Repair.** Choose one:
- Delete the sentence at lines 276–281, state §3.5's finite-generation lemma for C₂, and replace the S₃ Check with a C₂ one. The Hℤ trivial and sign-action Checks at lines 1595–1598 already cover C₂.
- Or add a separate gap slug for the finite-group form to the plan's `gaps` and to the contract.

**Tested.** No target or downstream consumer of this roadmap uses a finite group other than C₂. The C₂ Checks (π₀,π₁,π₂ = ℤ,ℤ/2,0 for the trivial action and ℤ/2,0,ℤ/2 for the sign action) are unchanged by the restriction.

## R04 (P3) — bottEtaleDescent's general hypotheses have no source

**Location.** `README.md` lines 3406–3415: “Construct bottEtaleDescent … on regular finite-type schemes over ℤ[1/p] of finite p-cohomological dimension. … (Feng–Galatius–Venkatesh, §2.6.1, equation (2.6), p. 12.)”

**Claim.** The cited source gives Thomason's spectral sequence and its convergence for this class of schemes.

**Witness.** FGV (fgv lines 516–519, p. 12) says that existence and convergence “requires mild hypotheses on X, satisfied in any case we need”. It applies the sequence only to Spec ℤ′ and Spec O′_q (Lemmas 2.11 and 2.14). The general hypotheses (separatedness, a uniform bound on the cohomological dimension of residue fields) are Thomason's and are not cited.

**Repair.** Choose one:
- State bottEtaleDescent for X=Spec O_(F,S) with all primes above p in S, which is all that §§6.15–6.16 use.
- Or cite the primary source, Thomason, *Algebraic K-theory and étale cohomology*, Ann. Sci. ÉNS 18 (1985), Theorem 4.1, with its exact hypotheses in the sentence.

**Tested.** The table at lines 3462–3467 and §6.16 use only Spec O_(F,S), Spec ℤ[1/p] and Spec ℤ[ζ_q,1/p]. Each has étale p-cohomological dimension 2 for odd p (fgv line 598), so the restricted target covers every use.

## R05 (P3) — The pinned S-unit rank theorem is not cited

**Location.** `README.md` lines 230–232: “`Set.unit_fg_of_units`. The last result supplies finite generation for finite S, not an S-unit rank formula.” Also §1.3, lines 677–681: “For finite S, K₁(O) is finitely generated of rank r₁+r₂+|S|−1 … (K-book, VI.8.1, p. 513 …)”.

**Claim.** The pins supply no S-unit rank formula, so the rank in §1.3 rests on the K-book.

**Witness.** Tau Ceti's `TauCeti.finrank_sUnits` (`TauCeti/RingTheory/DedekindDomain/SInteger/Rank.lean:122`) states that, for finite class group, finitely generated units and finite S, the ℤ-rank of `Additive (S.unit K)` is the rank of `Additive Rˣ` plus `Nat.card S`.

**Repair.**
- In the Tau Ceti contract after line 232, add: “`TauCeti.finrank_sUnits` (SInteger/Rank.lean) gives the S-unit rank as the unit rank plus |S|; with Mathlib's `NumberField.Units.finrank_eq_rank` it gives r₁+r₂+|S|−1.”
- In §1.3, cite these two declarations for the rank of K₁(O).

**Tested.** For R=ℤ and S={(p)}: the rank of ℤ× is 0, plus |S|=1, gives 1. This matches r₁+r₂+|S|−1=1+0+1−1 and the Check at line 708 (units ±pⁿ).

## R06 (P3) — §2.3's ramification-weighted restriction is attributed to a transfer diagram

**Location.** `README.md` lines 880–882: “The **ramification index**, rather than residue degree, occurs on restriction. (K-book, V.6.6.3, p. 410; …)” Also line 895: “(K-book, V.6.6.3–6.6.4, p. 410.)” This is attached to the restriction assembly.

**Claim.** K-book V.6.6.3–6.6.4 state the restriction law with ramification weights.

**Witness.** kbook line 24609 (V.6.6.3, p. 410) is the diagram for the exact functors M(R′)→M(R), which give the transfer (norm) maps. The ramification square ∂_w=∂_v^e is Remark III.6.3.1, kbook lines 13484–13488, p. 234, in degree two.

**Repair.**
- At line 881, replace “K-book, V.6.6.3, p. 410” with “K-book, Remark III.6.3.1, p. 234, in degree two”.
- At line 895, replace the locator with “(SchemeKTheoryOperations §§3.6–3.7.)”.
- Keep V.6.6.3–6.6.4 at line 873, where it supports the transfer square.

**Tested.** SchemeKTheoryOperations §3.6 at #1229 states ∂_S′(x_L′)=e·(k→k′)^*(∂_S x) for a local flat map of DVRs. Remark III.6.3.1 gives ∂_w(r₁,r₂)=∂_v(r₁,r₂)^e. The README's own Check (u=2 in 𝔽₅× maps to 4 under e=2) matches the latter.

## R07 (P3) — §4.4 cites an example that prints a different w₁₀

**Location.** `README.md` lines 1798–1802: “In particular w₂=24, w₄=240, w₆=504 and w₁₀=264. … (K-book, Example VI.2.1.2, p. 470 and Lemma VI.2.4, p. 472.)”

**Claim.** The cited example gives these values.

**Witness.** kbook line 28420 (Example VI.2.1.2, p. 470) prints w₁₀=1320=2³·3·5·11. The README's 264 is correct: 5−1=4 does not divide 10, and Lemma VI.2.4 gives den(B₅/20)=den((5/66)/20)=264 in Weibel's indexing.

**Repair.** Replace the parenthesis with: “(K-book, Example VI.2.1.2, p. 470, whose printed w₁₀=1320 is a misprint since 4∤10, and Lemma VI.2.4, p. 472.)”

**Tested.** The formula of line 1795 at i=10 gives 2^(2+1)·3·11=264. Through §7.1, B₁₀/20=1/264. Both agree with the README and not with the printed example.

## R08 (P3) — §7.5 cites a declaration name that exists nowhere

**Location.** `README.md` lines 4197–4199: “It uses exactly cyclotomic_character_reflection, not an unproved assertion that irregular components have known order.”

**Claim.** cyclotomic_character_reflection is a supplied theorem.

**Witness.** `roadmaps grep` over main and all open heads finds the name only at this line. CyclotomicClassGroupsAndStickelberger (#1260) owns the input as §3.3, “Kummer reflection with the correct dual action”. Neither pin has the name.

**Repair.** Replace “cyclotomic_character_reflection” with “CyclotomicClassGroupsAndStickelberger §3.3's Kummer reflection (Sharifi, Corollary 4.4.4, p. 113)”.

**Tested.** Sharifi Corollary 4.4.4 (sharifi line 3545, p. 113) gives r_p(A(ω^(1−k)))≤r_p(A(ω^k))+1. Under Vandiver, A(ω^k)=0 for even k, so each odd component has rank at most one. This is the bound used at line 4182.

## R09 (P3) — The module docstring says the pins lack spectra

**Location.** `Suggested.lean` lines 37–38: “π₄(S) ⊗ ℤ[1/2] = 0 for the sphere spectrum, lacks spectra and their homotopy groups”.

**Claim.** Neither pin has spectra.

**Witness.** Tau Ceti at the pin has `SymmetricSpectrum` (`TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92`) and the sphere monoid (`SphereMonoid.lean`). None of the nine `Spectra/*.lean` modules defines homotopy groups of a spectrum.

**Repair.** Read: “lacks stable homotopy groups of spectra: Tau Ceti's `SymmetricSpectrum` has no homotopy groups at the pin”.

**Tested.** A grep of `TauCeti/AlgebraicTopology/Spectra/` and Mathlib finds no stable homotopy group. The headline therefore stays not statable, now for the correct reason.

## Verified sound

### The previous review's findings

| Previous finding | Status at 56413ae | Evidence |
| --- | --- | --- |
| R01, §7.5 re-plans the stable stems | Repaired, with a new attribution error (R01 above) | The stable-stem block and `subsingleton_homotopyGroup_sphere_add_four` are deleted. Lines 71–75 own only π₄(S)⊗ℤ[1/2]=0. sphereStemFour_odd is at lines 3971–3977. The Hatcher reference is gone. The docstring names the missing carriers (lines 36–39). The Layer 7 heading is restored (line 75). |
| R02, StableHomotopyKTheory §7.1 names | Repaired | `moore`, `sphere_firstStems` and `mooreTwo_piTwo` occur nowhere in the README. |
| R03, K3BlochGroups consumption | Repaired | Lines 4888–4894 record §8.10 and the p=2 items. R02 above covers the dropped content. |
| R04, §6.6 Caputo control | Repaired | Lines 2602–2617 use Proposition 4 (WK^ét₂(F)₃=0) and Remark 11(ii). The sextic class number is a Check, not a target (lines 2629–2635 and 2665–2675). The *Needs* at lines 2677–2679 match. |
| R05, §2.4 at n=1 | Repaired | Lines 929–932 restrict to odd n≥3 and give the n=1 counterexample. |
| R06, Ravenel and Hatcher not in the manifest | Repaired | `sources.toml` line 472 has `ravenel`, `licence_class = "author-page"`. Hatcher is no longer cited. |

### Gate, dependency check, Lean

- **Worker's gate** (`gate.md`): every check passes, including build=0.
- **Gate rerun** with the repository's own merge order:
  - output: `… layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`;
  - the failing check: `depcheck: UPWARD: ArithmeticKTheory (#134) -> GeometryOfNumbersAndQuadraticArithmetic (#148) at README lines [42, 45, 403, 1545]`.
- **Dependency check prescribed by the brief** (moved order): `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`.
  - In `merge-order-moved.txt`, GeometryOfNumbersAndQuadraticArithmetic is line 134 and ArithmeticKTheory line 135. This is the move the worker makes on submission, not a defect.
- **Outside-folder diff:** empty.
- **Never-cite list:** no never-cite roadmap appears in the README or `Suggested.lean`. HomotopySpheres is mentioned only in the pull-request description's dependency paragraph (note for the worker: that paragraph still lists “HomotopySpheres Stage 9, item 2” as a direct prerequisite).
- **Elaboration:** `lake env lean Suggested.lean` takes 3.5 s and gives exactly three `declaration uses 'sorry'` warnings (lines 62, 68 and 81).
- **`#check @name`** on a scratch copy, for all four declarations, matches `signatures.md`, with no binder lost:
  - `sUnitSubmonoid` and both §1.1 theorems carry `[IsDedekindDomain R]`, `[IsFractionRing R F]` and an arbitrary `S : Set (HeightOneSpectrum R)`;
  - `regularPrime_dividedBernoulli_num` carries `Nat.Prime p`, `Odd p`, `¬p ∣ classNumber (CyclotomicField p ℚ)` and `1 ≤ k`.
  - The README statements (lines 592–609 and 3659) have the same generality.
- **One-tactic probes** (`first | rfl | infer_instance | decide | norm_num | simp | aesop | simp_all | exact?`) close none of the three theorems.

### Headline theorems

- **Stated:** `integer_isLocalization_iff` and `integer_isLocalization_of_torsion_classGroup` (§1.1), and `regularPrime_dividedBernoulli_num` (§7.2).
- **Named in the docstring as not statable:** finite generation and ranks; Soulé; the odd and even tables; Harris–Segal; wild kernels; Bott descent; K₄(ℤ)=0; H₃(K(ℤ)); the order ratio; the even orders; the Vandiver table; the Gaussian and golden tame kernels; hermitian finiteness; the §3.2 bordification and Steinberg theorems; Borel's comparison; the odd fourth stem and the low Adams–Novikov E₂-term.
- **Carriers searched at the pins:**
  - no Milnor K₂, tame symbol or Quillen K-group (only Tau Ceti's Kummer-cup Steinberg relation, `FieldTheory/GaloisCohomology/Steinberg.lean`);
  - Lie cohomology only in low degree (Mathlib `Algebra/Lie/Cochain.lean`, Tau Ceti `Algebra/Lie/Cohomology/`);
  - no Tits building;
  - spectra but no homotopy groups of spectra (R09).
- **Padding:** none.

### Adversarial pass

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| `integer_isLocalization_iff` | R a field; ℤ with S={(2)} and M=⟨2⟩, {1}, ⟨6⟩; 0∈M | Field: Spec¹=∅ and integer=F, so any M of nonzero elements works; true and true. ⟨2⟩: ℤ[1/2], and 2∈(2); true and true. {1}: ℤ≠ℤ[1/2] and no element of M meets (2); false and false. ⟨6⟩: 1/6∉ℤ[1/2]; false and false. 0∈M: 0 is not a unit of a domain; false and false. ⇐ at infinite S: the primes meeting M are exactly S, and the localization is the intersection of R_v over v∉S, which is the S-integer ring; for v∈S an element of v⁻¹∖R has negative valuation only at v. | Pass |
| `…of_torsion_classGroup` | ℤ[√−5] with S={𝔭}, 𝔭=(2,1+√−5); S cofinite | 𝔭²=(2), and 2 is an S-unit lying in 𝔭. For any S each v∈S has v^h=(a_v) with a_v∈v and a_v an S-unit, so the iff applies. | Pass |
| `regularPrime_dividedBernoulli_num` | (p,k)=(5,1), (5,3), (5,5), (5,7), (5,63), (3,1); controls k=0 and p=37 | B₂/1=1/6; B₆/3=1/126; B₁₀/5=1/66; B₁₄/7=1/6, although 5∣15; B₁₂₆/63≡2·3≡1 mod 5. At p=3, B₂/1=1/6 with v₃=−1. At k=0 the numerator is 0 (excluded by 1≤k). B₃₂ has numerator −37·208360028141, and 37 is irregular. | Pass |
| §2.2 boundary convention | ℤ_(5), {5,2} and {2,5}; S={p} | β{5,2}=2^1/5^0=2 and β{2,5}=5^0/2=3. kbook line 13465 has the same formula s^v(r)/r^v(s). Native exponents −1 and 1 on p and p⁻¹ become 1 and −1 after negation. | Pass |
| §2.3 restriction and transfer | e=2,f=1; e=1,f=2; u=2 in 𝔽₅×; a tower e=2 then e=3 | Restriction on K₀: 1↦2 and 1↦1. Transfer: 1↦1 and 1↦2. u↦4. Tower factor 6. | Pass; locator R06 |
| §2.4 | n=1, 3, 4 over ℤ | n=1: ⊕K₀(k(v))=⊕ℤ≠0, and {±1}→ℚ× is not onto. n=3: K₂(𝔽_p)=0, so the map is onto. n=4: K₄(𝔽_p)=0, so the map is injective. | Pass |
| §3.1 layer poset | V=𝔽₂²; dim V=1; (0,L) against (L′,V) | 1+3+3+3+1=11 layers. In dim 1, (0,0) and (V,V) are incomparable (Kahn 4.3.2). (0,L)≤(L′,V) forces L′=0, and the reverse forces L=V. | Pass |
| §3.4 Borel range | SL₂/ℚ; Γ(3); F=ℚ(i), m=2; ℚ in degree 5; m=5, q=1 | ℚ-rank 1, so 4q<1 gives q=0. [SL₂(ℤ):Γ(3)]=24 and χ=−12/6=−2, so Γ(3) is free of rank 3. vcd SL₂(ℤ[i])=3−1=2, so H³=0 while H³(g,K)=ℝ. Degree 3 needs m≥14; degree 5 needs 20<m−1, so m≥22. 4=m−1 is excluded. Borel 9.5(3) gives [rk_ℚ G/4]′. | Pass |
| §4.2 | ℓ=3, F=ℚ | r=2 and a=1. i=1→1, i=2→3, i=6→3²=9, and w₆=8·9·7=504. | Pass |
| §4.3 | ℚ(√−2), ℚ(i), ℚ | The image of ℚ(√−2) is ⟨3⟩; 3²=9≢1 mod 16, so w₂⁽²⁾=8=2^(3+1−1). For ℚ(i), 5²≡9 mod 16, so 8=2^(2+1). For ℚ, a=2, so 8 at i=2 and 2 at i=1. | Pass |
| §4.4 | i=2, 4, 6, 10 | 8·3=24; 16·3·5=240; 8·9·7=504; 8·3·11=264=den(1/264). The K-book prints 1320. | Pass; locator R07 |
| §6.2 signature defect | ℤ; ℚ(√7) at S=∅ and over ℤ[1/2]; ℚ(√34)[1/2] | ℤ: Selmer {±1}, so j=0=u−t; étale H¹(ℤ,ℤ/2)=0 would give 1. ℚ(√7)[1/2]: −1 has signs (−,−); 8+3√7 and 3+√7 have signs (+,+) since 8−3√7≈0.063 and 3−√7≈0.354; so j=1. At S=∅, u−t=1−0=1. ℚ(√34)[1/2]: 5+√34 has norm −9, (5+√34)=𝔭₃², signs (+,−) since 5−√34≈−0.83; so j=0. | Pass |
| §6.6 Caputo control | Caputo's sextic F | Ring Moore sequence: K₂(O_F){3}/WK{3}≅ker(μ₉→μ₃)=ℤ/3. Proposition 4 gives WK^ét₂(F)₃=0, so K₂(O_F){3}=ℤ/3. Theorem 1 at i=n=1 gives a coefficient kernel ℤ/3, while div=0 (Remark 11(ii)). 3⁵=243≡−1 mod 61. | Pass |
| §6.7 wild kernels | ℚ at i=1; ℚ(i); ℚ(√−14) | {−1,−1} has real sign −1, so the raw kernel of ℚ is 0. The ℚ(i) kernel is inside K₂(ℤ[i])=0. −14≡2 mod 16, so wildkernel Example 5.6 (line 453) gives {−1,−1}∈WK∖div. | Pass |
| §6.10 special fields | d=−17, −14, 2; the norm test at m=4 and m=8 | −17≡7 mod 8 and F_v=ℚ₂(i) is nonexceptional: special and very special. −14≡2 mod 16 and F_v=ℚ₂(√2) is exceptional: special, not very special. d=2: Γ_∞(F_v)=Γ_∞(F)={±1 mod 8}, so not special; the README excludes it, Hutchinson Example 2.5 does not. m=4, q^i=3: norm 1+3≡0 and invariants {0,2}. m=8: norm 4, and coinvariants ℤ/2→{0,4} is an isomorphism. | Pass |
| §6.15 Adams slots | j=0, −1, 1 with both signs; FGV Lemma 2.11 | (0,0)/(2,1); (2,0)/(0,−1), total −2 in both cases; (2,2) for j=1 positive. FGV: ψ⁻¹ acts by (−1)^k on H²(k)⊂K^β_(2k−2); with j=k−1 this is (−1)^(j+1), as the README says. | Pass; scope R04 |
| §7.3 Herbrand–Ribet | ℓ=37, k=16; Teichmüller at p=5 | 1−32≡5 mod 36. Lifts 1, 7, 18, 24 mod 25; Σaω(a)=165, and 165/5=33≡3≡B₂/2 mod 5. The inverse character gives Σ=154≡4 mod 5, not p-integral after dividing by 5. | Pass |
| §7.4 Bott shift | ℓ=3, 5 | Generator degrees 0,3,1 and 0,7,1,5. Residue dimensions 1,1,0,1 and 1,1,0,0,0,1,0,1. K₂(ℤ[1/3];𝔽₃)=0 matches residue 2. | Pass |
| §5.4 and §8.10, K₃ | ℚ (r₁=1); ℤ[i] (r₂=1); D₈ control | ℤ/(2·24)⊕(ℤ/2)⁰=ℤ/48; ℤ⊕ℤ/24. In D₈, (as)²=a·a⁻¹=1, so the extension splits (nonabelian). | Pass |
| k4_int_eq_zero | odd part; 2-part through ℤ[1/2] | The cofibre of S[1/2]→K(ℤ)[1/2] has H̃_(≤4)=0, so π₄ is onto. Stem 4 at p=3 has only (1,5), and 4∤5; at p≥5, 7s≤4 forces s=0 and BP₄=0. The 2-rank j+s+t−1=0+1+0−1=0 for ℤ[1/2], and K₄(ℤ)↪K₄(ℤ[1/2]) since K₄(𝔽₂)=0. | Pass |
| §6.5 and the §7.5 order ratio | ℚ at i=2, 4 | 2·2/48=1/12=\|ζ(−1)\|; 2·1/240=1/120=ζ(−3). | Pass |
| integerEvenKOrder | a=0, 2 | c₁=num(1/24)=1, so \|K₂\|=2; c₂=num(−1/240)=1, so K₆=0; c₆=num(−691/65520)=691. | Pass |
| §8.1 data | ℚ(√5) | r₁+2r₂=2=[F:ℚ]; unit rank 1; w₂=8·3·5=120; 120·(1/30)=4. | Pass |
| §8.2 | p=2, 3; K₁ | K₂(ℤ[1/3])=ℤ/2⊕ℤ/2; K₄(ℤ[1/2])=ℤ/(2²−1)=ℤ/3; K₁(ℤ[1/p])=ℤ/2⊕ℤ. The transfer K₁(𝔽_p)→K₁(ℤ) is 0 because K₁(ℤ)↪K₁(ℤ[1/p]). | Pass |
| §8.4 tateCriterion | proof check; smallNorm | ḡⁿ lies in C̄ and β(gⁿ)=1, so ḡⁿ=1, with n the order of β(g). Hence C̄=⟨Ḡ⟩, and W̄⊆C̄ gives Ū=C̄ and ker β̄=1. A norm below q² leaves one v-factor. In ℤ[i], \|N(a−b)\|≤(\|a\|+\|b\|)²<q². | Pass |
| §8.5 Gaussian | q=5; {i,i} | 1+1/√2≈1.71<√5. C={±1,±i,±1±i} has 8 elements. 3{i,i}=0 and 4{i,i}=0, so {i,i}=0. | Pass |
| §8.8–8.9 golden | the eleven primes; q=4 | Norms a²+ab−b²: 4,5,9,11,11,19,19,29,29,31,31. Minors 6 and −3 give gcd 3. g↦(−1,−1) and h↦(1,−1) are independent. | Pass |
| R01: §6.1a ownership | GoNQA line 44 against lines 75–79 | Disclaimed there; claimed here. | R01 |
| R05: finrank_sUnits | ℤ, S={(p)} | 0+1=1=1+0+1−1. | R05 |

### Sources opened (seeded sample)

| Target | Locator, cache line | Result |
| --- | --- | --- |
| 2.2 | kbook (6.6)–(6.6.1) lines 24544–24559, p. 409; III.6.3 line 13461, p. 234 | ✓ |
| 2.3 | kbook V.6.6.3–6.6.4 lines 24609–24624, p. 410 (transfer); Remark III.6.3.1 line 13484, p. 234 | ✓ for transfer; R06 for restriction |
| 3.1 | kahn §4.1 line 640, p. 15; Def. 2.3.2 line 409, p. 10; 4.2.4 and 4.2.6 lines 674–704, p. 16; 4.3.2–4.3.3 lines 719–730, p. 17; kbook IV.6.8–6.9 lines 19050–19064, p. 325 | ✓ |
| 3.4 | borel1974 0.1 line 110, p. 237; 3.3 line 325, p. 243; Theorem 7.5 line 934, p. 259; 9.1 line 1006, p. 261; 9.5(3) line 1070, p. 262; borel1977 §5.2 lines 440–461, pp. 626–627; kbook IV.1.17–1.18 lines 15754–15779, p. 271 | ✓ |
| 4.2 | kbook VI.2.2 and VI.2.2.1 lines 28465–28485, pp. 470–471 | ✓ |
| 4.4 | kbook VI.2.1.2 line 28417, p. 470; VI.2.4 line 28557, p. 472 | ✓, with R07 |
| 6.2 | kbook (9.6) line 31761, Def. 9.6.1 line 31768, p. 520; (9.6.2) line 31786, p. 521 | ✓ |
| 6.7 | kbook V.6.8.2 line 24796, p. 413; wildkernel Def. 0.2 line 51, Lemma 0.3 and Cor. 0.4 lines 58–72, p. 2; Prop. 8.1 line 602, p. 20 | ✓ |
| 6.10 | hutchinson Def. 2.3 and Rem. 2.4 lines 139–150, p. 4; Lemma 2.6 line 172, p. 4; Lemma 2.7 line 201, p. 5; wildkernel Lemmas 3.2/3.4 and Rem. 3.4.1 lines 264–293, p. 9; Cor. 3.7 line 317, p. 10; Rem. 5.2.1 and Lemma 5.4 lines 433–440, p. 14 | ✓ |
| 6.15 | fgv (2.6) line 517, p. 12; Lemma 2.11 line 586, p. 13; Cor. 2.12 line 615 and its proof, p. 14; Rem. 2.13 line 641 and Lemma 2.14 line 649, p. 15 | ✓, with R04 |
| 7.2 | kbook VI.2.4.1 line 28561, p. 472; sharifi Cor. 4.4.4–4.4.5 lines 3545–3547, p. 113; Prop. 5.2.5 line 4230, p. 134; Rem. 5.2.8 line 4262, p. 135; Rem. 5.2.9 line 4267, p. 136 | ✓ |
| 7.3 | ribet (1.1)–(1.3) lines 73–97, pp. 152–153; (4.4) line 469, p. 162; sharifi Thm 4.5.7 line 3690, p. 117; kbook VI.10.4 line 32384, p. 530 | ✓ |
| 8.1 | definitions only; the presentation locators of §6.14 | ✓ |
| 8.2 | kbook III.6.5.1 line 13575, p. 236; V.6.1 line 24317, p. 406; VI.8.1 line 31271, p. 513; VI.8.3 line 31348, p. 514; VI.9.5 line 31706, p. 519; VI.10.1.3 line 32284, p. 528 | ✓ |
| 8.4 | groenewegen Lemma 7 line 265 and triangle lines 281–290 (PDF pp. 6–7, journal pp. 1448–1449); Theorem 15 line 519 (PDF pp. 12–13) | ✓; Bass–Tate not verifiable |

The repaired §6.6 was also checked: caputo Proposition 4 at lines 823–828 (p. 16), Example 2 at lines 847–860 and Remark 11(ii) at lines 864–867 (p. 17).

### Library declarations opened at the pins

**Mathlib** (`#check` on the scratch copy, or file and line):
- `RingTheory/DedekindDomain/SInteger.lean:65` `integer`, `:108` `unit`, `:124` `unitEquivUnitsInteger`;
- `RingTheory/Localization/LocalizationLocalization.lean:193` `IsLocalization.isLocalization_of_submonoid_le`;
- `NumberTheory/LSeries/HurwitzZetaValues.lean:251` `riemannZeta_neg_nat_eq_bernoulli`: ζ(−k)=(−1)^k B_(k+1)/(k+1);
- `GroupTheory/FiniteAbelian/Basic.lean:119` `AddCommGroup.equiv_free_prod_directSum_zmod`;
- `Algebra/Module/ZLattice/Covolume.lean:171` `ZLattice.covolume_div_covolume_eq_relIndex'`;
- `MeasureTheory/Group/GeometryOfNumbers.lean:92`;
- `RingTheory/DedekindDomain/AdicValuation/Valuation.lean:180` `intValuation_eq_exp_neg_multiplicity`;
- `NumberTheory/Cyclotomic/Gal.lean:76` `autEquivPow`, in namespace `IsCyclotomicExtension` (the README's unqualified backtick resolves there);
- `NumberTheory/NumberField/Units/DirichletTheorem.lean:359` `rank`, `:378` `finrank_eq_rank`;
- `Algebra/Lie/Cochain.lean`, low degree only;
- also `SmoothPartitionOfUnity.exists_isSubordinate` (needs `[T2Space M] [SigmaCompactSpace M]`), `ClassGroup.extendedHom`, `ClassGroup.equivPic`, `LinearEquiv.ofBijective`, the two `Module.Relations.Solution` surjectivity lemmas, `AddSubgroup.index_eq_natAbs_det`, `ZLattice.covolume`, `IsZLattice`, `bernoulli_one`, `bernoulli_eq_bernoulli'_of_ne_one`, `Bernoulli.vonStaudt_clausen` and `Module.End.eigenspace`.

**Tau Ceti:**
- `RingTheory/DedekindDomain/SInteger/Unit.lean:105` `unitValuation`, `:123` `unit_mono`, `:130` `unitValuation_ker`;
- `SInteger/ClassGroup.lean:95` `integer_extendedHom_surjective`, `:138` `ker_integer_extendedHom`, `:145` `integerClassGroupEquiv`;
- `SInteger/Spectrum.lean:180` `integerHeightOneSpectrumEquiv`;
- `RingTheory/ClassGroup/RelNorm.lean:130` `relNorm`, `:154` `relNorm_extendedHom`;
- `SInteger/Rank.lean:122` `finrank_sUnits` (R05);
- `AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92` (R09);
- the Sqrt5 worked-example names of lines 252–261, all present under `NumberTheory/NumberField/WorkedExamples/Sqrt5/`.

No S-integer localization criterion and no regular-prime Bernoulli statement exist at either pin, so the stated headlines duplicate nothing.

### Cross-roadmap citations resolved

**On main:**
- EllipticCohomology E4.S items 1 and 4 (lines 913–971; the p=3 α₁ Check cites item 4);
- BordismFormalGroups F3–F4;
- GeneralizedCohomology G2.4, G2.5, G2.7, G3 item 9 and G5.4;
- AlgebraicTopology Stage 8; MorseTheory M1–M3; GeometricTopology Layer 1; ClassifyingSpaces Stages 3–4; AlgebraicCurves Layers 0 and 12; JacobianChallenge Layer B; SchemeAndStackFoundations §3.3; EtaleCohomologyFoundations F.0.3/F.4;
- CharacteristicClasses C5a.1 (the compact Chern–Weil comparison, a different object from §3.4's).

**At open heads:**
- SchemeKTheoryOperations (#1229) §§3.6–3.7, including the flat-ramification law;
- KTheoryLowDegrees (#1248) §§5.1–5.5, 8.1 and 11.1–11.3;
- K2SymbolsBrauer (#1302) §§7.1–7.2, 9.2–9.6, 11.2, 12.1–12.3, 12.5 and 12.10–12.11;
- KTheoryFiniteLocalFields (#1281) §§0.5, 1.1–1.6, 3.0a, 3.1–3.5, 6.2–6.9, 6.5a and 7.3, and the six named declarations;
- CyclotomicClassGroupsAndStickelberger (#1260) §§0.1–0.4, 2.1, 3.1–3.3, 4.5, 5.1 and 5.4, with `IsRegularPrime`, `kummer_criterion`, `regular_prime_power_class_number` and `herbrand_ribet`;
- IntegralIwasawaTheory (#1306) §§3.1, 6.0, 7.4, 7.7–7.8, 10.4–10.5 and 12.3, with `VandiverCondition`, `oddPrime_specialValueEuler`, `dyadic_specialValueEuler` and `totallyRealHeckeValue_rational`;
- GeometryOfNumbersAndQuadraticArithmetic (#851) §§6.1a, 6.4.2 (`ExactW0`, line 2328), 6.8a, 6.9, 6.10a and 6.11.

**Declared gaps:**
- Both gaps are in `design/plan.json` with the same slugs as README lines 273 and 414.
- §6.11 at #851 does not state the Witt signature theorem, so gap:number-ring-witt-signature is genuine.
- StableHomotopyKTheory at #1227 has no homotopy-orbit spectral sequence. GoNQA §6.1a (line 2101) says it proves “orbit/fixed/Tate spectral-sequence comparisons with their convergence hypotheses”; whether that includes constructing the C₂ sequence is not explicit, so the gap is not challenged here (R03 concerns only its scope).

**Ownership by object** (`roadmaps grep` over main and all open heads):
- Solomon–Tits, signature defect, Harris–Segal, K₄(ℤ), the tame kernels of ℚ(i) and ℚ(√5), Bott-inverted tables and wild kernels of number fields have no second owner. The “wild kernel” hits in DiamondEtaleCohomology and ArithmeticGaloisRepresentations concern wild inertia.
- BorelRegulators (#1461, a consumer) cites §3.4 for borelInvariantFormComparison.
- K2SymbolsBrauer and ArithmeticGaloisDuality mention ArithmeticKTheory only as a downstream consumer, so there is no cycle.

**Overlap report:** no pull request changes this roadmap and no cited id is dropped. The only dropped content still cited is R02.

## Not verifiable

- **Bass–Tate** (`bass-tate`, waived): II §3 and Appendix Propositions 1–2, pp. 403–436, cited in §§8.3–8.5 and 8.8–8.9. The criterion of §8.4 was checked mathematically instead (table row).
- **Groenewegen's preprint pages** (`groenewegen-preprint`, waived). The published text's PDF pages coincide for Lemma 7 (pp. 6–7) and Theorem 15 (pp. 12–13).
- **Grayson, LNM 966** (`grayson-curve`): uncertified, cited by its page range.
- **Other waived texts:** Harris–Segal, Mitchell, Quillen's Seattle notes and Serre were not read.
- **Thomason (1985):** not opened. R04 rests only on FGV's own wording.
- **AINTLIB declarations** (external repository, §§7.1–7.3): not opened. §7.2's argument uses the supplier's unrestricted statements, not those signatures.

## Source issues

- **Error** in kbook at Example VI.2.1.2, printed page 470: the source says w₁₀(ℚ)=1320=2³·3·5·11; it should be 264=2³·3·11, since 5−1 does not divide 10 (Lemma VI.2.4: den(B₅/20)=264); affects a stated result.
- **Error** in kbook at V.6.8.2, printed page 413: the source says that when ℓ annihilates the torsion of K_n(R), div K_n(F) is the kernel of K_n(R;ℤ/ℓ)→K_n(F;ℤ/ℓ); it should require a stabilization modulus, since Caputo's sextic field has kernel ℤ/3 but div 0; affects a stated result.
- **Error** in kbook at V.6.8.2, printed page 413: the source says div K_(2i)(F) is isomorphic to the wild kernel; it should allow a ℤ/2 quotient for special F and odd i (wildkernel Theorem A, Example 5.6: ℚ(√−14)); affects a stated result.
- **Error** in kbook at Definition VI.9.6.1, printed page 520: the source says 0≤j(R)<r₁ for every R; it should assume 1/2∈R and r₁>0, since H¹_et(ℤ,ℤ/2)=0 gives j(ℤ)=1=r₁; affects a stated result.
- **Misprint** in hutchinson at Example 2.5, printed page 4: the source says ℚ(√d) is special for d≡±2 mod 16 excluding only d=−1,−2; it should also exclude d=2, since ℚ(√2) has equal global and dyadic Γ_∞; affects nothing.
- **Error** in wildkernel at Definition 5.2, printed page 14: the source says special needs, at every dyadic prime, a root ζ with ζ+ζ⁻¹ in F_p but not F; it should also allow nonexceptional F_p, as Remark 5.2.1 and ℚ(√−17) require; affects nothing.
- **Misprint** in hermitian at proof of Corollary 1.2.12, printed page 18: the source says the map is injective when n≤2n−3; it should be n≤2m−3, the statement's range; affects nothing.
- **Misprint** in caputo at Example 2, printed page 17: the source says E is totally split at 3 in the construction for a general odd prime p; it should say at p; affects nothing.
