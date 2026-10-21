<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/118#issuecomment-6310407403 -->
Review (claude) of 68681cd

Verdict: needs_changes

1. **F01** (P1) `period-nonvanishing` has supplier `none`

   Location: README line 138, "Owner: none; interface: required period witness: ltxzz Lemma 8.2.1"; plan gap `period-nonvanishing`, `"supplier": "none"`. Claim: 8.1 (`rankinSelbergSelmerRankZero`) consumes an unowned prerequisite. Witness: ltxzz line 6562 proves Lemma 8.2.1 from "[BPLZZ, Theorem 1.8]"; the only roadmap planning that theorem is `packages/GanGrossPrasadConjecturesForClassicalGroups/target.md` (triage target 4, "Proved unitary nonvanishing"), which is not in `merge-order/ORDER.txt`. Repair: state the theorem this roadmap can own, `rankinSelbergSelmerRankZeroOfPeriod`, whose hypothesis is the witness of Lemma 8.2.1 itself (a standard definite `V°n ⊂ V°n+1`, self-dual lattices away from `Σ⁺min`, `(K°n,K°n+1)` in the special subcategory with even levels transferable at `Σ⁺min`, and `f ∈ O_E[Sh°n₀][ker φΠ₀] ⊗ O_E[Sh°n₁][ker φΠ₁]` with `Σ_s f(s, sh↑(s)) ≠ 0`; ltxzz lines 6548–6561) and no gap; move the L-value form to Downstream consumers as the corollary a placed Gan–Gross–Prasad roadmap will draw, and delete the gap. If a human instead places GanGrossPrasadConjecturesForClassicalGroups in the merge order before this roadmap, the L-value form becomes a gap on its target 4.

2. **F02** (P1) `rank-two-three-proof` has supplier `none` and no source proof

   Location: README lines 749–755 (8.4) and 144; plan gap `rank-two-three-proof`, `"supplier": "none"`. Claim: 8.4 asserts rank zero and rank one for `n = 2` with L6 and L7 removed. Witness: ltxzz lines 196–199, Remark 1.1.10, only announces "a slightly different argument"; neither cached text contains it. Repair: restate 8.4 as the `n = 2` specialization of 8.1 and 8.2 over every CM `F/F⁺` including `F⁺ = ℚ`, with L1–L7 retained and H(2), H(3) discharged through Proposition 3.2.11 (line 1273, "holds for N ≤ 3") via `automorphic-multiplicity`; delete the gap; say in Scope that the L6/L7-free refinement is not planned because its proof is unpublished. Then 8.3's unconditional domain reads: `n = 2` over every `F⁺`, and `n ≥ 3` with `F⁺ ≠ ℚ`.

3. **F03** (P1) 1.2 re-plans SelmerIwasawaCohomology §§0.12–0.13

   Location: README lines 175–190 (`isFrobeniusWeaklySemisimple`, `weaklySemisimple_iff_surjective`, `_subquotient`, `_lift`, `_iso`). Claim: a new definition. Witness: `TauCetiRoadmap/SelmerIwasawaCohomology/README.md` at `17f6056`, lines 285–336: §0.12 "Weak semisimplicity at the invariant eigenvalue" (`IsWeaklySemisimple`, `invariantCoinvariantMap`, `weaklySemisimple_iff_split`, `weaklySemisimple_congr`, `weaklySemisimple_sum`, source Definition 2.1.2) and §0.13 "Procyclic invariants and integral lifting" (`weaklySemisimple_of_surjective`, subquotients and sums, `weaklySemisimple_integral_lift` over any DVR, source Lemmas 2.1.3–2.1.5). Repair: delete 1.2; cite SelmerIwasawaCohomology §§0.12–0.13 in the supplier contract and in the Needs lines of 3.2, 5.3, 6.3; the `cochain_sign` witness stays in Conventions.

4. **F04** (P1) 1.1 re-plans EulerSystemsAndKolyvaginSystems §1.3

   Location: README lines 156–173 (`lambdaExponent`, `lambdaExponent_le_iff`, `_map_le`, `_unit_smul`, `lambdaOrder_iso`, `_reduction`). Claim: a new definition from Definition 2.1.6. Witness: `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md` at `4fb7ae9`, lines 739–784: §1.3 "Exponents, orders and reducibility depth" with `TauCeti.ErrorTolerant.expAt`, `ordAt`, `expAt_add_ordAt_eq`, `reducibilityDepth`, `reducibilityDepth_eq_zero`, `reducibilityDepth_bounded`, Checks `expAt_zero`, `expAt_uniformizer_quotient`, citing Definitions 2.1.6, 2.3.2 and Lemmas 2.3.3–2.3.4. Repair: delete 1.1; cite that section in 5.6, 6.4, 7.2 and 8.1–8.2. No target here uses the design's generalization to an arbitrary commutative ring and ideal; if wanted, request it from that roadmap rather than restating it.

