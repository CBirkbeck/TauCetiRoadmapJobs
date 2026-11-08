# Review of GeneralAlgebraicKTheoryPartII (pull request #1742 at 3f10248)

**Verdict:** accepted

There are no findings. All six findings of the previous review are repaired. The gate passes, the dependency check is clean and `Suggested.lean` elaborates with `sorry` as its only warning. All 15 sampled locators read correctly at the cited lines. The adversarial pass below found no false statement, missing hypothesis or vacuous Lean declaration. Three mistakes found in the sources are listed under Source issues; the README already avoids each of them.

## Status of the previous review's findings

This head is a full re-review: the folder changed by 173 lines since 8a4b822.

- **R01 (P2), §4.30c re-planned the James–Hopf maps, the one-suspension splitting and the EHP sequence: repaired.**
  - §4.30c is retitled "The stable James splitting" and keeps its number. Its statement, conventions, proof route and interface now cover only the E₁-splitting Σ∞_+J(W)≃T(Σ∞W) and its loop form.
  - Line 13 now reads "The combinatorial James–Hopf maps J(Y)→J(Y^∧j) belong to BordismFormalGroups F6.2 item 3; nothing here uses them". BordismFormalGroups on main has that construction at line 704.
  - The G2.5 Freudenthal sentence (line 182), the Serre spectral sequence clause of the DGFloer contract (line 194), Stage 8 items 4–5 in the §4.30c Needs, the hatcher 4I.1–4I.2 and p.474 locators, and the `wu` reference are all gone.
  - §4.33's Needs reads "§4.30c (The stable James splitting)".
  - §4.30c keeps four Checks: S⁰, *, S^c and the Moore space.
  - `roadmaps grep` for "James–Hopf" and "EHP" finds no other roadmap citing them from this one. DGFloerPartII cites only §4.30b (lines 90, 619, 635, 825 and 1742). ChromaticHomotopyTheory cites only the stable splitting.
- **R02 (P3), padding in `Suggested.lean`: repaired.**
  - The 15 API and textbook-input theorems, the def `map`, the `Homology` section and the imports `CWType` and `FundamentalGroupAction` are deleted.
  - What remains: the seven definitions, the two instances, `existsUnique_lift`, `exists_cwComplex`, `continuousMul` and the two James theorems. The imports are `WeakHomotopyEquivalence` and `PathSpace.Moore`.
- **R03 (P3), Lean names missing from the README: repaired.**
  - Line 1210 now names `jamesSubmonoid`, `JamesReducedProduct.toFreeMonoid`, `.reduce`, `.mk`, `.ι` and `.filtration` where each object is defined.
  - Line 1231 lists all twelve named declarations.
  - Each of the 12 names has a backticked occurrence in the README.
- **R04 (P3), docstring claims about the pins: repaired.**
  - Docstring line 21 now says the stable splitting "lacks stable equivalences of spectra; Tau Ceti's symmetric spectra and free spectra are point-set constructions with no stable homotopy category".
  - Confirmed at the pin: `TauCeti/AlgebraicTopology/Spectra/Free.lean` says "point-set constructions, without a model structure". A grep of `TauCeti/TauCeti` finds no stable equivalence of spectra.
  - The EHP line is gone. Line 20 says the Bott–Samelson theorem lacks a Pontryagin product. A grep of both pins for a Pontryagin product on singular homology finds none; Mathlib has singular homology (`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`) but no H-space product.
- **R05 (P3), four works missing from sources.toml: repaired.**
  - `packages/GeneralAlgebraicKTheoryPartII/sources.toml` has 37 ids, including `hatcher` (author page), `lurie-ha` (author page) and `james` (uncertified, DOI 10.2307/2007107, Annals 62, pp.170–197).
  - `wu` left the References with §4.30c's cut.
  - The 37 ids are exactly the 37 References entries; `comm` shows no difference either way.
- **R06 (P3), two mispaired locators: repaired.**
  - §4.18 (line 965) now cites behrens line 1001 (p.27), line 1028 (p.28) and line 1048, Proposition 1.6.8 (p.29). Each line is on the cited page.
  - §4.26 (line 1100) now cites hahn line 113 (§2, p.3), line 62 (Theorem 1.6, p.2), line 198 (Theorem 3.3, p.5), line 306 (its proof, p.7) and line 337 (Definition 4.1, p.8). Each line is on the cited page.

