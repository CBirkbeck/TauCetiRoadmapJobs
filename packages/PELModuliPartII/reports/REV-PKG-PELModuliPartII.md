<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2458#issuecomment-6675081303 -->
Review (claude) of 2d790c7

Verdict: needs_changes

1. **F01** (P3) Supplier drift: ShimuraCompactifications §§C5.5, C5.18 and "Layer C5" are §§7.5, 7.18 and Layer 7 at the supplier's head

   - **Location:** `packages/PELModuliPartII/README.md` lines 61–62, 264–265, 272, 1337, 1439, 1500, 1568, 1645, 1657, 1898, 1916 ("ShimuraCompactifications §§C5.5 and C5.18", "Layer C5"); `packages/PELModuliPartII/design/plan.json` gap `bad-prime-projectivity` (`section` "§§C5.5, C5.18", `needs` and `detail` mention "Layer C5") and the target prerequisite lists at lines 3938, 4381, 4811, 5123.
   - **Claim:** properness of the integral toroidal model and quasi-projectivity of the neat PEL moduli at good primes are ShimuraCompactifications §C5.5 and §C5.18, in its Layer C5.
   - **Witness:** ShimuraCompactifications at its open head (the checkout the brief gives) has no section labelled C5.x; its layers are numbered 0–8. The two results exist as "### 7.5 Properness" and "### 7.18 Quasi-projectivity of PEL moduli at good primes" in "## Layer 7: integral PEL compactifications" (its README lines 2220, 2345, 2634), with the content the README attributes to them (7.18: the neat moduli of PELModuli M2.8 is quasi-projective over `B`, bad primes not treated). The worker's citation resolver already reports both labels as found nowhere (scratch `citations.md`, lines 61 and 1329).
   - **Repair:** replace `§C5.5` by `§7.5`, `§C5.18` by `§7.18` and `Layer C5` by `Layer 7` at every occurrence in the README (eleven lines above) and in the `bad-prime-projectivity` gap entry of `design/plan.json` (`section`, `needs`, `detail`; the gap list is the editable part of the plan at the package stage) and in the four target prerequisite strings. Re-run the citation resolver: the two leads disappear. Tested: the README text "§7.18 (quasi-projectivity of the neat PEL moduli of PELModuli §M2.8)" matches the supplier heading verbatim.

2. **F02** (P3) Supplier labels "§IG.0.27", "§IG.0.31" do not exist; the sections are §0.27 and §0.31

   - **Location:** `packages/PELModuliPartII/README.md` lines 42, 48, 214, 324, 331, 333, 434, 1359, 1465, 1488, 1500, 1610, 1657 ("IgusaVarietiesAndTorsionConcentration §IG.0.27", "§IG.0.31").
   - **Claim:** the PEL Rapoport–Zink spaces with the unstructured framed functor, and the Drinfeld-level models at a split distinguished place, are IgusaVarietiesAndTorsionConcentration §IG.0.27 and §IG.0.31.
   - **Witness:** the supplier's README at its head (the checkout given) contains no string `IG.` (grep count 0); the sections are headed "### 0.27 PEL Rapoport–Zink spaces" (its line 612; it constructs the structured functor for an unramified datum of type (A)/(C) and the unstructured framed deformation functor with formal representability) and "### 0.31 Harris–Taylor Newton strata at Drinfeld level" (its line 743; split `v₀`, RSZ §4.3 matching, Drinfeld levels from EndoscopicTransferAndUnitaryTraceComparison §10.2). Content matches; only the label is invented. The resolver lists both leads (scratch `citations.md` lines 48 and 324).
   - **Repair:** write `IgusaVarietiesAndTorsionConcentration §0.27` and `§0.31` at the thirteen lines above. Tested: both labels then match headings at the head.

3. **F03** (P3) Module docstring says the pins lack `Spf`; Tau Ceti has the affine formal spectrum at the pin

   - **Location:** `packages/PELModuliPartII/Suggested.lean` lines 14–16: "They lack formal schemes and `Spf`, formal smoothness of a morphism of formal schemes, and strict formal `O`-modules".
   - **Claim:** neither pinned library has `Spf`.
   - **Witness:** pinned Tau Ceti has `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean` (`carrier : Set (PrimeSpectrum A)`, line 73, for an adic ideal) and `.../Spf/StructureSheaf.lean` (`structureSheaf (hI : IsAdic I)`, line 262): the underlying space and structure sheaf of `Spf A`. There is no `FormalScheme` type, no morphism of formal schemes, no formal smoothness and no `p`-divisible group at either pin (grep of `mathlib/Mathlib` and `TauCeti/TauCeti`), so the headlines remain not statable and nothing in the file changes.
   - **Repair:** make the docstring exact, for instance: "They lack a category of formal schemes and formal smoothness of their morphisms (Tau Ceti's `TauCeti.AlgebraicGeometry.FormalScheme.Spf` gives only the space and structure sheaf of an affine formal spectrum), and strict formal `O`-modules …". Optionally add the same remark to the README's "From Tau Ceti" contract. Tested: the sentence is true at the pin by the files named.

