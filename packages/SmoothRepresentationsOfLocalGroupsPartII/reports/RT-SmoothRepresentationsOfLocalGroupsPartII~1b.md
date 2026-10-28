<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1642#issuecomment-6407517125 -->
Red team round 1 pass b (claude) of e4d41bc

Verdict: needs changes

1. **F01** (P3) Three CH26 section locators point at Lemma/Proposition 6.k instead of §6.k; two further locators off

   Location: README.md 5.18 (line 1306) "(CH26, §6.7, PDF p. 18; CH26 line 858)"; 5.19 (line 1318) "(CH26, §6.8, PDF p. 18; CH26 line 865)"; 5.21 (line 1342) "(CH26, §6.10, PDF p. 18; CH26 line 881)"; 7.4 (line 1692) "(CH26, §8.1 and proof of Corollary 5.7, PDF p. 27; CH26 line 702)"; 1.10 (line 588) "GI18, Appendix A.1, proof of Proposition A.2, arXiv v3 pp. 31–32; GI18 line 1289".

   Claim: the G₂, F₄ and E₇ half-integral computations, §8.1, and the Mp₂ₙ relative-isolation proof are at those lines and pages.

   Witness: CH26 line 858 is Lemma 6.7, line 865 Lemma 6.8, line 881 Proposition 6.10, all on PDF p. 18. The G₂ section §6.7 starts at CH26 line 1060 (PDF p. 21), §6.8 (F₄) at line 1072 (p. 22), §6.10 (E₇) at line 1111 (p. 23). CH26 line 702 is Corollary 5.7 on p. 15; §8.1 is line 1307 on p. 27. In the cached GI18 v3 text Proposition A.2 is on p. 29 (line 1289); its proof starts at line 1319 on p. 30 and continues on p. 31.

   Repair: 5.18 → "(CH26, §6.7, PDF p. 21; CH26 line 1060)"; 5.19 → "(CH26, §6.8, PDF p. 22; CH26 line 1072)"; 5.21 → "(CH26, §6.10, PDF p. 23; CH26 line 1111)"; 7.4 → "(CH26, §8.1, PDF p. 27, line 1307; proof of Corollary 5.7, PDF p. 15, line 702)"; 1.10 → "arXiv v3 pp. 29–31; GI18 line 1289 (statement) and line 1319 (proof)". Mirror the three CH26 lines and the GI18 range in the `locator` fields of sources.toml.