## Verified sound

**Gate, dependencies, outside-folder diff, build.**
- My gate run on this head prints every check it lists at 0 and ends `OK`, exit 0. The worker's gate also shows `build=0`, and my own elaboration below exits 0.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- Dependency check, verbatim: `depcheck: 230 roadmaps, 2341 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- In the merge order this roadmap is at line 332. Its suppliers that are still open sit earlier: StableHomotopyKTheory 16, GeneralAlgebraicKTheory 17, SchemeKTheoryOperations 36, AInfCohomology 80, PrismaticCohomology 81, KTheoryLowDegrees 87, KTheoryFiniteLocalFields 89, QWittVectors 201, RefinedTraceMethods 327 and StableHomotopyKTheoryPartII 330.
- The README cites HomotopySpheres 0 times, so no excluded supplier is used.

**Lean.**
- `lake env lean Suggested.lean` exits 0. Its only output is five `sorry` warnings, at lines 125, 137, 147, 157 and 175.
- There is no `set_option`, no `lemma`, no sorry'd data, and a single `import Mathlib` plus two existing `TauCeti.*` modules.
- I ran `#check @` on all 12 named declarations in one scratch copy. The elaborated types equal the worker's signature file.
  - The seven flagged "dropped" binders are all `[TopologicalSpace X]` on the purely algebraic definitions (`jamesSubmonoid`, `JamesReducedProduct`, `toFreeMonoid`, `reduce`, `mk`, `ι`, `filtration`). Dropping them is correct.
  - Every theorem keeps `T2Space`, the `CWComplex univ` structure, the 0-cell hypothesis `hw₀`, `ConnectedSpace` (James theorems), `Countable` cells (`continuousMul`), `hq`, `hq_eq` and `hd`.
- One-tactic probe on the scratch copy: `continuousMul` does not close by `infer_instance` (no instance found). `existsUnique_lift` and the James theorems need far more than one library lemma. No declaration is padding.
- The probe `ι X x₀ x₀ = 1`, closed by `simp` on the definitions, confirms that the base point is the unit.
- No fully qualified name clashes with another roadmap's Lean (`roadmaps grep --lean-only`). Neither pin has a James reduced product.
- The anonymous `Monoid` instance (line 90) has no docstring of its own. Its structure is stated in the docstrings of `jamesSubmonoid` and `JamesReducedProduct`, and Mathlib's docstring linter exempts instances.

**Headline theorems.**
- README headlines: Thomason–Neeman localization (§0.1), Theorem A in both forms (§4.46), CMNN finite-sphere vanishing (§5.4), two-height purity (§5.5), Theorem B, redshift and optimality (§§6.1, 6.5, 6.6), Galois descent (§8.3), height-one excision and homotopy invariance (§§9.2, 9.4), sifted continuity and cyclic assembly (§§10.2, 10.5), and the James theorem (§4.30b).
- All but the James theorem need spectra, ring spectra or enhanced K at the pins. The docstring names each one with its missing carrier, in 33 lines (lines 20–52).
- The James theorem is stated against `Topology.CWComplex`, `WithGeneratedByTopology`, `TauCeti.MooreLoopSpace` and `ContinuousMap.IsWeakHomotopyEquivalence`, in a weak-equivalence form and a homotopy-equivalence form.
- The homotopy-equivalence form is not a one-step corollary: Whitehead at the pin (`IsWeakHomotopyEquivalence.homotopyEquiv`) needs `CWType` of the Moore loop space, which is AlgebraicTopology Stage 8 item 11a, not a pinned declaration.

