# Review of OperatorKTheory (pull request #866 at c0a811d)

**Verdict:** needs changes

Two findings block. 7.1 states the equivariant technical theorem without the G-continuity hypothesis its source needs, and the statement is false without it (R01, P2). 1.4 re-defines the finite-projective module category that Tau Ceti provides. It also leaves out the comparison with Proj(A) that AlgebraicKTheory assigns to this roadmap (R02, P2). Three P3 repairs follow. The worker's gate passes and `Suggested.lean` elaborates with two `sorry` warnings and nothing else. Of the previous review's nine findings, eight are repaired and one is partly repaired (R09).

## Status of the previous review's findings (head 321c0a4)

- **R01 (two owners of the Calkin algebra): repaired.** Line 20 now reads "Atkinson's theorem and the Hilbert-module index". Lines 32–33 add "CStarAlgebras owns the Calkin algebra `B(H)/K(H)` and its ideal structure (C1.6)". Line 749 reads "Consume CStarAlgebras C1.6's Calkin algebra". The 4.1 *Needs:* line (746–747) and the supplier bullet (line 149) cite C1.6. C1.6 is at the CStarAlgebras head (33ddcef), README lines 435–447.
- **R02 (supporting lemmas in `Suggested.lean`): repaired.** The file states only the two Brown–Douglas–Fillmore theorems and their two predicates, and README lines 230–233 say so.
- **R03 (unused import): repaired.** The only import is `import Mathlib`.
- **R04 (Lean names absent from the README; superfluous `hH`): repaired.** Lines 1792–1812 name `IsEssentiallyNormal`, `essentialSpectrum` and both theorems. `hH` is gone, and both docstrings treat the finite-dimensional case.
- **R05 (Michael selection): repaired.** 9.2 (lines 1892–1909) derives Bartle–Graves from `LowerHemicontinuous.exists_continuous_selection`, and the "From Mathlib" contract (lines 114–117) cites it.
- **R06 (close projections; partial isometries): repaired.** Lines 254–257 consume C9.2 and add "`‖u−1‖<2`, so Mathlib `Unitary.joined` gives a path from 1 to u". Lines 132–136 list `TauCeti.IsPartialIsometry`.
- **R07 ("C1 pullbacks"): repaired.** The 3.3 *Needs:* line (624–625) now says the closed pullback "is constructed here, on the model of CStarAlgebras C5.5's mapping cone". The 4.4 *Needs:* line (834) reads "CStarAlgebras C1.7 multipliers; 3.3 closed pullback".
- **R08 (locators): repaired except at three claims.** Every one of the 48 subsections now has an inline locator. Three headline claims still lack theirs: 8.3's UCT sequence, 7.4's rotation-algebra K-groups and trace range, and 9.5's KK–E isomorphism (R04 below).
- **R09 (Checks; API bullets): partly repaired.** Three Checks were added to each of 1.4, 3.4, 4.3, 5.4, 5.5, 6.3, 7.1 and 9.3. API bullets were added in 11 subsections, but 37 of the 48 subsections still state their API only in prose (R05 below).

## R01 (P2) — 7.1's equivariant technical theorem drops the G-continuity hypothesis, and is false without it

Location: `TauCetiRoadmap/OperatorKTheory/README.md` lines 1281–1282: "Equivariant technical theorem: for σ-compact G, the elements M and N of 6.1 can be chosen with `g↦g(M)` norm continuous and `g(M)−M∈J` for every g (Blackadar, Theorem 20.1.5)."

Claim: under 6.1's hypotheses alone, M can be chosen G-continuous.

Witness: let G=ℝ translate J=C₀(ℝ), so M(J)=C_b(ℝ). For x>0 put f=max(sin x²,0) and h=max(−sin x²,0), and let A₁=C*(f), A₂=C*(h), so A₁A₂=0. If Mf and (1−M)h lie in C₀(ℝ), then M(√(π/2+2πk))→0 and M(√(3π/2+2πk))→1. These points are π/(x_k+y_k)→0 apart, so M is not uniformly continuous. Blackadar1998 line 9062 assumes that A₁, A₂ and Δ consist of G-continuous elements.

Repair: replace the bullet by "Equivariant technical theorem: for σ-compact G, if A₁, A₂ and Δ consist of G-continuous elements of M(J), meaning that g↦g·x is norm continuous, then the elements M and N of 6.1 can be chosen with `g↦g(M)` norm continuous and `g(M)−M∈J` for every g, and G-invariant when G is compact (Blackadar, Theorem 20.1.5)."

