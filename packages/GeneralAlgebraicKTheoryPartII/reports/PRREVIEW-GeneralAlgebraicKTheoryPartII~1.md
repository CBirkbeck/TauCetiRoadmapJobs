# Review of GeneralAlgebraicKTheoryPartII (pull request #1742 at 04493c3)

**Verdict:** accepted

No P1 or P2 finding. The gate passes on this head (every check 0, build OK), the dependency check reports no UPWARD or CYCLE line, all fifteen sampled locators hold at their cited lines, every cross-roadmap citation resolves on main or at the cited open head, and `Suggested.lean` correctly states nothing (no headline theorem is statable at the pins). Two P3 notes follow; they are the author's to take or leave.

## R01 (P3) — gap:spectral-units-and-lines asks in part for what EllipticCohomology E5 already builds

Location: `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` line 214, "Supply GL₁R as the multiplicative unit components of Ω∞R and BGL₁R as the classifier of R-lines equivalent to R, for every E∞ ring R."

Claim: the whole sentence is missing from the supplier.

Witness: EllipticCohomology README (main) lines 1533–1536 and the API bullet at 1555–1556 already build the units spectrum gl₁(R) of every commutative ring spectrum R, with its Σ^∞_+Ω^∞ adjunction and bgl₁(R)=Σgl₁(R), and record π₀gl₁(R)=(π₀R)^× with positive homotopy that of R. So GL₁R=Ω^∞gl₁(R) is supplied; only the identification of BGL₁R with the classifier of R-lines (the component of Pic(R) at R), and the two Thom contracts that build on it, are new.

Repair: in the EllipticCohomology contract paragraph, cite E5's gl₁(R)/bgl₁(R) for GL₁R and keep the contract for the R-line classifier alone, so the `needs` clause names exactly the missing piece (the same slug stays in `plan.json`). The two other Thom gaps (relative-thom-colimit, multiplicative-thom-refinement) are genuinely absent from E5, which only forms Thom spectra of maps into bgl₁(S) over the sphere.

## R02 (P3) — process wording in a proof route and the scope section

Location: `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` line 2013, "record the needed weakly additive motive interface as an RefinedTraceMethods §§4.6 and 4.10 supplier request"; also lines 13 and 15 ("is requested there", "is requested explicitly") and line 282 ("are requested as a precise extension").

Claim: "supplier request" is process narrative (a request is an action of the board, not a mathematical fact), and "an RefinedTraceMethods" is a slip.

Witness: the gap convention already states each contract timelessly as "What RefinedTraceMethods must provide (gap:linear-weak-additive-motives)" at lines 148–154; the proof route can simply cite those contracts.

Repair: replace the clause by "using the motive interface of the RefinedTraceMethods contracts gap:linear-weak-additive-motives and gap:linear-motive-tensor-unit", and in the scope paragraphs write "is stated as a supplier contract below" in place of "is requested".

## Verified sound

**Gate and tooling.** The worker's gate at 04493c3: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 imports=0 lean-lines=0 readme-ids-missing=0 empty-sections=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 outside-folder=0 build=0 OK. My own run of the direction check:

```
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The outside-folder diff against origin/main is empty. `lake env lean` on `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/Suggested.lean` exits 0 with no output (the file declares nothing, so there is no `#check` comparison to make and no one-tactic probe to run; I record both as not applicable). The manifest pins are Mathlib f6090c70 and the matching Tau Ceti; the shared packages directory is at that pin.

**Declared gaps.** The 32 slugs in the README (`grep -o 'gap:[a-z0-9-]*' | sort -u`) equal the 32 slugs the brief lists from `plan.json`; each appears in the README exactly once as "What <Supplier> must provide (gap:<slug>)" (32 such lines). Minimality checked against the suppliers: RefinedTraceMethods at its open head states neither TC/p colimit preservation, sifted-colimit preservation, the all-cyclic THH assembly, L_K(1)TC(ℤ)≠0 nor TC(ℤ[1/p])^∧p=0 as targets (its §4.17 proof route only uses CMM Theorem 2.7 and Corollary 2.15 by citation); SchemeKTheoryOperations at #1229 has no KH, Karoubi–Villamayor, cdh or abstract-blowup target (grep for "KH(", "Karoubi", "cdh", "abstract blowup" finds none); KTheoryLowDegrees at #1248 §1.2 "Ring K₀ and stable equality" does not prove nilpotent K₀ invariance; HomotopySpheres at #1287 §3B builds the James filtration, the smash-power quotients and the connected equivalence but no stable splitting (the only mention is a Check at line 883); KTheoryFiniteLocalFields at #1281 §1.6 and §6.5a give finite-field and separably-closed coefficients, not a ring-spectrum identification K(L)^∧p≃ku^∧p; EllipticCohomology E2/E3/E6 on main are at heights one and two with the level-three and affineness statements absent. The one partial overlap is R01.