5. **F05** (P2) `selmer-detection` asks for what EulerSystemsAndKolyvaginSystems §§1.3, 1.6, 1.11, 1.15 provide

   Location: README line 128; plan gap `selmer-detection`. Claim: reducibility depth, `θ_S`, `f(1)=1, f(2)=4`, injectivity of `Res_ρ` under both alternatives of Lemma 2.3.5, abundant tuples and diagonal evaluation are unowned. Witness: that README, §1.6 (lines 874–896: `θ_S`, the sequence `𝔣`, Lemma 2.3.4 and both criteria of Lemma 2.3.5), §1.11 (lines 1066–1122: `gammaAssociated`, `frobeniusSet`, `IsAbundant`, `exists_isAbundant`, `abundanceExponent`), §1.15 (lines 1297–1325: existence of abundant tuples, Propositions 2.6.6–2.6.7). Repair: delete the gap; bind those four sections in the Needs line of 7.2.

6. **F06** (P2) 7.2 omits the corrected hypothesis recorded by its supplier for CM fields

   Location: README line 682, "there exist distinct very special inert places and a basis … such that loc_wᵢ(sⱼ)=0 for i≠j and expλ(loc_wᵢ(sᵢ))≥m−m₀−f(r)rR". Claim: existence with no condition beyond L5-1 and the rank-one `h_γ`-fixed line. Witness: EulerSystemsAndKolyvaginSystems §1.15, lines 1297–1299: existence needs "(v) the O_λ-span of θ_S(G_{S,γ}) contains λ^c Hom(S,(R̄^(m))^{h_γ})", and "Without (v) the printed Proposition 2.6.6 fails when [F:F⁺] = 2, because G_{S,γ} can be trivial"; (v) is proved there when `R` extends to `R₊` over `F⁺` and `S` lies in the `c`-eigenspace on which `γ` acts by `+1`. This roadmap is the CM case. Repair: state 7.2 with hypothesis (v) of that section, and add an owned target proving (v) for `R = R₀ ⊗ R₁` with its extension `ρ₊` and for the specific `S` used in 8.1 and 8.2 (the saturated rank-one and rank-two lattices of the proofs at ltxzz lines 6600–6608 and 6840–6847), or carry (v) as an explicit hypothesis of 8.1 and 8.2.

7. **F07** (P2) `selmer-local` asks for what the base provides

   Location: README line 86; plan gap `selmer-local`. Claim: the rational, integral and reduced finite conditions are unbound. Witness: base README at `17f6056`: §2.6 (lines 472–492, `saturated_preimage`, `V → T → W` conditions), §2.7 unramified condition, §4.9 (line 1907: Bloch–Kato on `T` by preimage and on `W` by image, away from `p` the unramified condition), §4.10 (line 1935: integral finite preimage equals `H¹_ns` in the Fontaine–Laffaille range), §4.24 (lines 2293–2303: `Sel_(f,T)(F,T/λ^m)` as the image, saturated free reduction, conjugation `Sel_f(F,V) ≃ Sel_f(F,V^c)`, Definitions 2.4.1–2.4.2, Lemmas 2.4.3 and 2.4.5), §4.25 (lines 2305–2322, Proposition 2.4.6(2)); the singular quotient at unramified places is EulerSystemsAndKolyvaginSystems §1.2 (lines 719–739). Repair: delete the gap; bind these sections in 4.4, 4.5, 7.3, 8.1, 8.2.

8. **F08** (P2) `selmer-annihilation` asks ArithmeticGaloisDuality for items the base states

   Location: README line 140; plan gap `selmer-annihilation`. Claim: the `d_λ⁻¹/O_λ`-valued crystalline pairing and the uniform killing of bad-place localizations are unowned. Witness: base §4.11 (lines 1954–1976, "Finite crystalline annihilators and the inverse different", Liu 2.2.7) and §4.25 (`localAnnihilation_uniform`, with the weight `−1` hypothesis in the form Liu–Tian–Xiao–Zhang–Zhu use). Local Tate duality and the global reciprocity law are `TauCetiRoadmap/ArithmeticGaloisDuality/README.md` at `5b7027c` §R02.4.2 (line 3002), §R02.4.3 (line 3321), §D7.4 and §D7.7. Repair: bind these sections; the residual elementary statement (for a perfect pairing of free rank-one `A_m`-modules, exponents `a, b` give a product of exponent at least `max(0, a+b−m)`) is a two-line lemma this roadmap can own as a Check.

