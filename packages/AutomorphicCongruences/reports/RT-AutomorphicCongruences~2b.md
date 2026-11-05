<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/129#issuecomment-6637388726 -->
Red team round 2 pass b (claude) of c88704a

Verdict: needs_changes

1. **F01** (P2) ShimuraCompactifications §§C5.3, C5.15, C5.16 do not exist at the supplier's head

   Location: `README.md:18` ("ShimuraCompactifications, §§C5.3, C5.15, C5.16"), `README.md:89` ("§C5.3 (integral toroidal compactifications), §C5.15 (Fourier–Jacobi expansions of Hodge-line sections) and §C5.16 (the integral minimal compactification)"), and the citations at lines 429, 459, 713, 752.

   Claim: the three sections are supplied by ShimuraCompactifications under those numbers.

   Witness: at the open head of ShimuraCompactifications (pull request 1053, head f51ec79) Layer 5 "general-data maps and correspondences" has the single section §5.1, and no heading carries a "C" prefix; the three statements are "### 7.3 Integral toroidal compactifications", "### 7.15 Fourier–Jacobi expansions of Hodge-line sections" and "### 7.16 The integral minimal compactification" in Layer 7 "integral PEL compactifications" (same titles). Round 1 resolved these against the earlier head 63e3f03.

   Repair: replace "§§C5.3, C5.15, C5.16" by "§§7.3, 7.15, 7.16" at line 18, "§C5.3 … §C5.15 … §C5.16" by "§7.3 … §7.15 … §7.16" at line 89, and "ShimuraCompactifications §§C5.3 and C5.16" by "ShimuraCompactifications §§7.3 and 7.16" at lines 429, 459, 713 and 752.

2. **F02** (P2) AutomorphicBundles §§B5.1a, B5.7, B5.14, B5.15 do not exist at the supplier's head

   Location: `README.md:18` ("AutomorphicBundles, §§B5.1a, B5.7, B5.14, B5.15"), `README.md:89` ("§§B5.1a and B5.14 (scalar and vector Fourier–Jacobi expansions) and §§B5.7 and B5.15 (joint injectivity at component-detecting cusps)"), and lines 429, 459, 713, 763, 1208.

   Claim: these four sections supply the classical Fourier–Jacobi expansions and the joint injectivity at component-detecting cusps.

   Witness: at the head of AutomorphicBundles (pull request 1069, head fd74684) Layer 5 is "canonical and subcanonical boundary extensions" (§5.1 "Coefficients on degeneration charts", §5.7 "The logarithmic full-group extension"); no heading carries a "B" prefix. The cited content is Layer 12 "Hecke action and Fourier expansions": §12.2 "The torsor-level description of the scalar expansion", §12.8 "Joint injectivity at a component-detecting collection of cusps", §12.15 "Fourier–Jacobi expansion with vector coefficients", §12.16 "Expansion principle for locally free automorphic coefficients".

   Repair: cite "AutomorphicBundles §§12.2 and 12.15 (scalar and vector Fourier–Jacobi expansions) and §§12.8 and 12.16 (joint injectivity at component-detecting cusps and the expansion principle)" at line 89, and "AutomorphicBundles §§12.2, 12.8, 12.15 and 12.16" at lines 18, 429, 459, 713, 763 and 1208, after the repair worker confirms the four titles at fd74684.

