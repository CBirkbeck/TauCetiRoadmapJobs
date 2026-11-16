# Review of GrossZagierAndArithmeticHeightsPartII (pull request #2457 at f947271)

**Verdict:** accepted

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: §5.4 now reads "(LL2 Lemma 2.32, p. 23, with its proof, p. 24, for t ≠ 6; for t = 6, where ²D₃ = ²A₃, the unitary case of Lusztig76 7.3 with 6.1; …)". Layer 5 Dependencies and Source corrections now match it.
- R03 — repaired: §9.8 reads "(Zha12 §2.2, p. 206, for the setting; Theorem 2.10, p. 211, and Theorem 5.5, p. 250, for his Conjecture 2.9, p. 210)". References read "§2.2, pp. 206–210; Conjecture 2.9, p. 210; Theorem 2.10, p. 211; Remark 11, p. 245; Theorem 5.5, p. 250".
- R04 — repaired: the description now reads "`Suggested.lean` declares nothing: no headline theorem is statable at the pins…" and "Validation: the targeted Lake build succeeds with no warning".

## Verified sound

| Statement | Instances tried | Values computed (target side / check side) | Result | Change |
|---|---|---|---|---|
| 5.4 eigenvalues, t = 6 (²A₃ = U(4)) | twisted Coxeter s₁s₂ composed with w₀ in S₄; Lefschetz count over F_(q²) | Cycle type (3,1). Nonzero characters: (4), (2,2), (1⁴), of degrees 1, q²(q²+1), q⁶. Eigenvalues q⁴, q², 1 in degrees 4, 3, 2, matching q^(2j) in degree j+2. | holds | none |
| 5.4 Euler characteristic, t = 6 | closed stratum is the Hermitian surface of degree q+1; remove its (q³+1)(q²+1) points and (q+1)(q³+1) open lines | χ(S) = q³−q²+q+3 gives χ_c(open) = q⁶−q⁴−q²+1. The Lusztig side gives q⁶ − q²(q²+1) + 1, the same value. The F²-trace sum is 0, so there are no F_(q²)-points. | holds | none |
| 5.4 eigenvalues, t = 4 and t = 8 | ℙ¹ minus q²+1 points; LL2 line 1188 at t = 8 | t = 4: H¹_c has dimension q² and eigenvalue 1; H²_c has eigenvalue q². t = 8: {1, q², q⁴, q⁶} in degrees 3–6. Both match the formula. | holds | none |
| 5.4 locator: LL2 Lemma 2.32 | statement and proof cases | Statement at line 1168, p. 23. The proof (lines 1185–1187, p. 24) treats t = 2, 4 and t > 6. The case t = 6 is now sourced separately. | holds | none |
| 5.4 / Layer 5: ²D₃ = ²A₃ | Dynkin diagrams; Coxeter-variety dimension | The D₃ graph swap of α₂, α₃ is the end-flip of A₃. Spin⁻₆(q) ≅ SU₄(q). F-orbits on simple reflections give dimension 2 on both sides, which is t/2 − 1 at t = 6. | holds | none |
| 9.8 group AFL, n = 2 | F₀ = ℚ₃, γ = ((−26,1),(−675,26)), e = (0,1)ᵗ | γ² = 1, v(−675) = 3, ω = 1. Raw orbital integral 1−3^s+9^s−27^s: value 0, derivative −2·log 3. Zha12 Theorem 2.10 gives Int = (3+1)/2 = 2. | holds | none |
| 9.8 n = 1 emptiness | S₁ = F^1, GL₀ trivial | For every γ, Orb = 1 ≠ 0 and ω = η̃(1) = 1. No γ matches the nonsplit V₁. | holds | none |
| 9.8 Zha12 locators | §2.2, Conjecture 2.9, Theorem 2.10, Remark 11, Theorem 5.5 | Lines 347/348 (p. 206), 521 (p. 210), 538 (p. 210, artinian), 547 (§2.3 starts, p. 210), 578 (p. 211), 1968 (p. 245; its [16] is KR, line 2237), 2181 (p. 250). | holds | none |