Test: the repaired hypothesis excludes the witness, because f is not uniformly continuous. Every application in 7.1–7.2 meets the hypothesis, since there A₁ contains `K(E)`, which consists of G-continuous elements (Blackadar1998 line 9021), and Δ is spanned by the G-continuous F and φ(A).

## R02 (P2) — 1.4 re-defines Tau Ceti's finite-projective module category; the Proj(A) comparison that AlgebraicKTheory assigns here is missing

Location: README lines 321–322: "Define the category of finitely generated projective right modules over unital A, with right-linear morphisms and finite biproducts; it is an essentially small additive category". The essential-smallness bullet at lines 328–329 belongs to the same definition. The AlgebraicKTheory supplier bullet (line 206) cites only A1–A2, A6 and A8.

Claim: this roadmap constructs and owns the category of finitely generated projective right A-modules.

Witness: Tau Ceti defines `TauCeti.finiteProjectiveModules` (`TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:129`, essentially small at line 179). AlgebraicKTheory 0.1 (head b88e48f, README line 83) uses it over Rᵐᵒᵖ as Proj(R). Its lines 17 and 709 say that OperatorKTheory consumes Layer 0 and owns the comparison of its projection K₀ with K₀(A) of 0.3. That comparison appears nowhere here.

Repair, with AlgebraicKTheory, earlier in the merge order, keeping the object:
- Open 1.4 with "Use AlgebraicKTheory 0.1's Proj(A), Tau Ceti's `TauCeti.finiteProjectiveModules Aᵐᵒᵖ`, which is essentially small and has finite biproducts."
- Delete the essential-smallness bullet.
- Prove `pAⁿ≅qAᵐ` exactly when p∼q from AlgebraicKTheory 0.4's idempotent equivalence and Blackadar, Proposition 4.6.4 (algebraically equivalent projections are Murray–von Neumann equivalent), or keep the HilbertModules H2 route.
- Add the bullet: "`[p]↦[pAⁿ]` followed by `TauCeti.SplitK0.mapEquiv` identifies K₀(A) with AlgebraicKTheory's K₀(A) of 0.3, naturally for unital *-homomorphisms."
- Add AlgebraicKTheory A0 (0.1, 0.3, 0.4) to the supplier contract and to the 1.4 *Needs:* line, and add `TauCeti.finiteProjectiveModules` to "From Tau Ceti".

Test on the 1.4 Checks: for A=ℂ, Proj(ℂ) is the finite-dimensional spaces and both sides send `[ℂⁿ]` to n. For A=B(H), A²≅A in Proj(A), so `[A]=0` on both sides, as `K₀(B(H))=0` requires.

## R03 (P3) — The *Needs:* lines of 4.3 and 7.3 put early interfaces behind unrelated layers

Location: line 798, "*Needs:* 4.2; HilbertModules H1–H4.", and lines 1340–1342, one *Needs:* line ("7.1–7.2; K6.3 quasihomomorphisms; K3.2; …") for all of 7.3.

Claim: the dilation needs 4.2, and the tree interface needs equivariant KK.

Witness: 4.3's construction uses only H_B, adjointable operators and stabilization (HilbertModules H1–H4). It uses nothing of 4.2's corona index or graded pairs. Lines 1354–1357 say the tree interface "uses no analytic input". FreeProbability on main (lines 308 and 406–408) consumes both of these early pieces.

Repair: make 4.3's line "*Needs:* HilbertModules H1–H4." Split 7.3's line into "*Needs (tree interface):* Mathlib `SimpleGraph.mulCayley`, `SimpleGraph.IsTree`, `FreeGroup.toWord`." and "*Needs (KK comparison, Toeplitz extension and PV):* 7.1–7.2; K6.3; K3.2; OperatorAlgebraDynamics D1–D2."

## R04 (P3) — Three headline claims still have no locator at the claim

Location:
- 8.3 lines 1739–1745: the UCT sequence carries only "Proposition 23.5.1" for the resolution.
- 7.4 lines 1532–1541: `K₀(A_θ)≅K₁(A_θ)≅ℤ²`, the Powers–Rieffel projection and the trace range ℤ+θℤ.
- 9.5 lines 1973–1975: "If `KK(A,−)` is half-exact, prove this comparison is an isomorphism".

Claim: every claim carries its locator.