3. **F03** (P2) OrdinaryAutomorphicFormsAndModularityLifting §§3.28–3.29, 4.13–4.16, 5.6 and "Layer 4 (R = T)" do not exist at the supplier's head

   Location: `README.md:145` ("Import OrdinaryAutomorphicFormsAndModularityLifting §§3.28–3.29 (nearly ordinary deformation data and presentations), §§4.13–4.16 (R = T at nice primes) and §5.6 (Skinner–Wiles ordinary modularity lifting)"), `README.md:1711` ("the nice-prime R = T of OrdinaryAutomorphicFormsAndModularityLifting §§4.13–4.16"), and the gap pointer "Layer 4 (R = T), with §§3.28–3.29" (the brief's gap list and `design/plan.json`, `"section"` of gap:fujiwara-minimal).

   Claim: the supplier plans these sections and its Layer 4 is an R = T layer on which gap:fujiwara-minimal is announced.

   Witness: at the head of OrdinaryAutomorphicFormsAndModularityLifting (pull request 1066, head 61b27fa) Layer 3 "Local deformation refinements and the unit-rank bound" has §§3.36–3.39, Layer 4 "Commutative-algebra inputs and solvable descent" has §§4.3, 4.6a, 4.20, Layer 5 "Conditional lifting and arithmetic inputs" has §§5.1, 5.1a, 5.3 ("Skinner–Wiles Theorem B"), 5.8, 5.9, 5.10; the only "3.28" is SW99's Lemma 3.28 quoted in §2.10. Its scope says ClassicalSerreModularity §I.1 owns the Skinner–Wiles route. Round 1 resolved the citations against head faca0d2.

   Repair: at line 145 write "Import OrdinaryAutomorphicFormsAndModularityLifting §3.39 (ordinary deformation and tangent refinements) and §§5.3 and 5.8 (Skinner–Wiles ordinary modularity lifting, conditional on its Hypothesis H and component support)"; delete the clause "§§4.13–4.16 (R = T at nice primes)" and at line 1711 replace "the nice-prime R = T of OrdinaryAutomorphicFormsAndModularityLifting §§4.13–4.16" by "the conditional Skinner–Wiles lifting of OrdinaryAutomorphicFormsAndModularityLifting §§5.3 and 5.8"; set the gap's section to "Layer 5 (conditional lifting), with §3.39" in `design/plan.json` and wherever the README states it. The repair worker confirms the three titles at 61b27fa.

4. **F04** (P3) The "IG." layer prefix of IgusaVarietiesAndTorsionConcentration does not exist at its head

   Location: `README.md:93` ("Hecke algebras of Layer IG.0 and the Igusa towers of Layers IG.1–IG.2"), `README.md:95` and `design/plan.json` ("section": "Layers IG.1–IG.2").

   Claim: the supplier's layers are labelled IG.0–IG.2.

   Witness: the head of IgusaVarietiesAndTorsionConcentration (pull request 1090, head 5447ef6) contains no string "IG."; its layers are "Layer 0: Unitary data, Hecke algebras, p-divisible groups and central leaves", "Layer 1: Igusa towers, actions and cohomology", "Layer 2: Partial compactifications and cusp geometry" (contents as cited).

   Repair: write "Layer 0" and "Layers 1–2" at lines 93 and 95 and in the gap's section field.

5. **F05** (P3) Page locators into versions that were not read: BCS-published and LLZ14 (Annals)

   Location: `README.md:1709, 1922, 1940, 1957, 2103, 2119, 2137, 2169, 2185, 2202, 2223, 2240, 2257` ("[BCS-published](…/BCS-print.pdf), … p. N"), `README.md:1032` ("LLZ14, Lemma 6.8.9 and Corollary 6.8.10, p.736"), `README.md:2322`, `sources.toml:208` ("numbering agrees, pages differ").

   Claim: the published BCS pages and the Annals page of LLZ14 locate the cited statements.

   Witness: `sources.toml` records BCS only as arXiv v2 (fetched_from arxiv.org/pdf/2405.00270v2, sha256 bf87592c…) and LLZ14 only as arXiv:1212.4056v2; no file in the sources cache contains the author copy, and `version_note` asserts a page difference of a text that was not fetched. This is the class repaired for NAK in round 1 (b-F06).

   Repair: either fetch `https://web.math.ucsb.edu/~castella/BCS-print.pdf` through the sources service with `--licence-class author-page`, record its sha256 on the BCS key and keep the page locators; or replace each "BCS-published, p. N" by the arXiv v2 locator the README already gives for the same statements (Thm 1.1.2 and its proof pp. 2 and 10; Hypothesis 3.1.1 and Thm 3.2.1 p. 7; Lemma 5.1.1 p. 9; Prop. 5.2.1 and Lemma 5.2.3 pp. 9–10; (5.4) p. 10) and delete "numbering agrees, pages differ". For LLZ14 write "arXiv v2, p. 58" or fetch the Annals PDF linked at line 2331 and record it.

6. **F06** (P3) Checks blocks that contain no computed test

   Location: `README.md:1875–1878` (§5.8: "A trace congruence alone is not used …"; "The scalar Selmer term … are not suppressed"; "A two-character rank-two Ribet theorem does not supply …"), `README.md:1928–1930` (§5.11: "No assertion that tensor product commutes …"; "No replacement of a normal Hida branch …"; "A map applied to a divisorial ideal is not used …"), and single reminder bullets at lines 983 (§2.12), 1783 (§5.4), 1947 (§5.12), 1963 (§5.13), 1993 (§6.1), 2127 (§7.2), 2229 (§7.8).

   Claim: these bullets test the targets.

   Witness: each holds equally for the stated target and for its wrong variants (a reversed inequality, a specialized majorant with zero image); none evaluates a value. Round 1's a-F13 replaced 30 such blocks but did not list §§5.8 and 5.11.

   Repair: move the reminders into the "Assume" paragraphs and replace them by: §5.8 — "Degree count at v | p: tr σ(1) = 1 + 2 + 1 = 4 and the plus pieces have ranks 1, 1, 2, so Ch(σ⁺,x,T) has degree 2 = deg Ch(ρ⁺,x,T)(1 − χ(x)T); a plus piece of rank 3 fails (7). Orientation: ord_P(𝔈_D) = 2 with scalar Selmer valuation 0 gives ord_{P_0}(char X^Σ) ≥ 2; scalar valuation 1 gives only ≥ 1 through §0.7(iv); valuation 2 gives nothing." §5.11 — "For A = O[[X,Y]], φ: X ↦ 0 and X = A/(X+p) ⊕ A/(X,Y): Ch_A(X) = (X+p) (the second summand is pseudo-null), f = X + p, φ(f) = p ≠ 0, and X/XX ≅ O[[Y]]/(p) ⊕ O[[Y]]/(Y) has characteristic ideal (pY) ⊊ (p) = (φ(f)): the pseudo-null summand reappears after specialization and the containment is strict. With f = X, φ(f) = 0 and nothing is concluded." The seven single bullets may simply be moved out of their Checks blocks.

Round 2. The whole of `packages/AutomorphicCongruences/README.md` (2356 lines, 92 targets, 93 Checks blocks, 17 declared gaps) and `packages/AutomorphicCongruences/Suggested.lean` (62 lines, no declaration) were read line by line. Every cross-roadmap section citation was re-resolved against the supplier as it is today (main, Completed, or the head of its open pull request through `roadmaps show`); three suppliers were renumbered since round 1 and their citations no longer resolve (S01–S03). No mathematical falsity was found; the round-1 repairs are in place and introduced no new error.

## Round-1 findings at this head

| Finding | Status | Witness at c88704a |
| --- | --- | --- |
| a-F01 (P1) lattice bound loses spanning | repaired | `README.md:329`: "if moreover N′ = 0 and the orbit module spans, ℒ ⊗_A Frac(A) = M, then ord_P Ch … ≥ ord_P(J), because spanning gives Fitt_R(N) ⊆ I (SU Lemma 4.3.10(iii))"; (iii) now needs spanning or SU Lemma 4.3.11; negative control at line 350. The deduction is sound: Fitt_A(N)·R ⊆ Fitt_R(N) ⊆ I gives Fitt_A(N) ⊆ I ∩ A = J, and over the DVR A, Fitt_A(N) = (ϖ^{ℓ(N)}). SU §4.2.3 (SU lines 1856–1876) indeed assumes nothing on the irreducibility of σ, so the split datum is a datum. |
| a-F02 (P1) Yager coefficients | repaired | `README.md:1116`: "let Ô_∞ be the p-adic completion of ⋃_m O_(K_m), the ring of integers of ℚ_p^(ur,p)"; S ⊆ Ô_∞[[U]], ρ(d) ∈ Aut(F ⊗ Ô_∞); Check at line 1120 (W(𝔽₉) excluded). |
| a-F03 (P3) β Check converse | repaired | `README.md:1757`: "vanishes whenever f_(κ0) sits at W = 0 … for T = γ_cyc − c … β(W·T) = 0 although w(κ0) may be p ≠ 0". |
| a-F04 (P2) CW standing hypotheses | repaired | `README.md:1030`: "p > 3 …; 𝕀 regular and finite flat over O_L[[T]]; … trivial tame character …; ρ̄_𝐟 irreducible with ε̄ ≠ δ̄ on D_p …; discriminant prime to Np"; the FW form is an owned target; 11a1/p = 5 Check at line 1053. |
| a-F05 (P2) circular order | repaired | §2.10 ends "its factorization and its integrality are proved in §2.11" (line 909); §2.11 Needs §2.10 only (line 951). §5.3 (line 1740) names §5.4 "whose construction does not use this subsection", Needs lists §5.4 (line 1760); §5.4 Needs §§1.1, 1.2, 5.2 (line 1789): no cycle. |
| a-F06 / b-F05 (P3) dangling identifiers | repaired | lines 1528 ("dual trivialization of §4.1"), 1541 ("parity argument … recorded in the Layer 3 Examples and applied in §4.5"), 1584 ("determinant/characteristic criterion of §3.4, as applied in §3.10"); no `GenMC`, `fw-pointwise-theorem` or `integrality-of-universal-trivialization` remains. |
| a-F07 (P1) imprimitive (NV2) | repaired | `README.md:1740–1742`: (NV2) on L^(−) = L^(Σ,−)·∏(E⁻_(q,v))⁻¹, μ(L^(Σ,−)) = Σ ord E⁻ over nonsplit q; witness Check at line 1753. Recomputed: a_113(11a1) = 9, factor ((114)²−81)/113² = 12915/12769, v₇(12915) = 1, residue 4 − a² ≡ 0 mod 7. |
| a-F08 (P2) underived base change | repaired | `README.md:1383`: "z_(Σ,n)(ρ_x) is z_(Σ,n)(ρ^u) ⊗ A composed with the natural map H¹(C) ⊗_R A → H¹(C ⊗ᴸ_R A); … injective with cokernel H²(C)[f]"; §4.8 line 1635 likewise; k[[X]] Check at line 1393. |
| a-F09 (P3) §5.2 Checks | repaired | lines 1732–1734: ℓ² = 5ℓ; periods 2, 1, 2/5 (recomputed). |
| a-F10 (P3) Nakamura locators | repaired | lines 1410 "(68)–(76), pp. 71–74", 1414 "(77), p. 78", 1682 "(93), p. 84" and "(91)–(92), pp. 82–83". |
| a-F11 (P1) Betina–Williams supplier | repaired | gap:bianchi-p-irregular-l-functions at line 119, identical `needs` in `design/plan.json`; §2.20 Needs lists it (line 1160). 17 slugs in both files. |
| a-F12 (P3) docstring inventory | repaired | `Suggested.lean:44–58` names §§0.7, 2.4/2.6/2.12, 2.19, 3.2, 3.7 with their missing carriers. |
| a-F13 (P3) reminder-only Checks | repaired for the 30 listed blocks | spot-checked §§1.9, 2.2, 2.7, 2.9, 2.13, 2.16, 2.18, 2.21, 3.2, 4.1, 4.5, 7.3: computed Checks present and recomputed (values below). Blocks not in that list are S06. |
| a-F14 (P3) BSD scope | repaired | `README.md:1576`: "FW Cor. 5.4 … is a source consequence outside this roadmap's scope"; §3.10 Check line 1479 agrees; line 2311 unchanged. |
| b-F01 (P3) line-number locators | repaired | `README.md:423` "(SU §2, author-copy p. 13)"; line 117 "integral period comparison in the proof of Wan-2015 Proposition 96, p. 80"; plan.json `needs` identical. |
| b-F02 (P3) SU journal number | repaired | `README.md:844`: "(SU Thm 7.3.1, p. 103, cited by CLW as [SU14, Theorem 7.5] in the journal numbering; Harris Thm 2.5.6)". |
| b-F03 (P3) HT94 Thm 0.1 | repaired | `README.md:384`: "HT93 Theorem I and HT94 Theorem 0.2 prove the opposite divisibility …; HT94 Theorem 0.1 is the rational divisibility of the anticyclotomic characteristic series by the Katz function". |
| b-F04 (P3) Nakamura condition (b) | repaired | `README.md:1662`: "condition (a) of NAK-v2 Thm 5.2, p. 75"; "condition (b) of NAK-v2 Thm 5.10(4), p. 79"; source line 1664 matches. |
| b-F06 (P3) unread versions | partly repaired | NAK: every published-version claim is gone (only "the untilde π of that version", line 1319, a harmless residue). CGS23: v2 fetched and recorded with its sha256 (`sources.toml:262`). BCS-published and LLZ14's Annals page were not treated: S05. |

No repair introduced a new error: the re-stated §0.7(ii)–(iii), §2.19 coefficient ring, §5.3 μ formula and the 30 replaced Checks were recomputed (table below) and agree with their sources.

## Verified sound

- Declarations read: 0 (`Suggested.lean` declares nothing; single `import Mathlib`, no `set_option`, no `lemma`, no `sorry`, namespace `TauCetiRoadmap.AutomorphicCongruences`; the `#check @name` comparison is vacuous). Headline inventory (§§1.10–1.11, 2.7–2.8, 2.14, 2.20–2.22, 4.3, 4.5, 5.10, 6.6, 7.9–7.10 and the owned deep intermediates) re-checked against the pins: no Iwasawa Selmer group, characteristic ideal of an Iwasawa module, p-adic L-function, deformation ring or zeta morphism exists at Mathlib 6b7abb3 / Tau Ceti a91d3aa, so nothing statable is absent and nothing is padding.
- Targets read: 92 of 92, all four Examples blocks, Conventions, supplier contracts, consumers, References.
- Pinned declarations re-grepped at the pins (9 of 9): `TauCeti.Multiquadratic.oddPrimeDiscriminant` (NumberTheory/Multiquadratic/Cyclotomic/GaussSum.lean), `NumberField.ncard_primesOver_multiquadratic_iff`, `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`, `TauCeti.fittingIdeal` (RingTheory/FittingIdeal/Basic.lean:343), `TauCeti.ContCohomology.H1`, `Matrix.coeff_charpolyRev_eq_neg_trace`, `RingHom.quotientKerEquivOfSurjective_apply_mk` (Ideal/Quotient/Operations.lean:93), `Ideal.span_singleton_mul_left_unit` (Ideal/Span.lean:100), `Module.length`.
- Dependency check, exact output: `depcheck: 208 roadmaps, 1734 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). `git diff --stat origin/main...HEAD` touches only `packages/AutomorphicCongruences/` (11 files). No pull-request number or process word in README or docstring; `grep` finds no `lemma` declaration and no `set_option`.
- Gaps: 17 slugs in `design/plan.json` = 17 "What … must provide (gap:…)" lines, every `needs` identical to the README (bianchi gap compared verbatim); each has a named supplier and a precise `needs`; none asks for what a supplier plans (PadicFamilies Layer 4 ends at §4.9 with no Katz, anticyclotomic or Bianchi p-irregular function; PadicMeasuresIwasawaAlgebras §4.6 states `charIdeal` only when A is factorial; CompletedCohomologyAndLocalGlobalCompatibility §4.7 assumes End(ρ̄_p) = k and gives a non-example for split ρ̄_p; EulerSystemsCyclotomicMainConjecture Layer 3 has no imaginary-quadratic analogue).
- Sibling citations: about 165 section and layer identifiers from the contracts and `*Needs:*` lines resolved against the headings dumped from each supplier at its current head (34 suppliers: on main PadicMeasuresIwasawaAlgebras, EllipticCurves, ProfiniteCohomology; Completed NumberFieldArithmetic, LocalGaloisGroups, ProfiniteArithmetic; pull requests 869, 858, 1310, 966, 1053, 1069, 1090, 1063, 924, 925, 1006, 1066, 920, 923, 1034, 1270, 1312, 1688, 1071, 1020, 1013, 1498, 1272, 1311, 968, 1306, 1039, 1487, 1689, 1019; KatoEulerSystems at the head given in the brief). 147 resolved with the cited titles (PadicFamilies §§4.0.1–4.0.3 are `####` subsections of §4.0; NumberFieldArithmetic §1.1 is "#### 1.1 The relative splitting criteria"; IntegralIwasawaTheory §12.1 states `wilesMainConjecture`; KatoEulerSystems §4.3 states the odd-p, irreducible, free-rank-one-quotient integral bound at every height-one prime and §7.4 Col(c) = r_E L_(E,N) with the unit condition p ∤ r_E ∏ ℓ_q(q⁻¹), as the README says). 18 did not resolve: S01–S04. The two consumers cite this roadmap as described (ModularIwasawaMainConjectures §§1.11, 2.21, 3.4, 3.7–3.9, 4.3, 4.5–4.6, 7.9–7.10 through gap:automorphic-endpoints; HeegnerPointEulerSystems gap:primitive-toric-mu).
- Suppliers' hypotheses re-read where the README restates them: CompletedCohomologyAndLocalGlobalCompatibility §4.7 (p ≥ 3, End(ρ̄_p) = k, ρ̄_p ≇ χ ⊗ (1 ∗; 0 ε)); PadicLocalLanglandsForGL2Qp §§5.8–5.9 (p ≥ 3, End(ρ̄) = 𝔽, neither cyclotomic orientation); both match lines 153 and 1220.
- Locators verified against the cached texts (36): SU §4.2.3 data (1)–(5) and (4.2.3.a), Lemmas 4.3.3, 4.3.10(i)–(iii), 4.3.11, Prop. 4.5.6, Cor. 4.5.7, Prop. 4.5.8, Thm 7.3.3 (i)–(ii), Thm 7.3.5 with the four characters on p. 107, Prop. 12.3.6 with its five hypotheses; FW Thms 1.6, 1.7, 1.13, 4.38, 4.41 (1)–(5), Def. 4.24 (1)–(4), Thm 5.1 (Γ₀(Np^r), hypotheses 1–3, μ nontrivial only when ρ̄_f|G_Qp is irreducible), Thm 7.32; CLW §5.2 (including "if 2 does not split in K then π is ramified at 2"), Thm 8.2.1 (1)–(2) with the three extra conditions of (2), (1.0.1) and the definition T_(π,K,ξ) = T_π(ε²_cyc)|_(G_K)(ξ⁻¹) ⊗ ℤ_p[[Γ_K]](Ψ_K⁻¹); CLW-addendum §3 (choice of η₁, η₂, η₃, ν_i, μ_i), (4.0.2)–(4.0.4) (data set 1 makes L_(2,1), L_(5,1), L_(6,1) units, data set 2 makes L_(1,2), L_(2,2), L_(5,2) units, L_(1,1) ≠ 0 ≠ L_(6,2)); BCS Thm 1.1.2 (a)–(b) with (im), Thm 4.1.3 (p ∤ 2N, (spl), (D_K,N) = 1, (irr_K), both directions, before inverting p), Prop. 4.2.2 (p > 2, (disc), (Heeg), (spl), (irr_K)), Thm 3.2.1 (p > 3); Hsieh2014 Theorems A–C hypotheses (p. 712–713); Wan-2015 Theorem 3 and Theorem 86 (both printed "p > 5"), Definition 85 ((NV2) on the Σ-imprimitive function, as the README says), Theorem 86 (1)–(3) and the stabilizer argument excluding p = 3 only; Wan-2020 Thms 1.1 (a)–(g) and 1.2 (a)–(d); CW Thms 3.6 and 3.8 (i)–(iii).
- Checks tested by computation: 25 (table below), all agreeing with the README.

### Adversarial pass

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.7(ii) spanning clause | R = A[x]/(x²−p³), I = (x,p³), J = (p³), L = A[x/p] | IL = p²A + pA·(x/p); ℓ_A(L/IL) = 2 + 1 = 3 = ord(J); in general Fitt_A(N)R ⊆ Fitt_R(N) ⊆ I ⇒ Fitt_A(N) ⊆ J | holds |
| §0.7 negative control (line 350) | K = ℚ(i), p = 5, Σ = {2,5,∞}, S-units 1+i, 2±i | valuations kill 2±i at the two primes over 5; (1+i)⁴ = −4 = 1−5 generates 1+5ℤ₅, so (1+i)⊗5⁻ⁿ is locally nontrivial; Selmer = 0, ord(J) = 1 | bound fails without spanning, as stated |
| §0.3(ii) when f ∈ 𝔞 | Fitt(X) ⊆ (f) ⊆ 𝔞 | Fitt(X/𝔞X) = 0 ⇒ X/𝔞X not torsion ⇒ Ch = 0 by SU's convention; "0 divides 0" | consistent |
| §0.3 Check | A = ℤ_p[[T]], X = A/(p,T), 𝔞 = (T) | Ch_A(X) = A; X/TX = 𝔽_p, Ch = (p); (1) ⊇ (p) | direction as stated |
| §1.1 Check | p = 3 | |GL₂(𝔽₃)| = 8·6 = 48, 48² = 2304; torus 2⁴ = 16; UV ≠ VU | agrees |
| §2.2 Check | ℤ_p[[ℤ_p^×]] | ℤ_p[X]/(X^{p−1}−1) ≅ ℤ_p^{p−1}: p − 1 components, 4 at p = 5 | agrees |
| §2.4 Σ-independence | prime 2, Satake (i,−i)³, pairings 1 | ζ₂(2) = 4/3; L₂(1/2,Π,r) = (3/2)⁻⁴ = 16/81 (four products i, four −i); L₂(1,Ad) = (8/9)³ = 512/729; J₂ = (16/9)(16/81)(729/512) = 1/2; omitted factor 2 | both sides fixed |
| §2.7 coefficient ring | CLW (8.2.1) prints ⊗_{O_L[[Γ⁺_K]]} R | X ⊗_{O_L[[Γ⁺]]} O^ur[[Γ_K]] is a module over O^ur[[Γ⁺]][[Γ⁻ × Γ⁻]], two anticyclotomic variables; the README's ⊗_A is the intended localization | README reading correct (source misprint below) |
| §2.10 Lemma 7.20 | (k,m,κ) = (2,0,6) | Γ(5)Γ(6) = 24·120 = 2880; 2^{−18+1} = 2⁻¹⁷; π^{1−12} = π⁻¹¹; i^{2−6−1} = i⁻⁵ = −i | agrees |
| §2.12 unit assignments | addendum (4.0.3) | set 1: L_(2,1), L_(5,1), L_(6,1) units, L_(1,1) ≠ 0; set 2: L_(1,2), L_(2,2), L_(5,2) units, L_(6,2) ≠ 0 | agrees with lines 801 and 968 |
| §2.13 argument | L = Σ a_i(γ⁻−1)^i, a_i ∈ O^ur[[Γ⁺]], specialization at a local point c | μ = 0 at c ⇒ some a_i(c) a unit ⇒ a_i a unit of the local ring O^ur[[Γ⁺]] ⇒ a_i ∉ Q for every proper Q, (p) included | sound |
| §2.18 Check | D_K = −7, −3, −4; ℓ = 7, p = 5 | −7 ≡ 1, −3 ≡ 5 mod 8; (−7/5) = (3/5) = −1; (−91/5) = (4/5) = 1 | agrees |
| §2.19 normal-basis criterion | 𝔽_p[U_m] = 𝔽_p[t]/(t^{p^m}), socle = Tr | x generates O_{K_m} iff Tr(x̄) ≠ 0 iff Tr(x) ∈ ℤ_p^×; m = 1: Tr(1) = p | agrees |
| §2.19 𝔽₂₇ witness | a³ − a − 1 at a = 0,1,2 | values −1, −1, 2: no root; τ(a) = a+1; y(a) = (a,a+1,a+2); y(a)^τ = (a+1,a+2,a) = e_{τ²}·y(a); inverted pairing (a,a+2,a+1) has conjugate (a+1,a,a+2) ≠ (a+2,a+1,a) | convention pinned |
| §2.19 twisted invariance | u(ρ(d)x) | = ρ(e_u·d^u)x = ρ(e_u e_{u⁻¹} d)x = ρ(d)x | agrees |
| §3.1 Check (a_p ≡ ±1) | u ⊕ u⁻¹ω = χ̄ ⊕ χ̄ω | u⁻¹ω = uω ⇔ u² = 1 ⇔ a_p ≡ ±1; the other matching needs ω² = u², impossible for p > 3 (ω² ramified) | agrees |
| §3.1 Check (𝔽₅, X²+2) | squares mod 5: 0,1,4 | −2 ≡ 3 nonsquare: irreducible, End = 𝔽₂₅ | agrees |
| §3.2 Check | B = O[[x,y,z]][t]/(t²−x²) | t²−x² = (t−x)(t+x) squarefree in a UFD: reduced; t²−x² ∈ 𝔪²: singular; rank 2 | agrees |
| §5.2 Check | T = ℤ₅[x]/(x(x−5)) ↪ ℤ₅², x ↦ (0,5) | a + bx ↦ (a, a+5b): image {a ≡ b mod 5}; T ∩ ℚ₅(1,0) = ℤ₅(5,0); ℓ² = (25,0) = 5ℓ | agrees |
| §5.3 witness | 11a1, p = 7, q = 113 | a_113 = 9 (point count); 113 ≡ 2 mod 3 inert, 113 ≡ 1 mod 7; ((q+1)² − a²)/q² = 12915/12769, 12915 = 3²·5·7·41, v₇ = 1; general weight: 1 − a²q^{−κ₀} + 2q⁻¹ + q⁻² ≡ 4 − a² ≡ 0 mod 7 | agrees |
| §5.5 Checks | F = ℚ(√29), M = Fℚ(√−7), p = 23; F = ℚ(√3), M = ℚ(ζ₁₂) | 29 ≡ 6 ≡ 11², −7 ≡ 16 ≡ 4² mod 23; disc(M) = 29·7·203 = 203², N(D_{M/F}) = 203²/29² = 49; 144/12² = 1, narrow class field ℚ(√3,i) | Δ+ holds / fails as stated |
| §5.10 weight member | p = 5 | p + 1 = 6 ≡ 2 mod 4, even, trivial nebentypus | agrees |
| §7.6 twist stability | det σ = 1, T/(σ−1)T ≅ ℤ_p | both eigenvalues 1 ⇒ (σ−1)² = 0; saturated image ⇒ σ−1 = [[0,u],[0,0]], u a unit; σ² − 1 = 2N; u = p gives ℤ_p ⊕ 𝔽_p | agrees, p = 2 excluded |
| §7.10 Check curve | y² = x³ − 4x + 7 | Δ = −16·1067 = −16·11·97; #E(𝔽₃) = 7, a₃ = −3; #E(𝔽₅) = 4, a₅ = 2; disc(X²+3X+3) = −3 ≡ 2 nonsquare mod 5; c₄ = 192, −c₆ = 6048 ≡ 9 = 3² mod 11, v₁₁(Δ) = 1 | (im) holds, 10/11 has v₅ = 1 |
| §7.7 derivation | J ∋ Col(c) = r_E L_(E,N) | ord_𝔭 char(H²₀) ≤ ord_𝔭(Λ/J) ≤ ord_𝔭(r_E L) ⇒ (r_E L_(E,N)) ⊆ char | direction as stated |
| §5.11 proposed Check | A = O[[X,Y]], X ↦ 0, X = A/(X+p) ⊕ A/(X,Y) | Ch = (X+p), φ(f) = p; specialization O[[Y]]/(p) ⊕ O[[Y]]/(Y), Ch = (pY) ⊊ (p) | strict containment, as §0.3(ii) predicts |

## Not verifiable

- Ichino2008 Theorem 1.1, Ikeda1994 Prop. 1.3, Lemma 1.1, Thm 3.2, Harris1984 Thm 2.5.6, Rubin2000 Thm II.3.3, BST19: waived, cited by locator.
- Hung2017 Theorem B (behind §5.3(2) and the admission of p = 5): uncertified; the reading is Wan-2015 p. 70 and BCS §1.5.
- The published BCS (IMRN) pages and LLZ14 p. 736: not in the manifest or cache (S05).
- Ownership against open pull requests was checked by object only through the sibling checkouts named in the brief and `roadmaps grep` in round 1; this round re-resolved section identifiers at the current heads and did not repeat the object sweep. Board packages other than KatoEulerSystems (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) were not read; their titles do not overlap this roadmap's objects.
- NAK, LZ14, KLZ17, Pottharst, HT93, HT94, Hid06, Hid91, Fujiwara, Finis2006, Hida2010, Hsieh2012, Vatsal2003, Kato2004, KPX, Pan, EW16, BDP22, JSW17, GV00, Paskunas2016 locators were not re-read this round; round 1 verified them and the repaired locators (a-F10, b-F04) were checked above.

## Source issues

- **Misprint** in CLW at Theorem 8.2.1(1), printed p. 78: the source says the characteristic ideal is taken of X tensored over the cyclotomic subring O_L[[Γ⁺_K]] with R; it should be tensored over O_L[[Γ_K]], the ring over which X is a module, as the README's §2.7 reads it; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c88704a74c3065e48c43496a3728a600dc9f2aa2", "job": "RT-AutomorphicCongruences~2b", "model": "fable", "worker": "chris-x9"} -->