The rows for untouched statements stand as in the previous review, of `eb24852`.

- Source locators: 11 checked against 3 cached texts. LL2: lines 1168, 1185–1191 and 1339. Zha12: lines 22–23, 347–355, 521, 538, 578, 1968 and 2181. LZ: line 1007, the form of the Lusztig citation. All are correct.
- Seeded sample: no sampled target falls in the changed passages (§§5.4, 9.8, Layer 5 Dependencies, Source corrections, References). §§5.5 and 5.6 depend on §5.4 only through its statements, which did not change.
- Cross-roadmap citations in the changed passages: PELModuliPartII §3.7 resolves at head d85737d (line 919: strata, dimension t(Λ)/2 − 1, incidence by vertex sums). GrossZagierAndArithmeticHeights §7.2 resolves at head 9d72f01. ComplexMultiplicationAndExplicitReciprocityPartII at head 8c1992c still has no citation of §12.6a(e), so D01 stands.
- Pinned library: the change touches no library declaration.
- Gate rerun at this head: every check 0, OK. Depcheck: "depcheck: 262 roadmaps, 2545 edges, 0 problem(s)". This roadmap sits at merge-order position 380. The outside-folder diff is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file is unchanged since `eb24852` and declares nothing, so there are no signatures to `#check` and nothing to probe for padding.
- The pull request's title and description agree with this head. The change alters no layer, heading, headline or supplier that they describe.
- Remark on untouched text: LL2 Lemma 2.32 is stated for d > 0, while §5.4 says d ≥ 0. The extra case d = 0 holds trivially on a connected stratum.

Overlap check: read PELModuliPartII §3.7 at its head and ComplexMultiplicationAndExplicitReciprocityPartII at its head. PELModuliPartII owns the exotic strata, their dimensions and their incidence, and §5.4 cites it. GSpin divisors and generic-fibre Borcherds products have two owners; that is deferred as D01. The changed passages share nothing else, and the other closest roadmaps stand as in the review of `eb24852`.

Source independence: changed passages only. 6 passages compared with 2 sources: §5.4 and the Source-corrections bullet against LL2 lines 1168–1191; Layer 5 Dependencies against LL2 line 1187; §9.8 and the Zha12 reference against Zha12 lines 347–355 and 536–546; the Lusztig76 reference against LZ line 1007. None shares more than formulas and type names. Largest share of locators: Z, 63 of 324. The count at `eb24852` was 322, and the change adds one LL2 locator and one Lusztig76 locator. Contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Lusztig76 (uncertified, paywalled, DOI 10.1007/bf01408569): the case of 7.3 covering ²A₃ and Theorem 6.1 were not read. Instead, the §5.4 eigenvalue claim at t = 6 was checked by the computations in the table.

## Source issues

- **Gap** in LL2 at the proof of Lemma 2.32, p. 24: the source treats the strata of type 2, 4 and greater than 6 only; it should also treat type 6, where the Coxeter variety is of type ²D₃ = ²A₃; affects the proof.

## For the human reviewers

- Scope: the Krämer identity (§8.7) and the modified arithmetic Siegel–Weil formula (§13.10) are headlines stated in rank n ≥ 4 under the hypothesis (H_n) (README line 1169), which the README says no published argument proves. K Lemma 9.6 fails as stated (K lines 3934–3970).
- Scope: §14.5 asserts less than Z Theorem 15.1. It excludes the group version at p = n ≥ 5 because of the gap in Z's proof of Proposition 4.12(i) (Z line 1313; README line 2008).
- Sources: LRZ (arXiv 2404.02214v2, References line 2073) is cited as a preprint with no journal reference. It supplies the integral geometry of §4.2, which the headline §4.5 uses.