Witness:
- Blackadar1998 Theorem 23.1.1 (line 10153, p. 233) is cited only in References.
- Blackadar1998 10.11.6(b)–(d) and the Powers–Rieffel remark after it (lines 4024–4033, pp. 87–88) cover irrational θ.
- Blackadar1998 Theorem 25.6.3 (line 12060, p. 278) is not cited at all.

Repair: add "(Blackadar, Theorem 23.1.1)" after the displayed UCT sequence. In 7.4 add "(Blackadar, Exercise 10.11.6(b)–(d) and the Powers–Rieffel remark after it, for irrational θ; the same Pimsner–Voiculescu computation applies to every θ)". In 9.5 add "(Blackadar, Theorem 25.6.3)".

## R05 (P3) — README shape: the API of most definitions is still prose, and the title line is not in house form

Location: line 1, `# Operator K-theory, extensions, and KK-theory`; and the definition subsections 1.2, 1.3, 1.5, 2.1, 2.4, 3.1, 3.2, 4.2, 4.4, 4.5, 5.1, 5.2, 6.2, 6.4, 7.2–7.7, 8.1, 8.3, 9.1 and 9.4.

Claim: each definition lists its API as bullets, under a `# Roadmap: <lower-case title>` heading.

Witness: 37 of the 48 subsections have no bullet list before their Checks. For example, 1.2 (lines 278–284) runs V(A)'s and K₀'s six API facts into one paragraph. Ninety-two of the 142 READMEs on main open with `# Roadmap:`.

Repair:
- Retitle line 1 as `# Roadmap: operator K-theory, extensions, and KK-theory`.
- In each listed subsection, keep the defining sentence. Then move each "Prove …" fact into its own bullet, with its hypotheses and conclusion. For 1.2: independence of matrix size and reindexing; functoriality; the universal property; generation by differences; and the equality criterion with r.

## Verified sound

**Gate and direction.**
- The worker's gate (gate.md) reports every check passing at this head, including `build=0` and `depcheck=0`.
- My rerun without `--build` printed `depcheck=1` against the live merge order: `UPWARD: OperatorKTheory (#9) -> AlgebraicKTheory (#15) at README lines [204, 206, 472, 530, 624, 737]`. This is the moved case:
  - With `--movable` against the same order, the check prints `moved: AlgebraicKTheory moved in the merge order up before OperatorKTheory … depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`.
  - The brief's command against `merge-order-moved.txt` prints `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`.
  - No UPWARD or CYCLE line remains.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `overlaps.md` lists no other pull request changing this roadmap and no dropped id.

**Elaboration and signatures.**
- `lake env lean` on `TauCetiRoadmap/OperatorKTheory/Suggested.lean` gives two `declaration uses 'sorry'` warnings (lines 68 and 82) and nothing else.
- A scratch file with `#check @name` for all four declarations matches the README and `signatures.md`:
  - Both theorems carry `[CompleteSpace H] [TopologicalSpace.SeparableSpace H]`.
  - `essentialSpectrum` drops `[CompleteSpace H]`, which its body (`IsFredholm`) does not use.
  - Nothing changed.
- The same scratch file elaborated `#check` for 27 Mathlib names that the README cites, among them `Unitary.joined` (`Mathlib/Analysis/CStarAlgebra/Unitary/Connected.lean:312`, distance less than 2 in a unital C*-algebra) and `LowerHemicontinuous.exists_continuous_selection` (`Mathlib/Topology/Semicontinuity/Michael.lean:108`; paracompact normal domain; complete, first-countable, locally convex target).
- Tau Ceti names were resolved at the source:
  - `TauCeti.IsPartialIsometry` (`Algebra/Star/PartialIsometry.lean:52`, projections at lines 71 and 78).
  - `TauCeti.isFredholm_one_sub` and `add_of_isCompactOperator` (`Analysis/Fredholm/CompactPerturbation.lean:64, 87`); `index_add_of_isCompactOperator` (same file, line 137).
  - `Continuous.isLocallyConstant_index` and `Path.index_eq` (`Analysis/Fredholm/ContinuousFamily.lean:54, 81`).
  - `TauCeti.SplitK0` (`CategoryTheory/GrothendieckGroup/Split.lean:128`).
- I checked the README's convention for right Hilbert modules against Mathlib's `CStarModule` (`Module/Defs.lean:73–79`, and `Constructions.lean:79`, where ⟪x,y⟫=y x*). Mathlib's class is left-linear: ⟪x,a•y⟫=a⟪x,y⟫. Working over Aᵐᵒᵖ therefore gives ⟪x,y·a⟫=⟪x,y⟫a, as Conventions (lines 58–59) intend.

