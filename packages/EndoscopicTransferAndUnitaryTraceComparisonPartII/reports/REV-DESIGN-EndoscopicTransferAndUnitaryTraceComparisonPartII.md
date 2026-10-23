<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/309#issuecomment-6366028511 -->
Review (claude) of 80a66cc

Verdict: needs changes

1. **F01** (P1) Gaps G1, G3, G5 and G6 have no supplier, and the intake cannot read them

   - **Location.** README line 1432: "No exact supplier node or scoped stage was found"; line 1442: "The new sibling is not an existing roadmap id; it is deliberately not used as a prerequisite." Plan lines 2531–2609: each `gaps` entry has only `id`, `title`, `neededBy`, `detail`.
   - **Claim.** FJ.0/pushforward, FJ.0/orbital-comparison, FJ.1/nonsingular-transfer, all of FJ.3 except the descent, and FJ.4/product-group-contraction and rank-shifted-fundamental-lemma rest on contracts G1, G3, G5 and G6.
   - **Witness.** `JacquetRallisRelativeTraceComparison` is not on main, at any open head (`roadmaps grep`), in the board packages index or in ORDER.txt. The entries lack `supplier`, `section` and `needs`, and no node lists `gap:<slug>` among its prerequisites.
   - **Repair.**
     - **G1: own it here.** Add an FJ.0 target "fibre integration along the contraction torsor". It has three parts:
       1. the F-point map of the torsor `Iso_E(W2,W1) → Ω` has local analytic sections;
       2. `r_!` maps `C_c^∞(Iso_E(W2,W1))` onto `C_c^∞(Ω)`;
       3. for every closed regular orbit O and every compact test f there is a compact nonsingular test equal to f near O. Take `f·1_U` with `U = π^{-1}(B)`, where B is a compact open neighbourhood of π(O) in the regular locus of the invariant base; U is open and closed, and it lies in the invertible locus by Lemma 2.4.

       Locators: Leslie25 line 642–651 (p. 16, citing Shalika 1972 §1); Leslie19 line 1379–1389 (Proposition A.3, stated without proof, line 1338). *Needs:* Mathlib `HasStrictFDerivAt.implicitFunction` (Mathlib/Analysis/Calculus/Implicit.lean:464 at the pin), ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts*, AdelicAlgebraicGroups §2.2 *quotient-measure*. **Test:** at n=1 with f=1_{O_E} and B=O_F^×, U=O_E^×, `f·1_U=1_{O_E^×}` is compact in E^× and `r_!` of it is `1_{O_F^×}`.
     - **G3, G5 and G6: own the Jacquet–Rallis inputs here** in a new layer before FJ.3. Its targets:
       - the invariant quotient and the orbit matching (4.2) (Leslie25 §4.1, pp. 32–34);
       - the factors ω of (4.1) and (4.6);
       - smooth transfer and its compatibility with the partial Fourier transform (Zhang 2014, as used at Leslie25 Theorem 4.2, p. 34, and before Proposition 5.1, p. 41);
       - the fundamental lemma (BP21 Theorem 1, p. 3);
       - descent of the Weil actions (BP21 Proposition 1, p. 7);
       - Leslie25 Theorem 11.1 (p. 78) with its Part 2 proof.

       Cite MetaplecticAutomorphicForms §2.5 `weil_generators` and §2.1 `weilIndex` for the Weil operators. Cite AutomorphicLFunctionsAndLocalFactors (its targets built on Leslie §8.2–8.4, "The normalized adjacent-rank period" and "Central Rankin–Selberg period factorization") and AutomorphicSpectralTheory for the global inputs. This also serves GanGrossPrasadUnitaryGroups: at its open head db8ad41, README lines 151, 153 and 155 declare three gaps on EndoscopicTransferAndUnitaryTraceComparison whose section contract is "Part II relative comparison continuation", that is, Jacquet–Rallis transfer.

       If the board prefers a separate Jacquet–Rallis roadmap, that is a human decision. Until it exists, write each input as a declared gap whose supplier is EndoscopicTransferAndUnitaryTraceComparison, with a named section, a one-sentence `needs`, the same slug in `gaps` and in the README, and `gap:<slug>` in each consumer's prerequisites.
     - **Test.** The gate still reports 0 problems: ReductiveGroupsPartII (line 20), AutomorphicLFunctionsAndLocalFactors (72), AutomorphicSpectralTheory (74), EndoscopicTransferAndUnitaryTraceComparison (110) and MetaplecticAutomorphicForms (111) are all in the permitted list.

