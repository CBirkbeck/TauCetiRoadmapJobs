# Review of CharacteristicClasses (pull request #1807 at 7fa7fe9)

**Verdict:** needs changes

Two findings, both P3; neither blocks. This head repairs all four findings of the previous review (details under "Verified sound"). The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with only its five `sorry` warnings. What remains:

- fifteen targets state their theorem with no source locator at the claim, five of them in this round's seeded sample (R01);
- one sentence of C1.5 stops in the middle and leaves a comparison without its second term (R02).

## R01 (P3) — Fifteen targets carry no locator at the claim

Location: `TauCetiRoadmap/CharacteristicClasses/README.md`, sections 1.4 (lines 940–948), 2.4, 2.5, 2.6 (1444–1519), 3.3 (1703–1720), 4.3 (1999–2006), 5.3, 5.5 (2128–2167), 6.2 (2663–2690), 6.4, 6.5 (2739–2761), 7.2 (2818–2833), 7.3 (2845–2865) and 7.3a (2867–2928). For example 6.5: "For embeddings with a specified complex normal bundle prove the cohomological/K-theoretic pushforward comparison `ch(f!_K a)=f!_H(ch(a)·Td(ν)^−1)`".

Claim: each of these sections states theorems and gives no theorem number, section or page. The seeded sample contains C1.4, C2.6, C4.3, C6.2 and C6.5, so for those there was nothing to check a statement against. For C7.3 and C7.3a a locator exists but only in `## References` (Cohen) and in the Lean docstring (Milnor–Stasheff §4), not at the claim. C7.3 has one locator, for `e(TSⁿ)`, and none for the Euler sequence.

Witness: `grep -n "Hatcher\|Dupont\|Cohen\|Milnor\|Bott" README.md` returns two lines inside the ranges above: line 2856 (C7.3, `e(TSⁿ)` only) and line 2155, which is the phrase "Milnor argument" in C5.4, not a locator.

Repair: add the locator in parentheses at each claim. I read every locator below marked "read" at the cited line and it supports the statement it is attached to.

| Target | Locator | Status |
| --- | --- | --- |
| C1.4 smooth representatives of bundles and isomorphisms, with the relative versions | Müller–Wockel, *Equivalences of smooth and continuous principal bundles with infinite-dimensional structure group*, arXiv:math/0604142v3, Proposition I.13 (finite-dimensional group), Theorem II.11 (bundles, relative to a closed set) and Theorem II.12 (equivalences, relative) | read (lines 225, 461, 686) |
| C3.3 `p_i=(−1)^i c_(2i)(E_ℂ)` | `hatcher-vbkt` §3.2, p. 94; Milnor–Stasheff Theorem 15.3 for the Whitney correction (already in References) | read (line 3649); Milnor–Stasheff uncertified |
| C4.3 universal Chern–Weil map, agreement with the smooth-bundle map, multiplicativity, naturality | `dupont-ccc` Theorem 6.13 a)–d), pp. 94–95 | read (lines 2977–2990) |
| C5.3 disconnected compact G | `dupont-ccc` Theorem 8.1, the last step of its proof, p. 129 | read (line 3954) |
| C5.5 Euler class and Pfaffian | `dupont-ccc` Corollary 8.37, p. 131 | read (line 4028) |
| C2.6 Euler integral of G/T and the transfer `T(φ)=π_*(Ψ∧φ)` | `dupont-ccc` Lemma 8.30 and its proof, pp. 125–129 | read (lines 3848–3952); see the note below |
| C6.2 definition of ch by Newton polynomials, additivity and multiplicativity | `hatcher-vbkt` §4.1, pp. 109–110, Proposition 4.2 | read (lines 4199–4231) |
| C7.2 `ch Δ⁺ − ch Δ⁻ = ∏(e^(x_j/2) − e^(−x_j/2))` | Atiyah–Hirzebruch, *Riemann–Roch theorems for differentiable manifolds*, Bull. AMS 65 (1959), §4, p. 281 | read (line 200) |
| C7.3 Euler sequence and `c(TCPⁿ)=(1+h)^(n+1)` | `cohen-fiber-bundles` Chapter 1 §2.2, p. 25 (`τCPⁿ⊕ε≅⊕γ*`), and Chapter 3, p. 112 | read (lines 949, 3809) |
| C7.3a `T(RPᵐ)⊕ε¹≅γ^⊕(m+1)`, `w(ν)w(TM)=1` and non-immersion of `RP^(2^k)` in `ℝ^(2^(k+1)−2)` | `cohen-fiber-bundles` Theorem 1.15, p. 24; Proposition 3.27, p. 105; Corollary 3.28, p. 106 | read (lines 929, 3583, 3596) |
| C2.4, C2.5 embedding Gysin maps and fibre integration | Bott–Tu §6 (already in References) | uncertified, not read |
| C6.4, C6.5 Thom correction and Riemann–Roch for embeddings | a source that states the K-level identity | not found; see the note below |

