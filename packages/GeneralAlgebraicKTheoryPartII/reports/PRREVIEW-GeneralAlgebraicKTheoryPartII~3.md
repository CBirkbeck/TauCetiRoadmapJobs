# Review of GeneralAlgebraicKTheoryPartII (pull request #1742 at 492970e)

**Verdict:** needs changes

Three blocking findings, R01–R03, all concern supplier ownership, and all three were introduced by this head. The James construction is now planned here although HomotopySpheres §3B owns it. Two gap contracts ask RefinedTraceMethods for statements its §4.17 already makes. The spherical lifts of perfect δ-rings are credited to a section whose roadmap now imports them from RefinedTraceMethods §6.1. Five P3 findings follow. Of the previous review's findings, R02 is repaired and R01 is not (it is R04 here).

## R01 (P2) — §§4.30b–4.30c and the James block of Suggested.lean re-plan HomotopySpheres §3B

Location: `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` line 13: "The James reduced product with its word filtration, the connected James equivalence, the James–Hopf maps and the stable James splitting are owned here (§§4.30b–4.30c)." The same claim appears in §§4.30b–4.30c (lines 1206–1265), line 272, line 2473, and `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/Suggested.lean` lines 11–17 and 66–175.

Claim: this roadmap owns J(W), its word filtration and smash-power quotients, the James map and the connected James equivalence, the James–Hopf maps, and the stable splitting.

Witness: `TauCetiRoadmap/HomotopySpheres/README.md` at head b3f62ce (merge-order line 72; this roadmap is at 327), §§3B.1–3B.6, lines 966–1054: reduced words, quotients W^∧r, James map, connected equivalence, James–Hopf map, and "the stable James splitting `Σ∞ΩΣW ≃ ⋁_(r≥1) Σ∞W^∧r`".

HomotopySpheres states the stable splitting as natural and compatible with the word filtration. Two other open heads say the same. AlgebraicTopology's open revision (README line 135) states that the James constructions "stay" in HomotopySpheres. ChromaticHomotopyTheory's head (line 10) describes this roadmap as taking the stable splitting from HomotopySpheres. HomotopySpheres §3B.6 now states exactly what `gap:stable-james-splitting` asked of it. Moving ownership here therefore leaves the object with two owners.

Repair:
1. Delete §4.30b and the parts of §4.30c that restate HomotopySpheres. Restore a `From TauCetiRoadmap.HomotopySpheres` contract that consumes:
   - §3B.1–3B.2: J_rW, the identification J_rW/J_(r−1)W ≅ W^∧r, and the connectivity of the filtration;
   - §3B.4: the connected equivalence J(W) ≃ ΩΣW;
   - §3B.6: the stable splitting, including its form Σ∞(ΩΣW)₊ ≃ S ∨ ⋁_(r≥1) Σ∞W^∧r.

   No gap contract is needed for these.
2. Repoint the `*Needs:*` of §4.31 (line 1283), §4.32 (line 1320), §4.33 (line 1337) and §7.7 (line 1987). Update the Layer 4 and Layer 7 Dependencies, Scope line 13, line 272 and line 2473. §4.33's hypothesis becomes HomotopySpheres' "path-connected pointed CW complex whose basepoint is a 0-cell".
3. Decide on the E₁-ring form Σ∞_+J(W) ≃ T(Σ∞W). It is not in §3B.6, and no target here needs it: §4.33 and §7.7 use only the reduced wedge, which is the fiber of the augmentation. Either drop it, or keep it as a one-paragraph extension that cites §3B for everything else.
4. Delete the James section of `Suggested.lean` and its docstring sentence. The file then states nothing, and its docstring list already explains why.
5. Drop the `hatcher`, `james` and `lurie-ha` references along with these sections. `james` has no locator, and none of the three is recorded in the roadmap's manifest.