**Sampled locators (all fifteen hold).**
- §1.4: lmmt line 916–920 defines A(X)=K(S[ΩX]) and states Corollary 4.14; cdh line 4319–4336 gives the finitely dominated retractive-space model and its Spanier–Whitehead stabilisation.
- §2.1: lt line 1173 Definition 3.1 (truncating, nilinvariant, excisive); lmmt line 549–554 defines "truncating on M-acyclic ring spectra" and notes τ≤kR stays M-acyclic.
- §3.3: barwick line 820 Theorem 6.1 (connective heart theorem); agh line 1227 Theorem 3.18 (nonconnective, noetherian heart).
- §3.6: lmmt line 765 Proposition 3.12, with the kernel generated by the cofibre-relation objects (5) and PP Theorem 4.26 for the restricted t-structure.
- §4.3: lmmt line 267 Lemma 2.2 (i)–(viii), with T(0)=S[1/p] fixed at line 263.
- §4.17: ravenel line 401 Theorem 2.1(e) ⟨k(n)⟩=⟨K(n)⟩∨⟨H/(p)⟩ and (f) ⟨BP⟨n⟩⟩=⟨E(n)⟩∨⟨H/(p)⟩.
- §4.20: mah81 line 46 Theorem 1.1 and line 633 Theorem 6.3; mil81 line 272 Theorem 4.11 and line 282 Corollary 4.12 (π_*(φ⁻¹V)=𝔽_p[φ^{±1}]⊗Λ); bhls line 98 Theorem A.
- §5.3: lmmt line 694–728 Remark 3.9: the transfer factorisation (4), the Tate Verdier quotient linear over R^tC_p, Kuhn blueshift, Corollary 4.30 and HN Theorem 1.4.1.
- §6.1a: bsy line 809 Theorem 2.38 (colocalization, tilt via (π₀/𝔪)♭, π_*E(A)≅W(A)[[u₁…u_{n−1}]][u^{±1}]), line 2026 Definition 4.29, line 2141 Corollary 4.37, line 2177 Theorem 4.40, line 2246 Corollary 4.44, line 2416 Theorem 5.1, line 2443 Theorem 5.3 (height zero), lines 2511/2593/2633 Propositions 5.9/5.15/5.17; the nilpotence-detection definition at line 88–92.
- §7.2: lmmt line 849–857, the n-nice definition (Hℚ⊕T(1)⊕⋯⊕T(n), π₀≅ℤ) and Corollary 4.7.
- §7.4: lmmt line 876 Corollary 4.9 and Remark 4.10, including the p-inverted splitting K(𝔽_p)[1/p]⊕ΣK(𝔽_p)[1/p].
- §7.6: lmmt line 903 Corollary 4.12 and Remark 4.13.
- §8.1: cmnn20 line 300 Definitions 2.1–2.3 (T_F, T_{ε,Σ}, T_ε, ε-objects) and lines 489–501 Definitions 2.15–2.16 (towers).
- §8.8: lmmt line 1006–1010 Corollary 4.21(iv) and the proof at 1037–1044 (GL₂(𝔽₃) at p=2 via TMF(3), G₂₄ over 𝔽₃ at p=3); goerss line 688 Theorem 3.6.
- §10.1: lmmt line 765 Proposition 3.12 and line 1155 Corollary 4.31 (A⊂C additive, thickly generating).