2. **F02** (P1) G2, G4, G7 and G8 are not supplier gaps; three targets state no theorem

   - **Location.** README line 696: "The intended assertion is equivalence of the resulting orbital-integral identities." Line 1323: "This is a conjectural target for arbitrary support". Line 1391: "Determine an explicit augmentation of the ordinary Langlands–Shelstad–Kottwitz transfer factors". Gaps at lines 1437, 1447, 1462 and 1467.
   - **Claim.** G2 and G4 are supplier obligations. FJ.1/contraction-independence, FJ.5/full-smooth-transfer and FJ.5/full-spherical-transfer-factors are targets.
   - **Witness.** The two FJ.5 targets and contraction-independence have 0 consumers in plan.json. Leslie19 line 697 leaves the conjecture unproved in general. Leslie25 line 1176–1180 only suggests an augmentation.
   - **Repair.**
     - G4 is the content of FJ.3/germ-inversion: own it there. The proof is finite Fourier inversion on `(ℤ/2)^r`, applied to Xiao18 line 914–916 (identity (7)) via Lemma 4.6 (line 932), with the torus measures of Leslie25 line 493–494. Move the four-form sign question (E12) to the source corrections, since the spherical case uses only the reference/reference term. **Test:** at n=1, `ωG = 1/2 = 2^{-1}·(1·1 + κ·0)` for both v=1 and v=π (table row 21).
     - Delete FJ.1/contraction-independence with G2 (Remark 2.11 asserts it without proof and nothing consumes it), or restate it as a precise theorem with the explicit datum map and factor correction.
     - Delete FJ.5/full-smooth-transfer with G7, and FJ.5/full-spherical-transfer-factors with G8. Keep FJ.5/full-spherical-extension, which is a construction.
     - In Scope, one sentence records that unrestricted relative transfer (Leslie19 Conjecture 4.4, p. 15) and a full-module transfer statement (Leslie25 Remark 3.7, p. 27) are open and are not targets.

3. **F03** (P1) The ET stage slugs and the two "requests" do not exist where cited; two inputs are owned by nobody

   - **Location.** README lines 112–115, for example "EndoscopicTransferAndUnitaryTraceComparison, ET.1 | Requested normalized Hermitian orbital integrals, factors and the Xiao germ/descent factor comparison". Requests at lines 1419 and 1424; plan lines 2507–2530.
   - **Claim.** ET.0, ET.1, ET.2b and ET.3 are sections of the parent. The requests are supplier contracts.
   - **Witness.** At its open head 40d60b6 the parent has only Layers 1–14 with numbered §§, so no ET.0–ET.3. Neither "Xiao" nor "Jacquet" occurs in it. The requests are absent from `gaps`, so the intake never announces them.
   - **Repair.**
     - Replace the slugs by sections:
       - crossed-module-galois-cohomology → §1.1;
       - abelianized-cohomology → §1.5;
       - rational-classes-in-stable-class → §1.14;
       - unitary-hermitian-matching → §1.17;
       - unitary-elliptic-endoscopic-data → §1.4 with §1.17(c) (§1.8 is the global similitude list);
       - chevalley-quotient → §3.3.
     - Replace request ET.1 by §§2.1, 2.4, 2.9, 2.11 and 2.12, and request ET.3 by §4.7 (Lie-algebra transfer, any residue characteristic) and §4.9(b) (spherical base change).
     - Two pieces remain unowned:
       1. The Xiao factor identity `ω(γ,v,v*) = χ(D)·ω(γ1,…)·ω(γ2,…)`, together with the `|D|^{-1}` of Lie descent (Xiao18 line 1181–1187, line 1015–1023). Own it as an FJ.3 target: it is a determinant computation.
       2. Formula (2.7) outside "unramified, p odd" (parent README line 981), which FJ.1 needs at ramified E and FJ.4 needs at p=2. Declare it as a gap with supplier EndoscopicTransferAndUnitaryTraceComparison, section §2.12. Its `needs`: "for every quadratic extension of p-adic fields of characteristic zero, including p=2 and ramified E, the factor of §2.9 for U(V_a)×U(V_b) equals κ(inv(δ,δ′))η(D(δ))|D(δ)|_F (Leslie25 (2.7), p. 19)".
     - **Test.** At a=b=1, x−y=π, p=2, unramified, the factor is −q^{-1}. The gate stays at 0 problems.

4. **F04** (P1) Residue characteristic two rests on supplier statements made only for odd residue characteristic

   - **Location.** README lines 158–159: "This works in residue characteristic two by the imported rank-one Hermitian lattice classification". Line 1074 cites GN.2 for c with norm −1 "including residue characteristic two". Supplier table row at line 110.
   - **Claim.** GeometryOfNumbersAndQuadraticArithmetic GN.2 supplies Hermitian classification, unimodular classification and unramified diagonalization in all residue characteristics.
   - **Witness.** At head 465728d, GN §2.9 is "over a local field of odd residue characteristic" (README line 1196), and GN has no unimodular-classification or diagonalization target. The parent's §2.12 assumes "p odd" (line 981).
   - **Repair.**
     - Cite Tau Ceti `TauCeti.map_normUnits_unitFiltration` (TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126 at a91d3aa) for N(O_E^×)=O_F^× in every residue characteristic. That gives c with N(c)=−1 in FJ.4/contraction-sign-comparison and in the signed rank-one Check.
     - Own three statements here, or declare them as gaps on GN §2.9 and §2.7:
       1. Nondegenerate Hermitian spaces over any quadratic extension of local fields are classified by dimension and discriminant (Jacobowitz 1962, Theorem 3.1, as cited at Leslie19 line 760).
       2. For unramified E/F, the K_{n,E}-classes in X_n are the `K∗ϖ^λ` with λ∈P_n (Leslie25 (3.7), line 1119–1123).
       3. U(Λ_n) is transitive on vectors of Λ_n with h(w,w)=1 (BP21 line 198–199; Leslie25 line 1945–1946).
     - Repoint the remaining GN slugs:
       - integral-hermitian-lattice → §2.7 `IntegralHermitianLattice.ofCarrier`;
       - hermitian-dual-lattice → §2.7 `IntegralHermitianLattice.dual`;
       - signed-hermitian-space → §2.9 `SignedHermitianSpace` (its carrier holds over any field with involution);
       - hermitian-special-values → §3.2.
     - **Test.** At p=2 and n=1, the Tau Ceti lemma gives c. Statement 1 makes the four form pairs of a=b=1 well defined.

