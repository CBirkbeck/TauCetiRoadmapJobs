# Review of RelativeFarguesFontainePartII (pull request #1825 at f4f1d10)

**Verdict:** needs changes

## R01 (P1) — §§9.3–9.4: for the stated norm the Galois action is not continuous once 0∈I

**Location:** `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md` line 1840 (§9.3) and line 1857 (§9.4): "For I compact in [0,1) … the endpoint 0 allowed, extension of scalars gives an equivalence … with continuous semilinear G_F-action … Continuity uses the Banach norm of the module."

**Claim:** When 0∈I the norm of B_(C,I) contains the radius-zero norm q^(−v_π), and G_F does not act continuously on B_(C,I) for it. The base change of B_(F,I) is then not an object of the target category, so the stated equivalence fails at every I containing 0.

**Witness:** F the completed perfection of 𝔽_p((t)), I={0}, c∈C∖Fbar: v_π(σ[c]−[c])=0, so the norm of σ[c]−[c] is 1 for every σ with σ(c)≠c, and every open subgroup contains one.

**Repair:** In §9.3 replace "Continuity uses the Banach norm of the module." by: "Continuity is for the topology of B_(C,I) in which G_F acts continuously. When 0∉I this is the normalized Banach norm. When 0∈I the radius-zero norm q^(−v_π) is replaced by the weak topology of W_OE(C)[1/π] (on each π^(−N)W_OE(C), the product topology of the Witt coordinates for the valuation topology of C), taken together with |·|_(max I) when I≠{0}; for q^(−v_π) itself the orbit map of [c], c∈C∖Fbar, is not continuous." Use the same topology in the sentence of §9.4 "whose action on sections over every compact subinterval is continuous". Add the Check: "At I={0} and c∈C∖Fbar, v_π(σ[c]−[c])=0 whenever σ(c)≠c, so the unit object is not continuous for the radius-zero norm; in the weak topology σ[c]→[c] because σ(c)→c." Restrict the existing Check on σ(e)=[σ(c)/c]e to 0∉I or to the weak topology. FF17 Proposition 11.2.18 does not name the topology; if the weak-topology form at 0∈I is not wanted as a target, restrict §§9.3–9.4 to I⊆(0,1) and say so in §9.2.

## R02 (P2) — §8.4 plans the general Fréchet–Stein theory that a roadmap on main owns

**Location:** `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md` line 1667 (§8.4): "Construct the general Fréchet–Stein and coadmissible-system interface over any complete nontrivially valued nonarchimedean field K"; line 2197 assigns "the general Fréchet–Stein interface … to §8.4".

**Claim:** The general theory (definition, coherent systems, coadmissible modules, independence of the sequence, Theorems A and B, A_n⊗_AΓ(M)≅M_n, the abelian category) has an owner on main, which is earlier than every open roadmap. §8.4 states it again, with the same two Checks.

**Witness:** `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md` on main, line 196, §1.4 "Fréchet–Stein algebras and coadmissible modules", lines 198–204: any field complete for a nontrivial nonarchimedean absolute value, not necessarily commutative, with ST02 §3 and Corollaries 3.1–3.5.

**Repair:** Replace the first three sentences of §8.4 by: "Fréchet–Stein algebras over a field complete for a nontrivial nonarchimedean absolute value, their coherent systems and coadmissible modules, independence of the defining sequence, Theorems A and B, A_n⊗_AΓ(M)≅M_n and the abelian category are LocallyAnalyticDistributionsPartII §1.4 and are not restated. Prove that B_I is a Fréchet–Stein E-algebra for every nonempty I⊆[0,1): for a cofinal sequence of compact J_n⊆I the rings B_(J_n) with their normalized endpoint norms are noetherian (fields or PIDs, §5.1) and B_(J_(n+1))→B_(J_n) is flat with dense image." Delete the general **API** block, the three general Checks (A_n=K with K², with 0, and K[ε]/(ε²)→K) and the second bullet of the last Checks block; keep the annular Check. Move the ST02 locators to the one sentence that cites the supplier, or drop ST02 from the References. In line 2197 replace the clause by "the general Fréchet–Stein and coadmissible-module theory is LocallyAnalyticDistributionsPartII §1.4, and §8.4 proves only that the rings B_I are Fréchet–Stein". Add `### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII` to the supplier contracts, and "TauCetiRoadmap.LocallyAnalyticDistributionsPartII §1.4" to the Needs line of §8.4 and to the Layer 8 Dependencies.