2. **F02** (P3) The CiF4 comparison that justifies the corrected F₄, B₃ extraneous point fails as printed

   Location: README.md 7.11 route (line 1813) "the F₄, B₃ coordinate is corrected by comparison with Ciubotaru's F₄ classification (CiF4, §3.2, the B₃ row…)" and the paragraph after (line 1815) "Weyl-conjugate to the B₃ complementary-series parameter at ν = ½".

   Claim: ω₁ + ½ω₃ + ½ω₄ = (5/2, 1, ½, 0) in the (6.21) coordinates is W-conjugate to CiF4's B₃ parameter at ν = ½.

   Witness: CiF4 line 584 prints the B₃ row with 3/2+ν in both of its first two coordinates; at ν = ½ that is (2, 2, 3/2, ½), squared norm 10.5, whereas |(5/2, 1, ½, 0)|² = 7.5. The coordinates are the same Euclidean ones (CH26 line 911–912: pairings are dot products; CiF4 line 441–444 lists the distinguished orbits F₄, F₄(a₁), F₄(a₂), F₄(a₃) at (11/2,5/2,3/2,½), (7/2,3/2,½,½), (5/2,3/2,½,½), (3/2,½,½,½), which are ρ, ω₁+ω₂+ω₄, ω₂+ω₄, ω₂ in (6.21)), and W(F₄) acts by isometries, so the two points are not conjugate. The row is a misprint: the parameter direction must be orthogonal to the central point (3/2, 3/2, 3/2, ½) (it lies in the centre of the Levi, as in CiF4's C₃ rows), which forces (3/2+ν, 3/2−ν, 3/2, ½); with that sign the ν = ½ point (2, 1, 3/2, ½) reflects by α₁^∨ = (1,−1,−1,−1) to (5/2, ½, 1, 0) and permutes to (5/2, 1, ½, 0). Independent check: the B₃ Levi of Φ^∨ orthogonal to (0,0,1,−1) has ρ_l = (5/2, ½, ½, ½) = ω₁ + ω₂ = ½h^∨ (sum of its nine positive G-roots is (5,1,1,1)), so the stratum's real parts are ω₁ + ω₂ + t·(0,0,1,−1), squared norm 7 + 2t²; the README's point is t = ½ (simple-coroot pairings (1, 0, ½, ½), fundamental-weight pairings of G^∨ (5, 9, 13/2, 7/2), all in ½ℤ), while CH26's printed ω₁+ω₂+½ω₃+½ω₄ = (4, 3/2, 1, ½) has squared norm 19.5, i.e. t = 5/2, outside the complementary series t < 1. The correction itself is therefore right; its stated justification is not.

   Repair: replace the CiF4 sentence by the orthogonal-decomposition computation above and add "CiF4's B₃ row is read with 3/2 − ν in its second coordinate; as printed the direction is not orthogonal to the central point (recorded as a misprint)". In the Example paragraph write "Weyl-conjugate, after that sign correction, to CiF4's B₃ parameter at ν = ½, namely (2, 1, 3/2, ½); the printed value of Theorem 8.5(3) has squared norm 19.5 and lies outside the stratum's complementary series".

3. **F03** (P2) The supplier contract overclaims what SpringerResolutionAndCharacteristicCycles Layer H provides

   Location: README.md line 15 "SpringerResolutionAndCharacteristicCycles S and H owns Springer/Steinberg geometry and homological convolution"; line 129 "and H, convolution and its homological conventions".

   Claim: Layer H of that roadmap owns (homological) convolution.

   Witness: the roadmap exists only as the board's design package `packages/SpringerResolutionAndCharacteristicCycles/design/README.md` (it is on neither main nor an open pull request). Its Layer H is "Holonomicity, regularity and equivariance" with the nodes transfer-and-duality, kashiwara-equivalence, bernstein-inequality, holonomic-modules, finite-length-and-cycle-additivity, intermediate-extension, regular-holonomic, strong-equivariance, moment-support-and-induction; the word "convolution" occurs only inside its BR-input gap. Layer S (springer-resolution, steinberg-variety, steinberg-components) matches what line 129 says of it. No *Needs:* line consumes H except through the declared gap:steinberg-equivariant-k-theory, which already asks for the K-theoretic convolution.

   Repair: line 15 → "SpringerResolutionAndCharacteristicCycles Layer S owns the Springer resolution and the reduced Steinberg variety with its components; its Layer H owns holonomic D-modules and characteristic cycles. The additional supplier contract below separates coherent equivariant K-theory convolution from those scopes." Line 129 → "Consume Layer S, the Springer resolution, reduced Steinberg variety and its components. Convolution on the Steinberg variety and its equivariant K-theory realization are specified by the additional contract below." plan.json is unchanged (the gap's `section` "S and H" stays).

4. **F04** (P2) gap:triple-centralizers-and-orbit-tables is compound

   Location: README.md line 125 and design/plan.json `gaps[0]`.

   Claim: one `needs` sentence is a single contract.

   Witness: it asks for three independent deliverables: (a) reductivity and component groups of algebraic sl₂-triple centralizers (Kostant), (b) the finite-orbit and unique-open-orbit theorem for the q-eigenspace of a semisimple automorphism (Vinberg's graded theorem, the only input of 7.3's "finitely many orbits and a unique open orbit"), (c) semantic nilpotent-orbit and reductive-centralizer tables (7.6, 7.10, 7.11). (b) is unrelated to N0–N3's triple theory; a supplier can discharge (a) and (c) without (b).

   Repair: split into gap:triple-centralizers (supplier LieHighestWeightPartII N0; needs: the centralizer in G^∨ of an algebraic sl₂-triple is reductive, with its component group), gap:graded-open-orbit (supplier LieHighestWeightPartII N0–N1; needs: for semisimple s ∈ G^∨ and q ≠ 1, Z_{G^∨}(s) has finitely many orbits on the q-eigenspace of Ad(s), exactly one open), gap:orbit-tables (supplier LieHighestWeightPartII N3; needs: the Bala–Carter orbit list with reductive-centralizer types for F₄, E₇, E₈ used in 7.11 and the C₄ data of 7.12). Same slugs in plan.json and in the README's LieHighestWeightPartII subsection; update the *Needs:* lines of 7.3, 7.4, 7.6, 7.8, 7.10, 7.11, 7.13.

5. **F05** (P3) Internal target slugs are labels that nothing defines

   Location: every *Needs:* line and many routes, e.g. line 215 "SRU.0 / strongly-continuous-unitary", line 316 "SRU.0 / positive-type-function", line 1005 "SRU.3 / k-types-persist", line 1753 "az-iwahori-matsumoto".

   Claim: "SRU.k / slug" names a target of this roadmap.

   Witness: a grep for labels of the form "(*slug*)" in README.md returns 0; every heading is numeric ("### 0.1 …"). About 95 distinct slugs are cited and none is attached to a heading, so a reader must guess that az-iwahori-matsumoto is 7.5, steinberg-isolated is 4.7, smooth-vectors-unitary is 0.8. The citation checker resolves only the layer prefix.

   Repair: append the slug to each of the 89 target headings in the sibling roadmaps' label form, e.g. "### 0.1 Strongly continuous unitary representations and unitary equivalence (*strongly-continuous-unitary*)"; or replace every "SRU.k / slug" and bare slug by the numeric "SRU.k.n".

6. **F06** (P3) Residual Lean-style names for declarations that exist nowhere

   Location: README.md line 163 "ContRepresentation.strong continuity"; line 324 "topological irreducibility.cyclic"; lines 328–332 and 340 "the unitary dual.mk π hπ hirr v hv", "the unitary dual.mk π … v … = the unitary dual.mk ρ … w …"; lines 411 and 730 "dist_ptCoeff_le"; line 564 "hilbertSum_weaklyContained_iff"; line 592 "the unitary dual.mk_eq_mk_iff"; line 1013 "the unitary dual.isOpen_setOf_apply_ne_zero"; line 623 "Representation.charTwist".

   Claim: these name declarations.

   Witness: Suggested.lean declares none of them; `Representation.charTwist` does not exist in Mathlib (code search over the repository: 0 hits); the "the unitary dual.…" forms are a mechanical substitution of a former identifier and are neither prose nor Lean.

   Repair: write them in prose: "orbit continuity"; "every nonzero vector of a topologically irreducible representation is cyclic (0.1)"; "the class [π] of a unit-vector coefficient (0.6)"; "[π] = [ρ] iff π ≃ᵤ ρ (0.6)"; "the estimate ‖c(π,v) − c(π,w)‖ ≤ (‖v‖+‖w‖)‖v−w‖ of 0.4"; "the Hilbert-sum criterion of 1.1"; "the open set {x : (rep x)(f) ≠ 0} of 1.7"; "the twist ρ ⊗ χ by the smooth character χ".

7. **F07** (P3) Milman's converse is not a headline of this roadmap

   Location: Suggested.lean lines 106–114, `extremePoints_closure_convexHull_subset_closure`.

   Claim: the acceptance test states the roadmap's headline theorems.

   Witness: the statement is over an arbitrary real locally convex space E and an arbitrary set S and mentions no object of the roadmap; its own docstring calls it "the convex-geometric input". It is a legitimate README target (Mathlib at the pin lacks it: `Mathlib/Analysis/Convex/KreinMilman.lean` contains only `IsCompact.extremePoints_nonempty`, `closure_convexHull_extremePoints` and `surjOn_extremePoints_image`), but by the acceptance-test rule a theorem about free variables only is not a headline.

   Repair: delete it from Suggested.lean; README 1.2 keeps the statement; remove `extremePoints_closure_convexHull_subset_closure` from the 1.2 acceptance-signature line and from the module docstring's list.

8. **F08** (P3) Second countability narrows two headline theorems below their sources

   Location: Suggested.lean lines 131–133 (`raikov`) and 144–146 (`exists_coeff_approx_of_weaklyContainedIn`), both with `[SecondCountableTopology G]`; README 1.5 and 1.6 hypothesis paragraphs.

   Claim: the theorems need G second countable.

   Witness: BHV Theorem C.5.6 (BHV line 14690) and Proposition F.1.4 (BHV line 16155) are proved for every locally compact group; `exists_coeff_approx_of_weaklyContainedIn` mentions no measure, so nothing in its statement uses the hypothesis; an uncountable discrete group is an instance where the source proves the statement and the Lean theorem does not apply.

   Repair: drop `[SecondCountableTopology G]` from `exists_coeff_approx_of_weaklyContainedIn` and from `raikov`; in README 1.5 and 1.6 state "G a locally compact group" and move "second countable, so that L¹/L∞ duality is used in its σ-finite form" into the proof routes. Keep the hypothesis in `godement` and say in 1.3 why: Mathlib's `=ᵐ[μ]` is BHV's "locally almost everywhere" only for σ-finite μ.

9. **F09** (P3) A named consumer precedes this roadmap in the merge order

   Location: README.md line 1859 "GlobalShtukasAndFunctionFieldLanglandsPartII uses the local generic temperedness tests, geometric weight patterns and complementary-series constraints…".

   Claim: that roadmap is a downstream consumer.

   Witness: `merge-order/ORDER.txt` lists GlobalShtukasAndFunctionFieldLanglandsPartII at line 244 and this roadmap at line 294; the consumer's board package (`packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md` lines 476 and 814) has *Needs* on SRU.5/real-satake-parameter, SRU.6/tau-fixed-dual-group and SRU.3. The dependency check for this roadmap reports no problem because the edge is on the consumer's side.

   Repair: nothing inside this folder; the intake must place GlobalShtukasAndFunctionFieldLanglandsPartII after SmoothRepresentationsOfLocalGroupsPartII (or that package must move the consumed targets down). The sentence may stay.

Checkout confirmed at e4d41bc; the pull request changes only `packages/SmoothRepresentationsOfLocalGroupsPartII/` (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, two reports). All 1883 README lines and all 159 Lean lines were read. No Lean was run; signatures were compared by reading them against the pinned sources (Mathlib 6b7abb3c, Tau Ceti a91d3aaf).

## Adversarial table (sampled rows; every Lean declaration and the targets whose values were computed)

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsPositiveType` (kernel a⁻¹b, `Matrix.PosSemidef`) | constant 1; constant −1; ℤ with φ(0)=1, φ(n)=2; S₃ standard rep, v on the (12)-axis | 1: all finitely supported forms ‖Σcᵢ‖² ≥ 0. −1: 1×1 form −|c|² < 0. ℤ: 2×2 minor 1−4 < 0. S₃: Gram at {e,(12)} = [[1,1],[1,1]], form 4 at (1,1), 0 at (1,−1) | matches README 0.3; pinned `PosSemidef` uses finitely supported vectors on any index type (PosDef.lean line 62) | none |
| `IsPositiveType` vs Mathlib inner-product convention | ℤ/2, φ = coefficient of δ₀ in ℓ²(ℤ/2) | Σᵢⱼ cᵢ conj cⱼ ⟪v,π(gⱼ⁻¹gᵢ)v⟫ = ‖Σ cᵢ π(gᵢ)v‖²; kernel entry (a,b) ↦ conj(x_a)φ(a⁻¹b)x_b agrees with a = gⱼ, b = gᵢ | consistent in both directions | none |
| `positiveTypeOne` | trivial group; S¹ characters χₙ | trivial: the set is {1}; S¹: χₙ ∈ P₁, weak-* limit 0 ∉ P₁ | 1.4 and 1.5 Checks hold | none |
| `IsTopologicallyIrreducible` | zero space; ℂ with trivial action; ℓ²(ℤ) regular | 0: `Nontrivial` fails, excluded. ℂ: only ⊥,⊤. ℓ²(ℤ): proper closed invariant subspaces exist (Fourier) | matches 0.1 | none |
| `exists_gnsRep` | φ = 1 on nontrivial G; φ = δ₀ on ℤ; φ = 0 | 1: kernel rank 1, Kolmogorov space 1-dim, π trivial. δ₀: features orthonormal, π = left regular on ℓ²(ℤ). 0: space {0}, statement trivially true | matches 0.5 Checks; `KolmogorovSpace` takes a `PosSemidef` proof over any type (Kolmogorov.lean lines 118–125) | none |
| strong continuity in `exists_gnsRep` | ‖Φ(ga) − Φ(a)‖² | = 2 Re(φ(e) − φ(a⁻¹ga)) → 0 as g → e, using `IsTopologicalGroup` and `hcont` | needs exactly the stated hypotheses | none |
| `mem_extremePoints_positiveTypeOne_iff` | trivial G; ℤ/2 with φ(1) = t | trivial: P₁ = {1}, extreme; space 1-dim, irreducible. ℤ/2: [[1,t],[t,1]] ⪰ 0 iff |t| ≤ 1; t = ±1 extreme and GNS 1-dim; |t| < 1 midpoint and GNS = 1 ⊕ sgn | both directions agree with BHV C.5.2 (line 14570) for any topological group | none (hunitary, hstrong follow from htranslation: P3 note only) |
| `WeaklyContainedIn` | σ = π; σ = 1, π = λ on ℓ²(ℤ) | reflexive with n = 1, z = v. (2N+1)^{-1/2}1_{[−N,N]}: coefficient max(0, 1−|k|/(2N+1)), at k = 1 equal to 2N/(2N+1) → 1 | matches BHV F.1.1 (line 16025) and the 1.1 Checks | none |
| `extremePoints_closure_convexHull_subset_closure` | S = {0,1,½} ⊂ ℝ; S = circle ⊂ ℝ²; S = {eₙ} ⊂ ℓ² | [0,1], ext = {0,1} ⊂ S; disc, ext = circle; ℓ²: 0 = lim (e₁+…+eₙ)/n is extreme in C ⊂ positive cone and ‖eₙ‖ = 1, C not compact | true as stated; hypothesis needed; Mathlib lacks it at the pin | R07 (not a headline) |
| `godement` | trivial group, Haar mass c, f = z ∈ ℂ | double integral c²|z|²φ; condition iff φ real ≥ 0 iff φ positive type on the trivial group | iff holds; integrand of f ∈ C_c, φ ∈ L∞ is integrable, so no junk value of the Bochner integral enters | none |
| `godement` kernel direction | finite group, f = δ_a + iδ_b, φ = 1 and φ = −1 | Σ f(x) conj f(y) φ(y⁻¹x): at φ = 1 equals |1+i|² = 2; at φ = −1, f = δ_e gives −1 | matches 1.3 Check and BHV C.5.3 (line 14634, stated with L¹ test functions; C_c is dense) | none |
| `raikov` | l = ⊥; trivial group; S¹ with χₙ against P≤1 | ⊥: both sides true. trivial: one-point. S¹: χₙ → 0 weak-* with χₙ(1) = 1 shows P≤1 would fail | matches BHV C.5.6 (line 14690); compact-open = uniform on compacta for locally compact G | R08 (second countability not in the source) |
| `exists_coeff_approx_of_weaklyContainedIn` | H' = 0 with H ≠ 0; G finite | H' = 0: hweak fails at Q = {1}, v ≠ 0 (‖v‖² < ε impossible), so vacuous. finite: Q = G, limit attained, coefficient equal | matches BHV F.1.4 (line 16155); 1.6 counterexample for reducible σ on ℤ/2 recomputed: indicator of 0 is neither 1 nor sgn | R08 |
| 0.4 coefficient vs Tau Ceti `matrixCoeff` | unitary character with value i at g | c(π,1)(g) = i; `matrixCoeff π hπ 1 1 g` = ⟪π g 1, 1⟫ = −i; at g⁻¹ it is i | adapter in 0.4 correct; `matrixCoeff` requires `Continuous π` in operator norm (MatrixCoefficient.lean line 73) as the README says | none |
| 0.8 projector normalisation | K finite, regular representation, τ of dimension d | (1/|K|)Σ conj χ_τ(k)π(k) = e_τ/d | README right; GS23 line 1361–1363 omits dim τ (Source issues) | none |
| 1.9 counterexample to GS23 Prop. 11.6 | G₂(ℚ₅), π₁ = St, πₙ = 1 (n ≥ 2) | σ = St ≺ ⊕πᵢ; every increasing subsequence is eventually 1; {St} open (4.7, rank 2) so 1 ↛ St | printed subsequence claim fails; closure form holds | none (Source issues) |
| 2.3 non-split example | GL₂(ℚ_p), i_B(δ_B^{1/2}) | St sub, 1 quotient (dual of i_B(δ_B^{−1/2}) ⊃ constants) | consistent with 5.1 sign convention | none |
| 4.4 A₂ exponent classes | w ∈ W(A₂), J(w) = {α : wα > 0} | e ↦ {α₁,α₂}; s₁, s₂s₁ ↦ {α₂}; s₂, s₁s₂ ↦ {α₁}; w₀ ↦ ∅; sizes 1,2,2,1; inverse convention sends s₂s₁ to {α₁} | Check holds | none |
| 4.6 A₂ ray | χ = q^ρ, w = s₂s₁, ray −mω₂^∨ | wρ = −α₂, ρ + wρ = α₁, ⟨α₁, ω₂^∨⟩ = 0 so δ_B^{1/2}wχ = 1 on the ray; St exponent gives q^{−2m} | Check holds | none |
| 4.7 Hecke step | Ind from H(W_M,q) of sign, W_M ≠ 1 | dimension [W:W_M] > 1, sign multiplicity 1, trivial multiplicity 0 | a third K-type with I-fixed vectors exists | none |
| 4.8 Ψ(G) = 1 | PGL₂(ℚ_p), w = [[0,1],[p,0]] | w² central, ⟨w⟩ compact of order 2, χ(w) = −1 so χ ∉ Ψ(G); Z compact ⇒ Z ⊂ G°, G/G° finite lattice ⇒ trivial (Ber92 line 1281–1284) | repair F01's reading stands | none |
| 5.1 sign convention | PGL₂, ν = ρ, t = diag(ϖ,1) | val_T(t) = ω^∨, ⟨ω^∨,ρ⟩ = ½, χ_{s_ρ}(t) = q^{1/2} = δ_B^{−1/2}(t); X(ρ) = Ind_B 1 ∋ constants | README "subrepresentation for dominant ν" right; CH26 line 807 says quotient (Source issues) | none |
| 5.7 region count | F₄: h = 12, degrees 2,6,8,12 | 14·18·20·24 / (2·6·8·12) = 120960/1152 = 105 | Check holds | none |
| 5.11 d-values | all types | agree with CH26 lines 872–877 | holds | none |
| 5.19 F₄ level-9 coroot | α₁^∨+2α₂^∨+4α₃^∨+2α₄^∨ in (6.21) | (1,−1,−1,−1)+(0,0,0,4)+(0,0,4,−4)+(0,2,−2,0) = (1,1,1,−1); level 9; ⟨(2,0,0,0),½ω₁⟩ = 1 | holds | none |
| 5.20–5.22 E₆, E₇, E₈ | level-r₀ coroots and inequalities | match CH26 lines 1094–1105, 1117–1128, 1149–1155 (labels 89–92, 46–49) | hold | none |
| 5.27 G₂ witness | s_c(aα₁^∨+bα₂^∨) = (−1)^a, ν = ½ω₂ | values on (1,0),(0,1),(1,1),(2,1),(3,1),(3,2): −1, q^{1/2}, −q^{1/2}, q^{1/2}, −q^{1/2}, −q; none is q^{±1}; without the sign (3,2) gives q; fixed roots {±α₂^∨, ±(2α₁^∨+α₂^∨)} orthogonal = A₁×Ã₁ | witness correct; refutes CH26 Cor. 6.32(1) for noncentral s_c as the README says | none |
| 5.29 E-type rows and 2βⱼ vectors | all 26 rows, all 54 vectors | identical to BC1 lines 2195–2231 and 2235–2254; β₃₆ = ω₂(E₆), β₆₃ = ω₁(E₇), β₁₂₀ = ω₈(E₈), each of squared length 2 | hold | none |
| 5.29 B/D rule | B₂ (0,¾); B₃ (1/5,2/5,9/10) | i = 2: ¾ < 1; i = 2: 4/5 < 9/10 and exactly one value 4/5 in (2/5, 9/10) | agrees with BC1 lines 789–791 | none |
| 6.1 Table 1 | ²A₃, ²A₂, ²Dₙ, ³D₄, ²E₆ | fixed groups Sp₄, SO₃, Spin_{2n−1}, G₂, F₄; duals SO₅ (B₂), SL₂ (C₁), C_{n−1}, G₂, F₄ | holds; "SL₂ not PGL₂" right | none |
| 7.1 D_G[1] | GL₂(ℚ_p); rank two | J = ∅ term i_B(δ_B^{−1/2}) = 1 + St, J = Δ term −1: D_G[1] = [St]; cuspidal sign (−1)^{|Δ|} | holds; Aub95 line 119–124 gives (1)–(4) as cited | none |
| 7.5 involution convention | La24 line 790–793 | IM(T_s) = (−t)^{λ(s)}T_s⁻¹, IM(θ_x) = T_{w₀}θ_{w₀x}T_{w₀}⁻¹ | README matches | none |
| 7.9–7.10 Sp(6), (2,2,2) | ½h^∨ = (½,½,½), point (0,½,1) | squared norms 3/4 and 5/4, so not W-conjugate; ν = (−½,0,½), |ν|² = ½ | holds | none |
| 7.11 F₄, A₁+Ã₁ | ½ω₁+½ω₄ | = (1,½,0,0), squared norm 5/4 = |½ω₂|² + ½ with ν = (0,½,½,0) in the centre of ⟨α₂^∨,α₄^∨⟩ | CH26's row consistent | none |
| 7.11 F₄, B₃ | see R02 | README point squared norm 7.5 = 7 + 2(½)²; CH26 point 19.5 = 7 + 2(5/2)² | README value right, justification wrong | R02 |
| 7.12 E₈, 4A₁ | (½,½,½,½); (¼,¾,¾,¾) | ν₁+ν₄ = 1 ≥ 1; ν₂+ν₃ = 3/2 ≥ 1; half-integer lattice forces ν₄ ≤ ½ then ν₂+ν₄ ≤ 1; quarter lattice forces all = ¼ then ν₂+ν₄ = ½ | holds | none |

## Verified sound

- Declarations read: 12 (6 definitions, 6 theorems); every section `variable`/instance context compared with the README statement by reading; no binder is lost (each theorem carries its own instance arguments; the definitions need no completeness). No `set_option`, no `lemma`, imports are `Mathlib` plus two existing `TauCeti.*` modules, no sorry'd data, no `True` placeholder.
- Pinned declarations checked at the pins: `Matrix.PosSemidef` (finitely supported vectors, any index type), `Matrix.PosSemidef.KolmogorovSpace`, `kolmogorovFeature`, `inner_kolmogorovFeature`, `kolmogorovFeature_dense`, `kolmogorovIsometry`, `kolmogorovIsometry_unique`, `ContRepresentation` (monoid homomorphism into continuous linear maps, no orbit continuity), `TauCeti.ContRepresentation.IsUnitary` (no completeness), `IsUnitary.adjoint_comp_self` under `[CompleteSpace V]`, `matrixCoeff`/`matrixCoeff_apply` (require `Continuous π`), `TauCeti.IsPositiveDefiniteSub` (additive, difference kernel), `TauCeti.GL2Steinberg`, `finrank_GL2Steinberg`, `character_GL2Steinberg`, `character_GL2PrincipalSeries_one_one_eq_one_add` (Steinberg.lean lines 107, 130, 142, 172), Mathlib's Krein–Milman file (no Milman converse).
- Targets read: 89 of 89. Headline theorems statable at the pins and present: GNS existence, pure-iff-irreducible, Godement, Raikov, single-coefficient weak containment. Not statable and named in the module docstring: weak-* compactness, sum/closure and isolated-summand theorems, Bernstein admissibility and the dual bijection, Miličić/Tadić limits, Gan–Savin generic limits, Howe–Moore, Steinberg and supercuspidal isolation, the spherical classifications, Aubert duality, Kazhdan–Lusztig, extraneous points. No padding found among the six definitions (each is used by a stated headline).
- Locators verified against the cached texts: 95 line locators (BHV 16, GS23 11, CH26 33, Cas95 5, Cas80 1, HO 2, BC1 8, BC3 2, Aub95 2, Aub96 1, CCLTV 1, GI18 1, CIK71 1, BCP 1, La24 1, Ban02 1, CiF4 2, Ber92 5, Kato81 1); the PDF page of each recomputed from the page markers. All agree except the five in R01; printed-page citations for Aub95, Ban02 and Kato81 are consistent with their PDF pages.
- Checks tested with values: 46 of the 99 Check bullets (the rows above and the 0.1–0.8, 1.1, 1.4–1.7, 2.1, 2.5, 3.1, 4.1, 5.1–5.2, 5.7, 5.17, 5.28–5.29, 6.1, 7.1, 7.3, 7.6, 7.9, 7.12 bullets); none is false, vacuous or a restatement. Every definition has at least three Checks.
- Sibling citations checked: SmoothRepresentationsOfLocalGroups at #785 head: all 47 cited slugs exist (van-dantzig … cuspidal-representations), SR.3a.1's Schur sentence (SR README line 2357), SR.3.3 harish-chandra-tempered-support (line 2820), SR.3.4 nonsplit components (line 2851–2869). ReductiveGroupsPartII at #785: RG2.0, RG2.3 (hyperspecial-vertices, reductive-quotient-of-special-fibre), RG2.4 (iwasawa-decomposition, cartan-decomposition), RG2.5 (langlands-dual-group, pinned-automorphisms, galois-action-on-dual-group). NoncompactQuantumSymmetry at #1015: "Shared group C*-algebra and weak-support comparisons" (its weak containment is C*-kernel inclusion, so coefficient weak containment and the Fell topology on Ĝ are not owned there), M0 (strong-unitary convention, bounded Schur lemma, vector-valued compact-type projectors with the factor d_τ), M0a, M2.TypeIDisintegration. HilbertModules H5 (pure-state unitary dual), FactorRigidity (correspondence Fell topology), CStarAlgebras C2, EndoscopicTransferAndUnitaryTraceComparison §2.16, AutomorphicSpectralTheory §7.0b, OperatorTheory/PolarDecomposition PD-B24–B36, BanachSpaceTheory B5 (L¹/L∞ duality, line 334), OperatorAlgebraDynamics D1–D2 (full group C*-algebra, integrated forms), ReductiveGroups Layers 2 and 7, LieHighestWeight Layers 0, 2, 4 (titles match the cited slugs), CompactGroups (Peter–Weyl). LieHighestWeightPartII N0–N5 and ExcursionOperatorsAndSpectralActionPartII SC3–SC4 exist as board design packages with the cited nodes (jacobson-morozov, kostant-conjugacy, classical-partitions, highest-weight-test, positive-real-part; atomic-stable-character, atomic-fs-parameter). The seven other declared gaps are precise and declared with the same slug in plan.json and the README.
- Ownership: `roadmaps grep` over main and 367 open pull requests finds no other owner of functions of positive type, the coefficient Fell topology, the Aubert involution or the Kazhdan–Lusztig dictionary; the GL₂(𝔽_q) Steinberg representation is cited to Tau Ceti, not restated. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- Dependency check: `tauceti-roadmap … gate --depcheck … --movable` output: `depcheck: 56 roadmaps, 644 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Policy: no pull-request numbers, no process narrative, no `lemma`, no `set_option`, every target has a locator, no computational algorithm, package confined to its folder.

## Not verifiable

- The base roadmap ExcursionOperatorsAndSpectralAction (ES5 "parameter-of-an-irreducible-smooth-representation", which the PartII design lists as existing) is on neither main, nor an open pull request, nor the board; whether gap:semisimple-parameter-cuspidal-support asks PartII for a map that the base already owns could not be checked. The intake should route the gap to the owner when it announces it.
- The six `sorry` elaborations and the binder audit were not re-run (no Lean on this pass); the signatures were compared by reading. The repair report's `#check` comparison is taken as evidence only for what it states.
- Whether the "some, equivalently every unit vector" clause of 1.7 and the product statement of 1.10 hold at the stated generality depends on the declared gap:finite-product-fell-duals and on the 1.7 route; no counterexample was found.
- Ownership against open pull requests was checked only through `roadmaps grep` and the sibling checkouts named in the brief.

## Source issues

- **Error** in CH26 at Theorem 8.5(3), B₃ row, printed page 28: the source gives the F₄, B₃ extraneous real part as ω₁+ω₂+½ω₃+½ω₄, whose squared norm 19.5 puts it outside the stratum's complementary series (all its real parts have squared norm 7 + 2t² with t < 1); it should be ω₁+½ω₃+½ω₄ = (5/2, 1, ½, 0); affects a stated result.
- **Misprint** in CiF4 at §3.2, B₃ row of the maximal-parabolic table, printed page 14: the source gives the second coordinate as 3/2 + ν, which is not orthogonal to the central point; it should be 3/2 − ν, as the orthogonality in the C₃ rows shows; affects nothing.
- **Error** in GS23 at Proposition 11.6, printed page 33: the source concludes that σ is the limit of a subsequence of the πₙ; it should conclude that [σ] lies in the Fell closure of {[πₙ]} (G₂(ℚ₅), π₁ = St, πₙ = 1 refutes the printed form); affects a stated result (Corollary 11.7 survives).
- **Misprint** in GS23 at the definition of f_τ before Lemma 11.4, printed page 32: the source normalises f_τ by the volume of K only; it should carry the factor dim τ for π(f_τ) to be the τ-isotypic projector; affects nothing (only non-vanishing is used).
- **Misprint** in CH26 at §6, the parenthesis after (6.2), printed page 17: with s_ν = exp(ν log q) and (6.1) as printed, L(ν) for dominant ν is the unique irreducible subrepresentation of X(ν) (PGL₂, ν = ρ gives X(ρ) = Ind_B 1 containing the constants); the source says quotient; affects nothing.
- **Gap** in CH26 at (6.5), printed page 17: the list of types for which w₀ = −1 omits A₁ and D_{2m}; it should include them; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e4d41bc", "job": "RT-SmoothRepresentationsOfLocalGroupsPartII~1b", "model": "fable", "worker": "fable-rt207"} -->