5. **F05** (P1) Igusa's criterion is used and owned by nobody; "SF.1" is not a section

   - **Location.** README line 342: "Use the split multiplication-map section and its generic transitive fibers in Igusa’s criterion (supplier request SF.1)." Supplier row at line 118.
   - **Claim.** FJ.0/quotients obtains its categorical quotients from a supplier.
   - **Witness.** No SF.1 request exists (plan lines 2507–2530). On main, SchemeAndStackFoundations has Layers 0–…, not "SF.1", and no Igusa criterion. `roadmaps grep` finds "Igusa's criterion" nowhere. Leslie25 line 566–575 quotes it from Zhang 2014 §3.
   - **Repair.** Own Igusa's criterion as an FJ.0 target (Leslie25 Proposition 2.1 proof, p. 14). Alternatively, narrow FJ.0/quotients to what its single consumer FJ.0/regular-invertible uses: invariance of the charpoly coefficients and single generic fibres. Repoint galois-descent-affine to SchemeAndStackFoundations §0.11 or §1.24.

6. **F06** (P2) A gap and three targets restate what suppliers already provide

   - **Location.** README line 1452 (G5): "actual SL_2(F) Weil actions on the two test spaces". Line 852: "a torsor for H1(F,T_y)". Line 619: "multiplies the sum by the inverse of its character value". Line 1074.
   - **Claim.** These are new obligations of this roadmap or of its supplier.
   - **Witness.** MetaplecticAutomorphicForms §2.5 `weil_generators` gives the generator formulas, and §2.1 gives the Weil index. Parent §1.17(b) builds `inv(δ,δ′)` across both forms with its image. Parent §2.4 has the reindexing by κ(d₀)^{-1}. Tau Ceti has the norm lemma of R04.
   - **Repair.**
     - G5 keeps only the descent to orbital-image spaces and agreement on the intersection (BP21 Proposition 1), and cites §§2.1 and 2.5 for the actions.
     - FJ.3/pure-form-orbit-torsor cites §1.17(b) and states only bijectivity and the cyclic coordinates (Xiao18 Lemma 4.6).
     - The basepoint API of FJ.1/kappa-orbital-integral cites §2.4.
     - Step 1 of FJ.4/contraction-sign-comparison cites the Tau Ceti lemma.

7. **F07** (P3) Generality narrowed below the sources

   - **Location.** README lines 31–32: "(E/F) a quadratic **field** extension". The hypotheses at lines 877 and 920 restrict FJ.3/generalized-nilpotent-integral and FJ.3/germ-inversion to unramified E/F.
   - **Witness.** Leslie25 line 510–511 sets Part 1 over a quadratic étale algebra. Leslie25 line 1387–1388 and Xiao18 lines 108–109 and 115 define the nilpotent integrals and prove Theorem 4.7 for every quadratic extension.
   - **Repair.** State FJ.0–FJ.1 over a quadratic étale algebra, with E=F×F as a Check: U(W) is then GL_n, which recovers the linear Friedberg–Jacquet case. Drop "unramified" from generalized-nilpotent-integral and germ-inversion, and keep it for lie-parabolic-descent, augmented-to-endoscopic, group-to-augmented and FJ.2/FJ.4.

8. **F08** (P3) Two n=1 Checks fail for nonstandard forms

   - **Location.** README line 327: "In dimension one r1(z)=r2(z)=-N_E/F(z)." Line 348: "For n=1 the full quotient is the scalar -N(z)".
   - **Witness.** For W1=⟨1⟩, W2=⟨ε⟩ with ε a non-norm, the adjoint relation gives X^τ(w)=ε^{-1}z̄w. So r1(z)=r2(z)=−N(z)/ε≠−N(z).
   - **Repair.** "For W_i=⟨a_i⟩, r1(z)=r2(z)=−(a1/a2)N(z); for standard forms this is −N(z)." Add the W1=⟨1⟩, W2=⟨ε⟩ case as a negative control: its image is the other norm class.

9. **F09** (P3) Locators and a Uses line

   - **Location.** README line 1303: "[Leslie25] Theorem 2.12, p. 22". Line 1046: "Section 2, Lemma 1, pp. 3–5". Line 409: "Uses: FJ.1/kappa-orbital-integral and FJ.4/unit-fundamental-lemma".
   - **Witness.** Leslie25 line 873 puts Theorem 2.12 on p. 21. BP21 §2 begins on p. 4, with Lemma 1 at lines 151–216. In plan.json, FJ.4/unit-fundamental-lemma does not list FJ.0/relative-orbital-integral; its direct consumers are kappa-orbital-integral and orbital-comparison.
   - **Repair.** Change the locators to "Theorem 2.12, p. 21" and "§2, Lemma 1, pp. 4–5", and name orbital-comparison as the direct consumer at line 409.