Tested on the instance of §4.33's Check (line 1335), W=S² and E=Hℚ. HomotopySpheres §3B.6's Check (line 1106) gives Σ∞ΩS³ ≃ ⋁_(r≥1) Σ∞S^(2r), whose rational homology is ℚ in each positive even degree. These are the same values, so §4.33 and §7.7 go through unchanged on the cited supplier.

## R02 (P2) — the two TC/p gap contracts ask for what RefinedTraceMethods §4.17 already states

Location: README line 59: "What RefinedTraceMethods must provide (gap:tc-mod-p-cyclotomic-colimits): §4.17: Prove that X↦TC(X)/p preserves all small colimits of cyclotomic spectra whose underlying spectra are connective." Line 61 is the analogous sifted-colimit contract. Both are used in the Needs of §10.2 (line 2399) and §10.4 (line 2444).

Claim: both statements are missing from RefinedTraceMethods.

Witness: `TauCetiRoadmap/RefinedTraceMethods/README.md` at head b0ad346, lines 2240–2251, §4.17 "TC modulo p and colimits": (i) TC/p on CycSp_≥0 preserves all small colimits; (ii) A↦TC(A)/p preserves sifted colimits of connective E₁-rings.

Both items come with API bullets and Checks.

Repair:
- Delete the two contract paragraphs.
- Add "§4.17 (TC modulo p and colimits), items (i)–(ii)" to the RefinedTraceMethods consumption paragraph (line 63).
- In the Needs of §10.2 and §10.4, replace `gap:tc-mod-p-ring-sifted-colimits` and `gap:tc-mod-p-cyclotomic-colimits` with that citation.
- Withdraw both slugs from the plan (R07).

Tested: the supplier's Check, S⊔S=S, gives a fold map TC(S)/p⊕TC(S)/p→TC(S)/p whose fiber TC(S)/p is nonzero. This is exactly the reason §10.2 is restricted to sifted diagrams, and the citation carries that restriction.

## R03 (P2) — spherical lifts of perfect δ-rings are credited to HabiroCohomologyFoundationsPartII §0.1, which no longer owns them

Location: README line 15: "HabiroCohomologyFoundationsPartII §0.1 owns the spherical lifts of perfect p-complete δ-rings, built by spherical Witt vectors". The same citation appears in the contract at lines 220–222, the §6.1a proof route (line 1732), the §6.1a Needs (line 1747) and the Layer 6 Dependencies (line 1856).

Witness: `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md` at head 5732822, line 9, says these lifts "are supplied by RefinedTraceMethods §6.1"; line 141 says the same. RefinedTraceMethods at its head, line 2553, "Spherical lifts of perfect δ-rings", proves Map_CAlg(S_B,R) ≃ Hom(B/p,π₀R/p).

Repair:
- Cite RefinedTraceMethods §6.1, "Spherical lifts of perfect δ-rings", in all five places, and fold the HabiroCohomologyFoundationsPartII contract into the RefinedTraceMethods paragraph.
- That universal property already is the Witt–tilt adjunction that §6.1a sets out to prove, because Hom(A,S) = Hom(A,S♭) for perfect A. So §6.1a's route should cite it and keep only the E(k)-linear base change and the cover theorem.

Tested at A=𝔽_p. RefinedTraceMethods' Check B=ℤ_p gives S_p^∧ with π₁=ℤ/2 at p=2, which is the value line 222 states. Map(S_p^∧,S_p^∧) = Hom(𝔽_p,𝔽_p) is a single point on both sides.

## R04 (P3) — gap:spectral-units-and-lines still asks EllipticCohomology E5 for GL₁R

Not repaired from the previous review (its R01).

Location: README line 192: "Supply GL₁R as the multiplicative unit components of Ω∞R and BGL₁R as the classifier of R-lines equivalent to R, for every E∞ ring R."

Witness: EllipticCohomology on main builds gl₁(R) for every commutative ring spectrum R (README line 1533), with π₀gl₁(R) = (π₀R)^× and positive homotopy that of R (line 1555). Line 208 here already consumes "E5's units".