4. **F04** (P3) §0.6 defines the relative local model but has no API list and only two Checks

   - **Location:** `packages/PELModuliPartII/README.md` §0.6 "Relative unitary Grassmannian chart" (lines 391–404): a construction ("the polarized local-model functor is the Grassmannian of rank-r quotients …") consumed as "the local model" by §§1.2, 5.1, 7.6 and the Mathlib contract (line 141 names §0.6 among the users of `Module.Grassmannian`), with two Checks and no `**API.**` block.
   - **Claim:** a definition with its API and at least three discriminating Checks (house shape).
   - **Witness:** the section is the only one of the 43 constructions with a stated carrier (Mih19 Definition 2.11, p. 9, `Mih19 line 393`) that carries no API list; Mih19 Proposition 2.12 (`Mih19 line 396–410`) identifies the subfunctor cut out by the rank conditions (i′) with the one cut out by the characteristic-polynomial condition (i) through equality of generic fibres, a discriminating fact the Checks do not record.
   - **Repair:** add an `**API.**` list (the functor on Spf-schemes of `O_L`-stable isotropic quotients of the standard module with conditions (i) and (ii); its identification with the rank-r Grassmannian of the distinguished summand; smoothness of relative dimension rs; compatibility with the Hodge map of §0.4) and a third Check, for example: "Imposing only the rank conditions (i′) of Mih19 Lemma 2.10 gives a closed subfunctor containing the local model with the same generic fibre; since that subfunctor is the integral smooth Grassmannian, the two coincide, whereas dropping the structural-action clause (ii) changes the functor (Mih19 Proposition 2.12)". Tested against Mih19 lines 396–410.

5. **F05** (P3) Locator slip: RSZ20 Remark 8.18 is on p. 54

   - **Location:** `packages/PELModuliPartII/README.md` line 1728 (§9.4): "RSZ20 Lemma 8.16 and Remark 8.18, p. 53".
   - **Claim:** both are on p. 53.
   - **Witness:** `RSZ20 line 2858` (Lemma 8.16) lies on p. 53, `RSZ20 line 2888` (Remark 8.18) after the p. 54 marker at line 2886.
   - **Repair:** "Lemma 8.16, p. 53, and Remark 8.18, p. 54".

No previous review of this package exists. Five findings, all P3 (locator, style, policy); no P1 or P2. The dependency check shows no UPWARD or CYCLE line, the Lean file elaborates with no message, and every sampled locator that the cache can show was found at the stated place. The verdict is `needs_changes` only because the findings below are repairs a fix round applies.

## Verified sound