Two notes on the table.

- C2.6: Dupont's Lemma 8.30 works with real forms on a simplicial manifold. It supports the Euler-integral input (zeros at the Weyl cosets, every local index +1) but not the construction over a paracompact base without a manifold structure. That construction still needs its own source or the sentence "this construction is this item's own".
- C6.4/C6.5: Atiyah–Hirzebruch 1959, Theorem 1 with the embedding step of §4 (lines 100–104 and 181–192), proves only that `f_*(ch(Y)·Â(ν)⁻¹)` lies in the image of ch. Its Remark (1) says the K-level homomorphism is only expected. So it does not support `ch(f!_K a)=f!_H(ch(a)·Td(ν)⁻¹)` as written; cite a source that does.

Tested on the instance that showed the gap: C7.3a's headline is Cohen's Corollary 3.28 word for word (k>0, N≤2^(k+1)−2), which is the Lean statement `not_exists_isImmersion_realProjectiveSpace`.

## R02 (P3) — A sentence of C1.5 breaks off, leaving a comparison without its second term

Location: `README.md:961–962`: "Compare BU(1), BO(1) and the double-cover model, For T=(S¹)^m construct the compatible finite models".

Claim: the sentence ends at a comma and the next begins. A target is promised (a comparison of BU(1), BO(1) and the double-cover model) without saying with what or by which maps. C1.5a and C1.6 then rely on it ("T1.6's universal double cover").

Witness: the same broken sentence is on main at `CharacteristicClasses/README.md:698`; no later sentence of C1.5 completes it.

Repair: "Compare BU(1) and BO(1) with these CP∞ and RP∞ carriers, and RP∞ with the quotient S∞/{±1} of T1.6's universal double cover, by the universal-bundle maps." Tested against C1.5a (lines 994–996), which uses exactly T1.6's universal double cover and principal circle bundle on these carriers.

## Verified sound

**The previous review's findings at this head.**

- R01 (house shape, Checks, locators): repaired. The README now has `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `### k.n` subsections with their C-labels, `### Examples` and `### Dependencies` in every layer, `## Downstream consumers` and `## References`. There are now 34 Checks blocks, including one in every section that review listed as lacking them (C1.0, C1.1b, C1.2b, C1.5, C3.5, C4.3, C5a.1, C5a.2, C5a.4, C6.1, C6.3, C7.2). Locators were added to C1.5a, C1.6, C3.4a, C3.5, C3.6 and C6.3; I read each (below). The targets that still have none are R01 above; that review did not list them.
- R02 (docstring): repaired. `Suggested.lean:98–108` names the CE/de Rham comparison and the universal transgression as not statable, and lines 44–51 now say "the pins define no degree of a self-map, and for an integer `d` with `f_*[M] = d • [M]` … it follows".
- R03 (ConvexityToric): repaired. Lines 3061–3064: "it compares its Borel constructions with C1.5's torus model, keeping C1.5's sign `u_i=−h_i`. Nothing here consumes ConvexityToric."
- R04 (C5.1): repaired. Lines 2050–2056 consume LieGroups Layer 5A's radical/centre and bracket-orthogonality arguments, and lines 2061–2068 keep as the item's own only `LieAlgebra.IsKilling` for the complexified summand and `B_G = −λ_i κ`.

**Gate and dependency check.** The worker's gate at 7fa7fe9 passes every check. The diff outside the pull request's listed folders is empty. The branch's Tau Ceti pin (2fd255d9) is main's. The dependency check prints:

    depcheck: 234 roadmaps, 2299 edges, 0 problem(s)

**Lean.**

- `lake env lean` on `Suggested.lean`: five `sorry` warnings (lines 148, 172, 188, 212, 244), nothing else.
- `#check @` for all five declarations in a scratch copy: the elaborated types match README C2.1 (lines 1200–1213), C2.2 (1276–1285), C2.3 (1319–1324) and C7.3a (2909–2923). `[FiniteDimensional ℝ F]` survives in the three bundle theorems; nothing changed.
- One-tactic probe (`first | rfl | trivial | (simp; done) | infer_instance | (constructor <;> simp; done) | (intro h; simp at h; done)`): all five fall through to `sorry`, so none is padding.
- All five Lean names appear in the README, and `roadmaps grep` finds them in no other roadmap's `Suggested.lean`.