10. **F10** (P3) The README is not in TauCetiRoadmap form

   - **Location.** Line 1: "# Relative endoscopy for unitary Friedberg–Jacquet periods". There are 37 field-list blocks, the first at lines 242–278. LaTeX display delimiters appear at lines 38, 44, 77, 172 and 181, and `\( … \)` at lines 186–188 and 193.
   - **Witness.** The README has no `**Summary.**`, Scope, supplier contracts, Layers, `*Needs:*` lines or `**Checks.**` lists. Its 14 "Unit tests" blocks name Lean counterparts (115 `TauCeti.UnitaryFJ.*` names). The links at lines 13 and 15 point to missing files.
   - **Repair.**
     - Add the missing sections, including `### Examples` and `### Dependencies` per layer.
     - Rewrite FJ.0–FJ.4 as Layers 0–4, each target as prose with its hypotheses, locator and a `*Needs:*` line built from its prerequisites, and turn the tests into unnamed Checks.
     - Use namespace `TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII`. Backtick only names that Suggested.lean will declare.
     - Convert the TeX to Unicode or code spans. Delete "Planets", "Coverage" and the dangling links.
     - Zero-function tests (for example `relativeOrbitalIntegral_zero`) also hold for the zero map, so they do not count toward the three discriminating Checks.

11. **F11** (P3) Process narrative and planning residue

   - **Location.**
     - Lines 12–19, for example "Every target has implementation status `unchecked`".
     - Line 104: "under this issue's fixed roadmap id".
     - Lines 1479–1514: eight lines of the form "Previously reported as `PAPER-LESLIE-25/E1`".
     - Lines 1534–1561 and 1597–1607 (WORKERS.md, `lean-check`).
     - Lines 1611–1614: "read in place in the maintainer's cleared library".
     - Line 723: "when the import is implemented".
   - **Witness.** The word "packet" occurs 9 times. The text also uses route-item counts, job ids, access dates and reading-boundary notes.
   - **Repair.** Delete these passages. Move the split proposal to the plan's `restructure`, where it already is. Keep E01–E13 as a timeless "Source corrections" section without the provenance lines.

12. **F12** (P3) The pins the README states are not the pins

   - **Location.** README lines 1565–1566: "Mathlib `082e2d37…` and Tau Ceti `f790474…`". Plan lines 16–17.
   - **Witness.** The content repository's lake-manifest pins Mathlib 6b7abb3 and Tau Ceti a91d3aa.
   - **Repair.** State the manifest pins. All eight cited Mathlib declarations exist at 6b7abb3 (see Verified sound).