9. **F09** (P2) `coefficient-algebra` asks for what is provided

   Location: README line 84; plan gap `coefficient-algebra`. Claim: finite `O_λ`-modules, Nakayama and elementary divisors need a base section. Witness: Mathlib `Module.torsion_by_prime_power_decomposition` (`Mathlib/Algebra/Module/PID.lean`), `Module.free_iff_isTorsionFree` (`Mathlib/LinearAlgebra/FreeModule/PID.lean`), and the base §§0.12–0.13 and EulerSystemsAndKolyvaginSystems §1.3 above. Repair: delete the gap (moot after R03 and R04).

10. **F10** (P2) `selmer-bipartite` is a conditional, compound need for a formalism no supplier has

   Location: README line 132 and plan gap detail "Determine whether a bipartite formalism exists; import its actual section if it does". Claim: 7.3 exports its rank bounds "through the imported Selmer-annihilation interface". Witness: EulerSystemsAndKolyvaginSystems contains no bipartite system (its Layer 4 is the Mazur–Rubin Selmer sheaf on the conductor graph, lines 2639–2680; the word does not occur); the source's rank arguments are explicit (ltxzz lines 6613–6640 and 6840–6860); README line 7 says this roadmap owns "the Selmer-rank deductions". Repair: delete the gap; make the one-place annihilator class `c₁` with its singular exponent `(8.4)` and nonsingular localizations `(8.5)`, and the two-place analogue, owned targets of 7.3, needing only the base §§4.24–4.25 and ArithmeticGaloisDuality §§R02.4.2–R02.4.3.

11. **F11** (P2) `hecke-transfer` is compound and names the wrong owners

   Location: README line 98; plan gap `hecke-transfer` ("Assign and bind general-rank Satake, native double-coset operators and the two-clause inertial transfer API"). Witness: transferability is `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` §13.7 "Transferable compact levels" (lines 4869–4876, Definition D.2.1 and Lemma D.2.2); the unramified unitary spherical algebra and Satake isomorphism are supplied, by IntegralHeckeAndGaloisDeterminants' own contract (its lines 82–83), by SmoothRepresentationsOfLocalGroups SR.4. Repair: split into a binding of §13.7 for 2.1, 4.1, 5.1, 6.1 and a gap or binding on SmoothRepresentationsOfLocalGroups SR.4 for the Satake map (3.1) and the double-coset operators of Appendix B used in 1.4.

12. **F12** (P2) `old-form-dimension` is EndoscopicTransferAndUnitaryTraceComparison §13.9

   Location: README line 112; plan gap `old-form-dimension`. Witness: that README §13.9 "Packet oldform dimension identities" (lines 4915–4922: the LTXZZ D.2 data, `c_v`, transferable levels, "Proposition D.2.3 and its setup, pp. 368–372") and §13.6 "Relevant generic packet multiplicity one" (lines 4852–4856). Repair: delete the gap; bind §§13.6–13.9 in 3.3; keep only Lemma 6.4.2 as a residual gap if §13.9's intertwiner comparison does not cover it.

13. **F13** (P2) `galois-realization` and `automorphic-multiplicity` name a GL₂ roadmap

   Location: README lines 88, 106; plan gaps with supplier AutomorphicGaloisRepresentations. Witness: that roadmap's title is "galois representations attached to modular and Hilbert modular forms" (line 1). The GL_N material is `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md` at `c4cc6a1`: AG2.1b "The actual Galois constituent of cohomology" and "The archimedean packet multiplicity" (lines 1169–1200), AG2.2 "Galois assembly for discrete unitary transfer" and "Attachment under cuspidal solvable base change" (lines 1254–1294), AG2.7 "Residual representation of π", "Unitary discrete-parameter export", "Lattice and residual polynomial export" (lines 2892–3170); the multiplicity space is EndoscopicTransferAndUnitaryTraceComparison §9.1 `CompactUnitaryRaw.multiplicity` (quoted at AutomorphicGaloisRepresentationsPartII lines 104–110). Its "The coefficient field of a relevant automorphic representation" (line 878) says it "does not prove Definition 3.2.5 strong Galois realization over each completion". Repair: repoint both gaps to AutomorphicGaloisRepresentationsPartII and bind those sections; keep as residual gaps exactly Definition 3.2.5 (strong coefficient field) and H(N) for the noncompact case `F⁺ = ℚ`.