**Pinned declarations opened (26).**

- Tau Ceti:
  - `Singular/LocalHomology/FundamentalClass.lean:204` and `:275` (`fundamentalClass`, `mapFundamentalClass`), and `Cohomology/FundamentalClass.lean:120`;
  - `Singular/FilteredSpace.lean:247` (`filteredSpaceSpectralSequence`, homological) and `ClassifyingSpace/Basic.lean:73`;
  - `Algebra/Lie/Cochain.lean` (uses `d₂₃`, 2-cochains only);
  - `Orientation/Cover.lean:36`, `Orientation/ThomClass.lean:27`, `MayerVietoris/Basic.lean:65`, `MayerVietoris/DirectedUnion.lean:34`;
  - `FiberBundle/Separation.lean:37`, `SerreFibration/FiberBundle.lean:21`, `VectorBundle/FiniteRank/Basic.lean:209`;
  - `CWComplex/Classical/RealProjective.lean:18`, `Manifold/Instances/LensSpace.lean:20` (`instIsManifoldQuotient`);
  - `CliffordAlgebra/Spin/Real/Frame.lean:149`;
  - `Lie/Killing/SymmetricAlgebra.lean:37`, `Lie/HighestWeight/ChevalleyRestriction.lean:46`;
  - `PowerSeries/GenusPolynomials.lean:38` and `:44`, `Quaternion/ComplexMatrix.lean:55`.
- Mathlib: `Algebra/Lie/Cochain.lean:118` and `:123` (`d₁₂_apply_apply_ofTrivial`, `d₂₃`; nothing above 3 arguments), `Geometry/Manifold/Instances/Quotient.lean:50`, `Instances/Sphere.lean:465`.
- A search of Tau Ceti's `AlgebraicTopology` for a relative cup product finds none, which confirms the docstring's reason for not stating the Thom isomorphism.

**Cross-roadmap citations resolved (21).**

- TopologicalKTheory at this head: T1 items 3 and 4 (lines 302, 316), T1.5a (421), T1.6a (497) and its countable-colour producer (537), T3 item 4 (1035), T4 item 8 (1125), T6.4 (consumer lines 152–159), T7 item 4 (1796, the doubled-space formula).
- AlgebraicTopology at this head: the consumer lines 157–164, the supported-cellular supplement (1912–1914) and the names `supBallEuclideanDiskHomeomorph`, `homotopyPushoutGluingComparison`, `simplicialRealizationCW` and `relativeCWPushoutCWModel` (539–546, 1062).
- On main: LieGroups Layers 1, 2, 5, 5A and 6 (lines 301, 356, 518, 641, 673); MorseNovikov's ownership of the Lefschetz formula (line 17); LieGroupoidsPoisson G1.3a (line 18); SchubertGeometry S9 item 6 (line 120).
- `roadmaps resolve` reports no unresolved citation and no unresolved Lean name.

**Ownership and overlaps.**

- `overlaps.md`: no dropped id, and no id that only an open revision defines. #1808 and #1854 conflict in this folder; the description's merge-order block fixes "this pull request → #1808 → #1854".
- `roadmaps grep` for the non-immersion statement, the Euler-number statement and Thom-class headlines finds no second owner; SpinGeometry's `Suggested.lean` only uses the pinned `IsThomClass`.

**Headline theorems.**