**One-tactic probe.** On scratch copies I replaced each `sorry` by `first | rfl | simp | simp_all | infer_instance | trivial | decide | tauto | aesop`, and separately by `exact?`. All four attempts fail, so neither theorem is padding. No Mathlib or Tau Ceti declaration, and no other roadmap, defines essential normality or the essential spectrum of bounded operators. OperatorTheory/UnboundedOperators treats the self-adjoint unbounded case, and only in an open revision.

**Headline theorems.** The Summary (lines 9–14) lists eleven end theorems. The two Brown–Douglas–Fillmore statements are stated. For each of the others, the docstring (lines 18–41) names the carrier that is missing at the pin: K-groups, the spatial tensor product, adjointable module operators, Kasparov cycles, crossed products and group C*-algebras, and the asymptotic algebra. The Hilbert-space form of Atkinson's theorem with a parametrix is statable, but it is a short consequence of Mathlib `isFredholm_iff_exists_isQuasiInverse` and Tau Ceti `isFredholm_one_add` (README lines 107–109 and 140–142). Stating it would be padding, so its absence is not a defect.

**Cross-roadmap citations resolved (25 supplier targets and 7 consumer roadmaps).**
- CStarAlgebras (head 33ddcef): C1.4 (line 380, quasicentral units), C1.6 (435), C1.7 (468), C5.4 (1203, countably many unitaries), C5.5 (1230, mapping cone as a closed pullback), C6–C7 (C7.2 Choi–Effros, 1488), C8.2 (1617), C8.4 (1676), and C9.2 (1737; the √2 bound is its second Check, line 1760).
- HilbertModules (head bbc2ad5): H1–H4 (126–355), H5's section-module comparison (lines 421–426, the content of "Serre–Swan"), H6 (725, bounded transform) and H7 (762).
- AlgebraicKTheory (head b88e48f): A1 (211), A2 (284), A6 (550) and A8.
- On main (eaf17b1):
  - OperatorAlgebraDynamics D1–D4 (expectation 168, weak containment 188, Takai 264) and D6 (457, O_n).
  - BanachAlgebras 1.2 (255, the left-multiplication renorming at 286) and Layer 2 (440).
  - GrothendieckEulerForms Layers 1–2 (215, 238); TopologicalKTheory T1–T7 (163–1148).
  - VonNeumannAlgebras V0 (275, Gelfand–Naimark) and V11 (the Pontryagin layer, 3149–3165).
- Consumers on main all cite existing ids: NoncommutativeGeometry (57, 605), FreeProbability (79, 308, 406), OperatorTheory (68, 83), OperatorTheory/ToeplitzOperators (27; the anchor `#k4-fredholm-indices-and-extensions` resolves), SeibergWittenTheory (23), GeneralizedCohomology (1820) and FactorRigidity (988).

**Ownership by object.** I ran `roadmaps grep` over main and the 467 open heads for "Kasparov product", Pimsner–Voiculescu, Green–Julg, Connes–Thom, Bartle–Graves, "asymptotic morphism", "bootstrap class", Busby, Toeplitz–Cuntz, Powers–Rieffel and Atkinson.
- CStarClassification consumes K9's asymptotic morphisms (line 1186).
- NoncommutativeGeometry's smooth Rieffel projection is compared with K7's generator (main line 558).
- HeisenbergImprimitivity defers to NoncommutativeGeometry N7.
- IndexTheory and ToeplitzOperators consume K4.

No second owner was found apart from R02.