Repair: cite E5's gl₁(R) for GL₁R = Ω∞gl₁(R), and narrow the contract to the R-line classifier, BGL₁R as the component of Pic(R) at R.

Tested at R=Hℤ: E5's Check gives π₀gl₁ = {±1} and π₁ = 0, matching §1.1's Check π₀GL₁(Hℤ) = {±1}.

## R05 (P3) — the James declarations in Suggested.lean are padding and disagree with the README

Location: `Suggested.lean` lines 127–151: `isClosed_filtration`, `filtration_zero`, `range_ι`, `continuousMul`, `continuous_map` and `map_ι`. Also line 159, `exists_jamesMap_isWeakHomotopyEquivalence`.

Claim: these are acceptance statements of this roadmap.

Witness: `filtration_zero` is the boundary case r=0; `range_ι` and `map_ι` restate `ι`, `reduce` and `map`; none of the 16 Lean names occurs in the README; line 159 assumes countably many cells, while §4.30b (line 1208) covers every connected CW complex.

The remaining declarations are basic API facts of the definition.

Repair: delete them; R01's repair removes the whole block. If a James statement survives anywhere, the README must name it and state its countable-cell scope. That is the case where the product topology is the CW topology (hatcher, Theorem A.6, p.524).

Tested: one-tactic probes (`simp`, `aesop`, `fun_prop`) closed none of these declarations, so the ground for deleting them is the boundary-case and restatement rule, not a one-line library proof.

## R06 (P3) — four layer Dependencies omit suppliers that their targets' Needs name

Location: the Dependencies of Layer 4 (line 1580), Layer 6 (line 1856), Layer 7 (line 2013) and Layer 10 (line 2469).

Witness: §4.26's StableHomotopyKTheoryPartII §§4.4–4.5 (line 1115) is absent from line 1580; §6.1a/§6.6's BordismFormalGroups and EnhancedDerivedSheaves (lines 1747, 1831) from 1856; §7.5's GeneralizedCohomology G3 item 8 and EnhancedDerivedSheaves E5 (1953) from 2013; §10.4's StableHomotopyKTheory Layers 3–7 (2444) from 2469.

Repair: add these items, add Mathlib `WittVector` to Layer 6, and after R01 add HomotopySpheres §3B to Layers 4 and 7.

Tested: a mechanical comparison of each layer's Needs supplier names against its Dependencies line returns exactly these omissions and none in Layers 0–3, 5, 8 or 9.

## R07 (P3) — the plan's gap list no longer matches the README

Location: the README's supplier contracts (lines 51–268) declare 23 slugs; `design/plan.json` declares 32.

Witness: the plan's gaps include nine slugs absent from the README (`thh-all-cyclic-assembly`, `tc-z-k1-nonzero`, `tc-z-inverse-p-vanishing`, `k1-tc-filtered-colimits`, the four `linear-motive*` slugs, `stable-james-splitting`), and place `tc-mod-p-*` at §2.10, where the README has §4.17.

The four `linear-motive*` slugs are `linear-weak-additive-motives`, `linear-motive-tensor-unit`, `linear-motive-kzero-unit` and `linear-motive-projection-formula`.

Repair: withdraw the nine slugs from the plan's gaps, and after R02 the two TC/p slugs as well, so the intake stops announcing them on the RefinedTraceMethods and HomotopySpheres jobs. Both suppliers have already built one of these: TC/p colimits (R02) and the stable splitting (R01).

Tested: after withdrawal the plan's slugs equal the README's, 21 once R02 is applied.

## R08 (P3) — §10.4's THH assembly sentence lacks its primary locator

Location: README line 2430: "For every E₁-ring R and every discrete group G, the assembly map colim…THH(R[H])→THH(R[G]) is an equivalence of cyclotomic spectra." Its only locator is "(lmmt line 1197, Proposition 4.33 and proof, p.1036.)"