## R03 (P2) — a headline of §11.1 is statable at the pins and absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/RelativeFarguesFontainePartII/Suggested.lean` line 31: "Nonprincipal positive period ideal: lacks the positive period subring B⁺ …; the headline is the B⁺ assertion." README line 2057: "The two-generated ideal (f,g) is not principal in A[1/p]".

**Claim:** §11.1 asserts two results (Berger08, Remark 1.1.3): A[1/p] is not Bézout, and B⁺ is not. Every carrier of the first exists at the pins, at the README's own generality (E=ℚ_p, F=ℂ_p^♭). §§11.3 and 11.5 state their statable parts; §11.1 does not.

**Witness:** With the file's instance in scope, `¬ IsBezout (Localization.Away ((p : ℕ) : WittVector p (PreTilt 𝓞_ℂ_[p] p)))` elaborates at the pins with `sorry` as the only warning; `simp`, `rfl` and `infer_instance` do not close it.

**Repair:** Add under the Layer 11 heading

```lean
/-- For `E = ℚ_p` and `F = ℂ_p^♭`, the ring `A[1/p] = W(𝒪_F)[1/p]` is not a Bézout ring:
the ideal generated by two series with exponents decreasing to an irrational limit is not
principal (Berger08, Remark 1.1.3). -/
theorem not_isBezout_wittVector_preTilt_padicComplexInt_invert_p (p : ℕ) [Fact p.Prime] :
    ¬ IsBezout (Localization.Away ((p : ℕ) : WittVector p (PreTilt 𝓞_ℂ_[p] p))) := by
  sorry
```

Change docstring line 31 to "Nonprincipal ideal of the positive period ring B⁺: lacks B⁺; the A[1/p] assertion is stated." Name the declaration in §11.1, and write "four" for "three" in the README's "How to read the build" (line 7, adding §11.1) and in the pull request description.

## R04 (P2) — the all-local-field Lubin–Tate contract asks for what the supplier already states

**Location:** `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md` lines 2253–2255: "The mixed-characteristic input retains its finite-ℚ_p hypotheses. … Provide the formal-module, inverse-division Tate-module and normalized convergent logarithm interfaces over every complete discretely valued field with finite residue field".

**Claim:** At its open head the supplier states the Lubin–Tate formal module and the Tate module in both characteristics, and the formal-module logarithm over the fraction field in either characteristic. Only the convergence of the logarithm is restricted to finite extensions of ℚ_p. The contract is not minimal and the sentence before it misdescribes the supplier.

**Witness:** LubinTateFormalModulesAndQuasiCanonicalLifts README at its open head: §1.3 line 495, Check line 528 (over 𝔽_q[[t]], F_f=X+Y, [a]_f=aX); §2.2 line 666 (every local field); §3.2 line 980 (logarithm, either characteristic); §0.3 line 332 assumes K/ℚ_p finite.

**Repair:** Replace lines 2253–2255 by: "Use LT.1 (§1.3) and LT.2 (§2.2) in both coefficient characteristics, as stated there; for E=𝔽_q((π)) and Q=πX+X^q the module is the additive law with [π]=Q. Use §3.2 for the formal-module logarithm over E in either characteristic. LT.0 Analytic logarithm (§0.3) proves convergence for finite extensions of ℚ_p only. What LubinTateFormalModulesAndQuasiCanonicalLifts must provide (the all-local-field Lubin–Tate contract): for E of characteristic p, convergence of the §3.2 logarithm of a Lubin–Tate module on the open unit disc of every complete extension of E, its O_E-linearity for the additive scalar action, and the identity log=lim_n π^(−n)[π^n]_LT there." Tested on Q=πX+X^q: the coefficients are c_i=c_(i−1)/(π−π^(q^i)), of norm q^i, and q^i|x|^(q^i)→0 for |x|<1. Adjust the last sentence of §6.9 (line 1432) and the clause of line 2197 to the same scope.