**Sources read at their locators (the seeded sample).** Blackadar page numbers are the printed ones.
- 1.5: Blackadar1998 §6.3, p. 34 (line 1744; stably finite gives an ordered group, 6.3.3), and §6.9, p. 41 (line 2064; traces induce states). This matches.
- 4.1: Zois2010 Lecture 1 Theorem 1, p. 59 (line 1653), with both the parametrix form and the Calkin form. Blackadar1998 8.3.2, p. 63 (line 2934; w=[[v,1−vv*],[1−v*v,v*]] gives `[1−v*v]−[1−vv*]`). Roe2017 Exercise 7.13 (line 1269).
- 4.3: Blackadar1998 13.7.2, p. 113 (line 5019). It requires A separable and B σ-unital, and its step (b) uses `⟨x₁,φ(a₁*a₂)x₂⟩`, the order the third Check pins.
- 4.4: Blackadar1998 Definition 15.2.1, p. 122 (5376), Examples 15.3.2(a), p. 123 (5407), and Definition 15.6.1, p. 126 (5546; B stable, the standard isomorphism). Further: 15.6.3 (5564), 15.7.1 (5662; the unital clause allows a nonunital lift) and 15.8.4 (5733).
- 6.2: Blackadar1998 Definition 18.3.1, p. 170 (sign `(−1)^(∂x·∂F₂)`, which is `(−1)^(∂ξ)` for odd F₂); 18.4.1(b) (positivity); 18.4.3, p. 174 (A separable, D σ-unital, unique up to operator homotopy); 18.6.1, p. 178 (A and D₁ separable, D₂ σ-unital).
- 7.1: Blackadar1998 Definition 20.1.1, p. 205; Definitions 20.2.1–20.2.2, pp. 206–207; Theorem 20.3.1, p. 208. Theorem 20.1.5, p. 206, has the hypothesis that R01 restores.
- 7.2: Blackadar1998 Theorem 20.2.7(a), p. 207 (compact G); Theorem 20.6.2, p. 210 (descent with functoriality and the product).
- 7.3:
  - Julg2013 §§1–5: T_t in Corollary 1 (line 60), the identity `θ₁(g)=F*π₁(g)F+p₀` in Proposition 2 (line 129) and the unit class in Corollary 3 (line 150), all matching. Julg passes to the limit by strong continuity, and the README correctly asks for norm continuity of the compact differences.
  - PimsnerVoiculescu1982 (OCR): Γ_n and `g_kΓ_k=Γ_k∖{e}` (lines 50–52, p. 132), the covariance and matrix-unit map (lines 79–88, p. 133), Lemmas 1.1–1.3 (pp. 133–137), Theorem 3.1 (p. 151) and Corollary 3.2 (p. 152), all with unital A.
- 7.6: Cuntz1981 (OCR) Theorem 1.5, p. 105 (line 164); §2.1 `ℤ/(n−1)` (line 198); §2.4, p. 107 (line 229).
- 7.7: Blackadar1998 Definition 10.3.1, p. 74 (3426); Theorem 19.3.6, p. 192 (separable, trivially graded). Roe2017 Lemma 19.1 (line 3460), winding −1.
- 8.1: Blackadar1998 Definition 22.3.4, p. 228 (line 9924), N1–N4 as in the README.
- 8.2: StacksProject tags 00LO (line 7868), 00LT (7945), 00LY (8201), 00LZ (8208) and 00M3 (8393). Each matches its cited use.
- 8.3: Blackadar1998 Proposition 23.5.1, p. 236 (10253; lines and planes, then replacing B by S²B⊗K at 10268); Theorem 23.1.1, p. 233 (A∈N, B separable).
- 9.2: Messerschmidt2016 Theorem 5.1 (line 677, pdf p. 14). Its proof of Theorem 5.2 uses the sphere fibre map (lines 695–697), as the README does.
- 9.4: Blackadar1998 Definition 25.4.4, p. 269, and Proposition 25.5.1, p. 270 (quasicentral approximate unit).