13. **F13** (P3) No sources manifest at submission

   - **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/sources.toml` was absent.
   - **Witness.** The README cites Leslie25, Leslie19, Xiao18, Hironaka99 and BP21.
   - **Repair.**
     - This review's fetches recorded all five. Project Euclid refused the Hironaka PDF, so its entry comes from the publisher's J-STAGE copy, recognised by OCR.
     - The author adds `cited_for` for every citing target.
     - The author adds `version_note`s: Leslie25 is cited by arXiv v3 pages, not Annals 201 pages; BP21 by arXiv v3, not Duke 170.
     - After the repairs, add entries for every text newly cited (Jacobowitz 1962, Shalika 1972, Zhang 2014).

14. **F14** (P3) The planned Lean file contradicts the acceptance-test rule

   - **Location.** README lines 1598–1602: "Its five admitted milestones express their Hermitian, swap, equivariance and characteristic-polynomial properties … Seven admitted examples check zero, identity, scalar and diagonal contractions".
   - **Witness.**
     - Admitted examples are never written.
     - The milestones follow in one step from Mathlib: `Matrix.isHermitian_mul_conjTranspose_self` (Mathlib/LinearAlgebra/Matrix/Hermitian.lean:285) and `Matrix.charpoly_mul_comm` applied to (−X, Xᴴ) (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:271).
   - **Repair.** Replace these lines with the package's headline list.
     - **To state:** nothing is statable at the pins.
     - **To name in the docstring as not statable, with the missing carrier:**
       - Theorem 2.12, which lacks unitary groups of Hermitian spaces over p-adic fields with Haar and quotient measures, relative and κ-orbital integrals, and rational classes in a stable class;
       - Theorem 3.5, which lacks local spherical Hecke algebras of GL_n(E) and X_n and ordinary transfer;
       - Theorem 5.3, which lacks Jacquet–Rallis orbital integrals;
       - Hironaka's isomorphism, which lacks spherical Hecke algebras with Satake.

       Tau Ceti's `HeckeRing.GLn` is the p-local arithmetic Hecke ring over ℤ, not a local spherical Hecke algebra.
     - **To leave out:** the contraction lemmas and the examples.

15. **F15** (P3) The Part II introduction does not say where the parent stops

   - **Location.** README lines 3–10 and 101–106: "Ordinary endoscopy remains in the parent."
   - **Witness.** The parent stops at ordinary unitary Lie-algebra transfer (§§1.17, 2.12, 4.4–4.7). GanGrossPrasadUnitaryGroups expects this Part II to carry the Jacquet–Rallis comparison (see R01).
   - **Repair.** Say in one paragraph that the parent supplies ordinary endoscopy for unitary Lie algebras and stops before symmetric-space endoscopy. Say that this Part II owns relative endoscopy for (U(W1⊕W2), U(W1)×U(W2)) and the Jacquet–Rallis inputs it consumes (R01).

Files reviewed: `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md` (cited as "README line N"), `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/plan.json` ("plan line N") and `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/sources.toml`, which did not exist at submission (R13). Sources are cited as `<source id> line N` in the line-numbered texts of the sources service. There is no previous review. Six findings block (R01–R06). The mathematics held up well: the adversarial pass found no false theorem, and the design's own source corrections E01–E13 were all confirmed in the texts. What blocks is ownership. Every declared gap has supplier `none`, the stage slugs cited for four suppliers do not exist in those roadmaps, and the claimed coverage of residue characteristic two rests on supplier statements made only for odd residue characteristic.

## Verified sound

**Dependency gate** (output, verbatim):

    candidate: EndoscopicTransferAndUnitaryTraceComparisonPartII is not in the merge order yet; checked as if placed after EndoscopicTransferAndUnitaryTraceComparison (the intake inserts it when its design is accepted)
    depcheck: 27 roadmaps, 227 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The named suppliers precede line 110 of the merge order: SchemeAndStackFoundations (line 2), SmoothRepresentationsOfLocalGroups (21), AdelicAlgebraicGroups (29) and GeometryOfNumbersAndQuadraticArithmetic (60).

**Ownership by object.** I searched with `roadmaps grep` over main a07e202 and the 330 open heads (index of 2026-10-23T12:42:40Z), including every sibling the brief names, and over the board checkout's packages and the RefinedTraceMethods head. The terms were Friedberg–Jacquet, Jacquet–Rallis, Leslie, Xiao, Hironaka, Beuzart, Feigon, Igusa's criterion, Jacobowitz and spherical Fourier.

- No roadmap owns relative endoscopy for U(2n)/U(n)×U(n), Hironaka's module on X_n, or the Jacquet–Rallis local theory.
- GeometryOfNumbersAndQuadraticArithmetic §3.2 treats Hironaka's spherical functions on U(2n)/(U(n)×U(n)), a different space.
- SmoothRepresentationsOfLocalGroups SR.4.3 *parabolic-descent* already owns Leslie's ξ with `(m₁,m₂)↦diag(q^{−b}m₁,q^{−a}m₂)`, and the design imports it correctly.
- This roadmap is therefore the right owner of FJ.0–FJ.4. The restatements found are listed in R06.

**Seeded source sample.** The 15 labels were drawn as label occurrences with `random.Random("REV-DESIGN-EndoscopicTransferAndUnitaryTraceComparisonPartII").sample` within each label. All 15 were verified; findings attach to items 2, 4, 6, 8, 9, 10, 11, 12 and 14. The author flagged one locator as unverified: the Annals pagination (see Not verifiable).

| # | Item (README line, target) | Checked against | Outcome |
|---|---|---|---|
| 1 | "Levi scaling and base change" (169–189) | Leslie25 line 999–1005 (Lemma 3.2: Z_i↦q^{−b}X_i, q^{−a}Y); line 1749–1753 (p. 39 support claim) | Sound. All values recomputed (table rows 17–18); the even-coweight claim at p. 39 is false (Source issues) |
| 2 | Uses (409, relative-orbital-integral) | plan prerequisites | The unit-FL consumer is indirect (R09) |
| 3 | Uses (450, pushforward) | plan prerequisites of orbital-comparison and contracted-lattice-function | Correct |
| 4 | Hypotheses (877, generalized-nilpotent-integral) | Leslie25 line 1387; Xiao18 line 115 | "Unramified" is narrower than the source (R07) |
| 5 | Hypotheses (1089, spherical-pushforward) | Leslie25 line 898–899 (unramified), line 1269 (vol U(Λ_n)=1) | Correct; no residue restriction in the source |
| 6 | Direct prerequisites (378, torsor) | parent §§1.1, 1.5, 1.14, 1.17 exist by content; GN §2.9 | Slugs do not resolve (R03); GN classification only for odd p (R04) |
| 7 | Direct prerequisites (399, relative-orbital-integral) | AdelicAlgebraicGroups §2.2 *quotient-measure*, "Weil's formula for integrable functions" | Present; repoint to §2.2. Parent §2.1 covers ET.1 here |
| 8 | Direct prerequisites (438, pushforward) | as 7 | The analytic input (G1) is missing from the prerequisites (R01) |
| 9 | Direct prerequisites (519, relative-datum) | parent §1.4, §1.17(c); GN §2.9 | R03, R04 |
| 10 | Direct prerequisites (1395, full-spherical-transfer-factors) | internal ids exist | Target states no theorem (R02) |
| 11 | Coverage (508, FJ.1) | parent §4.7 | The smooth-transfer "request" is already supplied (R03); G2 is internal (R02) |
| 12 | Coverage (723, FJ.2) | parent §4.9(b) | Base change is supplied (R03); process wording (R11) |
| 13 | Sources (1212, contracted-lattice-function) | Leslie25 line 1197–1241 ((3.8), Lemma 3.8, Remark 3.9, pp. 28–29) | Correct; the source's x·x^τ sign is a misprint (Source issues) that the design's sign comparison repairs |
| 14 | Direct open obligations (476, G1) | Leslie25 line 642–651; Leslie19 line 1338, 1379 | The obligation is real; unowned (R01) |
| 15 | Check (1282, graded-transfer) | Leslie25 line 1221–1253 | Computed: odd total valuation gives 0 on both sides; matching multiplies determinants |

**Locators.** All 37 Sources lines were checked. Leslie25 v3 pages equal its PDF pages; Hironaka99 printed page = PDF page + 552. 35 are correct, one page is wrong (R09) and one page range is slightly off (R09). All 13 source corrections E01–E13 of README lines 1477–1531 were confirmed at their locators.

**Library declarations opened at the pins.**

- Mathlib 6b7abb3:
  - `Matrix.conjTranspose` (Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43);
  - `Matrix.IsHermitian` (Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44, `Aᴴ = A`);
  - `Matrix.isHermitian_mul_conjTranspose_self` (:285, rectangular) and `Matrix.isHermitian_conjTranspose_mul_self` (:289);
  - `Matrix.charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132, determinant of the charmatrix);
  - `Matrix.charpoly_mul_comm` (:271, square, commutative ring; the rectangular form is `charpoly_mul_comm'` at :241);
  - `MvPolynomial.hsymm` (Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312);
  - `MvPolynomial.bind₁` (Mathlib/Algebra/MvPolynomial/Monad.lean:67);
  - `HasStrictFDerivAt.implicitFunction` (Mathlib/Analysis/Calculus/Implicit.lean:464).