**Library declarations opened at the pins (22).**
- Mathlib:
  - `SSet.Quasicategory`, `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean` line 41.
  - `CategoryTheory.Idempotents.Karoubi`, `Mathlib/CategoryTheory/Idempotents/Karoubi.lean` line 43.
  - `CategoryTheory.Triangulated.TStructure`, `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` line 54, and `TStructure.bounded`, line 262, defined as `t.plus ⊓ t.minus`, so its bounds depend on the object as the README says.
  - `Topology.RelCWComplex`, `Mathlib/Topology/CWComplex/Classical/Basic.lean` line 99; `Topology.CWComplex`, line 135; `Subcomplex`, line 653.
  - `Topology.WithGeneratedByTopology`, `Mathlib/Topology/Convenient/GeneratedBy.lean` line 70, a type synonym carrying the topology generated by the given family.
  - `DeltaGeneratedSpace`, `Mathlib/Topology/Compactness/DeltaGeneratedSpace.lean` line 40.
  - Singular homology, `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`.
- Tau Ceti:
  - `TauCeti.ExactStructure`, `TauCeti/CategoryTheory/Exact/ExactStructure.lean` line 241.
  - `finiteProjectiveModulesExactStructure` and `_eq_split`, `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean` lines 232 and 35.
  - `SplitK0`, `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean` line 128; `AbelianK0`, `Abelian.lean` line 15; `TriangulatedK0`, `Triangulated.lean` line 17; `SplitK0.finrankEquiv`, `FiniteDimensionalVectorSpace.lean` line 22.
  - `MooreLoopSpace`, `TauCeti/Topology/PathSpace/Moore.lean` line 608.
  - `MooreLoopSpace.homotopyEquivPath`, `TauCeti/Topology/PathSpace/Moore/Comparison/Basic.lean` line 26.
  - `ContinuousMap.IsWeakHomotopyEquivalence`, `TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean` line 17.
  - `CWType`, `TauCeti/Topology/CWComplex/Classical/CWType.lean` line 38.
  - `IsWeakHomotopyEquivalence.homotopyEquiv`, `TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean` line 21.
  - The module docstrings of the nine files in `TauCeti/AlgebraicTopology/Spectra/`, all point-set.

**Cross-roadmap citations resolved (each section opened where cited).**
- RefinedTraceMethods, open head (rev 1493):
  - §§2.1–2.12 (lines 484–999).
  - §4.6 (line 1730), §4.9 (1825), §4.10 (1907), §4.11 (1948), §4.14 (2041).
  - §4.15, which contains "Stable K-theory is THH" (line 2120).
  - §4.17, which contains the DGM theorem, "TC modulo p and colimits" items (i)–(ii), and henselian rigidity with finite coefficients, including the semiperfect degree ≥0 bullet (lines 2226–2311).
  - §4.18 (line 2311).
  - §4.19, "The TC assembly map for C_p" (line 2361).
  - §6.1, which contains "Spherical lifts of perfect δ-rings" with the universal property in ring maps B/p→π₀R/p (line 2539 ff.).
- StableHomotopyKTheoryPartII, open head (rev 1733): §§4.4, 4.5 and 4.8 (lines 554, 579, 637).
- QWittVectors, open head (rev 1351): §§1.1–1.6 and §1.4a (lines 138–277).
- Read with `roadmaps show` at their open heads:
  - KTheoryLowDegrees §§1.1–1.3 and §13.1 (line 1559). It has no nilpotent K₀ theorem, so gap:nilpotent-kzero asks for nothing it already provides.
  - KTheoryFiniteLocalFields §0.4 (line 174), with `heightOneLocalize` and `heightOneFromZeroSpace`, §§1.1–1.6 and §6.5a (line 1361).
  - AInfCohomology §AI.7.2 (line 3816).
  - PrismaticCohomology §0.65 (line 1225).
  - GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1, 10.13, 11.15–11.16, 13.6 and 13.8a–13.8c.
  - StableHomotopyKTheory §§3.18–3.21, 5.18–5.19, 6.1–6.3, 7.1 and 7.27.
  - SchemeKTheoryOperations §§1.1, 2.7, 3.1, 3.5, 4.1, 4.3, 4.12 and 5.2–5.9.