Other locators I opened: Blackadar1998 4.6.1–4.6.6, 5.1.1, 5.1.2, 5.3.1, 5.4.1, 5.5.1, 5.5.3, 8.1.1, 8.1.3, 8.1.5, 8.2.2, 8.3.7, 3.1.1, 3.4.3, 9.1.1, 9.2.1, 9.3.1, 12.2.1, 12.2.3, 12.4.2, 13.6.2, 14.1.1, 16.2.1, 16.2.2, 17.1.1, 17.3.1, 17.5.5–17.5.6, 17.6.5, 17.11.1–17.11.4, 19.5.7, 19.7.1, 21.2.2, 22.2.1, 22.3.1 and 25.6.1; and Roe2017 Example 7.14, Propositions 7.11, 12.15 and 12.17, Theorem 12.16 and Theorem 14.5. All exist and support their claims. Blackadar's 16.2.2 (line 5966) matches both Lean statements.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 nearby projections | p=diag(1,0), q at angle φ<π/2; e₀₀,e₁₁ in K; shift S | ‖p−q‖=sin φ; ‖u−1‖=2sin(φ/2)≤√2 sin φ ⇔ cos(φ/2)≥1/√2; K⁺ rotation has ‖u−1‖=√2 and ‖e₀₀−e₁₁‖=1; S*S=1, SS*=1−e₀₀ | holds | none |
| 1.2 V(A), K₀ | v=(1 0); B(H); zero algebra | v*v=diag(1,0), vv*=1; [1]+[1]=[1], K₀(B(H))=0; V(0)=0 | holds | none |
| 1.3 nonunital K₀ | ℂ⁺; C₀(ℝ²); K | ℂ⁺≅ℂ×ℂ with kernel ℤ×0; V=0 but K₀=ℤ (Blackadar 5.5.3, line 1622); [e₀₀] generates | holds | none |
| 1.4 projective modules | A=ℂ; e=[[1,1],[0,0]]; B(H) | [ℂⁿ]↦n; e²=e with range ℂ×0, class 1; A²≅A gives [A]=0 | true; category duplicated | R02 |
| 1.5 trace pairing | M_n with tr/n; C(X) at x; K | rank one ↦1/n, [1_(M_k(A))]↦k·τ(1)=k; Σᵢp_ii(x)=rank p(x); K has no tracial state | holds | none |
| 2.1–2.2 K₁ | C(𝕋); C(S³); ℂ; K; C₀(ℝ) | [z]↦1, [z*]=−[z]; maps S³→S¹ lift since H¹(S³)=0, the SU(2) class generates; 2·4^(−1/2)=1; σ(1+k) countable, so a log exists and K₁(K)=0; rank-two corner gives 2[e₀₀] | holds | none |
| 2.4 LocalNormed | g=1/10; z−2 in ℂ[z]; zero algebra | \|g−1\|=0.9, \|g⁻¹−1\|=9; (z−2)⁻¹=−Σzⁿ/2ⁿ⁺¹ is not a polynomial; GL_n(0) trivial | holds | none |
| 3.1 Bott (headline) | e=1 in ℂ; H(r,s); Bott matrix M | winding +1; edges exp(2πix(s)), f_e f_p⁻¹, 1, 1; scalar part exp(2πi[s+(1−r)(1−s)+r(1−s)]p)=1; M²=(1+\|z\|²)M, p(0)=diag(0,1) | holds | none |
| 3.2 six-term (headline) | Toeplitz; cone of ℂ; B(H)→Q(H) | δ₁[z]=[1−S*S]−[1−SS*]=−1=index S; exp(2πis) has winding +1; K₁(Q)≅ℤ | holds | none |
| 3.3 pullback MV | A₂=0; Q=0; swapped legs; ℂ⇉C(S¹) | D=J; split; ∂_D(u)=(∂₁u,∂₂u) dies in K(D), so ι₁∂₁=−ι₂∂₂ (negation); P=ℂ forces ∂:ℤ→ℤ both injective and zero | one-leg hypothesis needed and present | none |
| 3.4 external product | 𝕋²; coordinate flip | K₀=ℤ⊗ℤ⊕ℤ⊗ℤ=ℤ²; qτ has degree −1, giving −q*β=(−1)^(1·1)q*β | holds | none |
| 3.5 Fréchet criterion | C¹(𝕋) with ‖f‖+‖f′‖; 2+z | \|\|\|fg\|\|\|≤‖f‖‖g‖+‖f′‖‖g‖+‖f‖‖g′‖≤ RHS with C=1; 1/(2+z)=Σ(−1)ⁿzⁿ/2ⁿ⁺¹ | holds | none |
| 4.1 Atkinson (headline) | S; δ_n↦δ_(2n); dim H<∞ | index 0−1=−1; T*T=1 with cokernel spanned by the odd δ's; Q(H)=0 and every index is 0 | holds | none |
| 4.2 graded pairs | [[0,S*],[S,0]]; swap on ℂ^(1\|1) | F²−1=diag(0,−e₀₀) compact, index −1; both kernels 0 | holds | none |
| 4.3 dilation | M₂(ℂ), φ(a)=a₁₁; φ(λ)=λ/2; c=e₁₂, a=e₂₂, b=e₁₂ | null space = zero first column, E_φ≅ℂ², V*π(a)V=a₁₁; V*y=y/2, V*V=1/2; φ(cab*)=φ(e₁₁)=1 vs φ(ab*c)=φ(e₂₂)=0 | holds | R03 |
| 4.4 complete pairs | even/odd; e_(3n), e_(3n+1); B=0 | ΣSᵢSᵢ*=1; sum 1−R, q(R)≠0, so 1 and 1−q(R) are not conjugate; U*U=Σsᵢsᵢ*=1, UU*=Σtᵢtᵢ*=1, Usᵢ=tᵢ; 0=1 in L(0) | holds | none |
| 4.5 Ext (headline) | Toeplitz; (M_n,K); C(X) | a lift of z is a unitary of index 0, against −1; KK¹(M_n,ℂ)=K¹(ℂ)=0 against U=ℤ/n; Choi–Effros lift exists | holds | none |
| 5.1 Clifford | e₁, e₂; s e₂+t e₁ | e₂²=1, e₁e₂=diag(−i,i)=−e₂e₁; block t−is=−i(s+it) has winding +1, s−it has −1; pq+(p+q)r=qr+p(q+r)=pq+pr+qr | holds | none |
| 5.2 cycles | (A,id,0); diag(a,a,…); swap W | (0²−1)a=−a compact; diag not compact; W odd and graded-commuting, {W,F⊕−F}=0, F_t²−1=cos²(πt/2)(F²−1)⊕(F²−1) | holds | none |
| 5.4–5.5 degrees, unbounded | x=−cot πt; eigenvalue λ | (x−i)/(x+i)=e^(2πit); F²−1=−1/(1+λ²) | holds | none |
| 6.2 product (headline) | 1_D; f,g; two odd classes | x⊗1_D=x; [f]⊗[g]=[g∘f]; adapter (−1)^(1·1)=−1; 18.3.1 sign checked | holds | none |
| 6.3 quasihomomorphisms | λ1 vs λ(1−e₀₀); (ℓ²(ℕ),id,0) | difference e₀₀; s₀(1)−s₁(1)=j(e₀₀)↦1, swap gives −1; product rank 1, rank-two corner 2 | holds | none |
| 6.6 index pairing | [P,u]; Pu*P; (1−P)u(1−P) | [P,u]δ₋₁=δ₀, zero elsewhere; indices −1 and +1; (1−P)u(1−P) has kernel δ₋₁ and is onto: +1 | holds | none |
| 7.1 equivariant KK | trivial G; compact G on ℂ; C(𝕋) rotation | KK_G=KK; [V]∈R(G); g(ξb)=β_g(ξ)β_g(b), ⟨gξ,gη⟩=β_g(ξ*η), not B-linear | holds | none |
| 7.1 equivariant technical theorem | G=ℝ on C₀(ℝ); f, h interleaved | A₁A₂=0; M→0 at x_k, M→1 at y_k, y_k−x_k=0.0625 at k=100, tending to 0 | false as stated | R01 |
| 7.2 Green–Julg (headline) | trivial G; ℤ/2 on ℂ; V_g on L²(G,B) | p_G=1; p_G=(u₀+u₁)/2, p_G²=p_G; R(ℤ/2)=ℤ²=K₀(ℂ²); V_g(ξb)=V_gξ·β_g(b), ⟨V_gξ,V_gη⟩=β_g⟨ξ,η⟩, V_g commutes with λ_s and ρ(b) | holds | none |
| 7.3 free groups (headline) | Γ_n; tree defect; n=0,1; PV matrix units | g_iΓ_n=Γ_n, g_nΓ_n=Γ_n∖{1}; defect supported on [g⁻¹,1] with range in the edges of [1,g]; (ℤ,0), (ℤ,ℤ); E(g′,g)μ(α(g)a)·E(g,g″)μ(α(g″)b)=E(g′,g″)μ(α(g″)(ab)); δ₁[u_n]=−[1] | holds | R03 |
| 7.4 PV and A_θ (headline) | UaU*=α(a); θ=1/2; θ=p/q | (1−α⁻¹_*)(−α_*)=1−α_*; uvu*=e^(2πiθ)v; ℤ+½ℤ=½ℤ; ℤ+(p/q)ℤ=(1/q)ℤ | holds | R04 |
| 7.5 twisted centre | cocycle at (x,−x,x); rotation cocycle; d=0 | c(x,−x)=c(−x,x); ρ=e^(2πiθ(nm′−n′m)), C_ρ=0, qℤ² or ℤ²; Q(W_y)=∫s(y)ds W_y | holds | none |
| 7.6 Cuntz (headline) | n=1,2,3 | vacuum class (1−n)[1]; ℤ/0=ℤ=K₀(C(𝕋)), K₀(O₂)=0, K₀(O₃)=ℤ/2 | holds | none |
| 7.7 Connes–Thom (headline) | x(t)=(1−t)p+tα(p); u(x)=(x+i)/(x−i) | x(1)=α(x(0)); arg u=2arg(x+i) runs from 2π to 0, winding −1 | holds | none |
| 8.1 bootstrap | 0; Sℂ; O_n; B(H), Cr*(F₂) | 0→ℂ→ℂ→0; Cℂ contractible; E_n∼ℂ and K∼ℂ, O_n by N3; neither excluded algebra is separable nuclear | holds | none |
| 8.2 Ext/Tor | ℤ/m; ℤ/2 and ℤ/2 | Ext¹(ℤ/m,ℤ)=coker(×m)=ℤ/m; Tor₁(ℤ/2,ℤ/2)=ℤ/2 | holds | none |
| 8.3 UCT (headline) | A=ℂ; (O_n,ℂ); degree pairs | Ext terms vanish; KK₀=Hom(ℤ/(n−1),ℤ)⊕Ext(0,ℤ)=0, KK₁=Ext(ℤ/(n−1),ℤ)=ℤ/(n−1); degree 1 pairs (K₀,K₀) and (K₁,K₁) | holds | R04 |
| 8.4 BDF (Lean) | S; S⊕S*; dim H<∞; nonseparable H | S*S−SS*=e₀₀, index −1 inside 𝕋; −1+1=0; σ_e=∅ and both sides true; P with separable range vs Q with nonseparable range: σ_e={0,1}, indices 0, yet Q−UPU* is never compact | true; separability needed and present | none |
| 8.5 Künneth (headline) | O₃⊗O₃; A_θ⊗A_θ′ | K₀=ℤ/2⊗ℤ/2=ℤ/2, K₁=Tor=ℤ/2; ℤ⁴⊕ℤ⁴=ℤ⁸ | holds | none |
| 9.1 asymptotic morphisms | (1+1/t)φ; φ_t=2a | defect −(1/t)(1+1/t)φ(ab)→0; 2−4=−2 | holds | none |
| 9.2 Bartle–Graves | ℓ^∞→ℓ^∞/c₀; r=0; fibre segment | no linear section; s(0)=0; ‖(1−s)x₀+sx₁‖≤(1−s)R+sC<R, so the capped fibre map is lower hemicontinuous | holds | none |
| 9.3 composition | ℂ→ℂ | x_t²−x_t→0 forces x_t into {0,1}; [[ℂ,ℂ]]={0,id} | holds | none |
| 9.4–9.5 E-theory (headline) | E(ℂ,ℂ); reversal; (O_n,ℂ) | ℤ with identity 1; exp(2πit)↦exp(−2πit), giving −1; E₀=KK₀=0, E₁=KK₁=ℤ/(n−1) | holds | R04 |
| Conventions: right modules | A over itself in Mathlib | ⟪x,y⟫=yx*, ⟪x,a•y⟫=a⟪x,y⟫; over Aᵐᵒᵖ, ⟪x,y·a⟫=⟪x,y⟫a | consistent with the pin | none |