14. **F14** (P2) `cohomological-genericity` is stated by IgusaVarietiesAndTorsionConcentration IG.7 and AutomorphicGaloisRepresentationsPartII AG2.7

   Location: README line 94; plan gap `cohomological-genericity`. Witness: `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md` §IG.7.2 "Cohomologically generic Hecke homomorphisms" (lines 2867–2873, the Definition D.1.1 quantifiers verbatim in its own words), §IG.7.5 "Caraiani–Scholze vanishing", §IG.7.7 "Irreducible middle-degree concentration"; AutomorphicGaloisRepresentationsPartII AG2.7 "Decomposed generic residual representation" (line 2990), "Infinitely many decomposed generic primes" (line 3039), "Residual genericity outside finitely many λ" (lines 3064–3070, Corollary D.1.4). Repair: delete the gap; bind these in 1.6, 3.1, 7.4. The candidate's merge-order position then moves after IgusaVarietiesAndTorsionConcentration, which is permitted.

15. **F15** (P2) PELModuli is absent from the supplier table and provides three gaps' content

   Location: README lines 90, 96, 102; plan gaps `cm-reflex` (ShimuraData), `native-shimura` (ShimuraVarieties), `grothendieck-messing` (CrystallineCohomology). Witness: `TauCetiRoadmap/PELModuli/README.md`: M2.8 representability and smoothness, M2.12 "Deformations of unitary `O_F`-abelian schemes" (line 2499, `unitaryDeformation`, `p > 2` unramified, generalized CM type), M2.13–M2.14 kernel ranks of isogenies of unitary abelian schemes, M4.3 "PEL generic fibres are canonical models" (line 3226), M4.5–M4.6 integral models at higher level, M4.7 "The rank-one CM moduli schemes" (line 3372, `cmModuli1`), M4.8 Galois structure, M4.9 "Torus-invariant cohomology and its trace" (line 3422, invariants not coinvariants). CM types and reflex fields are ShimuraVarieties §5.1 (line 1297). Repair: add PELModuli to the supplier table; rebind `grothendieck-messing` to M2.12–M2.14 (delete if covered), `native-shimura` to M2.8, M4.3, M4.5–M4.6 with a residual gap only for the strictly semistable special-level models of ltxzz §5.2 and the definite Shimura sets, and `cm-reflex` to ShimuraVarieties §5.1 plus PELModuli M4.7–M4.9, with the reflexive closure (Definition 3.3.2) and the Hasse classification of hermitian spaces as the residual, each on a single named owner.

16. **F16** (P2) `nearby-weight` asks for what LefschetzPencilsAndVanishingCycles 7a.7–7a.9 state, and misses the actual residual

   Location: README line 104; plan gap `nearby-weight`. Witness: that README at `1b8f741`, §7a.7 "Strictly semistable degenerations: nearby cycles" (line 3737), §7a.8 "The weight spectral sequence" (lines 3780–3790, the `E₁` formula and abutment without properness), §7a.9 "Monodromy on the weight spectral sequence" (lines 3836–3842). Its Scope (lines 86–88) and 7a.9 say the induced filtration is not identified with the monodromy filtration in dimension above one, and 7a.8 is written with `ℚ_ℓ` coefficients. 2.5 needs Lemma 5.9.3(3)–(5) (ltxzz lines 4122–4150, Saito 2003 Corollary 2.8(2)) with `O_λ` and `O_λ/λ^m` coefficients. Repair: bind 7a.7–7a.9; restate the gap as exactly that residual: the three-step filtration of `H^{2r−1}(M, RΨL(r))` induced by the monodromy filtration of `RΨL`, its graded pieces `E₂^{1,2r−2}`, `H^{2r−1}(M•)`, `E₂^{−1,2r}`, `N` induced by the identity on `H^{2r−2}(M†,L(r−1))`, for two-component strictly semistable schemes without properness, with torsion and adic coefficients.

17. **F17** (P2) 2.5 `weightComplex_singularSequence` has coinvariants where the source has invariants

   Location: README line 333, "0→F₋₁H¹(I,H²ʳ⁻¹(RΨL(r)))→H¹sing→H²ʳ⁻¹(M•,L(r−1))_F→0", with the design's own convention (line 565) that a subscript `F` means coinvariants. Witness: ltxzz line 4152 (Lemma 5.9.3(6)) and its proof, lines 4190–4195: `H¹sing ≅ H¹(I,…)^{Gal}`, the sequence is the Galois invariants of `0 → F₋₁ → F₀ → gr₀ → 0` using `H¹(Gal, F₋₁) = 0`; the third term is `H^{2r−1}(M•,L(r−1))^{Gal}`. Repair: write the superscript; add a Check in which Frobenius acts by a non-unit scalar `u ≠ 1` on a rank-one `L`, so invariants are `0` while coinvariants are `L/(u−1)`.