- Tau Ceti a91d3aa:
  - `TauCeti.map_normUnits_unitFiltration` (TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126) and `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (:158), both for unramified L/K in every residue characteristic;
  - `HeckeRing.GLn` (TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean), the p-local arithmetic Hecke ring.

**Cross-roadmap citations resolved.**

- EndoscopicTransferAndUnitaryTraceComparison at open head 40d60b6: §§1.1, 1.4, 1.5, 1.8, 1.14, 1.17, 2.1, 2.4, 2.9, 2.11, 2.12, 3.3, 4.7 and 4.9.
- GeometryOfNumbersAndQuadraticArithmetic at 465728d: §§2.7, 2.9 and 3.2.
- AdelicAlgebraicGroups at 70c4324: §2.2 (*quotient-measure*, Weil's formula, quotient measures in stages).
- SmoothRepresentationsOfLocalGroups at 1383569: SR.4.1 and SR.4.3 *parabolic-descent* and *macdonald-formula*.
- SchemeAndStackFoundations on main: §0.11 and §1.24.
- MetaplecticAutomorphicForms at 22bee85: §§2.1 and 2.5.
- AutomorphicLFunctionsAndLocalFactors at 5d22a23: the targets built on Leslie §8.2–8.4.
- GanGrossPrasadUnitaryGroups at db8ad41: gap lines 151–155.

The parent's §1.8 is the global similitude list, but its §2.12 uses a local version of it.

**Adversarial pass.** One row per statement; values were computed independently of the README.

| # | Statement | Instance | Values computed | Result |
|---|---|---|---|---|
| 1 | Block δ(X)=[[0,X],[−X^τ,0]] is in u(W)_1 | adjoint for h1⊕h2 | δ* = [[0,−X],[X^τ,0]] = −δ | ✓ |
| 2 | Adjoint law (g1Xg2⁻¹)^τ = g2X^τg1⁻¹ | g_i unitary | uses g^τ=g⁻¹ | ✓ |
| 3 | r1 equivariant, r2 opposite; swap r2(X)=r1(X^τ) | direct | r1(g1Xg2⁻¹)=g1r1g1⁻¹; −X^τ(X^τ)^τ=−X^τX | ✓ |
| 4 | Equal charpolys of the contractions | Mathlib :271 on (−X, Xᴴ) | (−X)Xᴴ = −(XXᴴ) | ✓ (one-step; R14) |
| 5 | n=1 contraction = −N(z) | W1=⟨1⟩, W2=⟨ε⟩ | X^τ=ε⁻¹z̄, r1=−N(z)/ε | ✗ as stated (R08) |
| 6 | Hom//U(W2) ≅ Herm(W1); full quotient Aⁿ | split model (A,B)↦AB | section A↦(A,I) surjective | ✓ given Igusa (R05) |
| 7 | rss ⇔ r1 rss and invertible; charpoly δ = p(T²) | block determinant | det[[T,−X],[X^τ,T]] = det(T²−r1); p(0)=0 gives a double root 0 | ✓ |
| 8 | Zero map not rss; diagonal distinct N(z_i)≠0 rss | n=2 | p(t)=t² repeated; distinct nonzero eigenvalues | ✓ |
| 9 | Stabilizer H_X ≅ T_{r1(X)} via (t, X⁻¹tX) | direct | (X⁻¹tX)^τ(X⁻¹tX) = X^τ(XX^τ)⁻¹X = 1 | ✓ |
| 10 | Kernel isomorphism D(H_X)→D(T) | n=1 | both kernels trivial (Z/2→Z/2 injective) | ✓ |
| 11 | RO(1_{O_E}, x)=1, n=1, x unit | volumes 1 | quotient volume 1·1/1, integrand 1 | ✓ |
| 12 | Rescaling dt by c gives RO·c⁻¹ | AA *quotient-measure* | dh→c·dh ⇒ dġ→c⁻¹dġ | ✓ |
| 13 | r_!1_{O_E}(t)=1 iff v(t) even ≥0; r_!1_{O_E^×}=1_{O_F^×} | n=1 unramified | v_F(N z)=2v_E(z); −1∈N(O_E^×) (Tau Ceti :126) | ✓ |
| 14 | RO(f,X)=Orb(r_!f, r1X) | n=1 unit test | both 1 | ✓ |
| 15 | Four form pairs for a=b=1 | F^×/N = C₂ | 2×2 = 4 | ✓ |
| 16 | Nice-match factor η(x−y)\|x−y\| negative case | x−y=π, unramified | η(π)\|π\| = −q⁻¹ | ✓ discriminating |
| 17 | BC(T_(1,0),E) = T_(2,0),F − (q−1)T_(1,1),F | n=2, from T_p²=T_{p²}+(q+1)R_p | Sat_F T_(2,0) = q(T₁²+T₂²)+(q−1)T₁T₂; q=2 gives −1 | ✓ |
| 18 | ξ_E(T_(1,0)) = T⊗1+1⊗T; Z₁Z₂ gets q⁻²; squares commute | a=b=1 | q(q⁻¹X+q⁻¹Y)=X+Y; (q^{−b/2}T)²=q^{−b}T² | ✓ |
| 19 | n=1: basis e_j, j∈ℤ; 1_{π^dO_E^×}∗e₀ = e_{2d} | g·y=N(g)y | orbits π^jO_F^×; v(N g)=−2d forces v(y)=2d | ✓ |
| 20 | Raw germ of 1_{O_F} is 1/2; shells 1 and −1 | Σ_{k≥0}(−q^{−s})^k | 1/(1+q^{−s}) → 1/2 | ✓ |
| 21 | ωG_Σ = 2^{−r}Σκ_Σ(ζ)Orb | n=1, v=1 and v=π | v=1: 1/2 = ½(1+0); v=π: G=−1/2, ω=−1, ωG=1/2 | ✓ (Xiao (8) lacks 2^{−r}) |
| 22 | Free of rank 2ⁿ; cyclic map injective, not onto | degree count | [ℂ(T):ℂ(T²)] = 2ⁿ preserved by S_n invariants; n=1 basis {1,T} | ✓ |
| 23 | Pure-form union: S is an H¹-torsor, \|S\|=2 at n=1 | n=1; S₁=∅ | 2 classes; singleton | ✓ |
| 24 | Lie descent of φ⊗1_L = ξ_F(φ)⊗1 | Jacobian | ∫du = \|det m₁\|^{b/2}\|det m₂\|^{a/2}φ^P ⇒ q^{−b/2}, q^{−a/2}; a=b=1, m₁=π: q⁻¹ | ✓ |
| 25 | Descent of 1_{M₂(O)}⊗1_L | a=b=1 | ∫1_O(u)du = 1 | ✓ |
| 26 | r_n = r_a + r_b, so the factors cancel | n=2, F[x]=F×F | 2⁻² = 2⁻¹·2⁻¹ | ✓ |
| 27 | Weil action on I_GL+I_U well defined | A+B=A′+B′ | A−A′ = B′−B in the intersection | ✓ |
| 28 | Norm kernel not additive | u=1, w=w′=1 | N(2)=4 ≠ N(1)+N(1)=2 | ✓ |
| 29 | ⟨w, n(π⁻¹O)⟩ = SL₂(F) | generators | w(π⁻¹)w(1)⁻¹ = diag(π⁻¹,π) ⇒ all of N(F) | ✓ |
| 30 | Unit-vector splitting, no division by 2 | h(w,w) unit | projection h(w,v)h(w,w)⁻¹w is integral | ✓ (transitivity unowned, R04) |
| 31 | r₋(cX) = r₊(X) | N(c)=−1 | −(cX)(cX)* = −N(c)XX* | ✓ |
| 32 | r₊!φ = φ∗e₀ | n=1, φ=1_{π^dO_E^×} | both 1_{π^{2d}O_F^×} | ✓ |
| 33 | Product-group contraction of 1_K⊗φ is φ | vol K_m = 1 | ∫_K φ(diag(h⁻¹,1)g)dh = φ(g); Ω = ω(γ₁⁻¹γ₂) | ✓ |
| 34 | Rank-shifted FL at n=1 | GL₀ trivial | BC₁(1_{π^dO_E^×}) = 1_{π^{2d}O_F^×} = φ∗e₀, ω=1 | ✓ |
| 35 | Φ_{n,d}=0 for d odd or <0; Φ_{1,2d}=e_{2d} | n=1 | v_F(det XX*) = 2v_E(det X) ≥ 0 | ✓ |
| 36 | m₀ formula and sign | Leslie uses xx^τ, r = −xx^τ | −T = cTc* ∈ K∗T, so m₀(−T) = m₀(T) | ✓ |
| 37 | Sat c_{n,d} = q^{d(n−1)}h_d; ξ_E splits degrees | exponents | ⟨λ,2ρ⟩+Σ2(i−1)λ_i = d(n−1); d(n−1)−bd_a−ad_b = d_a(a−1)+d_b(b−1); n=2,d=1: q(Z₁+Z₂)↦X₁+Y₁ | ✓ |
| 38 | Graded transfer | odd total valuation; matching | det y = det y_a·det y_b | ✓ |
| 39 | Unit FL, other pairs zero | a=b=1, (α,β)=(ε,ε) | discriminant product matches reference; Theorem 2.12 asserts RO^κ=0 there | ✓ consistent |
| 40 | Degree-one target Φ₁,₂⊗Φ₁,₀+Φ₁,₀⊗Φ₁,₂ | a=b=1 | (d_a,d_b) ∈ {(1,0),(0,1)} | ✓ |
| 41 | ξ_X(e₀)=e₀⊗e₀; ξ_X(c₂,₁∗e₀) = e₂⊗e₀+e₀⊗e₂; central q^{−2ab} | Sat(1_K)=1 | a=b=1: q⁻² | ✓ |
| 42 | Raw germ vs averaged sum (worked check) | as row 21 | 1/2 vs 1 | ✓ |
| 43 | Compact grading (worked check) | n=1, 2 | e_{2d}; degree-one sum | ✓ |
| 44 | q_E=q², \|π\|_E=q⁻²; torus measure c ⇒ c⁻¹ | conventions | as rows 12 and 37 | ✓ |

**Lean.** Elaboration is not available (this lane does not elaborate). No Suggested.lean exists at the design stage, so the `#check @name` comparison was not run. The one-tactic probe was decided by reading the pinned library (R14).