## R05 (P3) — library locators stale at the pins, and a deprecated name

**Location:** `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md` lines 1501 and 2205–2219: "`IsBezout.TFAE` in `Mathlib/RingTheory/Bezout.lean` (line 55)"; "`PreTilt` in `Mathlib/RingTheory/Perfection.lean` (line 633)"; "`IsAlgClosure` … (line 264)".

**Claim:** Twelve cited line numbers and one name do not agree with the pinned Mathlib and Tau Ceti.

**Witness:** At the pin, `Mathlib/RingTheory/Bezout.lean` line 55 is `theorem tfae` and line 82 is `@[deprecated (since := "2026-10-27")] alias TFAE := tfae`; `Mathlib/RingTheory/Perfection.lean` line 623 is `def PreTilt`.

**Repair:** Write `IsBezout.tfae` (line 55) in lines 1501 and 2207. Correct the lines: `PreTilt` 623; `IsAlgClosure` 280 (its signature also takes `[IsTorsionFree R K]`); `LaurentSeries.valued` 504; `WittVector.fontaineTheta`, `WittVector.fontaineTheta_teichmuller`, `surjective_fontaineTheta` 166, 183, 196; `WittVector.Isocrystal` 112; `ContinuousLinearMap.isOpenMap` 229 and `ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective` 279; `TauCeti.AlgebraicGeometry.WeilDivisor` 43, `.ofPoint` 105, `.weightedDegree` 358; `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.finiteProjectiveEquiv` 112.

## R06 (P3) — the preface cited as FF17 is by Pierre Colmez

**Location:** `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md` line 2288: "Chapter 1, Chapters 2–7, §§11.1–11.2 and the explicitly located preface results support the targets above", and the eight "FF17, Préface …" locators (§§7.1, 8.10, 11.1, 11.3, 11.4, 11.5, 11.6).

**Claim:** The preface results cited (Corollary 3.3 and note 26, Theorem 2.35, Remarks 2.32, 3.10 and 4.4, §§1.1–1.4) are in the preface "La courbe de Fargues et Fontaine", whose author is Pierre Colmez; the reference credits them to Fargues and Fontaine.

**Witness:** FF17 line 136 (the author line of the preface) and its running heads at FF17 lines 163 and 1118.

**Repair:** Append to the FF17 entry: "Locators written "Préface" refer to the preface of this volume, *La courbe de Fargues et Fontaine*, by Pierre Colmez."

## R07 (P3) — the description says the roadmap follows a source

**Location:** the pull request description, block `roadmap-summary`: "The route follows Fargues–Fontaine, with Kedlaya–Temkin for the strict endomorphism."

**Claim:** A roadmap does not say that it follows a source, and the head's organisation is its own: its layers are not the source's chapters in order.

**Witness:** README lines 1604, 1804 and 1896: Layers 8–9 cite FF17 §11.2 and precede Layer 10, which cites FF17 §§6.6–7.9; Layer 6 joins FF17 Ch. 4 and Ch. 6; Ch. 5 and 8–10 have no layer.

**Repair:** "The statements are those of Fargues–Fontaine, each cited by locator, with Kedlaya–Temkin for the strict endomorphism and Poonen for the Hahn-field automorphisms."

## Previous findings