Witness: lmmt line 1197, Proposition 4.33, states only the p-adic TC assembly for connective R; its proof (line 1204) quotes LRRV17. arXiv:1504.03674v3, Theorem 1.19(i), p.7, states the THH equivalence for every very well pointed ring spectrum.

Theorem 1.19(i) allows any family containing all finite and infinite cyclic subgroups.

Repair: add the Lück–Reich–Rognes–Varisco locator to §10.4 and record the source in the manifest. This roadmap now owns the THH statement rather than taking it as a contract.

Tested at G=C₂×C₂ (§10.4's Check). Theorem 1.19(i) requires all three C₂ subgroups in the family, which matches the Check's four Σ∞_+BG summands.

## Verified sound

**Gate and tooling.**
- The worker's gate passes every check on this head (build OK). The outside-folder diff against origin/main is empty.
- My run of the dependency check gives `depcheck: 239 roadmaps, 2429 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. `roadmaps resolve` finds no unresolved citation, and `overlaps.md` reports no dropped id.
- `lake env lean` on `Suggested.lean` exits 0. The only warnings are 8 sorry warnings, at lines 127, 130, 133, 137, 142, 146, 150 and 159.

**Elaborated signatures and Lean truth.**
- I ran `#check @name` on all 16 declarations in a scratch copy. Six are flagged as possibly missing `[TopologicalSpace X]`: `jamesSubmonoid`, `JamesReducedProduct`, `toFreeMonoid`, `reduce`, `mk` and `filtration`. All six are algebraic, so no needed hypothesis is lost.
- `map` ignores `_hf`, but `continuous_map` needs it. Counterexample without it: X=Y=[0,1], x₀=0, y₀=1, f=id. Then map∘mk sends 0 to the unit, while letters x>0 converge to the letter 0, which is not the unit.
- The 8 theorems are true at the pin:
  - `isClosed_filtration`: the preimage of J_r in Xⁿ is a finite union of the sets {x_i=x₀ for i∈S}, |S|≥n−r, which are closed when x₀ is closed.
  - `existsUnique_lift`: the topology is coinduced from ⊔Xⁿ, and the lift's composite with `mk` is a finite product.
  - `continuousMul`: X compact Hausdorff makes J(X) a k_ω-space, so the product topology agrees with the colimit topology.
  - The James theorem: with countably many cells, Xⁿ carries the CW topology (Hatcher A.6), so J(W) is Hatcher's J(W) (Theorem 4J.1, p.471). Changing d changes the map by a homotopy. Near w₀ the loops tend to the constant loop of length 0 by the tube lemma.
- Pinned declarations opened:
  - `TauCeti.MoorePath`, `TauCeti/Topology/PathSpace/Moore.lean` line 83 (the path is stopped after `length`, which matches the `projIcc` clamp);
  - `ContinuousMap.IsWeakHomotopyEquivalence`, `TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`;
  - `TauCeti.SymmetricSpectrum`, `TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean` line 92. It is point-set only, with no stable model structure, telescope, Bousfield localization or K-theory spectrum, so the docstring's list of unstatable spectral headlines stands.
- No James construction exists in either pinned library (grep).

**Previous findings.** R02 is repaired: lines 13, 15 and 268 now read "stated as a supplier contract", and no "request" wording or "an RefinedTraceMethods" remains. R01 is not repaired (it is R04 here).

**Sampled locators** (cached source texts, read at the cited lines):
- 0.1: bgt line 1622, Proposition 5.14, p.777; lmmt line 645, Lemma 3.7, p.1024.
- 3.3: barwick line 820, Theorem 6.1, p.19 (connective); agh line 1227, Theorem 3.18, p.27 (noetherian heart).
- 4.4: lmmt line 316, Lemma 2.3 and Remark 2.4 (unital magma), p.1017; hopkins-smith line 89 (Theorem 3), line 129 (Theorem 7) and line 166 (Theorem 11).
- 4.19: lmmt lines 1028–1031: T(n)- and K(n)-localization agree on L_n-local spectra, p.1032.
- 4.30b: hatcher §3.C p.224, Proposition 4I.2, Theorem 4J.1 p.471 (connected CW), §4.K p.475 and Theorem A.6 p.524; `james` is not verifiable (below).
- 4.33: lmmt line 919, Corollary 4.14 and its proof via the James splitting, p.1030.
- 4.36: weibel line 186, Theorem 2.3, p.473; line 215, Theorem 3.1, p.474.
- 4.42: lmmt line 586, Corollary 3.5, p.1023.
- 4.44: lmmt line 645, Lemma 3.7. Its generators are A⊗F with F finite p-local and L_n^(p,f)-acyclic, which is the same as p-primary of type >n.
- 5.4: lmmt line 116, Theorem 1.1, p.1013; Remark 3.9, lines 694–728, pp.1025–1026; cmnn24 line 827, Theorem 4.6, p.19; cmnn24 line 913, Theorem 4.10, p.21.
- 6.2: bsy line 2419, Corollary 5.2, p.55.
- 6.6: lmmt line 734, Remark 3.11, p.1026.
- 8.1: cmnn20 line 300, Definitions 2.1–2.3, pp.7–8.
- 10.2: lmmt line 1162, Corollary 4.32, pp.1035–1036.
- 10.4: lmmt line 1197, Proposition 4.33, p.1036 (see R08).

Also opened: csy line 3655 (Corollary 5.1.9) and line 3930 (Theorem 5.3.5), for §4.15 and the Scope paragraph; cmnn20 lines 622–766, Constructions 3.2 and 3.12 and Definition 3.11, for §8.1a. No locator in the README is flagged as unverified.

**Cross-roadmap citations resolved.**
- HomotopySpheres at head b3f62ce: §3B (lines 938–1120).
- RefinedTraceMethods at head b0ad346: §2.6 (line 646), §2.8 (804), §2.9 (853), §2.10 (879), §4.6 (1730), §4.9 with F_κ/Σ_κ (1853), §4.10 (1907), §4.11 (1948), §4.14 (2041), §4.15 (2120), §4.17 DGM (2228), TC/p (2240), henselian rigidity (2262), §4.18 (2311), §4.19 (2361), §6.1 (2540–2577). The head states neither the A-linear motives of §8.1a nor the THH cyclic assembly, so this roadmap may own both. A search for "weakly additive" and "Or_Cyc / family of cyclic" across all open heads finds no other owner.
- HabiroCohomologyFoundationsPartII at head 5732822: §0.1 (lines 137–150).
- StableHomotopyKTheoryPartII at head e8c1239: §4.4 (line 542), §4.5 (567), §4.8 (625). P_p(2)=2+tr(1) agrees with §4.26's Check.
- ChromaticHomotopyTheory at head b049bb3: §4.2 (line 361), which holds the sharp-bound consequence that the Scope paragraph defers there. It is a scope note, not a Needs edge, so depcheck reports nothing.
- On main: TopologicalKTheory T7.1 (lines 1236–1290, ring ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)); GeneralizedCohomology G5.4 (line 1677, a²=4b, c(a)=2u², c(b)=u⁴); EllipticCohomology E5 (lines 1533–1571, gl₁, J-homomorphism bo→bgl₁(S)).