**Manifest.** This review's fetches recorded five entries, and `sources check` reports 0 problems. Project Euclid served a bot-block page for Hironaka99. I removed that entry, which this review had created, and re-fetched the J-STAGE copy, completing its authors, title, year and DOI.

## Not verifiable

- **Leslie25 in Annals 201 (2025), 551–645, and BP21 in Duke 170.** The published versions are paywalled. Every locator was checked against the arXiv v3 texts the README names; the README itself says the published PDF was not compared.
- **Hironaka99 normalization (pp. 570–571).** The OCR of formulas (2.5)–(2.6) is garbled. Theorem 2 and the rank-2ⁿ statement are legible (PDF p. 19). The exact constants of the normalization H(e₀)=1_K could not be read.
- **Leslie25 Part 2 (Sections 6–10).** Only Theorem 11.1, Lemma 11.2 and §11.2 were read; the global proof was not re-derived. It is not load-bearing for this review, since the finding is about ownership.
- **Jacobowitz 1962, Shalika 1972, Zhang 2014 and Rogawski 1990.** These are paywalled or not fetched. They are recommended as locators only as cited by Leslie25 and Leslie19.
- **The sign conventions behind E12.** The difference between Leslie25 p. 38 and Xiao18 Theorem 6.1 was confirmed, but which Jacquet–Langlands normalization explains it was not settled.