18. **F18** (P2) 8.2 exports Remark 8.3.3, which the source does not prove

   Location: README line 733, "Nonzero AJ already forces the global epsilon sign −1; it is a conclusion rather than an extra premise"; plan gap `epsilon-from-cycle` on AutomorphicGaloisRepresentationsPartII. Witness: ltxzz line 6793 is a one-sentence remark with no proof; Theorem 8.3.2 (lines 6773–6792) does not contain it; AutomorphicGaloisRepresentationsPartII has no root-number target. Repair: remove the clause from 8.2 and delete the gap; one Scope sentence that the root-number consequence is not exported.

19. **F19** (P2) `potential-map-notation` is not a supplier prerequisite

   Location: README line 148; plan gap `potential-map-notation` ("Certify the precise potential-map carrier notation…"). Claim: a supplier must certify typography. Witness: ltxzz lines 5097–5126 settle it: `B^r` is the kernel of `δ₀*`, `B_r` the cokernel of `δ₁!`, `C_r = (B_r)_0^{Gal}` (invariants), `C^r = (B^r)_0{}_{Gal}` (coinvariants), `Δ_r : C_{2n−r} → C^r` (5.28), and Remark 5.11.8 factors `∇` through coinvariants. The design's 5.4 wording (line 565) is correct. Repair: delete the gap; keep 5.4's worded carriers and the `potential_invariants_coinvariants` Check.

20. **F20** (P3) `chow-abel-jacobi`: bind MotivesAndAlgebraicCycles §§7.16–7.18

   Location: README line 116. Witness: `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md` at `c3dad31` §7.16 "Beilinson–Bloch rank predicates" (line 1520, `CH^r(X)^0` as geometrically homologically trivial cycles in fixed compatible realizations), §7.17 heights with Abel–Jacobi on curves, §7.18 "The unitary specialization of the rank conjecture" (line 1567, signature `(n−1,1)` unitary towers). Repair: bind these; state the residual (the `O_λ`-coefficient arithmetic étale regulator on `CH^n(X)^0` and its pushforward, pullback and coefficient compatibilities) as the whole content of the gap.

21. **F21** (P3) `hochshild-serre-adic` names a Selmer roadmap for a geometric spectral sequence

   Location: README line 118. Witness: the base's Scope (lines 7–21) owns no scheme cohomology; the base itself cites SchemeAndStackFoundations §2.15 `hochschildSerre_galois_covering` for `Spec 𝒪_{F,S}` (base line 1683; main README line 3846), and continuous actions on adic geometric complexes are EtaleCohomologyFoundations §F.4.6 (main lines 1089–1106). Repair: repoint to those two owners, with the residual (adic coefficients and the single-row edge identification of `H^{2n}` with `H¹` of `H^{2n−1}`) stated once.

22. **F22** (P3) Deformation and local-representation gaps: bind existing predicates and choose owners by scope

   Location: README lines 92, 110, 114, 136. Witness: GlobalGaloisDeformations line 1193 `IsCyclotomicAbsIrred` ("`ρ̄|G_{F(ζ_p)}` is absolutely irreducible") serves L6, 3.3 and A7.2.2; DeformationAndDerivedPatchingAlgebra's summary (line 3) is local algebra, not the polarized `R = T` theorem; local unitary constituents and tower cohomology are EndoscopicTransferAndUnitaryTraceComparison Layers 11–12 (lines 4153–4745), not AutomorphicGaloisRepresentationsPartII; ReductiveGroupsPartII (branch `roadmap/reductive-adelic-smooth-bundle`) contains no incidence or Deligne–Lusztig variety. Repair: bind `IsCyclotomicAbsIrred`; put `rigid-r-equals-t` on GlobalGaloisDeformations; put `local-unitary-representations` on EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4, 12.x; keep `unitary-incidence` but name it as a new obligation rather than an extension of an existing section.