**Principles.** No route-specific shortcut (all local families are built for every finite `K/ℚ_p`, `p>2`, with the ramified-coefficient restrictions stated as hypotheses, not as omissions); PELModuli is extended, not re-planned (each base result cited by section: §M4.7 assumes `p` unramified, PELModuli line 3394, so §6.6 is a genuine extension; §M2.8 states no quasi-projectivity, PELModuli line 2381; §M2.15 states Zink's equivalence only over complete local noetherian rings, PELModuli line 2608, so gap:zink-display-equivalence is necessary). No copied passage (spot-checked twelve statements against the sources below; all paraphrased). No algorithm. `Suggested.lean`: `import Mathlib` only, no `set_option`, no declaration, no sorry'd data.

**Dependency check (verbatim).**

    depcheck: 242 roadmaps, 2487 edges, 0 problem(s)

Exit 0; no UPWARD, CYCLE or moved line. PELModuliPartII is at line 246 of the merge order, after IgusaVarietiesAndTorsionConcentration (245), its last supplier; SelmerIwasawaCohomologyPartII (248) appears only as a consumer. Every `*Needs:*` entry names a roadmap earlier in the order or a declared gap.

**Elaboration.** `lake env lean packages/PELModuliPartII/Suggested.lean` from the content checkout: exit 0, no output (no `sorry`, nothing declared). The `#check @name` comparison has no declaration to run on; stated vacuously.

**Headline theorems and padding.** The README's end theorems (summary, lines 11–16): formal smoothness of `N_n` of relative dimension `n−1` (§1.2), regular semistable reduction of `N¹_n` (§2.2), of the Krämer space (§5.7), formal smoothness and two components of `N^exo` over every finite `K/ℚ_p` (§§3.4, 3.7), finite étaleness of the CM moduli at every prime (§6.6), smoothness/quasi-projectivity/projectivity and regular semistable reduction of the global models (§§7.2, 7.7, 7.8, 7.9, 8.3, 8.7), the basic-locus uniformizations (§§9.5–9.10), the Tate–Dieudonné comparison (§9.1). Each is named in the module docstring with its missing carrier. Checked at the pins: no `p`-divisible group, strict `O`-module, abelian scheme over a base, `O_F`-action with Kottwitz condition, Deligne–Mumford stack, formal scheme category or formal smoothness (grep of `mathlib/Mathlib` and `TauCeti/TauCeti`; Tau Ceti has only the `Spf` space and structure sheaf, R03, and `AbelianVariety (K) [Field K]` at `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`). For §9.1 the hypothesis needs isocrystals of abelian varieties (`WittVector.Isocrystal`, `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, is the abstract class with no functor from abelian varieties), and the ℓ-adic half alone is false by the §9.1 Check I recomputed below; so stating nothing is correct. No padding (nothing is declared; one-tactic probe has nothing to run on).

**Pinned declarations opened (file:line).** `LinearMap.charpoly` (`Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`), `charpoly_monic` (:72), `charpoly_natDegree` (:76, `StrongRankCondition`), `Matrix.charpoly` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`), `Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean`, submodules with finite projective quotient of rank `k`, the convention the README states), `WittVector.Isocrystal` (:112), `IsRegularLocalRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean:52`), `AlgebraicGeometry.Flat` (`Morphisms/Flat.lean:42`), `Smooth` (`Morphisms/Smooth.lean:59`), `SmoothOfRelativeDimension` (:127), `TauCeti.AlgebraicGeometry.AbelianVariety` (`Basic.lean:95`).

**Supplier citations resolved at the heads (all exist with matching titles).** PELModuli #966: M0.4, M0.6, M0.7, M0.10, M0.16–M0.18, M0.22–M0.25, M1.1, M1.6, M1.7, M1.9, M1.13, M2.8, M2.11, M2.12, M2.14, M2.15, M3.1, M3.2, M3.8, M4.3, M4.5–M4.8, M5.5. AbelianSchemesAndArithmeticModuli #849: A4.1, A4.3, A4.7–A4.9, A6.10, A6.11, A6.13. FiniteFlatGroupsAndIntegralPadicHodgeTheory #879: Layer R07.1, R07.2.10, R07.2.17, R07.2.20, R07.2.26. EndoscopicTransferAndUnitaryTraceComparison #999: 7.6, 8.3, 8.10, 10.2. IgusaVarietiesAndTorsionConcentration #1090: 0.27, 0.31 (R02). AdicSpacesPartIII (main): Layer F0, R2.9. SchemeAndStackFoundations (main): Layers 1, 4. AlgebraicModuliForArithmeticGeometry #853: 1.3. GeometryOfNumbersAndQuadraticArithmetic #851: 2.7, 2.9. PadicHodgeTheory #1062: 3.3–3.5, 8.3. ShimuraVarieties #933: 1.7, 2.5–2.7, 4.5, 5.10, 6.7. AdelicAlgebraicGroups #792: 4.1 (weak approximation and torsors; no hermitian existence theorem, so gap:hermitian-local-global is minimal; PELModuli M3.2 is the Hasse principle for `ker¹`, not Landherr). ReductiveGroupsPartII (main): RG2.3.5 (GL and GSp chains only, so gap:unitary-multichain-stabilizer is minimal). ShimuraCompactifications #1053: 7.5, 7.18 (R01). SelmerIwasawaCohomologyPartII #1403 (consumer only): 2.2–2.6, 5.2, 5.4. Stacks tags 0B3G, 0B3H, 0C4M, 0C4N, 01WN, 0BCL opened in the cached chapter (`Stacks lines 4242–4768`); each says what the README uses it for.

**Declared gaps.** All four slugs are in `design/plan.json` and stated under the supplier's subsection with the identical `needs` sentence (checked by script); each names a supplier earlier in the order; each is precise and minimal by the supplier readings above. None is unowned.

**Ownership.** `roadmaps grep` over main and all open heads for Landherr, Krämer model, almost self-dual, exotic good reduction, strict formal `O`-modules/`O`-displays/Witt `O`-frames, special homomorphisms, quotients of formal schemes by discrete groups, Mihatsch: no other roadmap constructs these objects (PELModuli M2.15 owns Zink displays and is cited; GrossZagierAndArithmeticHeights #1487 only consumes EndoscopicTransfer §10.2; GeometricSatakeAndFusionPartII #1836 mentions a two-dimensional nonsplit hermitian space inside a gap contract). No declaration of `Suggested.lean` exists, so no name can clash.

**Shape.** 75 subsections, 43 with an `**API.**` block, every one of those with ≥3 Checks (script); every layer ends with `### Examples` and `### Dependencies`; every target carries a locator; no LaTeX delimiters, no TeX braces outside code spans, no process words, no pull-request numbers, no machine paths (greps). The manifest records all 17 cited works, all `certified`; nothing was fetched.

**Sampled locators (15 targets) and the other locators opened.**

| Target | Locator checked | Where in the cache | Result |
| --- | --- | --- | --- |
| 0.1 | Mih19 Part III §10 p. 40; Lemma 11.2 p. 41; Def 11.6 p. 42; Defs 11.7–11.9, Rem 11.11, crystal paragraph p. 43; Prop 12.11 pp. 47–48 | `Mih19 lines 1812, 1860, 1912, 1920–1958, 2114` | all as stated; Prop 12.11 needs `R` π-adic, implied by π nilpotent |
| 0.6 | Mih19 Def 2.11, Prop 2.12 pp. 9–10 | `Mih19 lines 393–410` | smooth of relative dimension rs, no unramifiedness of `E₀/K` |
| 0.4 (opened for 0.6) | Mih19 Defs 2.7–2.8 pp. 8–9; Def 3.2, Thm 3.3 p. 12 | `Mih19 lines 344–368, 527–536` | `P(r,s)` as stated; no supersingularity |
| 1.2 | LZ22 §2.1 p. 10; RZ96 Thm 3.25 p. 88 | `LZ22 lines 392–408`; `RZ96 line 3008` (printed 88) | formally smooth of relative dimension n−1 |
| 1.4 | LZ22 §2.11 (2.11.0.1) p. 15; Zhang21 §3.1 (3.2) | `LZ22 lines 582–585` | δ by `X ↦ X×Ē^r`, identifies `N_{n−r}` with `Z(M)` |
| 2.1 | LZ22 §10.1 pp. 63–64; Cho18 Thm 1.2 p. 4 | `LZ22 lines 2805–2816`; `Cho18 lines 136–143` | kernel in `Y[ϖ]` of order q²; Cho: semistable over `O_Ĕ` for arbitrary `F/ℚ_p` (Remark 1.3 only concerns descent to `O_E`) |
| 2.3 | LZ22 §10.2 (10.2.1)–(10.2.2) pp. 64–65 | `LZ22 lines 2849–2862` | `W_n` split, `x₀` of norm ϖ, `V_{n+1}=W_n⊥⟨x₀⟩`, lift unique |
| 3.1 | LL22 Def 2.1, Rem 2.2 pp. 9–10 | `LL22 lines 405–430` | determinant, wedge, spin, `ker λ = X[ι(u)]`, exact arrows |
| 4.4 | LL22 Prop 2.62, Lemma 2.63 pp. 40–42; Rem 2.68 p. 43 | `LL22 lines 2045, 2134, 2214` | isomorphism of prestacks; ramified `F/ℚ_p` left open |
| 6.6 | RSZ21 (3.15)–(3.16), Rem 3.7 pp. 11–12; §4.1 (4.2) p. 17; LL22 Notation 4.19 pp. 57–58 | `RSZ21 lines 680–699, 964–968`; `LL22 lines 2883–2908` | finite étale over `O_E`; nonempty for any `a` when `F/F⁺` ramifies somewhere (Rem 3.7(i)) |
| 6.7 | RSZ21 §§3.3, 4.1 pp. 14–19; Rem 6.5 pp. 30–31; LZ22 §11.2 pp. 74–75 | `RSZ21 lines 1620–1640`; `LZ22 lines 3282–3284` | (M7): kernel in `A[ι(ϖ_v)]` of rank `#Λ_v^∨/Λ_v` |
| 7.2 | Zhang21 Def 6.1, Thm 6.2; Stacks tags; RZ96 Def 6.9 p. 279 | `Zhang21 lines 1667–1719`; `RZ96 line 8517` (printed 279) | smooth DM stack of relative dimension n−1; quasi-projective scheme at small level stated without proof there (README supplies the route) |
| 7.10 | LZ22 §14.1–14.2 pp. 84–85; HLSY23 §10.2 pp. 77–79; RSZ21 Thms 6.2, 6.7 pp. 30, 32 | `LZ22 lines 3661–3700`; `HLSY23 lines 4100–4120`; `RSZ21 lines 1598, 1716–1724` | (G0)–(G4) as stated; Drinfeld levels at split places with (S), (D) |
| 9.1 | RZ96 Lemma 6.28, Cor 6.29 pp. 292–293; Thm 6.30 pp. 293–294 | `RZ96 lines 8931–8976` (scan offset 12) | Cor 6.29 printed for two objects each isoclinic separately; the README's correction is right (see Source issues) |
| 9.3 | Zhang21 §7.3 (7.3)–(7.4), footnote 3; RZ96 Thms 6.27, 6.30 | `Zhang21 lines 1812–1849`; `RZ96 lines 8923, 8965` | `V′` definite, invariant switched at `v₀` only among finite places |
| 9.8 | Zhang21 (7.5)–(7.6); LL21 (8.2) p. 37; LL22 (4.8) pp. 67–68 | `Zhang21 lines 1831–1835`; `LL21 line 1715`; `LL22 lines 3399–3406` | product with `Ŷ`; CM projection to `Z^ℚ(ℚ)\Z^ℚ(𝔸_f)/K_Z` |
| others opened | Cho18 §3.9; LL22 Def 2.59, Lemma 2.4, Prop 2.28, Notation 4.19, §4.5, Rem 4.29, Prop 4.30; RSZ21 §5.2 (1)–(2) and footnote 11, Rem 6.8, Rem 6.9, Def 6.10, (6.6)–(6.7); HLSY23 Def 2.2, (2.1)–(2.6), §1.2; LL21 Notation 5.6, Lemmas 5.2, 5.5; Kraemer03 Def 4.1, Thm 4.5, (4.3)–(4.11), standing `n≥3`; RSZ20 Thm 4.7, (4.10), (4.19), Lemma 8.16, App. A (A.1)–(A.8), Rem A.2; RZ17 (8.2) p. 28; Wu16 §3.4 (3.21)–(3.26), Thms 5.17–5.18; Howard19 Props 2.1–2.2; LRZ26 Thm 14.6.2; LTXZZ22 Def 3.3.4, Lemma 4.2.1, Def 4.2.2, Thm 4.2.3, Rem 4.2.5, §5.1, Def 5.2.1, Rem 5.2.4, Thm 5.2.5, Def 5.2.6 | see the adversarial table | all support the statements as written, with the page slip of R05 |

**Adversarial pass (values computed by me / stated).**

| Statement | Instances | Computed / stated | Result |
| --- | --- | --- | --- |
| §0.1 strictness Check | `K=ℚ_p(√p)`, `R=O_K/(p)` | `√p ≠ −√p` in `R` since `2√p ∉ (p)`; twisted module not strict / same | ok |
| §0.1 biformality Check | relative height 1, dimension 1 | dual dimension 1−1=0, étale, not biformal; sources of height 2 dim 1 biformal / same | ok |
| §0.1 `O=ℤ_p` | `μ_{p^∞}`, `ℚ_p/ℤ_p` | `P/Q` rank 1; `P/Q=0`, not nilpotent / same | ok |
| §0.2 unstructured parameters | `n=1`, `[K:ℚ_p]=2` | `d(h−d)=2·2=4`; strict: 0 / same | ok |
| §0.3 heights | `[K:ℚ_p]=2`, `n=3` | relative height 6, absolute 12, relative dim 3, absolute dim 6 (Examples) / same | ok |
| §0.4 `P(r,s)` | Mih19 Def 2.7 | `P₀₁=∏_{Ψ₁}ψ(charpol)`, `P₁₀=P₀₁(T−a)/(T−ā)`, `P(r,s)=P₁₀^rP₀₁^s` / same; clause (ii) is Def 2.8(ii) | ok |
| §0.4 `K₀=K` | identity frame | `[K:K₀]=1`, heights `2n·1=2n` / identity | ok |
| §0.6 dimension | `(1,n−1)`; `r=0` | `rs=n−1`; `Gr` of rank-0 quotients = base / same | ok (R04 for shape) |
| §1.2 | `n=1,2` | dim 0 (`Spf O_L̆`), dim 1 / same | ok |
| §1.4 signatures | `n=1`; `ℰ` for `ℰ̄` | `(1,0)+(0,1)=(1,1)`, height 4; `(1,0)+(1,0)=(2,0)` / same | ok |
| §1.5 / §2.3 invariants | `L/K` unramified | every unit a norm; `W_2` even valuation, `⊥⟨ϖ⟩` odd ⇒ `V_3` nonsplit; LZ22 line 423 "non-split" / same | ok |
| §1.6 dimensions | `n=2,3,4` | relative `(0,1),(1,3),(2,5)`; arithmetic `(1,2),(2,4),(3,6)` / same | ok |
| §2.1 kernel | `q=3` | order 9, Cho `q^{2h}` with `h=1` / same | ok |
| §2.4 degree | `q=3`, `n=2` | `(deg α)²=deg λ_Y·deg(ϖλ_ℰ̄)=9·9` ⇒ 9; `27²=729≠81` / same; LZ22 §13.4 prints `q` (Source issues) | ok |
| §2.5 | `q=3` | `π₁` generic degree `q+1=4` (LZ22 Rem 10.2.1) / same | ok |
| §3.1 kernel orders | `n=2` | `deg i(u)²=deg ϖ=q^{2n}` ⇒ `#X[i(u)]=q^n=q²` / same | ok |
| §3.2 | `σ∘i(u)` vs `σ∘i(u²)` | kernels `q^n` vs `q^{2n}`; `σ^∨=σ` via LL22 Rem 2.2 / same | ok |
| §3.4 coefficient ring | `n=2` | fibre of `O_L̆[[t]]` over `O_K̆` closed point `k[u]/(u²)[[t]]` nonreduced / same | ok |
| §3.7 | `n=2`; `n=4` | reduced dim `n/2−1=0`; `V_Λ` dim `t/2−1=1` for `t=4`, two `ℙ¹` (LL22 Rem 2.29) / same | ok |
| §4.1 | `f=2`, `n=2` | height `2nf=8`, dim 4 (LL22 Def 2.59) / same | ok |
| §4.3 `μ` | `f=1` | empty product, `μ=1` / same | ok |
| §5.2 | Lie action | `ā`; `(e,e)_Y ∈ O_K^×` (HLSY23 line 484) / same | ok |
| §5.4 trace recovery | `A=⟨Πx,y⟩`, `B=⟨x,y⟩` | `Tr(u⁻¹δ(A+uB))=δ·0·A+2δB` ⇒ factor `(2δ)⁻¹` (HLSY23 (2.2) `1/(2δ)`) / same | ok |
| §5.5 parity | `n=3`; `n=2` | `χ((−1)^{n(n−1)/2}det C)`; unit rescaling changes the class by `χ(c^n)`, trivial iff `n` even is false: `c^3` changes sign for non-norm `c`, `c²` does not / same (HLSY23 lines 471–474) | ok |
| §5.6 chart | `n=2` | Kraemer03 (4.11) with `n=2`, `k=2`: `y(x₁²+1)=2π`; roots of `1+x²` simple since `2x` unit; `z=(1+x²)/2` étale, `yz=u` / same | ok |
| §5.7 | `n=2` | Howard19 Prop 2.2: regular of dimension `n`; relative `n−1` / same | ok |
| §6.2 | `F⁺_v=ℚ_p(√p)`, `F_v=F⁺_v(√ε)` | embeddings `(σ,±)`, conjugation `σ↦σ̄`; `{(σ,+),(σ,−)}` pulled back and CM; `{(σ,+),(σ̄,−)}` CM, not pulled back / same | ok |
| §6.5 | `𝔽₃` block; `A_ψ=∅` | rows `(0,1),(0,0)`: charpoly `T²`, nonzero; `Q=1` ⇒ summand 0 / same | ok |
| §6.6 ramified CM | `F=ℚ(√−p)`, `R=k[ε]` | `A₀[p^∞]` strict `O_{F_p}`-module of relative height 1; `x`-stable summands of `R[x]/(x²)` with rank-one quotient are `(x+εc)`, `x` acts on the quotient by `−εc`, charpoly `T+εc` fixes `c` / same | ok |
| §6.6 nonemptiness | any `a` | RSZ21 Rem 3.7(i): nonempty for any `a` when `F/F₀` ramified at a finite place / same | ok |
| §6.8 sign | `n=3`, `r_φ=2` | RSZ20 (A.7): `(−1)^{Σ_{Φ_{ν,v}}r_φ}` with opposite `r₀`; Rem A.2: positive convention gives `Σ_{Φ̄_v}r_φ=Σ_{Φ_v}(n−r_φ)`; exponents 1 vs −2 / same | ok |
| §7.2 bad base | `F⁺=ℚ(√3)`, `F=ℚ(ζ₁₂)`, `p=3` | 3 ramified in `F⁺`; `−1` nonsquare mod 3 ⇒ inert in `F`; `3 ∣ Disc(O_F×O_F)` ⇒ bad by PELModuli M0.10 (`p ∤ Disc`) / same | ok |
| §7.7 Meyer | `F⁺=ℚ`, `n=4` | trace form signature `(6,2)`, 8 variables, isotropic; `F⁺≠ℚ` ⇒ definite real place ⇒ anisotropic / same | ok |
| §7.8 charts | `n=2` | `uv=t²` embedding dim 3, dim 2; `yz=u` over `O_{F̆_{v₀}}` regular after unramified extension (RSZ21 Rem 6.8 for the wedge side) / same | ok |
| §8.1 arrows | `c≠1` | `λ₀×cλ` not a multiple of `λ₀×λ` (1 vs `c`) / same; LTXZZ22 Def 4.2.2 common `c` | ok |
| §8.3 | `N=2`; `F⁺=ℚ` | `x₁x₂−p ∉ m²` ⇒ regular of dim 2; `diag(a,b)` isotropic iff `−ab ∈ Nm F^×` / same | ok |
| §8.6 | `q=3` | `v₀`-degree `9`; LZ22 line 3593 prints `q_{v₀}` / same (Source issues) | ok |
| §8.7 tangent | `N=2` | `Hom(line, line)`, dim `N−1=1`; `T_p` étale contributes 0 (LTXZZ22 Thm 4.2.3) / same | ok |
| §9.1 Checks | supersingular `E`, `K=ℚ`; ordinary `E`; conjugated CM pair, `p` split | `End⁰⊗ℚ_ℓ=M₂(ℚ_ℓ)` dim 4 = `End(V_ℓ)`; at `p` both `D_{1/2}`. Ordinary: `K_E⊗ℚ_ℓ` dim 2 ≠ 4. Conjugated pair: `fι(a)=ι(ā)f` ⇒ `(a−ā)f=0` ⇒ `Hom_K=0`; conjugate-semilinear maps of a free rank-one `K⊗ℚ_ℓ`-module: dim 2; each `𝔭`-part isoclinic (slopes 0 and 1), so RZ96 Cor 6.29 as printed fails; with the common-slope hypothesis `Frob^m=ι(u)` on `A×A′` and `K`-linear maps are automatically `Frob^m`-equivariant / same | ok |
| §9.2 | `Γ=ℤ` shift; `−1` on `N_n` | quotient `𝔑`; `−1_X` is an automorphism carrying `ρ` to `−ρ`, so `−1` acts trivially, not a torsor / same | ok |
| §9.3 product formula | flip `v₀` only | real signature `(n−1,1)→(n,0)` flips the sign of `det`, needed to restore the product formula / same | ok |
| §9.6 normalization | `n=2`, `val_u(ϖ)∈{0,1}` | `h′=(u²/ϖ)h^exo`, valuation `1−val_u(ϖ)`; unit ⇒ same duals; `val=0` ⇒ dual shifts by `(u²/ϖ)⁻¹` / same; LL22 line 3374 fixes `ϖ` only away from `u`, the README adds `val_u(ϖ)=1` as a convention | ok |
| §9.10 | `q=3` | `deg α=9`, `π₁` degree 4; LRZ26 Thm 14.6.2(ii)–(iv): `π₁` finite flat degree `q+1`, `π₂` proper, exceptional `ℙ^{n−1}` / same | ok |
| Conventions 4, 5, 7, 8 | as stated | recomputed in the §§7.8, 5.6, 8.1, 9.6 rows | ok |
| Suggested.lean docstring | carriers | see R03: `Spf` space and sheaf exist at the Tau Ceti pin; no formal scheme, `p`-divisible group or abelian scheme over a base | R03 |

**Generality and context.** The README's hypotheses agree with the sources' at every sampled target (Cho18 over `O_Ĕ` for arbitrary `F/ℚ_p`; LL22 Lemma 2.4 for general `F`, footnote 8; RSZ21 Theorem 6.7(ii) semistability only at `ν` unramified over `F_{v_ν}`, kept in §§7.8, 7.10, with HLSY23 §10.2's unhedged assertion recorded; LZ22 (A1) `v₀` unramified over `p` kept in §7.9). No Lean signature exists to compare.

## Not verifiable

- Zhang21 published page numbers (pp. 879–881, 901–909): the cache holds arXiv:1909.02697v3 with its own pagination (`Zhang21 line 1695` is arXiv p. 30); sections, equations and footnotes were verified, the printed pages were not.
- LTXZZ22 published page numbers (pp. 147, 159–163, 188–193): the cache holds arXiv:1912.11942v3 (179 pages, arXiv pagination); theorem, definition and remark numbers verified.
- RZ96 is an OCR scan with a page offset of 12 (scan page 305 = printed 293); the printed numbers were read from the running heads and agree with the README.
- Ownership against open pull requests whose files the brief does not give was not checked beyond the `roadmaps grep` index of all 459 open heads.

## Source issues

- **Error** in RZ96 at Corollary 6.29, printed p. 293: the source says the `K`-linear ℓ-adic and `p`-adic Hom comparisons hold for two polarized `K`-objects each satisfying Lemma 6.28 separately; it should require the `𝔭`-parts of both to be isoclinic of the same slope (an ordinary CM elliptic curve and its conjugate-action twist, `p` split, give `0` against a 2-dimensional space); affects a stated result.
- **Misprint** in LZ22 at §13.4, p. 82: the source says the isogeny `α: A×A₀→A♯` has degree `q_{v₀}`; it should be `q_{v₀}²` at `v₀`, forced by `α*λ♯=λ×u₀λ₀` with both source factors of degree `q_{v₀}²` there and `λ♯` principal; affects nothing.
- **Gap** in LL22 at §4.5, p. 66: the source says the integral models are smooth projective by RSZ20 Theorem 4.7; that theorem gives flatness, smoothness and the generic fibre, not projectivity; it should prove properness separately (for `F⁺≠ℚ`); affects a stated result.
- **Misprint** in LL22 at §4.3, p. 58, and §4.5, p. 66: the source says the exotic conditions at the ramified places above `p` hold for `A₀[v^∞]`; it should say `A[v^∞]`, the only factor of height `2nf`; affects nothing.
- **Gap** in HLSY23 at §10.2, p. 78: the source says the Krämer model is regular and semistable at every place of `E` above the ramified and almost self-dual places; it should assume `ν` unramified over `F_{v₀}` at ramified places and `E_ν` unramified over `ℚ_p` at almost self-dual places, as the cited RSZ21 Theorem 6.7(ii) and RSZ20 Theorem 4.7(ii) do; affects a stated result.
- **Misprint** in HLSY23 at §1.2, p. 2: the source says the Krämer filtration has rank 1; Definition 2.2(3) has rank `n−1`; affects nothing.
- **Misprint** in HLSY23 at Definition 2.2(2), p. 10: the source says the framing is a height-zero `O_F`-linear quasi-isogeny with no relation between the polarizations, while isomorphisms match polarizations up to `O_{F₀}^×`; it should require the framing to pull the framing polarization back to an `O_{F₀}^×`-multiple; affects nothing.
- **Gap** in LTXZZ22 at Theorem 4.2.3, published p. 161: the source says the integral model is projective if and only if its generic fibre is, and the proof addresses only the tangent sheaf and cites RSZ21 for quasi-projectivity; it should give an integral properness argument; affects a stated result.
- **Misprint** in LTXZZ22 at Definition 4.2.2, published p. 160: the source says the Hecke parameter ranges over `K^p\U(V)(𝔸_F^{∞,p})/K^{p′}`; it should be the finite adeles of `F⁺`, over which `U(V)` is defined; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2d790c7e964069e5e8d3d7f9de9a20cb5ae30b7d", "job": "REV-PKG-PELModuliPartII", "model": "fable", "worker": "chris-x10"} -->