Further locators opened while checking neighbouring targets, all consistent: lmmt Lemma 2.3/Remark 2.4 (§4.4), Lemma 2.6 (§4.6), Lemmas 2.7–2.8 (§4.8), consequences (i)–(ii) (§4.7, §4.9), Proposition 2.9/Remark 2.10 (§4.12), Proposition 2.11/Remark 2.12 (§4.15, m=n+1 via CSY Theorem E = csy line 4036 Theorem 5.4.4), Proposition 3.1 (§4.38, N=m−1), Lemma 3.2 (§4.39), Lemma 3.3 (§4.40), Proposition 3.4 (§4.41), Corollary 3.5 (§4.42), Proposition 3.6 (§4.43), Lemma 3.7 (§4.44), Theorem 3.8 (§4.46), Corollaries 4.2–4.5 and Remark 4.6 (§5.1, §6.1, §5.6), Example 4.8 (§7.3, §4.35), Corollary 4.11 (§7.5), Corollary 4.14 (§7.7), Lemma 4.15 and Corollaries 4.16/4.18 (§4.32, §7.8), Corollary 4.19 (§8.6), Corollary 4.21(i)–(iii) (§8.7), Corollaries 4.23–4.25 and Remarks 4.26–4.29 (§§9.1–9.7), Corollary 4.30 (§5.2), Corollary 4.32 (§10.2), Proposition 4.33 and Corollary 4.34 (§§10.4–10.5); lt line 689 Lemma 2.4 (§2.3), line 1197 Theorem 3.3 and line 1204 Corollary 3.5 (§2.2); agh line 1502–1510 (right regular noetherian) and line 1515 Proposition 4.4 and Example 4.6 (§3.4); cm-tate line 70 Definition 2.2, line 118 Theorem 2.6 and Corollary 2.7 (§§4.22–4.24); kuhn-guide line 113 Theorem 1.1 with properties (1)–(2) characterising Φ_n (§4.11); kuhn-tate line 151 Theorem 1.5 (§4.24); hahn line 19 Theorem 1.1, line 22 Definition 1.2, line 432 Corollary 4.6.1 and line 442 Proposition 4.7 (§§4.27, 4.29); cmnn24 line 101 Theorem C and line 827 Theorem 4.6/Lemma 4.7 (§4.25, §4.29); cmnn20 line 798 Theorems 4.2–4.4, line 975 Theorem 5.6, line 1651 Theorem B.2 and Corollaries B.3–B.4 (§§8.2–8.5); yuan line 58 Theorem A (perfect field k), line 96 Theorem C, line 310 Theorem 4.3 and line 326 Lemma 4.5 (§6.3 and the two spectral gaps); bsy line 3901 Proposition 9.12 and line 3929 Remark 9.13 (§6.4, §6.5), line 98 Theorem D (§6.2); weibel line 38 (series convention), line 186 Theorem 2.3, line 236 Corollary 3.3(c),(d), line 469 Corollary 5.4 (§§4.36–4.37); mitchell line 52–59 Theorems A–B (§4.45); may-nilpotence line 47 Theorem B and line 107 Theorem 2.1 (§4.27, §4.34); akq line 632 Proposition 2.22 (§4.32); thom line 400 Definition 3.1 and line 847 Theorem 5.7 (§4.31); pp line 1595–1598 Definitions 4.19–4.20, line 1642 Lemma 4.25, line 1651 Theorem 4.26 (§3.5); bgt line 3363 Theorem 9.53 (§2.4); hs line 3711 Corollary 8.1.3 (§3.2); barwick-lawson line 207 Proposition 3.1, line 220 Corollary 3.2, line 253 Proposition 4.1, line 299 Corollary 4.2 (§8.9).