## Source issues

- **Misprint** in Leslie25 at Lemma 1.8, p. 12: the source says the centralizer is taken in U(W) although δ lies in Herm(V); it should be U(V); affects nothing.
- **Misprint** in Leslie25 at §2.2.3 after Remark 2.8, p. 19: the source says the datum has embedding η; it should be the embedding ξ of the fixed datum; affects nothing.
- **Misprint** in Leslie25 at §3 introduction, p. 22: the source says the reduction is an unresolved proposition label; it should be Proposition 3.12, p. 30; affects nothing.
- **Misprint** in Leslie25 at Lemma 3.1, p. 23: the source says the modular character of P(a,b)(E) uses F-absolute values of E-determinants; it should use the normalized absolute value of E; affects nothing.
- **Misprint** in Leslie25 at (3.8) and proof of Lemma 3.11, pp. 28–29: the source says densities and pushforwards are evaluated at x·x^τ; it should say r(x) = −x·x^τ, harmless because −1 is a unit norm when E/F is unramified; affects nothing.
- **Misprint** in Leslie25 at §4.1.2, p. 32: the source says the unitary invariants use powers of x; it should use powers of the Hermitian variable y; affects nothing.
- **Misprint** in Leslie25 at §4.1.4, p. 33: the source says the embedding's upper-left block is x; it should be y; affects nothing.
- **Misprint** in Leslie25 at Remark 4.4, p. 35: the source says the appendix author's name with a wrong letter; it should be Gordon; affects nothing.
- **Error** in Xiao18 at Theorem 4.7, (8), p. 21, copied as Leslie25 Theorem 4.7, p. 36: the source says the nilpotent integral equals the full character sum after inverting (7); it should carry the factor 2^(−|S1|) of Fourier inversion on (ℤ/2)^S1; affects a stated result.
- **Gap** in Leslie25 at Proposition 4.8, p. 37: the source says the hypothesis is for spherical functions in rank n; it should cover ranks a and b too, since the proof uses them; affects nothing.
- **Misprint** in Leslie25 at proof of Proposition 4.8, p. 38: the source says the upper augmented test is φ⊗1_Λ, evaluating to φ; it should be (φ∗1₀)⊗1_Λ, evaluating to φ∗1₀; affects nothing.
- **Gap** in Leslie25 at proof of Proposition 4.8, p. 38: the source says four-form signs depend on the number of split forms, while Xiao18 Theorem 6.1, p. 23, uses the second form only; it should supply a convention conversion; affects nothing.
- **Error** in Leslie25 at proof of Proposition 4.8, p. 39: the source says base change of a spherical function is supported on cosets with all coweight entries even; it should say only that the Satake squares commute, since BC(T_(1,0)) on GL₂ has −(q−1)T_(1,1); affects the proof.
- **Error** in Leslie25 at §5.1, p. 40: the source says the Hermitian Fourier kernel is ψ of the norm of ⟨u,w⟩, with argument x; it should be ψ(Tr⟨u,w⟩) with argument y, as in BP21 §3, p. 5; affects the proof.
- **Gap** in Leslie25 at proof of Proposition 5.2, p. 43: the source says the Weyl element acts on the defect through the intersection of the orbital-image spaces; it should extend the agreeing actions to their sum, as BP21 §4, p. 8 does; affects the proof.
- **Gap** in Leslie19 at proof of Proposition 4.5, p. 15: the source says that multiplying by the nonsingular-locus indicator gives compact support there; it should use a determinant-valuation cutoff equal to one on det(supp r_!f), as Proposition A.3 needs; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "80a66cc", "job": "REV-DESIGN-EndoscopicTransferAndUnitaryTraceComparisonPartII", "model": "opus", "worker": "fable-rev9"} -->