## Not verifiable

- I did not read ManuilovThomsen2005, Phillips2006 or Schochet1984 this round. They are outside the seeded sample, the README flags none of them as unverified, and the previous review read the first two at their locators. The mathematics of 6.5 and 7.5 was checked directly (table rows 4.5, 7.5).
- Slawny1972 is recorded as uncertified (paywalled), and the README cites it only through Phillips 2006, Theorem 1.9.
- I checked ownership against open pull requests through the heads the brief provides and the `roadmaps grep` index of all 467 open heads.

## Source issues

- **Misprint** in Blackadar1998 at the remark after Definition 15.2.1, printed p. 122: the source says the Busby invariant is injective exactly when B is essential in A; it should say essential in the extension algebra E; affects nothing.
- **Misprint** in Blackadar1998 at §20.6, before Definition 20.6.1, printed p. 210: the formula for the right action of C_c(G,B) on C_c(G,E) integrates over s but writes dt; it should be ds; affects nothing.
- **Misprint** in Zois2010 at Analytic K-theory Lecture 1, Theorem 1, proof of a⇒b, p. 59: the source says the inverse S maps Im T to (Im T)⊥; it should map Im T to (Ker T)⊥; affects nothing.
- **Error** in Blackadar1998 at the remark after Theorem 21.2.2, printed p. 220: the source says the surjectivity of both maps of the pullback square may be dropped; it should say one surjective map suffices, since two unital inclusions ℂ→C(S¹) break exactness at K₁(C(S¹)); affects nothing.