**Cross-roadmap citations resolved (file and line at the cited head or on main).** RefinedTraceMethods at #1493: §§2.1–2.5 (README lines 484–607), §2.9 (853), §2.10 (879), §§2.11–2.12 (919, 999), §4.6 (1730), §4.9 with its three bold sub-targets "Connective K-theory of small stable ∞-categories", "Nonconnective K-theory by the suspension construction", "Localizing and truncating invariants" (1825–1906), §4.10 (1907), §4.11 (1948), §4.14 "Square-zero extensions and linearization" (2041), §4.15 containing "Stable K-theory is THH (Dundas–McCarthy)" with derivative ΣTHH(A,M) (2120–2130), §4.17 containing "The Dundas–Goodwillie–McCarthy theorem" (2226–2238), §4.18 containing "Truncating invariants: nil-invariance and excision" with the Land–Tamme ⊙-ring (2289–2337), §4.19 containing "The TC assembly map for C_p" with cofibre Σ(THH(R;ℤ_p)_{hT_p})⊗C_p pointed at 1 (2339–2357). StableHomotopyKTheoryPartII at #1733: §4.4 (529), §4.5 (554). HomotopySpheres at #1287: §3B (817–900), §4B (1341), §4C (1482). QWittVectors at #1351: §1.3 (179), §1.4 (203), §1.4a with γ_∞((a_d))=∏(1−a_dt^d)^{−1}, its coefficient, restriction, Verschiebung and Teichmüller laws (229–258). KTheoryFiniteLocalFields at #1281: §0.4 with `heightOneLocalize` (localization at KU∧M(ℤ/p), p odd) and `heightOneFromZeroSpace` (174–178), §§1.1–1.6 (212–285), §6.5a (1361). KTheoryLowDegrees at #1248: §§1.1–1.3 (164–212), §13.1 (1559). SchemeKTheoryOperations at #1229: §§1.1, 2.7, 3.1, 3.5, 4.1–4.3, 4.12, 5.2–5.9 (106–2019). GeneralAlgebraicKTheory at #1212: §§3.12–3.14 (616–646), 6.9 (1295), 6.19 (1409), 7.1–7.7 (1436–1539), 9.8–9.17 (1939–2072), 10.1–10.13 (2098–2343), 11.15–11.16 (2635–2645), 13.6 (2950), 13.8a–13.8c (2994–3028). StableHomotopyKTheory at #1227: Layers 3–7 (970–2339), §§3.18–3.21 (1210–1247), 5.18–5.19 (2219–2233), 6.1–6.3 (2257–2315), 7.1 (2341), 7.27 (2695). AInfCohomology at #1044: §AI.7.2 (3816). MotivicEtaleKTheory at #1470: §7.2 (673). On main: EllipticCohomology E1–E6 (182–1942), EnhancedDerivedSheaves E0.4 (211), E0.7 (360), E3.1 (1121), E5:abstract.1–4 (1440–1512), E5:presentability.1–3 (1597–1698), E5:descent (1791), BordismFormalGroups F1–F3 (46–284) and F6.1–F6.5 (555–1526), GeneralizedCohomology G2–G5 (211–1373, with G3.8 cited at 1660), TopologicalKTheory T4 (816) and T7 (1148), AlgebraicTopology Stages 4 and 8 (246, 103), ModularCurves §7E (1510). Merge order: every named supplier precedes this roadmap (position 312); ChromaticHomotopyTheory sits at 313 and its README at #1643 consumes §§4.2–4.29, §6.2 and §5.5 from here (lines 9–10, 139–157, 367, 401), consistent with the Downstream consumers section. No other open roadmap builds the Bousfield–Kuhn functor, telescopic Tate vanishing, Hahn's theorem, the chromatic Nullstellensatz maps, the James stable splitting or purity/redshift (`roadmaps grep` for each). Ownership against open pull requests was checked through the sibling checkouts the brief lists and `roadmaps grep`.