- R01 of the review at 3a7b7c1 (§§1.9–1.10 no longer subsections): repaired. Lines 374, 389 and 408 read "### 1.8 Perfected annulus towers and norm powers", "### 1.9 Cyclotomic coordinates on period annuli", "### 1.10 Equal-characteristic exchange of variables"; the sentence "in each the numerical norms differ by the r-th power" is gone, and the Needs lines of §§1.9–1.10 cite §1.8 as a section.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.9 rank-two valuations | f=π[a], v_F(a)=−r, I={q^(−r)}; r with no n·r in v(F×), n≠0 | v_r(f)=0, both derivatives 1: values (0,1), (0,−1), reversed on f⁻¹. Second case: only index 0 minimizes, second component 0 | true; "in general not" is needed | none |
| §1.1 expansions at 0 | π⁻¹+[a] | lowest index −1, radius-zero norm q; FF17 Prop. 1.6.23 has 0∈I, 1∉I as stated | true | none |
| §1.2 boundary extension | π−[a], v_F(a)=2 | v_r=min(r,2): abscissae ≥0, ordinates ≥0; lim_(ρ→1) of the norm is 1 | true | none |
| §1.5 positive subrings | π^n; [a] with norm >1; x=[b]π⁻¹ | norms ρ^n→0 against 1 at radius 1; norm of [a] at 1 exceeds 1; v_(r′)(x)=v(b)−r′≥(r′/r)(v(b)−r) iff v(b)≥0 | true | none |
| §2.3 θ_Q | [x], 1, 0 for Q=X^q; R/π without surjective Frobenius | θ([x])=x^♯, θ(1)=1, θ(0)=0; pinned `surjective_fontaineTheta` and FF17 Prop. 2.1.10 both assume surjective Frobenius mod π | true | none |
| §2.9 completeness | Cauchy y_n with δ≥n, v(π)≤2 | ideals agree modulo a_3 for n≥3; the lifted generator keeps v(a₀)≤2<3, so degree one | true | none |
| §2.10 Lubin–Tate equations | Q=2X+X²; q=2, v(ε)=4; Q=πX+X², v(t)=1 | u_ε=1+[(1+ε)^(1/2)], two summands; norms 1/4 and 1/8; Q₂(t^(1/4))≡t+πt^(1/2) mod π² | true | none |
| §2.12 Berkovich topology | f=1, finite δ>0 | min(0,δ)=0 on both sides; the printed bound reads 0≥δ | true as corrected | none |
| §4.6 radius | d=2, norm of a₀ equal to q⁻⁶ | radius q⁻³; polygon (0,6)–(2,0), slope 3; each conjugate factor has constant norm q⁻³ | true | none |
| §§4.8–4.9 products | s=2⁻⁸, ρ=1/4, d=1 and 100; index i=0 | max(√s,s/ρ)=1/16; ρ^(−d)√s=1/4 and 2^196; the factor at i=0 is 1−h⁰=0 | true | none |
| §7.3 positive eigenvectors | V=0; trivial V, d=1 | H⁰=H¹=0; H⁰ contains a nonzero t∈P_(F,1) | true with V≠0 | none |
| §8.6 global sections | rank 0; trivial rank 2; a_D on (0,ρ] | 0; B_I²; a_D free of rank 1, no finite primitive product generates every compact restriction | true | none |
| §8.8 matrix factorization | Z=diag(T,T⁻¹), E⟨T⟩ and E⟨T⁻¹⟩ into E⟨T,T⁻¹⟩ | (2,1) entries reached: E⟨T⟩+T⁻²E⟨T⁻¹⟩, missing T⁻¹; 1+εT⁻¹E₂₁ is not XZYZ⁻¹ | true with the tangent hypothesis | none |
| §9.1 finite étale annuli | L=F; Artin–Schreier of degree p; I={0} | rank 1, trace the identity; Tr(1)=p=0 and the trace ideal still contains [ε]; unramified Witt-field extension | true | none |
| §11.4 closed primes | (π); W_OE(m_F); the maximal ideal | Frac(A/(π))=F; A/W_OE(m_F)=W_OE(k_F), fraction field inverts π; residue k_F; five primes as in the preface, Cor. 3.3 | true | none |
| `exists_strict_laurentClosure_endomorphism` | Frobenius; t↦t² | Frobenius fixes k only for k=𝔽_p and is bijective; t↦t² extends to a surjection of the algebraic closure. The norm on K is the unique extension | KT16 Thm 1.2 | none |
| `exists_untilt_padicComplex_not_continuouslyIsomorphic` | K=ℂ_p^♭; ℂ_p with valuation v∘σ | first excluded by 0<v(p), where v(p)=v(0)=0; second is continuously isomorphic to ℂ_p through σ | KT16 Thm 1.3 | none |
| `exists_hahnSeries_automorphism_rescaling_order` | x=t, y=t²; z=0; x=1+t | order σ(t^(1/2))=1=2·(1/2); 0=0; order(1+t)=0 is excluded | true by Poonen93 Thm 2 with E=𝔽̄_p(y) | none |
| §11.1, A[1/p] not Bézout | β_j decreasing to √2 | a generator h would have v(h mod p)=√2, outside the value group ℚ | true; statable | R03 |
| §9.3 descent at 0∈I | I={0}, c∈C∖Fbar | radius-zero norm of σ[c]−[c] is q⁰=1 when σ(c)≠c; weak topology: σ(c)→c | false as stated | R01 |
| §8.4 Fréchet–Stein interface | A_n=K constant; K[ε]/(ε²)→K | Γ(K^d)=K^d; not flat; both are Checks of the owner's §1.4 | owned on main | R02 |
| Lubin–Tate contract, §6.9 | Q=πX+X^q over 𝔽_q[[π]] | law additive; c_i=c_(i−1)/(π−π^(q^i)), norm q^i; q^i·x^(q^i) has norm tending to 0 inside the unit disc | supplier lacks convergence only | R04 |