- On main:
  - EnhancedDerivedSheaves E0.4, E0.7, E3.1, E5:abstract.1–4, E5:presentability.1–3 and E5:descent (lines 211–1791). E5:abstract.2 provides neither truncations nor the relative tensor bound, so gap:multiplicative-postnikov is minimal.
  - GeneralizedCohomology G2 item 5 (Σ∞ and Ω∞, line 302) and G3 item 8 (line 785).
  - AlgebraicTopology Stages 2, 4, 5 and 8, with `basedLoopCWType` at line 1950.
  - DGFloer Layer 1 item 2 (CW approximation) and Layer 2 items 1–2 (Moore paths).
  - BordismFormalGroups F6.1–F6.5, with the James–Hopf maps at line 704.
  - EllipticCohomology E1–E6.
  - TopologicalKTheory T4 and T7 item 1, whose coefficient ring is at line 1287.
  - ModularCurves §7E (line 2442).
- `roadmaps resolve` lists only the three `JamesReducedProduct.*` theorem names, which this roadmap's own `Suggested.lean` declares.

**Declared gaps.**
- The README states 21 contracts, one per slug, and they match the 21 declared slugs.
- Each names a supplier and section that exist. Each `needs` sentence is precise, and none asks for something an earlier owner already provides; I checked KTheoryLowDegrees and EnhancedDerivedSheaves E5:abstract.2 above.
- The height-zero detector D₀=Hℚ in the KTheoryFiniteLocalFields contracts is forced. The Check at line 248 computes π₋₂ values 0 and H²(C₂,ℤ₂)=ℤ/2 for S[1/3]-descent along 𝔽₄/𝔽₂, and I confirmed both values.