23. **F23** (P3) Scope overclaims Hilbert modular ownership

   Location: README line 11, "Hilbert modular supersingular geometry remains with HilbertModularVarietiesAndShimuraCurves; §8.5 is a comparison test with its theorem". Witness: `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` has no Liu–Tian supersingular-locus or level-raising section (its only "Theorem 4.7" is Yuan–Zhang's, line 2509). Repair: say that the Liu–Tian theorem is a declared gap on that roadmap, or drop 8.5.

24. **F24** (P3) Check and carrier details

   Location: README line 169 (`exponent_zero`: "in a nonzero domain exp(1 in O)=∞") contradicts line 170 (`exponent_field`: "λ=0 gives exponent 1 for x≠0") unless `λ ≠ 0` is stated. Line 194 states the reciprocity identity as a Laurent identity; the pinned carrier is `Polynomial.reflect`/`Polynomial.mirror` (`Mathlib/Algebra/Polynomial/Reverse.lean`, `Mirror.lean`). Repair: add `λ ≠ 0` (moot after R04), and state `P = (−1)^N · reflect N P` on Mathlib's carrier in 1.3.

25. **F25** (P3) Process narrative and emphasis

   Location: README line 7 ("§§3.9 and 3.14 mentioned by PadicMeasuresIwasawaAlgebras do not certify…"), lines 58–76 (nineteen rows "Required unbound section: Section binding is missing…"), lines 84, 88, 110, 138, 146, 148 ("The base text is absent", "its exact section is also absent", "Exact sections of all three are absent", "triaged target only", "The source is read, but this supplier text is absent", "The extracted typography…"), and capitalized emphasis (EVERY, IMAGE, PERFECT, SPECIAL-FIBRE, BOTH, INVARIANTS, COINVARIANTS). Repair: after the bindings above, rewrite the supplier table as "From TauCetiRoadmap.X" blocks naming sections, and the remaining gaps as timeless one-sentence obligations.

26. **F26** (P3) Over-hypothesized sub-claims

   Location: README line 381 (3.2): "If A6.1.4, A6.1.6 and H(N) hold, then E₂ is supported only at (0,2r), is free there"; line 481 (4.3): "For 4.1 and H(n),H(n+1) … Prove rational geometric cohomology vanishes outside degree 2n−1". Witness: ltxzz line 5295, Lemma 6.2.2 needs only Assumption 6.1.4; lines 6767–6769 derive the vanishing from cuspidality alone. Repair: attach each conclusion to the hypotheses it needs.

27. **F27** (P3) Consumers

   Location: README line 777 and plan `consumers`: "GanGrossPrasadConjecturesForClassicalGroupsPartII" is a proposed roadmap that does not exist. Repair: name only PeriodsAndSpecialValues (the filed consumer) and describe the arithmetic Gan–Gross–Prasad application in prose without a roadmap name.

Files reviewed: `packages/SelmerIwasawaCohomologyPartII/design/README.md` (README below), `packages/SelmerIwasawaCohomologyPartII/design/plan.json` (plan), `packages/SelmerIwasawaCohomologyPartII/sources.toml`. Previous review: none. Sources read: the three cached texts (`ltxzz`, `liu-tian`, `ltxzz-deformation`); no new source was needed, the manifest is unchanged and no `needs-references.toml` was written.

A fact that changes the whole supplier picture: every one of the 23 roadmaps in the README's supplier table, including the base, exists as a readable roadmap folder at the head of an open pull request on the content repository (branches `roadmap/selmer-iwasawa-cohomology` at `17f6056`, `roadmap/euler-systems-and-kolyvagin-systems` at `4fb7ae9`, `roadmap/arithmetic-galois-duality` at `5b7027c`, `roadmap/automorphic-galois-representations-part-ii` at `c4cc6a1`, `roadmap/endoscopic-transfer-and-unitary-trace-comparison`, `roadmap/pel-moduli`, `roadmap/lefschetz-pencils-and-vanishing-cycles` at `1b8f741`, `roadmap/igusa-varieties-and-torsion-concentration`, `roadmap/motives-and-algebraic-cycles` at `c3dad31`, and so on; all are in the merge order and in the brief's list of permitted suppliers). The design report states that these texts are absent and binds no section of any of them. Several of its 33 gaps ask for sections those roadmaps already state, and two of its own definitions re-plan sections of the base and of EulerSystemsAndKolyvaginSystems. The findings below quote the supplier text at the section the fix worker must bind.

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: weight, twist, Frobenius, `hγ`, `d0` | `n = 2`; inert `p = 3`; `γ = (I,−1)c`; sign action of `C₂` on `ℤ` | `(2−1)+(3−1)−4 = −1`; `9` and `1/9`; `γ² = (−I, 1)` so `hγ = −I` (ltxzz line 830); `d0(1)(c) = −2` matches Tau Ceti `d0 = g•m − m`; Hodge–Tate weight of `ℚ_ℓ(1)` is `−1` (line 606) | none |
| 1.1 `lambdaExponent` | `λ = O`, `λ = 0`, zero module, `O/π³` | values as stated; `exponent_zero` third clause needs `λ ≠ 0` | R04, R24 |
| 1.2 weak semisimplicity | trivial action; `[[1,1],[0,1]]` over `𝔽₃`; `F = 4` on `ℤ₃`; `diag(1,a)` with `a−1` a non-unit | all as stated; subquotient closure and lift agree with Lemmas 2.1.3–2.1.5 (lines 493–546) | R03 |
| 1.3 Satake predicates | `𝔽₇`, `q = 2`, `(T−2)(T−4)` and `(T−1)(T−3)(T−5)`; `(T−1)²` at `q = 1`; `T−1` over `𝔽₂` | `P(2)=0, P′(2)=5, P(−1)=1`; `P′(1)=1, P(−2)=0`; reciprocity holds; matches Definition 3.1.5 (line 1044) | R24 carrier |
| 1.4 Hecke scalars | `r = 1, q = 3, a = 3`; `r = 1, q = 3, a = 2` | `I° = 16`, `(q+1)R°−I° = 0`; `T° = 9/2`, `I° = 105/2`; formulas match B.3.5 and B.4.3 (lines 8157–8171, 8400–8413) | none |
| 1.5 special inert | `ℚ(i)` at 3, 5, 2; `[F⁺_v:ℚ_p] = 2` | as stated; Definitions 3.3.1–3.3.4 (lines 1280–1299) | none |
| 1.6 admissibility | L1–L7 read against Definition 8.1.1 and Remark 8.1.2 (lines 6368–6399); `ℓ = 3`, `n = 2` | all seven clauses and the L5-2 element agree; `ℓ ≤ 4n` excluded | R22 binding |
| 2.1 datum | `m = 0, 1, 2`; `Σ⁺lr = ∅`; P1–P6 against lines 5136–5179 | agrees, including `(P6)` only in even rank and strong disjointness (Definition 1.3.2, line 450) | R11, R15 |
| 2.2 basic correspondence | `N = 2, 3` | fibre dimension `⌊(N−1)/2⌋`, codimension `⌊N/2⌋`, tangent and normal bundles, `DL(V,{,},⌈(N+1)/2⌉)` as in Theorem 4.3.5 (lines 1871–1890) | R15 |
| 2.3 strata | `N = 2` node; `N = 3, p = 3` quartic | normal bundles `O(p+1)` and `O(−(p+1))` (Corollary 5.3.5, lines 2901–2912); Fermat hypersurface (line 2838) | none |
| 2.4 link cohomology | restriction degrees; `ℓ ∣ p+1`; `⌊N/2⌋−j = 1` | Lemma 5.6.2 (lines 3349–3355) and Theorem 5.7.8 count (lines 3722–3733) as stated | none |
| 2.5 weight complex | odd and even matrices, `N = 2` variant, `p = 3` | matrices match Lemmas 5.9.2(2) and 5.9.3(7) (lines 4073–4080, 4163–4177); singular sequence third term is invariants (line 4152) | R17, R16 |
| 2.6 product resolution | `n = 2`; empty centre | dimensions `3, 1`; Lemmas 5.11.2–5.11.3 (lines 4725–4732) | none |
| 3.1–3.7 | zero localization; `P = ∅`; hypotheses (a)–(d) of Theorem 6.3.5 | match lines 5204–5258, 5295–5312, 5634–5657, 6489–6499; 3.2 over-hypothesizes Lemma 6.2.2 | R26 |
| 4.1–4.6 | `n = 2`; degree-2 cover; `ℙ¹` | dimensions `(1,2,3)`; Construction 4.6.1(3) (line 2509); AJ target and purity (lines 6767–6772, 6484) | R20, R21, R26 |
| 5.1 datum | `𝔽₁₁`, `q = 2`, roots `{2,6}`, `{1,4,3}` | factors satisfy PI4–PI5, tensor root `2` is double so PI7 fails; PI1–PI7 as in lines 5867–5890 | none |
| 5.2–5.6 | one-point test function at `p = 3` | `(p+1)φΠ₀(I°)φΠ₁(T°)` (Theorem 7.2.8(3), lines 6044–6050); Proposition 7.2.7 and Corollary 7.2.9 (lines 6024, 6158) | R19 |
| 6.1–6.4 | PII clauses; `O/π² → O/π` | PII1–PII4, PII7 only (lines 6233–6242); inequality direction (lines 6305–6310) | none |
| 7.1 | `m = 1`; `ξ = ±1` | Lemma 2.7.1 (lines 918–930) | none |
| 7.2 | `r = 1, 2`; CM versus totally real | Propositions 2.6.6–2.6.7 (lines 870–890); supplier records the CM-case correction | R05, R06 |
| 7.3 | empty raising set | no formalism to import | R10 |
| 7.4 | families A and B; `k` of characteristic `≥ 2n(n+1)−1` | Lemmas 8.1.3–8.1.5 (lines 6400–6463) | R14 |
| 8.1–8.4 | `L(1/2) ≠ 0` with period; `AJ = 0`; `n = 2, F⁺ = ℚ` | Theorems 8.2.2, 8.3.2 (lines 6568, 6773); Remark 1.1.10 proves nothing | R01, R02, R18 |
| 8.5 | `g = 1, 3` | liu-tian Assumption 4.1, Definition 4.5, Theorem 4.7 (lines 1407–1413, 1477–1481, 1496–1500) | R23 |