**Pinned declarations opened.** Mathlib: `SSet.Quasicategory` (`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean` line 41), `CategoryTheory.Idempotents.Karoubi` (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean` line 43), `CategoryTheory.Triangulated.TStructure` (line 54) and `TStructure.bounded := t.plus ⊓ t.minus` (line 262) in `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean`; `WittVector` in `Mathlib/RingTheory/WittVector/Basic.lean`. Tau Ceti: `TauCeti.ExactStructure` (`TauCeti/CategoryTheory/Exact/ExactStructure.lean` line 241, on a preadditive category with a zero object), `TauCeti.finiteProjectiveModulesExactStructure` and `_eq_split` (`TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean`), `TauCeti.SplitK0` (`Split.lean` line 113), `TauCeti.AbelianK0` (`Abelian.lean` line 79), `TauCeti.TriangulatedK0` (`Triangulated.lean` line 139), `TauCeti.SplitK0.finrankEquiv` (`FiniteDimensionalVectorSpace.lean`). None of these supplies a stable ∞-category, a spectrum or a K-spectrum, so the module docstring's claim that no headline is statable at the pins is right; I found no statable headline the file omits (negative K, NK, telescopes, TC, Lubin–Tate theories and E∞ rings have no pinned carrier, and the one ordinary-ring statement, nilpotent K₀ invariance, is the imported gap:nilpotent-kzero, not a headline here).

**Adversarial table.** One row per statement checked; values computed on both sides.

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions: T(0)=S[1/p] vs Hℚ | p=2, X=H𝔽₃ | T(0)⊗H𝔽₃=H𝔽₃[1/2]=H𝔽₃≠0; Hℚ⊗H𝔽₃=0 | agree; sound |
| Conventions: [Σk]=−[k] | Perf(k), k→0→Σk | 0=[k]+[Σk] | sound |
| GAK finite fields K_{2r−1}(𝔽_q)=ℤ/(q^r−1) | q=2,r=1; q=3,r=1 | ℤ/1=0; ℤ/2 | matches README |
| KTFLF Check: 𝔽₄/𝔽₂ at p=3 | K(𝔽_{2^a})^∧₂ | odd groups of order 2^{ar}−1 odd, so ^∧₂=Hℤ₂; H²(C₂,ℤ₂)=ℤ/2; H²(C₂,ℚ)=0 | sound |
| §1.1 GL₁ of a square-zero ring | A=Hk⊕ΣHk | π₁GL₁(A)=π₁A=k; π₀=k^× | sound |
| §1.2/§3.2 additive vs stable K₀ of Perf(k) | ⊕ vs cofibre relations | ⊕_{j∈ℤ}ℤ vs ℤ; e_j↦(−1)^j kills e₀+e₁ | sound (§3.6 Check agrees) |
| §2.3 (LT 2.4) | A=B | fibre 0, (n+1)-connective for all n | sound |
| §2.4 (BGT 9.53) | R=Hk⊕ΣHk, j=0,−1 | K₀=ℤ both sides; K₋₁=0 | sound |
| §3.4 regular devissage | R=Hk[u], |u|=2 | cofib(Σ²R→R)=Hk; π₀R=k regular; AGH Example 4.6(1) | sound |
| §4.1/§4.5 L_n^f-local implies p-local | S/q, q≠p | S/q is Hℚ∨T(n)-acyclic, so [S/q,X]=0 for local X | sound |
| §4.9 bottom comparison | X=H𝔽₃, p=2 | L_{T(1)}H𝔽₃=0; pullback = H𝔽₃[1/2]=H𝔽₃ | sound |
| §4.12 Σ^∞Ω^∞ fails to preserve | X=Hℤ | Σ^∞(ℤ discrete)=⋁_{ℤ∖0}S≠0 while T(n)⊗Hℤ=0 | sound |
| §4.15 bound | n=1 | m=n+1=2 (lmmt Remark 2.12) | sound |
| §4.17 Ravenel classes | n=0,1, p=2 | BP[1/2] rational; BP⟨1⟩⊗H𝔽₂≠0, E(1)⊗H𝔽₂=0 | sound |
| §4.21 rational degree −2 | p=2, |v₁|=2 | π₋₂E(1)⊗ℚ=ℚ·v₁⁻¹; π₋₂BP⟨1⟩=0 | sound |
| §4.26 transfer quotient rank | p=2, height h+1 | E⁰(BC₂)/(tr) free of rank 2^{h+1}−1 with basis element 1; c(2)=2·1≠0 | sound |
| §4.26 [2](z) mod (2,u₁) | h=2 | [2](z)≡z⁴g₂(z), g₂(0)=u₂ | sound |
| §4.28 heights | 0, H𝔽_p, Hℚ, H𝔽_q (q≠p) | −1,−1,0,0: T(0)H𝔽_q=H𝔽_q≠0, T(1)H𝔽_q=v₁⁻¹(H𝔽_q/p^k)=0 | sound |
| §4.29 Tate of KU₂ | p=2, trivial C₂ | ℤ₂[[x]][x⁻¹]/(x(2−x))=ℤ₂[1/2]=ℚ₂; rational, so L_{T(1)}=0, L_{T(j)}KU₂=0 for j≥2 | sound |
| §4.31 cover index | S³⟨4⟩=fib(S³→K(ℤ,3)) | π₂=π₃=0, π₄=ℤ/2; target K(ℤ₂,3) gives π₂=ℤ₂/ℤ | sound |
| §4.31 p=3 sign twist | Ω²(S³⟨4⟩)→BO_(3) | null since π₁BO_(3)=0; Thom=Σ^∞_+Ω²S³⟨4⟩_(3) retracts to S_(3), π₃=ℤ/3≠π₃Hℤ_(3)=0 | sound |
| §4.32 slopes | p=3,m=2,i=1; p=5 | 1/16 vs 1/4; 1/48 vs 1/8; difference positive | sound |
| §4.34 unit detection | H𝔽₂ at q=2 | K(n)⊗H𝔽₂=0 all finite n, H𝔽₂⊗H𝔽₂ has π₀=𝔽₂ | sound |
| §4.36 ghost identity | a=τ(c); a=(0,1) over ℤ | −tχ′/χ=∑c^nt^n; 2t²+2t⁴+⋯ with w₁=0,w₂=2 | sound |
| §4.36 Witt action | 𝔽₃[ε]/ε², a=(1,0,…) | χ(a)(εx)=1−εx; 1+εx differs by 2εx≠0 | sound |
| §4.37 relative K₁ | ℤ/9→𝔽₃ | ker((ℤ/9)^×→𝔽₃^×)={1,4,7}, order 3 | sound |
| §5.4 assembly cofibre count | p=2,3 | (C_p,1): 1 and 2 summands | sound (RTM §4.19 agrees) |
| §5.6 T(0) variant | ℤ/p²→𝔽_p | relative K is p-primary (Weibel 5.4), so K(f)[1/p] equivalence; lmmt Remark 4.6 | sound |
| §6.4 height-zero bound | L alg. closed char 0 | π₀(ku^∧p⊕Σku^∧p)=ℤ_p, π₁=ℤ_p | sound |
| §6.5 negative-height example | R=(H𝔽₂)^{tC₂}, p odd | 1-periodic ⇒ Σ≃id on Perf(R) ⇒ 2=0 on K(R); R[1/p]=R≠0, R⊗Hℚ=0; ht_p R=0, ht_p K(R)=−1 | excluded by the rational-part hypothesis; sound |
| §6.5 same at p=2 | lmmt footnote 1 | ht₂R=−1, ht₂K(R)=−1≠0 | consistent with "no equality at ht=−1" |
| §6.6 stabilised relative K | A=ℤ, M=ℤ | K₁(ℤ[ε])=ℤ/2⊕(1+εℤ), relative ℤ=HH₀; so colim Ω^r fib = ΣTHH(S;M)=ΣM | README right; lmmt prints ΩM (source issue) |
| §6.1a unit non-compact | KU_p^∧ in Sp_{K(1)} | L_{K(1)}colim(p)=L_{K(1)}KU_p[1/p]=0 while colim π₀Map(R,R)=ℚ_p | sound |
| §7.3 no ring map ℤ/p^r→ℤ | r≥1 | p^r·1=0 vs p^r | sound |
| §7.4 exceptional heights | m=1 | {0,1,2}; p-inverted π₀,π₁ ranks (1,1) | sound; for m≥2 the i=1 case also vanishes (not claimed, not false) |
| §8.8 group orders | p=2; p=3 | (9−1)(9−3)=48; 12·2=24 | sound |
| §8.9 Tmf as a pullback | c₄, Δ²⁴ opens | Tmf=c₄⁻¹Tmf×_{(c₄Δ)⁻¹Tmf}Δ⁻¹Tmf (BL line 313–316); Δ∉π_*tmf, Δ²⁴ survives | sound |
| §9.3 smooth vs flat line | A=S, d=2 | Sym²_S(S)=Σ^∞_+BC₂≠S | sound |
| §10.3 cyclic orbit family | G=ℤ, S₃, Q₈ | ℤ/ℤ terminal; S₃, Q₈ noncyclic, no terminal orbit | sound |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, thirteen roadmaps), How to read the build, Layers 0–10 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References: present. Every target has a locator and a `*Needs:*` line; every definition-bearing target lists at least three Checks (I counted none below three). No LaTeX, no anchors, no pull-request numbers, no `lemma`, no `set_option`.

## Not verifiable

- none: every cited text is in the sources cache and was read at the cited lines.

## Source issues

- **Misprint** in lmmt at Remark 3.11, printed page 1026: the source writes the stabilised relative K-theory colimit colim_r Ω^r fib(K(S⊕Σ^rM)→K(S)) as ΩM; it should be ΣM, since relative K₁ of a split square-zero extension is HH₀ of the bimodule; affects nothing (T(n)-acyclicity is shift-invariant).
- **Gap** in barwick-lawson at proof of Corollary 4.2, manuscript page 7: the source takes the multiplicative subset of π_*tmf generated by Δ, but Δ is not an element of π_*tmf; it should be generated by a surviving power such as Δ²⁴; affects the proof (wording only).