**Declared gaps.** The README states 23 slugs, each exactly once as "What X must provide (gap:…)". Apart from R02, R04 and R07, each gap is precise and is not provided by its supplier or by the pins:
- the KH and cdh contracts against SchemeKTheoryOperations;
- the spectral étale contracts against KTheoryFiniteLocalFields;
- the elliptic contracts against EllipticCohomology on main, which covers heights 1–2 only;
- `multiplicative-postnikov` and `nilpotent-kzero`.

**Adversarial table.** One row per statement; values computed on both sides.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions: T(0)=S[1/p] vs Hℚ | p=2, H𝔽₃ | T(0)⊗H𝔽₃=H𝔽₃≠0; Hℚ⊗H𝔽₃=0 | sound |
| §0.1 Thomason–Neeman | q=id; q:D→0; A=0 | fib(KD→KD)=0; fib(KD→0)=KD; all terms 0 | sound |
| §3.3 heart | Perf(k) | K₀=ℤ on both sides, [Σk]=−1, K₋₁=0 on both sides; noetherian hypothesis kept for nonconnective | sound |
| §4.4 ring acyclicity | H𝔽_p at n=1; H𝔽_q at n=0 | T(1)H𝔽_p=K(1)H𝔽_p=0; T(0)H𝔽_q=H𝔽_q≠0=K(0)H𝔽_q | n≥1 is needed and is stated |
| §4.15 existential bound | K(ℤ/p,n) | n-connective with periodic groups 0; reduced K(n)-homology has rank p−1≥1 | m≥n+1, consistent with an existential m |
| §4.16 | ΣⁿHℤ/p→0 | n-connective L_n^(p,f)-equivalence; Σ∞Ω∞ gives Σ∞K(ℤ/p,n)→0, not a T(n)-equivalence | sound |
| §4.19 | Hℚ at n=1; L₁S at n=2; KU_(p) | T(1)Hℚ=0; T(2)L₁S=0; L_T(1)KU_(p)=L_K(1)KU_(p)=KU_p^∧ | sound |
| §4.29 Check | KU₂, trivial C₂ | ℤ₂((x))/(x−2)≅ℚ₂≠0 at i=0; rational, so T(1)-local value 0 at i=1 | sound |
| §4.30a | ko→KO at n=0 and n≥1; a-inversion at p=2 | π₋₈: ℤ[1/p] vs 0; cofiber τ≤−1KO is bounded above, hence T(n)-acyclic; ko[a⁻¹]=KO[1/2] is killed by T(1) at p=2 | sound; b in degree 8 is correct |
| §4.30b James (R01) | S⁰, S¹, S² | components: ℕ vs ℤ; π₁J(S¹)=ℤ=π₂S²; J_rS²→J(S²) is (2r+1)-connective; η maps to the generator of π₄S³=ℤ/2 | true; duplicates HomotopySpheres §3B |
| Lean `existsUnique_lift` | X={x₀,a} discrete, M=(ℕ,+) | J(X)=ℕ; a↦1 lifts uniquely to id | sound |
| Lean `continuous_map` without hf | X=Y=[0,1], x₀=0, y₀=1, f=id | discontinuous at 0 | hf is needed and present |
| Lean James theorem (R05) | W=S¹ | π₁: ℤ→π₂S²=ℤ, 1↦1 | true; countable-cell scope only |
| §4.30c/§4.33 | W=S², E=Hℚ; W=M(ℤ/2,3) | summands S^(2r); H̃₇=Tor(ℤ/2,ℤ/2)=ℤ/2 while the tensor algebra is 0 in degree 7; 𝔽₂-rank 2 | sound; identical to HomotopySpheres' Checks |
| §4.36 Witt action | 𝔽₃[ε]/ε², a=(1,0,…); a=(0,1) over ℤ | χ=1−t fixes [1−εx], and 1+εx differs by 2εx≠0; −tχ′/χ=2t²+2t⁴+⋯ with w₂=2 | sound |
| §4.42 | ℤ/4, ℤ/9 | K(𝔽₂)^∧₂=Hℤ₂ because 2^i−1 is odd; L_T(i)K=0 for i≥1; K₀=ℤ | sound |
| §4.44 | A=S, n=0; S/q | kernel generated by S/p; S/q maps to S/q≠0 | sound |
| §4.46 Theorem A | H𝔽_p, n=1 | L₁^(p,f)H𝔽_p=0 forces L_T(1)K(𝔽_p)=0, consistent with Hℤ_p | sound |
| §5.4 CMNN | n=2,3 | Mitchell gives L_T(2)K(S[1/p])=0; cmnn24 Theorem 4.10 at n=0,1 gives m≥2,3 | sound |
| §5.5 Purity | Hℤ, n=1,2 | L_{T(0)∨T(1)}Hℤ=Hℤ[1/p], matching Quillen localization; at n=2 the localization is 0, so L_T(2)K(ℤ)=0 | consistent |
| §6.1 Theorem B | H𝔽_p, Hℚ, E_n | heights −1, 0, n; K bounds 0, 1, n+1 | sound |
| §6.2 | H𝔽_q (q≠p); Hℚ | rationalization 0, so no characteristic-0 map; Hℚ→HL[u^±] | sound |
| §6.5 redshift | Hℚ; (H𝔽₂)^tC₂ at odd p | 0→1; height 0 with zero rational part and 2=0 on K, so ht K=0 | rational hypothesis needed and stated |
| §6.6 optimality | E₀(L); M=ku/p | T(1)E₀(L)=0 but K^∧ has π₀=π₁=ℤ_p; the colimit is ΣM with T(1)ΣM≠0 | sound (source prints ΩM) |
| §8.1 | Σ=∅; H(ℚ/ℤ) | F=0 admissible, so T_(ε,∅)=T; L_n^f kills H(ℚ/ℤ), which is not ε | sound |
| §8.1a | A=0; A=Hk; triangle ring | Mot_κ(0)=0; [Σk]=−1 in K′₀; K₋₁(R)=ℤ cannot embed in 0 | split exactness is needed and stated |
| §8.3 | G=1; KO→KU | identity; [KU]=[KO]+[Σ²KO]=2, so 1=[KU]/2 rationally | hypothesis met |
| §9.6 | p=2,3 | THH(ℤ[1/p])/p=0; K/p≃TC/p in degrees ≥0 for ℤ_p; ht Hℤ_p=0 gives L_T(1)K(ℤ_p)≠0; π₋₁TC(𝔽_p)=ℤ_p vs K₋₁=0 is a bounded difference | sound |
| §10.2 (R02) | S⊔S=S | fold-map fiber L_T(n)K(S)≠0 for n≥2 (ht S=∞) | sifted is needed; the input is in RefinedTraceMethods §4.17 |
| §10.4 (R08) | C₂×C₂; ℤ | 4 summands Σ∞_+BG; omitting a C₂ loses one; ℤ/ℤ is terminal | sound |
| Spherical lift (R03) | B=ℤ_p; B=0 | S_p^∧ with π₁=ℤ/2 at p=2; S₀=0 | the README's values match RefinedTraceMethods §6.1 |
| Units (R04) | Hℤ | π₀gl₁={±1}, π₁=0 | E5 agrees with §1.1 |

## Not verifiable

- `james` (I. M. James, *Reduced product spaces*, Annals of Mathematics 62, 1955), cited in §4.30b. The README gives no locator, and the text is on JSTOR behind a paywall, so it was not read. Hatcher Theorem 4J.1 covers the cited statement, and R01 removes the citation.

## Source issues

- **Misprint** in lmmt at Remark 3.11, printed page 1026: the source identifies colim_r Ω^r fib(K(S⊕Σ^rM)→K(S)) with ΩM; it should be ΣM, since relative K₁ of a split square-zero extension is HH₀ of the bimodule; affects nothing.
- **Gap** in barwick-lawson at proof of Corollary 4.2, manuscript page 7: the source localizes at the multiplicative set generated by Δ in π_*tmf, but Δ is not in π_*tmf; it should use a surviving power such as Δ²⁴; affects the proof.