- Source locators read at the text: 74 (FF17 60, KT16 4, Poonen93 3, Berger08 1, ST02 6), all at the pages cited (FF17: PDF page = printed page + 10); 195 numbered FF17 statements cited in the README were also located mechanically by number: each lies in its cited page range.
- Library declarations opened at the pins: 35 (file and line as corrected in R05; `Mathlib/NumberTheory/Padics/Complex.lean` lines 137, 145, 162, 244, 251, 257 and the Hahn-series, de Rham, Kähler and untilt lines agree as cited). No declaration of the pins proves a target; `fact_not_isUnit_natCast_padicComplexInt` has no counterpart in either library.
- Cross-roadmap citations resolved: 47 sections or targets in 18 roadmaps, on main or at the open heads of VectorBundlesAndIsocrystals, RelativeFarguesFontaine and LubinTateFormalModulesAndQuasiCanonicalLifts; all exist where cited.
- Declared gaps: five of six are precise and ask for nothing found in the supplier (no infimal convolution in OptimalTransport Layer 5; no free-quotient torsor in SchemeAndStackFoundations §1.23; no non-representability statement in VectorBundlesAndIsocrystals Layer 5); the sixth is R04. The contracts are labelled by a phrase, not by their slug.
- Gate on this head (the worker's run): every check 0, `OK`. Dependency check: `depcheck: 219 roadmaps, 2375 edges, 0 problem(s)`; no UPWARD or CYCLE line. Files changed outside the folder: none.
- Elaboration: `lake env lean` gives three `sorry` warnings (lines 65, 87, 102) and nothing else. The four elaborated types were compared with §§11.2, 11.3 and 11.5: no binder lost, generality equal. The probe with `simp`, `rfl` and `infer_instance` closes none of the three theorems: no padding.
- Headlines: 20 listed (3 stated, 17 named in the module docstring); the 17 were checked against the pins, and only §11.1 has a statable part (R03).
- Pull request text: 11 further claims of the title and description checked against the head, none contradicted (it adds the roadmap; three files; seventeen docstring entries counted).

Overlap check: read RelativeFarguesFontaine, VectorBundlesAndIsocrystals, CstConjectureForDaggerVarieties, VectorBundlesAndIsocrystalsPartII, ProetaleCohomologyOfPAdicCurvesAndTowers, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology, FarguesFontaineDiamonds; nothing shared with these. One object is shared with another roadmap: the general Fréchet–Stein and coadmissible-module theory, owner LocallyAnalyticDistributionsPartII §1.4 on main (R02).

Source independence: 12 passages compared with 4 sources (FF17, KT16, Berger08, Poonen93), none shared; largest share FF17, 108 of 113 locator lines; contents compared with FF17: independent. Layers 0–5 take FF17 Ch. 1–3 two layers to a chapter, in the order the Needs lines force (§3.1 needs §§2.6 and 2.9, §4.4 needs §3.1, §5.1 needs §4.7); Layer 6 joins Ch. 4 and 6, Layers 8–9 (Ch. 11) precede Layer 10 (Ch. 6–7), and Ch. 5, 8–10 have no layer.

Research link: Layers 0–10 are the function theory of the curve of Fargues–Fontaine (2017 author copy; Astérisque 406, 2018), on which the classification of vector bundles and p-adic Hodge theory on the curve rest; Layer 11 states Kedlaya–Temkin 2016, Theorems 1.2–1.3, and Poonen 1993, Theorem 2. Rests on the README's References and the sources read.

## Not verifiable

- none

## Source issues

- **Error** in FF17 at Remark 1.6.13, printed p. 72: the source says the two rank-two valuations lie outside Spa(B_I,B_I°); it should except radii q^(−r) with no nonzero multiple of r in the value group, where both equal v_r; affects nothing.
- **Misprint** in FF17 at Example 2.3.7, printed p. 117: the source says u_ε has the summands 1, [α], [α^(1/p)], …, [α^((p−1)/p)]; it should be the p summands [α^(i/p)], 0≤i≤p−1, without [α]; affects nothing.
- **Error** in FF17 at Proposition 2.3.16 (proof), printed p. 120: the source says the difference of v_(y1)(f) and v_(y2)(f) is at least d(y1,y2) for f in A; it should be that the two values agree after truncation at d(y1,y2); affects the proof.
- **Error** in FF17 at Lemma 3.4.5 (proof), printed p. 144: the source says each geometric root has norm ‖y‖^d, so w−π^d has radius-one norm at most ‖y‖^d; it should be norm ‖y‖ for each root and bound ‖y‖; affects the proof.
- **Gap** in FF17 at Corollary 3.5.3, printed p. 146: the source says the points of Y_I are the closed maximal ideals of B_I; it should say nonzero closed maximal ideals, since B_I is a field at a singleton outside the divisible value group; affects a stated result.
- **Error** in FF17 at Proposition 7.1.2, printed p. 262: the source says H⁰ is nonzero for every finite-dimensional continuous representation V; it should assume V≠0; affects a stated result.
- **Error** in FF17 at Lemma 11.2.10, printed p. 372: the source says additive surjectivity of B₁⊕B₂→A gives the factorization near 1 for every Z, by exponential and logarithm; it should assume the conjugated tangent map U+ZVZ⁻¹ surjective; affects a stated result.
- **Gap** in FF17 at Proposition 11.2.18, printed p. 376: the source says the semilinear action is continuous, with 0 allowed in I and no topology named; it should name a topology in which G_F acts continuously at radius 0, such as the weak one; affects a stated result.

## For the human reviewers

- Licence: FF17 is cited from the authors' public copy of 16 April 2017, a precursor of Astérisque 406 (2018); README line 2288 says its numbering is not identified with the published one. It carries 108 of 113 locator lines.
- Shape: "Scope and ownership" and "Exact supplier contracts" stand after "Worked examples" (README lines 2189 and 2201); roadmaps on main place them before the layers (PadicHodgeTheory lines 7 and 30). The head commit makes this move by name.