## Verified sound

- Seeded sample, 15 targets: 1.6, 2.1, 2.2, 2.6, 3.4, 4.2, 4.4, 4.5, 5.5, 6.2, 7.2, 7.4, 8.1, 8.3, 8.5. Every theorem number, page and quoted line was found at the locator and supports the statement, with the hypotheses the README lists; the only divergences are R06 (a supplier-recorded correction) and the unproved remarks of R02 and R18. Thirty-one further author-cited lines (Conventions, 1.1–1.5, 2.3–2.5, 3.1–3.3, 3.5–3.7, 5.1–5.4, 5.6, 6.1, 6.3–6.4, 7.1, 7.3, Appendix D) were read and agree.
- Pinned declarations: Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: `continuousCohomology (n : ℕ) (A : TopRep k G) : TopModuleCat k` and `TopRep.homogeneousCochains` in `ContCohomology/Basic.lean`; `ContinuousCohomology.cochainsMap`, `map`, `map_id`, `map_comp` with `φ : H →ₜ* G`, `f : res φ X ⟶ Y` in `Functoriality.lean`; `Polynomial.derivative`, `derivative_X`, `Polynomial.eval`, `eval_X`. Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `TauCeti.ContCohomology.d0` with body `g • m − m`, `H1`, `H1pi`, `subsingleton_H1_of_subsingleton`, `subsingleton_H1_of_subsingleton_coefficients`, `nsmul_H1_eq_zero` in `LowDegree.lean`. All six names and the direction conventions in the README are correct.
- Main-branch supplier sections exist as cited: EtaleCohomologyFoundations §F.0.3, §F.2.6, §F.2.7, §F.3a, §§F.4.0–F.4.6, §§0.9–0.11, §F.6, §F.7 (README lines 231–1264); its line 11 assigns nearby and vanishing cycles to LefschetzPencilsAndVanishingCycles; ProfiniteCohomology Layers 1–3, 5–8, 10 exist and its out-of-scope list (lines 121–123) excludes Hochschild–Serre and non-discrete coefficients; Chebotarev Layers 1–2, 10; SchemeAndStackFoundations Layer 5.
- Dependency gate, run on a scratch copy of the design README because `packages/SelmerIwasawaCohomologyPartII/README.md` does not exist at the design stage:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after AutomorphicGaloisRepresentations (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 37 edges, 0 problem(s)
```

  No UPWARD or CYCLE line. After the repairs the candidate's last supplier becomes IgusaVarietiesAndTorsionConcentration; all suppliers proposed above are in the permitted list.
- Plan and README agree: 33 gap slugs appear in both; every `neededBy` list equals the set of targets naming the gap; the target build order is acyclic; all 9 definitions and 7 constructions have at least three Checks; every theorem has a locator; every layer has Examples and Dependencies.
- Computations rechecked independently: the two Hecke scalar examples, the `𝔽₇` and `𝔽₁₁` Satake examples, the `(2,3)` weight and twist, the `(I,−1)c` square, the incidence-matrix entries at `p = 3`, the quartic normal degrees `±16`, and the potential-map direction.

## Not verifiable

- Lean elaboration: not applicable; the design stage has no `Suggested.lean`.
- The complete texts of the 23 supplier roadmaps were not read end to end; the findings quote the headings and sections read. Whether EndoscopicTransferAndUnitaryTraceComparison §13.9 includes Lemma 6.4.2, whether PELModuli line 299 is the reflexive closure of Definition 3.3.2, and whether MotivesAndAlgebraicCycles §7.16 constructs the `ℓ`-adic Abel–Jacobi map on `CH^r(X)^0` need the fix worker's reading of those sections.
- Theorem 5.7.8(2) (the excess bundle `σ*H ⊗ O(1)`) is truncated in the cache extraction after line 3740; the statement in 2.4 could not be matched term by term.
- The Appendix A incidence-variety computations behind 2.3–2.4 and the proof of the local equation `x₁x_N − p` were not re-derived.
- PeriodsAndSpecialValues, named as consumer, has no text anywhere; nothing in this review depends on it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "68681cd029678a26f823c42073891af00bf02193", "job": "REV-DESIGN-SelmerIwasawaCohomologyPartII", "model": "fable", "worker": "chris-f"} -->