- Stated: C2.1 (Thom class, existence and uniqueness over an arbitrary base; existence for every coefficient ring), C2.2 (Euler class as primary obstruction), C2.3 (`⟨e(TM),[M]⟩=χ(M)`), C7.3a (Whitney's non-immersion theorem).
- Named as not statable, each with the missing carrier: the Thom isomorphism, the Gysin sequence, the universal rings, Borel's theorem and the universal Chern–Weil map, the singular/de Rham Chern–Weil comparison, the exterior Hopf isomorphism, the CE/de Rham comparison, the universal transgression, the Chern-character isomorphism and its Thom correction.

**Sources: the seeded sample, read at the locator.** Printed pages are the PDF page minus 4 for `hatcher-vbkt`, minus 9 for `hatcher-at`, minus 6 for `cohen-fiber-bundles` and minus 8 for `dupont-ccc`.

- C1.2: no source claim; the Bockstein is the pinned declaration.
- C1.5a: `hatcher-at` Example 1B.3, p. 88 (line 3816) and Example 4.50, p. 380 (line 16490, from the bundle S¹→S∞→CP∞).
- C1.6: `hatcher-vbkt` Proposition 3.10, p. 86 (line 3359; w₁ and c₁, CW homotopy type).
- C2.0: unchanged since the previous review, which read `hatcher-vbkt` pp. 16 and 88 and `cohen-fiber-bundles` (2.4) and Proposition 3.7.
- C3.1: `hatcher-at` Theorem 4D.1, p. 432 (lines 18645–18653). Its hypotheses are fibre cohomology finitely generated and free in each degree and classes restricting to a basis, as the README says.
- C3.2: `hatcher-vbkt` pp. 79–81 (lines 3100 and 3172, the real relation and the alternating complex one).
- C3.4: Theorem 3.9, p. 84 (line 3285) and Proposition 3.12, p. 90 (line 3504).
- C3.5: `cohen-fiber-bundles` Theorem 4.38 and Corollary 4.40, p. 167 (lines 5679 and 5706, in §5.5).
- C3.6: `hatcher-vbkt` Theorem 3.16, p. 95 (line 3681), whose proof takes R=ℤ[1/2] (line 3695).
- C4.1: `dupont-ln` Propositions 9.1 and 9.3, Theorem 9.5 and Lemma 9.6 (lines 2138, 2195, 2244, 2264).
- C5.1: `dupont-ccc` Proposition 8.3 (line 3548, G compact connected).
- C6.3: `hatcher-vbkt` Propositions 4.3 and 4.5, pp. 110–111 (lines 4237 and 4266, finite cell complexes).
- C7.3: Proposition 3.14, p. 92 (line 3591).
- C1.4, C2.6, C4.3, C6.2, C6.5 and C7.3a have no locator at the claim: R01.

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C2.1 `existsUnique_singularCohomology_thomPair_fiber` | base a point with ω and −ω; rank 0 on two components | point: u=g and u=−g; rank 0: u=(1,−1), not a constant class | holds | none |
| C2.1 `exists_isThomClass_of_orientation` | Möbius line, ℤ; rank 0 | Möbius: cover connected, no orientation, hypothesis empty; rank 0: constant 1 is a unit on each fibre | holds | none |
| C2.2 `eulerClass_eq_zero_iff_exists_ne_zero` | TS²; S¹×ℝ²; su(F) on S⁴; n=1; B=∅ | 2≠0 and no section; H²(S¹)=0 and a constant section; rank 3 over dimension 4 has e=0 and no section, excluded by `hdim`; n=1 oriented line is trivial, both sides true (so `hn` is not needed for truth); ∅: both true | holds | none |
| C2.3 `eval_eulerClass_tangent_eq_eulerChar` | S²; T²; S³; reversed o | 2=2; 0=0; 2-torsion in ℤ gives 0=0; (−u,−[M]) gives the same value | holds | none |
| C7.3a `not_exists_isImmersion_realProjectiveSpace` | k=1,2,3; natural subtraction; m=3 control | w̄₁(RP²)=a, w̄₃(RP⁴)=a³, w̄₇(RP⁸)=a⁷, each above the normal rank m−2; 2^(k+1)−2≥2 so no truncation; w̄(RP³)=1 | holds; equals Cohen Cor. 3.28 | R01 (locator) |
| C1.1b ψ-weights | t=(3/5,3/10,1/10) | m=3/5, ψ=(3/10,0,0), sum positive | holds | none |
| C1.1d free classes [Sⁿ,O(k)] | k=1,2,3; n=0,1,2 | π₀×π₀=(ℤ/2)²; ℤ/2, ℤ⋊ℤ/2, (ℤ/2)²; ℤ/2 in all ranks since π₂(SO(k))=0 | table correct | none |
| C1.3 stable range | U(1)⊂U(1), m=3; ℤ/2 | 2(m−N)=4≥d+1 gives d≤3, true range d≤5; RP^(2m−1) through degree 2m−1 | holds, bound sufficient | none |
| C1.4 smooth representatives | Müller–Wockel I.13, II.11, II.12 | finite-dimensional K over a manifold; relative to a closed set | supported; no locator in README | R01 |
| C1.5 line class and torus sign | O(−1), O(1)⊗O(1), N=0 | −1 on CP¹; 2h; N=0 loses h | holds | none |
| C1.5 comparison sentence | lines 961–962 | sentence ends at a comma | incomplete target | R02 |
| C1.5a f_h | CP¹; map classifying −h; ℤ→ℤ/1 | +1 on π₂; −1 excluded; K(0,2) contractible | holds | none |
| C2.3a field | v_i=t_i(d_i−μ) | Σv_i=μ−μ=0; Σd_iv_i=Σt_id_i²−μ²=variance ≥0; tetrahedron 4−6+4=2 | holds | none |
| C2.6 transfer | SU(2); T; U(3); SO(3) | 2=\|W\|; 1; 6=\|S₃\|; W₃ of order 2 dies in H*(BT;ℤ) | holds; no locator | R01 |
| C3.1 Leray–Hirsch | P(E) real and complex; rank 0 | bases 1,…,a^(n−1) over 𝔽₂ and 1,…,a^(r−1) over any ring; Hatcher 4D.1 hypotheses match | holds | none |
| C3.2 relation sign | E=L₁⊕L₂ | ∏(x_i−a)=0 gives a²−c₁a+c₂=0 | holds | none |
| C3.3 Whitney correction | general k; L⊕L on RP⁴ | even-even terms give (−1)^k p_ap_b, odd-odd give (−1)^k c_(2a+1)c_(2b+1) with a+b=k−1; −β(a)²≠0 | holds; no locator | R01 |
| C3.3 `p_r=e²`, Sq¹ formula | n=2r | sign (−1)^(r(2r−1))=(−1)^r cancels (−1)^r; (j+1)≡(j−1) mod 2 | holds | none |
| C3.4a first groups | n−r even/odd, r≥2; complex | ℤ for k odd, ℤ/2 for k even; π_(2k−1)=ℤ | holds | none |
| C3.5 spin obstruction | O(1)_ℝ on CP¹; TS²; CP² | winding 1 has no square root; e=2 even; c₁=3h odd | holds | none |
| C3.6 antipodal involution | BSO(2r)→BSO(2r+1) | e↦−e, fixed ring R[p₁,…,p_(r−1),e²] | holds | none |
| C4.1 forms, conventions | O(1); plane block | (i/2π)(−2πiω)=ω; Pf=a/(2π), p₁ form (a/(2π))² | holds | none |
| C4.3 universal map | U(1), m=1,2,3 | −a/(2π)↦−h, pairing −1; m=1 has H²=0; square pairs to 1 on CP² | holds; Dupont 6.13 supports; no locator | R01 |
| C5.1 scalar | SU(2) | [e₁,e₂]=−2e₃, [e₁,e₃]=2e₂, tr ad(e₁)²=−8, B_G=2δ, λ=1/4 | holds | none |
| C5a.1 CE sign | su(2) | [e₂,e₃]=−2e₁, da(e₂,e₃)=2 | holds | none |
| C5a.2 QI | U(2) degree 2 | span(tr²,det) modulo span(tr²): dimension 1 | holds | none |
| C5a.3 `CS_P` | u(1), P=a²; quadratic P | θΩ with d=Ω²; 2·(−1/12)=−1/6, and −1+2/3=−1/3 | holds | none |
| C6.2 Chern character | O(1), O(2), TCP² | (1+h+h²/2)²=1+2h+2h²; 3(1+h+h²/2)−1=2+3h+3h²/2 | holds; no locator | R01 |
| C6.3 periodic target | point; S²; S¹ | ℚv^(−n/2); ℚ²; H¹·v in degree −1 | holds | none |
| C6.4 wedge correction | rank r | ∏(1−e^(x))=(−1)^r e^(c₁)∏(1−e^(−x)) | holds; no locator | R01 |
| C6.5 Riemann–Roch for embeddings | Atiyah–Hirzebruch 1959 Thm 1 | proves membership in the image of ch only | source does not reach the K-level statement | R01 |
| C7.3 acceptance | CPⁿ; Sⁿ; BSO(3) | n+1; 1+(−1)ⁿ; e mod 2=w₃≠0 | holds; Euler sequence has no locator | R01 |
| C7.3a Checks | RP⁴, RP², RP³ | (1+a)³; 1+a; 1 | holds | none |

## Not verifiable

- `milnor-stasheff`, `bott-tu`, `milnor-tdv` and `milnor-universal-ii` are uncertified (no legal copy). Their locators (Theorem 10.4, Corollary 11.12, §§4, 12, 14, 15, 19, Lemma 18.1; Bott–Tu §6; Milnor §6; Milnor §§2–3) were not read; the statements they are attached to were checked mathematically in the table.
- C6.4 and C6.5: I found no open source that states the K-level Thom-correction and embedding Riemann–Roch identities. Atiyah–Hirzebruch 1959 (publisher open archive, read) proves less (R01).
- C2.6 over a paracompact base that is not a manifold: no source located; Dupont's argument is on forms.
- `tomdieck-at` and `may-concise` are outside this round's sample and were not re-read.
- No locator in the README is flagged unverified.

## Source issues

- none