**Ownership.**
- §4.30b owns J(W), and HomotopySpheres also plans it (§3B at the #1287 head). HomotopySpheres is excluded as a supplier and no allowed roadmap owns J(W), so ownership here is the only option open to this roadmap. That conflict is not a finding against this folder.
- ChromaticHomotopyTheory (rev 1643, lines 5–13) cites this roadmap's §§4.2–4.33, 5.2, 5.5 and 6.5 by number and claims none of their objects. Its own objects (the sharp m, higher norms, all-level modular Galois) are not owned here.
- `roadmaps overlaps` reports no conflicting head, no dropped id and no id defined only by a revision.
- The pull-request description still lists HomotopySpheres (#1287) among its dependencies, although the README no longer cites it. That text is the worker's to regenerate; it is not in the folder.

**Sampled locators: 15 of 15 read at the cited lines.** Printed page = PDF page for lmmt and cm-tate; printed = PDF + 732 for bgt; printed = PDF − 9 for hatcher.

| Target | Source, line | What I read |
|---|---|---|
| 0.1 | bgt 1616, 1622, 1661; lmmt 645 | §5.2 is titled "The Thomason–Neeman Localization Theorem"; Propositions 5.14–5.15 on pp.777–778; Lemma 3.7 on p.1024 derives the compact-kernel sequence from Thomason–Neeman |
| 1.3 | lmmt 610, 618; bgt 1352, 1364 | Proposition 3.6 (p.1023) applies additive Schwede–Shipley; Theorems 4.22–4.23 (pp.770–771) give the spectral-category/stable-category Morita comparison; Corollary 4.31 is at lmmt 1155 (p.1035) |
| 2.4 | bgt 3363 | Theorem 9.53: K_i(R)≅K_i(π₀R) for i≤0 and connective R; statement and proof on printed p.826, within the cited pp.825–826 |
| 4.11 | kuhn-guide 113, 655, 710, 737, 743 | Theorem 1.1 (p.3) gives (1) T(n)-local values, (2) the finite-source formula and (3) Φ_nΩ∞≃L_T(n), with (1)+(2) characterizing Φ_n; Theorem 5.2 (p.15), Lemmas 5.4–5.5 and Definition 5.6 (pp.16–17) |
| 4.16 | lmmt 409 | Proposition 2.11(iii), p.1019; lmmt's m-connective convention matches §4.13 |
| 4.23 | cm-tate 62, 75, 106, 110 | Lemma 2.1, Proposition 2.3 (three equivalent conditions), Lemma 2.4 (prime order suffices), Theorem 2.5 (section after Ω^(∞+1)), pp.2–3 |
| 4.27 | hahn 19, 35, 347–432; may-nilpotence 107 | Theorems 1.1 and 1.3, the latter for h≥0 and D_p-algebras; Propositions 4.2–4.5 and Theorem 4.6 on pp.8–10; MNN Theorem 2.1, p^m x=0 ⇒ x^((p+1)^m)=0, on p.3 |
| 4.30 | lmmt 1002, 1011–1031; behrens 1048, 1160, 1175; mm 1729 | Corollary 4.21 proof (p.1032) gives L₂-locality, tmf→Tmf and Tmf→TMF at T(2); Propositions 1.6.8 and 1.6.12 and the fracture section on pp.29–32; mm Theorem 7.2 |
| 4.30b | hatcher, PDF 233/297/275/380/427/431/480/533 | Proposition 3.22 p.224, 3C.8 p.288, 3A.7 p.266, 4.37 p.371, 4.74 p.418, 4A.3 p.422, 4J.1 p.471, A.6 p.524 |
| 4.33 | lmmt 919–928 | Corollary 4.14 and the James splitting proof, p.1030 |
| 4.40 | lmmt 556; lt 203–206 | Lemma 3.3, pp.1022–1023; lmmt's "localizing invariant" is lt's, which lt footnote 1 identifies with weakly localizing |
| 6.1 | lmmt 162, 813 | Theorem B (p.1014); Corollary 4.3 for E₁ A-algebras B, n≥0 (p.1028) |
| 6.3 | yuan 58, 96, 287, 310, 326 | Theorem A (n≥1, perfect k), Theorem C, Theorem 4.2 (p.7), Theorem 4.3 and Lemma 4.5 (pp.8–9) |
| 7.8 | lmmt 960, 971, 841 | Corollaries 4.16 and 4.18 (p.1031); Remark 4.6 supports §5.6's T(0) variant |
| 8.1 | cmnn20 300–315, 317, 325, 339, 356, 421, 489–510 | Definitions 2.1 and 2.3 on Ĉat∞^perf (not necessarily small); Proposition 2.5 for small C; Proposition 2.6; Example 2.10(1),(3),(5),(6); Definitions 2.15–2.16, pp.7–12 |

I also read the newly paired lurie-ha locator: Proposition 4.1.1.18 is at PDF page 458, the free associative algebra.

**Adversarial table** (values computed on both sides)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.1 | q=id; q:D→0; A=0 | kernel 0 gives fib(K(D^ω)→K(D^ω))=0; kernel D gives fiber K(D^ω); all three terms 0 for A=0 | sound |
| §1.3 | C=Proj^ω(A) on right modules; C=0 | Hom_A(A,M)=M, so End_A(A)=A acting by left multiplication, with composition giving A rather than A^op; Hom(A,A⊕A)=A²; End(0)=0 | sound |
| §2.4 | Hℤ; Hk⊕ΣHk→Hk | K₀=ℤ on both sides, K₋₁=0 on both sides; BGT 9.53 covers every i≤0 | sound |
| §4.11 | Hℤ; T(n); Σ⁻¹Hℚ | L_T(n)Hℤ=0 ⇒ Φ_nΩ∞Hℤ=0; L_T(n)T(n)≠0; Ω∞Σ⁻¹Hℚ=*, so any height-zero Φ₀ would give 0=Hℚ[1/p]-value≠0 | sound |
| §4.15–4.16 | K(ℤ/p,n); Σ^nHℤ/p→0 | K(ℤ/p,n) is n-connective; K(n)-rank p^(C(n,n))=p, reduced rank p−1≥1 ⇒ Σ∞K(ℤ/p,n) is T(n)-nonacyclic ⇒ m≥n+1, matching lmmt Remark 2.12's m=n+1 | sound |
| §4.23 | L=Hℚ, G=C₂, C₃ | transfer is ×2 and ×3 on π₀; sections ×1/2, ×1/3; composites 1 | sound |
| §4.26 | p=2,3; h=2, k=1 | res P(2)=4 or 8 versus res(P(1)+P(1))=2, differences 2 and 6; [2](z) mod (2,u₁)=u₂z⁴+_F z⁸, so g₂(0)=u₂ | sound |
| §4.27 | H𝔽_p; Hℚ | K(h)⊗H𝔽_p=0 for all finite h; K(0)⊗Hℚ≠0 but K(1)⊗Hℚ=0, so the implication is one-way | sound |
| §4.29 | KU₂, trivial C₂ | [2](x)=2x−x²; ℤ₂((x))/(x(2−x))=ℚ₂, so i=0 fails as expected; i=1 gives L_T(j)KU₂=0 for j≥2, which is true | sound |
| §4.30 | tmf→Tmf; Δ²⁴ | cofiber τ≤−1Tmf is bounded above ⇒ T(n)-acyclic for n≥1; Tmf_(p) L₂-local ⇒ T(3)-acyclic; \|Δ²⁴\|=576; group orders 24·2=48 at 2, 12·2=24 at 3 (behrens 1154–1157) | sound |
| §4.30a | ko→ko[a⁻¹] at p=2 | a²=4b inverts 2, so π_*=ℤ[1/2][a^(±1)] and T(1)⊗ko[a⁻¹]=0, while T(1)⊗ko≠0 | sound |
| §4.30b and James theorems | S⁰; S¹; S²; d≡0; w₀ | J(S⁰)=ℕ versus π₀ΩS¹=ℤ, so `ConnectedSpace` is needed; π₁J(S¹)=ℤ=π₂S²; J₂S² has one 2-cell while S²×S² has two; J_rS²→J(S²) is (2r+1)-connective; d≡0 makes every letter the length-0 loop while π₂J(S²)=ℤ, so `hd` is needed; the junk s/0=0 gives q(w₀,0), the base point | sound |
| `existsUnique_lift` | X=S⁰, M=Multiplicative ℕ | φ∘mk on X^k is a product of f-values, continuous for the product topology and hence for the Δ-refinement; the ι x generate, so φ is unique | sound |
| `continuousMul` | countable versus uncountable cells | countable: J(W)×J(W) product topology = CW topology and multiplication is cellular; the hypothesis is present | sound |
| §4.30c | S⁰; Moore space S²∪₂e³ | Σ∞_+ℕ=T(S), π₀=ℤ[t], versus S[ℤ], π₀=ℤ[t^(±1)]; H̃₅(W∧W;ℤ)=Tor(ℤ/2,ℤ/2)=ℤ/2 versus T(H̃W)₅=0; over 𝔽₂ both sides have rank 2 | sound |
| §4.31 at p=3 | sign twist on Ω²S³⟨4⟩ | Ω²S³→BO_(3) is null as an E₂-map since π₁BO_(3)=0; the simply connected source maps through BSO_(3) ⇒ null ⇒ the Thom spectrum retracts onto S_(3), with π₃=ℤ/3 versus π₃Hℤ_(3)=0 | sound |
| §4.32 | y(m), z(m), m=0,1 | π₀y(m)=ℤ_p/(1−(1−p))=𝔽_p for m≥1, and S_p^∧ at m=0; π₂(J_rS²⟨3⟩)=0 ⇒ π₀z(m)=ℤ_(2); slopes 1/16 versus 1/4 at p=3, m=2 | sound |
| §4.33 | W=S², E=Hℚ | the hypothesis fails (Hℚ⊗Σ∞S²≠0) and the summands S^(2r) are rationally nonzero; consistent | sound |
| §4.40 | k=0; R=HA | τ≤0R=Hπ₀R, so the conclusion is the hypothesis | sound |
| §4.46, §5.5 | Hℤ, n=1 | L_(T(0)∨T(1))Hℤ=Hℤ[1/p]; the fiber of K(ℤ)→K(ℤ[1/p]) is K(𝔽_p), which is T(1)-acyclic | sound |
| §5.4 | n=2 | L_T(2)K(S[1/p])=0 (Mitchell plus the p-adic comparison with K(ℤ[1/p])); the high trace at m+1=1 is out of range | sound |
| §6.1 | H𝔽_p; 0; Hℚ | heights −1, −1, 0 ⇒ bounds 0, 0, 1; K(𝔽_p)[1/p]≠0 and T(1)K(𝔽_p)=0 attain 0 | sound |
| §6.3 | E₁; Hℚ in Theorem C | Yuan Theorem A needs n≥1; Theorem C fails at n=0 since Hℚ^tC_p=0 (Source issues); the README uses j≥1 | sound |
| §6.4 | K(L)→K(L[u])→K(L) | L⊗_(L[u])L=L⊕Σ³L, so the composite is 1+(−1)=0 on K; π₀ and π₁ of ku_p⊕Σku_p are ℤ_p | sound |
| §6.5 | (H𝔽₂)^tC₂ at odd p | ht_p=0 and rationalization 0; 2=0 on K, so T(1)⊗K=0 and K has height 0≠1; excluded by R⊗Hℚ≠0 | sound |
| §6.6 | M=HA | stable K of S with coefficients M is ΣM, with π₁=A from the units 1+A; lmmt prints ΩM (Source issues) | sound |
| §7.4 | m=1 | allowed heights {0,1,2}; the composite K(𝔽_p)→K(k(m))→K(𝔽_p) is id+Σ^(2p^m−1)=1+(−1)=0; rational ranks (1,0)+(0,1)=(1,1) | sound |
| §7.8 | m=1, 2 at p=2 | 0<i<1 is empty; T(1)y(2)=T(1)z(2)=0; π₀(z(2)[1/2])=ℚ, so the T(0) step is withheld for z | sound |
| §8.1 | H(ℚ/ℤ); H𝔽₂; Σ=∅ | N·(1/2N)=1/2≠0, so not ε; 2·id=0 on H𝔽₂, so ε in Sp; F=0 gives T_(ε,∅)=T | sound |
| §8.2 | KU→KO in Sp | π₀ sends 1 to 2, N=2; η³∈π₃KO=0, so KO is a retract of KO⊗C(η³)∈thick⟨KO⊗Cη⟩=thick⟨KU⟩ | sound |
| §8.9 | tmf→Tmf | barwick-lawson Corollary 4.2 gives K(ℤ)→K(tmf)→K(Tmf); the README's Δ²⁴ repairs the source's ⟨Δ⟩ (Source issues) | sound |
| §9.6 | p=2,3 | THH(ℤ[1/p])/p=0 but THH(ℤ[1/p])⊗ℚ=Hℚ≠0; π₋₁TC(𝔽_p)=ℤ_p versus K₋₁(𝔽_p)=0, a bounded discrepancy | sound |
| §9.7 | Coh(ℤ/p^r) stages | each stage is a K(ℤ/p^r)-module, and L_K(1)K(ℤ/p^r)=0; the colimit's L_K(1)TC equals L_K(1)TC(ℤ)≠0 because TC(ℤ[1/p])^∧p=0 | sound |
| §10.4 | G=C₂×C₂, R=S | LBG has four summands BG, one per g; (E_Cyc G)^⟨g⟩ is contractible; omitting one C₂ loses a summand | sound |

## Not verifiable

- `james` (Annals of Mathematics 62, 1955): the manifest settles it as uncertified, and the publisher and JSTOR copies are paywalled. The James equivalence it is cited for was checked against hatcher Theorem 4J.1 instead.
- Ownership against the BordismFormalGroups revisions #1807, #1808 and #1854 and HomotopySpheres #284: the brief gives no files for them, so I checked only through `roadmaps grep` and `roadmaps overlaps`, and used BordismFormalGroups on main.

## Source issues

- **Error** in yuan at Theorem C, manuscript p.3 (restated in §3, p.6): the source states it for every height n, n=0 included; it should require n≥1, since Hℚ is T(0)-nonzero while Hℚ^tC_p=0, and the proof's p-completion step needs n≥1; affects nothing.
- **Misprint** in lmmt at Remark 3.11, p.1026: the source identifies colim_r Ω^r fib(K(S⊕Σ^rM)→K(S)) with ΩM; it should be ΣM=ΣTHH(S;M), as the degree-one relative units show; affects nothing.
- **Misprint** in barwick-lawson at the proof of Corollary 4.2, p.7: the source localizes tmf at the multiplicative set generated by Δ in π_*tmf; Δ is not a class there (it supports a d₅ at 2 and 3), so it should use a surviving power such as Δ²⁴; affects nothing.
