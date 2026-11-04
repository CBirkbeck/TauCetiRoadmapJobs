<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1092#issuecomment-6393922836 -->
Red team round 1 pass b (claude) of 57fb70a

Verdict: needs changes

1. **F01** (P1) Splitting of exact tensor filtrations and the filtration flag variety are used but owned by no cited supplier

   Location: `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:248` (§0.2 proof: "Use the torsor/representation dictionary and descent for split filtrations"), `:281` (§0.4: "Conversely split an exact trace filtration by a cocharacter"), `:940` (§5.1: "Define Fl as filtrations of the standard fibre functor; its type components are clopen and descend to their reflex fields"); also §4.5 (`:853`, "lift the split filtered structure").

   Claim: §0.2 defines the type of a filtered G-functor as "the conjugacy class giving the grading", §0.4 splits an exact trace filtration by a cocharacter, and §5.1/§5.3/§5.6 use Fl_[mu] = G/P_mu for an arbitrary connected linear G. The *Needs* of §0.2 (ReductiveGroups Layer 1), §0.4 (§§0.2–0.3) and §5.1 (GS0, D6, §§1.4, 4.5) name no owner of the splitting theorem or of G/P_mu for non-reductive G, and no layer here proves it.

   Witness: HKI line 993 imports the splitting from Saavedra (Ch. IV, Thm 2.4). HodgeTateAndCanonicalSubgroups §2.14 (`TauCeti.HodgeTate.filteredFiberFunctor_split`) states splitting, type, parabolic and G/P_mu for finite-type affine G; merge-order line 234 < 245. ReductiveGroups has no such target.

   Repair: add a supplier subsection

   > ### From TauCetiRoadmap.HodgeTateAndCanonicalSubgroups
   > Use §2.14's splitting of exact tensor filtrations of fibre functors on Rep_k(G) for finite-type affine G (fpqc-local, hence over k in characteristic zero since the splitting torsor is unipotent), the cocharacter type, the filtration parabolic P_mu and the flag scheme G/P_mu with its base change; the rigid flag variety is its analytification (AdicSpacesPartII R1.3).
   > Consumed sections: HodgeTateAndCanonicalSubgroups §2.14.

   and add "HodgeTateAndCanonicalSubgroups §2.14" to the *Needs* of §§0.2, 0.4, 4.5, 5.1 and to the Layer 0, 4 and 5 Dependencies. Tested on a non-reductive instance: for G = G_m ⋉ G_a with mu acting on Lie G_a by weight −1, P_mu = G_m and Fl_[mu] = G/P_mu ≅ A^1, which is not a reductive flag variety (so GS0 does not cover it) while §2.14's G/P_mu does. The dependency direction stays downward (234 < 245).

2. **F02** (P2) §3.4 converse proof plan is a non sequitur: "central cocharacters" does not give a torus

   Location: `README.md:726`, "For the converse the algebraic filtration has an open MG orbit fixed by its field of definition, forcing central cocharacters and then a torus."

   Claim: centrality of the cocharacters is offered as the reason MG is a torus.

   Witness: the unit self-extension of §2.5 Check 3 has MG = G_a, whose only cocharacter (zero) is central; G_a is no torus. HKI lines 2424–2430 make Galois elements central (Lemma 2.1.5), use density, and exclude G_a via Example 5.4.5.

   Repair: replace the sentence by

   > For the converse, an open subgroup of the Galois image preserves the K-rational de Rham lattice (HKI Lemma 5.5.4), so its elements are tensor automorphisms of the fully faithful realization Rep MG → HS(C) and are therefore central in MG (HKI Lemma 2.1.5). By Zariski density of the image (§3.3), MG is commutative; the vanishing of nonzero C0bar-analytic self-extensions of the unit (§3.1, second Check) excludes an additive factor, so MG is a torus.

   Tested on G_a: the repaired route excludes it at the last step (its extension parameter is nonzero in B_dR/B_dR+, not C0bar-analytic), as the source does.

3. **F03** (P2) §§9.1–9.2 re-plan the finite-level quotients and the inverse-limit identification owned by DiamondsAndVStacks D3.10

   Location: `README.md:1586` ("Compact-open quotients give the respective finite levels; inverse limits recover M after checking sheaf descent and cofinality"), `:1597` ("Take level quotients in sheaves before proving the inverse-limit identification"), *Needs* at `:1582` and `:1609`.

   Claim: the roadmap proposes to construct M/K for compact open K and to prove M = lim M/K itself; neither §9.1 nor §9.2 cites an owner.

   Witness: DiamondsAndVStacks D3.10 (*locally-profinite-torsors*, head #820) gives, for a torsor under a locally profinite group, separated étale pushouts along G/K and the torsor as their inverse limit; M_C is a G(Q_p)×I-torsor over the admissible cell (§9.2; Spd C→Spd L).

   Repair: replace the two sentences by "By DiamondsAndVStacks D3.10 (locally-profinite-torsors), applied to the G(Q_p)×I-torsor M_C over the admissible cell (and to the G_b(Q_p)×I-torsor over X_[mu] when b is basic), the quotients M_C/K are separated étale over the respective lattice targets and M_C is their inverse limit." Add "DiamondsAndVStacks D3 / locally-profinite-torsors" to the DiamondsAndVStacks contract, to the *Needs* of §§9.1 and 9.2 and to the Layer 9 Dependencies (DiamondsAndVStacks is at merge-order line 16). Tested on §9.1 Check 2: for G_m the étale frame fibre Q_p× and K = Z_p× give the pushout fibre Q_p×/Z_p× = Z, discrete and étale, as D3.10 predicts.

4. **F04** (P2) §12.5: the quaternion algebra B is not determined; the Čerednik–Drinfeld hypothesis "same ramification away from p and ∞" is dropped

   Location: `README.md:2062`, "let B be the inner form definite at infinity and split at p"; again `:2076`, "its inner form B is definite at infinity and split at p".

   Claim: B is described only by its behaviour at p and ∞.

   Witness: HKII lines 2931–2932: B is ramified at ∞, split at p, and otherwise ramified where D is. For Ram(D) = {p, ℓ}, both Ram(B) = {∞, ℓ} and Ram(B′) = {∞, ℓ, q, r} fit the README; only B uniformizes.

   Repair (both places): "let B be the quaternion algebra over Q that is ramified at ∞ and split at p, and ramified at exactly the same finite places as D away from p". Tested: D with Ram(D) = {p, ℓ} gives Ram(B) = {∞, ℓ}; B′ above is excluded.

5. **F05** (P3) The Grassmannian is defined only for G/Q_p with no base, but used over Spd L for any p-adic L (round-2 leftover, still present)

   Location: `README.md:940`, "For connected linear G/Q_p, Gr_G is the étale sheaf quotient G(B_dR)/G(B_dR+)"; `:979`, "For connected linear G/L, with L a p-adic field, Gr_G is separated and partially proper over Spd L"; §6.5 (`:1137`) uses Gr_G over Spd Q_p-breve; §5.5 (`:1009`) takes S over L although Gr_[mu] lives over Spd L([mu]).

   Claim: §5.1 fixes neither the base nor a group over L, while §§5.3, 5.5, 6.5 use Gr_G/Spd L and its cells over L([mu]).

   Witness: HKII Definition 5.0.1 (HKII line 1347, line 1353, line 1362) takes G/L, defines Gr_G on Perfd_L over Spd L and Gr_[mu] over Spd L([mu]); Theorem 5.0.4(4) (HKII line 1430) takes S over Spa L([mu]).

   Repair: §5.1 first sentence → "Let L be a p-adic field and G/L a connected linear group (for G/Q_p use G_L). Gr_G/Spd L is the étale sheaf quotient G(B_dR)/G(B_dR+) on Perfd_L, equivalently …; Fl_G/Spa L is the rigid variety of filtrations of the standard fibre functor; for L′/L, Gr_{G_{L′}} = Gr_G ×_{Spd L} Spd L′." §5.5 first sentence → "For a seminormal rigid S over L([mu]) …". Tested: G = G_m over L gives Gr_[a] = Spd L for each integer a, which is exactly §5.3 Check 1.

6. **F06** (P3) §0.5's B_dR application omits that C is the completed algebraic closure of K0 (round-2 leftover, still present)

   Location: `README.md:289`, "In particular this applies to B_dR and the Galois action of a discretely valued p-adic K0⊂C with infinite cyclotomic extension."

   Claim: the Galois group of K0 is asserted to act on B_dR(C) for any C containing K0.

   Witness: HKI Example 3.1.10 (HKI line 1083, line 1084) needs C = completion of K0bar and Gamma = Gal(K0bar/K0); the Conventions (`:21`) allow larger C, on which Gal(Q_pbar/Q_p) has no given action. Every p-adic K0 has infinite cyclotomic extension.

   Repair: "In particular this applies to B_dR(C) with C the completion of an algebraic closure of a p-adic field K0 and Gamma = Gal(K0bar/K0): then C^Gamma = K0 and Gamma acts on the line K0·t through the cyclotomic character, which has infinite order." Tested: K0 = Q_p, C = completion of Q_pbar gives C^Gamma = Q_p and the character χ_cyc with image open in Z_p×.

7. **F07** (P3) Consumer pointers name source sections instead of README sections, and one pointer dangles (round-2 leftover, still present)

   Location: `README.md:223` ("HK II §3.1: Defines both Bialynicki–Birula filtrations"), `:250` ("HK I Theorem 3.2.6: … HK II §§5–7: Defines fixed-type cells and family types"), `:503` ("HK II §6: Defines the geometric fibres of neutral Hodge structures"), `:530` ("HK II §7: Defines geometric fibres of families"); `:2074` ("Under the ordinary Katz–Igusa tower and monodromy input stated below") with nothing below but the References.

   Witness: the consuming constructions are README §4.4 (`:820`), §0.4 (`:275`), §§5.1, 6.4 (`:938`, `:1123`), §7.1 (`:1240`), §6.1 (`:1057`); the Katz–Igusa input is the contract at `:176`; only References follow `:2074`.

   Repair: `:223` "HK II §3.1" → "§4.4"; `:250` "HK I Theorem 3.2.6" → "§0.4" and "HK II §§5–7" → "§§5.1 and 6.4"; `:503` "HK II §6" → "§7.1"; `:530` "HK II §7" → "§6.1"; `:2074` "stated below" → "requested from IgusaVarietiesAndTorsionConcentration (gap:ordinary-katz-igusa-monodromy)". Tested: each replacement heading exists in this README.

8. **F08** (P3) Duplicated *Needs* and Dependencies entries (round-2 leftover, still present)

   Location: `README.md:706` (§3.2) and `:718` (§3.3) list "PadicHodgeTheory §5.5" twice; `:1184` (§6.7) lists "DiamondSixOperations §S2.4" twice; `:2058` (§12.4) lists "PerfectoidShimuraVarieties §§3.1 and 3.5" twice; the Layer 3 (`:742–743`), Layer 6 (`:1230–1231`) and Layer 12 (`:2091–2092`) Dependencies repeat the same three lines.

   Witness: a scan of all *Needs:* lines and Dependencies blocks finds exactly these seven exact repeats; each arises when a supplier stage and one of its nodes render to one label (plan: `PadicHodgeTheory:R06.2` and `…/period-functors-perfect-residue-base`).

   Repair: delete the second occurrence in each of the four *Needs* lines and in the three Dependencies blocks. Optionally collapse nested entries such as "MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8; … §§6.1–6.2; … §6.8; … §6.3" (§§2.3, 6.2, 7.2) to the first. Tested: rerunning the scan gives no repeat.

9. **F09** (P3) Ownership of the canonical reduction is stated both ways

   Location: `README.md:13`, "Only their application to the new categories, and the precise canonical-reduction extension in its contract, belong here."; `:583` (§2.5), "Construct its canonical reduction of structure group"; versus `:108`, "What MotivesAndAlgebraicCycles must provide (gap:tannakian-canonical-reduction): Supply canonical reduction …".

   Claim: the scope paragraph and §2.5 place the canonical-reduction construction in this roadmap, while the contract assigns it to MotivesAndAlgebraicCycles.

   Witness: line 13 and §2.5 (`:583`) against line 108; `design/plan.json` `gaps` assigns `tannakian-canonical-reduction` to MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8.

   Repair: line 13 → "Only their application to the new categories belongs here; the canonical reduction to the reconstructed subgroup is requested from MotivesAndAlgebraicCycles (gap:tannakian-canonical-reduction)." §2.5 → "Import its canonical reduction of structure group (gap:tannakian-canonical-reduction) and characterize it …". Tested: after the edit the slug appears in the contract, the scope and §2.5, and no sentence claims the construction for this roadmap.

10. **F10** (P3) Three declared gaps are not named at the targets that consume them

   Location: §3.3 `README.md:714`, "Apply Serre’s Hodge–Tate openness criterion in that envelope", with *Needs* (`:718`) citing only PadicHodgeTheory §5.5; §1.1 interface `:327`, "b is basic iff the isocrystal Ad(b) is isoclinic of slope zero"; §11.4 `:1878`, "Pull it back along the submersive G(C)-orbit map".

   Claim: these steps read as supplied, but their inputs are open contracts.

   Witness: PadicHodgeTheory §5.5 (head #1062) has no openness theorem; its Sen theorem (§4.4) assumes K finite over Q_p, which a strict field is not. HKII line 1186 derives §1.1's criterion from ker(Ad) = Z(G). "gap:" occurs only at lines 72–184.

   Repair: in §3.3 write "Apply Serre’s openness criterion in that envelope (gap:strict-field-serre-openness)"; in §1.1 append "using ker(Ad) = Z(G) (gap:adjoint-kernel-and-orbit-differential)"; in §11.4 write "the orbit map, a submersion by gap:adjoint-kernel-and-orbit-differential". Tested: each consuming target then names a slug present in `design/plan.json` `gaps`.

11. **F11** (P3) §9.4 Check attributes an "unramified" hypothesis to HKII Example 8.4.4

   Location: `README.md:1658`, "For E/Q_p unramified cubic and the mirabolic subgroup of Res_E/Qp GL_2, the type with jumps (1,1,−2) in Example 8.4.4 …"; the §9 Examples (`:1703`) say only "cubic".

   Witness: HKII line 2386 takes any degree-3 E/Q_p; b_H = b = 1 needs only 1+1−2 = 0 in X_*(Res_{E/Q_p} G_m)_Γ = Z, which holds for every cubic E.

   Repair: "For a cubic extension E/Q_p (no ramification condition) and the mirabolic subgroup …". Tested: for a totally ramified cubic E the weights on Lie H are still 0, 1, −2 and b = 1 still lies in B(H, [mu_H^{-1}]).

## Verified sound

Read in full: `packages/AdmissiblePairsAndPadicHodgeStructures/README.md` (2110 lines), `Suggested.lean` (43 lines), `sources.toml`, `metadata.toml`, the `gaps` and node prerequisites of `design/plan.json`, and the round-2 repair report.

- **Declarations read: 0.** `Suggested.lean` has one `import Mathlib`, one module docstring and an empty namespace; no `def`, `theorem`, `instance`, `set_option` or `lemma`. The `#check @name` comparison therefore has an empty domain. The four headline theorems named in the Scope (HKII Theorem 9.1.3, Theorems A and B; HKI Theorem B) need Fargues–Fontaine modifications, diamonds or infinite-level moduli, none of which exists at the pins (Mathlib `6b7abb3` has only `WittVector.Isocrystal` and `BDeRhamPlus`/`BDeRham`); the docstring names each with its missing carrier. No statable headline is absent and nothing is padding.
- **Targets read: 78** (plan kinds: 37 theorems, 24 definitions, 10 constructions, 6 applications, 1 comparison). All 24 definitions carry at least three Checks (39 Checks blocks, 120 bullets).
- **Locators verified: about 150 source lines** against the cached texts: about 110 HKII lines (including Theorem 9.1.3 at HKII line 2481, Theorem A at line 268, Theorem B at line 501, Definitions 5.0.1, 8.4.1, 9.1.1, Theorem 5.0.4, Lemma 5.1.1, Propositions 7.3.3–7.3.4, Lemma 7.3.5, Proposition 9.3.4, Lemma 9.3.5, §10.1–10.2), 34 HKI lines (Theorem B at line 204, Corollary C at line 347, Proposition 3.1.7, Definitions 3.2.1/3.2.5, Theorems 3.2.6, 3.5.1, 4.4.4, 5.1.6, 5.2.4, 5.4.4, 5.5.1, Corollary 5.5.3, Theorem 6.3.2), LiuZhu lines 86, 89, 1154, BhattHansen lines 310, 314, 346, Scholze line 1936. Each cited line is the claimed statement; the statements match the README except where R06 and R11 say otherwise. §11.5 correctly states the opposite-special conclusion of Theorem 9.1.3(2); §§8.3 and 8.6 correctly depart from HKII Remark 7.5.3 (see Source issues).
- **Checks tested: about 110 of 120**, by explicit computation for those in the table below; none is false. The rest restate supplier facts (GS0 agreement, the BG2 stack identification, Steinberg, Čerednik–Drinfeld) and were checked only against the supplier text.
- **Sibling citations checked: about 95 anchors in 21 suppliers**, each found at the head or main copy the brief names: RelativeFarguesFontaine §§4.10–4.12, 6.6–6.9, 7.2, 7.4, 7.6 (head #1209); BunGAndNewtonStrata (10 anchors); VectorBundlesAndIsocrystals (9); ReductiveGroupsPartII (5, incl. *steinberg-quasi-split*); MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; DiamondsAndVStacks (12 anchors and D5.10, whose statement matches the §10.2 use); HeckeStacksAndLocalShtukas §§HS2.12, HS2.15 (arbitrary reductive b, so §6.8 is covered); AInfCohomology §§AI.2.2 (incl. "Operations in valid BKF subcategories"), AI.2.3; PadicHodgeTheory §§2.2–2.3, 5.5, 7.1 (lattice-position uniqueness), 7.4; AdicSpacesPartV (16 RZ anchors, design stage); PerfectoidSpaces §§P4.15.6, P6.11; GeometricSatakeAndFusion (5); DiamondSixOperations §§S2.4, S3.2, S4.2, S4.3; EndoscopicTransferAndUnitaryTraceComparison §§12.5, 12.11; IgusaVarietiesAndTorsionConcentration IG.1; PerfectoidShimuraVarieties §§2.2, 3.1, 3.5; HilbertModularVarietiesAndShimuraCurves §§R18.5.7, .15, .20, .21; AdicSpaces Layer 6; AlgebraicVectorBundles L0A–L0C, L2A–L2B; ReductiveGroups Layers 1–3, 5, 6A, 7. Slope conventions agree with suppliers: VectorBundlesAndIsocrystals sends the slope −d/h isocrystal to O(d/h), RelativeFarguesFontaine pairs isocrystal slope −n with O(n), HeckeStacks uses [b]∈B(G,mu^-1).
- **Declared gaps (9):** slug, supplier, section and needs are identical in the README contracts and in `design/plan.json` `gaps`. None asks for something already provided: RelativeFarguesFontaine §7.6(b) descends B_dR+-modules and isomorphisms over B_dR, not B_dR-modules; PadicHodgeTheory §4.4 has Sen's theorem only for finite K, and §7.1–7.2 take de Rham-ness as input; ReductiveGroups Layers 2–3 have neither ker(Ad) = Z(G), nor orbit differentials over p-adic fields, nor observable subgroups; AInfCohomology has crystalline-rigidified BKF modules but not the rational rigidified equivalence; PerfectoidShimuraVarieties and IgusaVarieties IG.1 lack basic uniformization and the ordinary Katz–Igusa tower. MotivesAndAlgebraicCycles §6.3's closed-immersion criterion comes close to the canonical reduction but does not state it (see R09).
- **Pinned declarations (read at the pins with `git show`):** Mathlib `Isocrystal.lean` lines 113, 132, 138, 157, 172 (Frobenius p^m·σ), 180 (algebraically closed k, finrank 1); `Baire/Lemmas.lean` lines 141, 256 (countable index; the second needs a nonempty space); `Baire/CompleteMetrizable.lean` line 25; `BDeRham.lean` lines 75, 88 (p-adically complete ring, p prime and not a unit; zero ring when p = 0). Tau Ceti `GroupFunctor.lean` line 138 (field, commutative Hopf algebra, universe lift); `Subcomodule/Finite.lean` lines 144, 292 (`Module.Free R C`); `ExteriorStabilizer/Character.lean` line 101 (field, `HopfIdeal`, `I.toIdeal.FG`, stabilizer over every commutative value algebra). All hypotheses are as the README states.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 48 roadmaps, 555 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The owners added by R01 (HodgeTateAndCanonicalSubgroups, line 234) and R03 (DiamondsAndVStacks, line 16) are earlier than this roadmap (line 245).
- **Policy:** `git diff --stat origin/main...HEAD` touches only the package folder (7 files); no pull-request number, process word, `lemma` or `set_option` in README or Lean; every target has a locator.
- **Ownership:** a `roadmaps grep` for admissible pairs, p-adic Hodge structures, bilattices and Howe–Klevdal over main and all 352 open heads finds only unrelated uses of "admissible pair" (ColemanIntegration, MorseNovikov, GrossZagierAndArithmeticHeights, HabiroCohomologyFoundations) and HK citations in suppliers for their own inputs. This roadmap owns the two-lattice categories, the non-reductive Grassmannian and bi-analytic Ax–Lindemann; no sibling checkout listed in the brief defines them.

Pass record (one row per statement; values computed):

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, Tate table | Q_p(1) | Frobenius p^-1σ, slope −1; E(W)=O(1); L_et=Fil^1 lowers degree by 1 to 0; L_dR=Fil^-1; HS modification O(1), slope 1 = −w/2 so w=−2 | agrees with HKII line 1866 and HKI line 1583 | none |
| Conventions, weights | GL_2 type (1,0); mirabolic (1,1,−2) | Ad weights {−1,0,1} symmetric; {0,1,−2} vs inverse {0,−1,2} | one-sided bounds differ only off reductive H | none |
| §0.1 | L2=t^aR; L2=⟨e1,e2+t^-1e1⟩ | t^(i+a)R∩R onto k iff i≤−a; min entry valuation −1, det 0, divisors {−1,1}; subline and quotient {0} | true | none |
| §0.2 | t^mu; G_a off-diagonal t^-1; PGL_2 over Q_p[[t]] | coset of t^mu; only cocharacter of G_a is 0 so t^-1 is not in the good cell; invariant 1/2 becomes 0 over Q_pbar[[t]] | true | R01 |
| §0.3 | G_a⊂GL_2 | Levi (0,0), actual (1,−1), determinant degrees 0=0 | strict dominance | none |
| §0.4 | G_a extension; split torus | grade 0 of BB: 0→C→0→C→0 not exact (HKI line 970); torus always exact | true | R01 |
| §0.5 | GL_2 types (1,0), (2,0); C=C_p, K0=Q_p | weights {−1,0,1} give a bijection; weight 2 leaves the root coordinate mod t^2; Galois fixes only Q_p-flags | (2) needs C = completion of K0bar | R06 |
| §1.1 | Borel, b=diag(p,1); b=1; torus | Frobenius on Lie U is p·σ, slope 1; b=1 slope 0; Ad trivial on a torus | true | R10 |
| §1.2 | Borel vs diagonal Levi | B(T)=B(Borel); diag(p,1) T-basic, not Borel-basic | true | none |
| §1.3 | GL_2, diag(p,1); b=1 | G_b = diagonal torus (not an inner form); G_1 = GL_2 | true | none |
| §1.4 | G=1; Borel | Bun_1 a point; Ext^1(O(1),O(−1)) = H^1(O(−2)) ≠ 0 | true | none |
| §1.5 | G_a, b=1 | Aut = H^0(FF,O) = Q_p; H^1(FF,O) = 0 | true | none |
| §1.6 | G_m, b=p | E_(p^m) ↦ E_(p^(m−1)) | subtracts n | none |
| §1.6 example | b=[[1,1],[0,1]], x=diag(2,1) | bxb^-1=[[2,−1],[0,1]]; b^-1σ_b(x)=σ(x)b^-1=[[2,−2],[0,1]]; b^-1xb=[[2,1],[0,1]] | correct | none |
| §2.1 | Q_p(1); Q_p⊕Q_p(1) | O(1), w=−2; slopes 0 and 1, not pure | true | none |
| §2.2 | O(1)⊕O(−1); Tate n=1 | degree 0, slopes ±1; L_dR=Fil^-1 | true | none |
| §2.3 | unit; unit self-extension | End(1)=Q_p; group G_a, connected | true | none |
| §2.4 | slopes 0, −1 | weights 0, −2 = 2·slope | true | none |
| §2.5 | sum of units; Tate; extension | groups 1, G_m, G_a; [[1,u],[0,1]] fixes e1 and sends e2 to e2+ue1 | true | R09 |
| §2.6 | G_m type a | b=p^-a ∈ B(G_m,[mu^-1]); weight −2a, Newton −a | true | none |
| §2.7 | unit | (O,O,id,id) | true | none |
| §3.1 | Tate n; extension x∈B_dR/B_dR+ | filtration in degree −n gives Fil^n; only x=0 analytic (HKI line 2101) | true | none |
| §3.2 | Tate n, strict K | D_cris rank 1, φ=p^-n; lattice Fil^n recovered | true | R08 |
| §3.3 | χ_cyc at p=2 | image Z_2× open in Q_2× | true | R08, R10 |
| §3.4 | torus; G_a extension | torus flags are points; G_a has central zero cocharacter but is not a torus | statement true, proof plan fails | R02 |
| §4.1 | L⟨u²,u³⟩ | same diamond as L⟨u⟩ | true | none |
| §4.2 | O(1) on Spa L | C(1)^(G_L′) = 0 for every finite L′ | not étale-trivial | none |
| §4.3 | X=A^1, ξ^-1·g | locus V(θ(g)) | Zariski closed | none |
| §4.4 | ⟨e1,e2+(z/ξ)e1⟩ | z≠0: (1,−1); z=0: (0,0) | true | none |
| §4.5 | same family | good only at z=0 | no type off z=0 | R01 |
| §4.6 | filtration in degree a | Σ Fil^i·F^-i = Fil^-a | true | none |
| §4.7 | same family | trace terms not direct summands at z=0 | outside essential image | none |
| §5.1 | G_a | ξ^-1 ∈ B_dR/B_dR+ outside the good cell {0} | true | R05 |
| §5.2 | χ(h)=h, h=2 | (2,1/2)v=v; (2,2)v=4v | graph h↦(h,χ(h)^-1) | none |
| §5.3 | GL_2 (2,0) | (1,1) ≤ (2,0) | cell not closed | R05 |
| §5.4 | G_a extension | GL_2 type (1,−1) not ≤ (0,0) | excluded | none |
| §5.5 | maps into Gr_Ga | only rigid point 0 (HKII line 1458) | true | R05 |
| §5.6 | (0,1,−2) vs (0,−1,2) | max 1: isomorphism; max 2: no section | true | none |
| §6.1–6.2 | Y = two points | morphism (a,a); evaluation faithful (HKII line 1835) | true | none |
| §6.3 | norm-one torus in SL_2 | H^1(Q_p,T)=Z/2 → H^1(Q_p,SL_2)=1 | kernel Z/2 | R09 |
| §6.4 | constant unit family | type 0 | conditional on gap | none |
| §6.5 | G_m, b=p^-n, type a | slope n−a; admissible iff a=n | true | none |
| §6.6 | G_m, b=p^-1, type 1 / 0 | point / empty (O(1) unmodified) | true | none |
| §6.7 | X=Y=point; X two points | 1·1=1; 2 (excluded) | true | R08 |
| §6.8 | torus | one point | true | none |
| §7.1 | order-2 monodromy | unit fibres, no global frame | excluded | none |
| §7.2 | Tate | MT = G_m | true | none |
| §7.3 | Borel, inverse type (1,0) | Levi Newton diag(1,0) noncentral | X empty | none |
| §7.4 | V=Q_p(−n), Fil^a | Fil^n ⊂ Fil^a iff n≥a | true | none |
| §7.5 | P^1, e1, flag [a:c] | incidence c=0 | closed | none |
| §7.6 | mirabolic (0,1,−2) | fails ≥−1, inverse passes | true | none |
| §8.1 | Tate n=−1 | Fil^-1⊂Fil^0 false; B_dR+⊂Fil^0 true | true | none |
| §8.2 | b_H=1 | b_G = gσ(g)^-1, ≠1 unless σ(g)=g | true | none |
| §8.3 | Borel, b=diag(p,1), L_[1:1] | G-bundle trivial (a≠0); e1-sublattice Re1 gives O(−1) | not H-admissible | none |
| §8.4 | torus | bounds vacuous | true | none |
| §8.5 | ramified F/Q_2 | dim D×/F× = 4−2 = 2 = dim P^1(F) | true | none |
| §8.6 | GL_3 family | min entry −1, min 2-minor −1, det 0: (1,0,−1); Levi (1,−1;0) vs (0,0;0) | true | none |
| §9.1–9.2 | G_m, n=1 | frame fibre Q_p×; L_et exponent 1, L_dR −1 | true | R03 |
| §9.3 | identity data | identity | true | none |
| §9.4 | cubic mirabolic | Hodge special yes, HT special no | true | R11 |
| §9.5 | GL_4 diag(t,t,1,1) | all weights in {−1,0,1} | agree | none |
| §9.6–9.7 | G_m, b=p^n | n↦−n, mu↦mu^-1, κ(b^-1)=mu; both domains points | true | none |
| §10.1 | two CM points | generated group GL_2, both exceptional | converse fails | none |
| §10.2 | P^1(Q_p) vs N | compact image closed; {p^n} not closed | true | none |
| §10.3 | residue F_q | |x^q−x|≤|π| holds on O_L, Gauss value 1 | needs infinite residue | none |
| §11.1–11.3 | {a}⊂{a,b}; empty index | {a}; M_C | true | none |
| §11.4 | GL_2 line flag | orbit rank 1 = dim P^1 | true | R10 |
| §11.5 | inverse mirabolic | HT special, not special (HKII line 2486) | true | none |
| §11.6 | [1:c], c∉E | X1−cX0 over L([mu]) (HKII line 272) | true | none |
| §11.7–11.8 | torus; Borel b=diag(p,1) | flag dim 0; HT image a point (HKII line 2499) | true | none |
| §12.1–12.3 | order-2 monodromy; ordinary rank one, p=2 | variation not neutral; Z_2× infinite profinite, Q_p× components Z | true | none |
| §12.4 | Γ=1 | quotient M/K_p | conditional | R08 |
| §12.5 | Ram(D)={p,ℓ} | B: {∞,ℓ}; B′: {∞,ℓ,q,r} | B undetermined | R04 |

## Not verifiable

- Lean: neither the board checkout nor the content checkout has a Lake environment, so `Suggested.lean` was not built. It has no declarations, so nothing beyond `import Mathlib` would elaborate.
- Numbering in the published versions (HKI in Algebra & Number Theory 2026, HKII in Inventiones) was not collated; every locator uses arXiv v2, as the manifest records.
- Whether the arbitrary-field full-rank de Rham criterion (gap:arbitrary-field-full-rank-de-rham) is known: LiuZhu restricts to finite extensions of Q_p (LiuZhu line 86), and the cache holds no source for other fields.
- The residue-field hypothesis of Serre's openness theorem (HKI reference [33], cited at HKI line 2170) is not in the source cache, so the minimality of gap:strict-field-serre-openness was checked only against the suppliers.
- AdicSpacesPartV exists only at the design stage (`packages/AdicSpacesPartV/design/README.md`); its 16 RZ anchors were checked there.
- No suspicious instruction was found in any text read.

## Source issues

- **Misprint** in HKI at the proof of Theorem 5.1.6, p. 42: the source says the isocrystal piece W_(−w/2) goes to Hodge weight w; it should be W_(w/2), since its Tate pair of slope −k has weight −2k; affects nothing.
- **Error** in HKII at Remark 7.5.3, p. 47: the source says the ambient admissible locus pulls back to the subgroup admissible locus, illustrated by the Borel with b=diag(p,1); it should be that subgroup admissibility is the defining-line Hodge locus (Proposition 7.5.2), the illustration needing b=diag(1,p); affects nothing.
- **Gap** in HKII at the proof of Theorem 7.2.3, p. 42: the source says Liu–Zhu's one-point de Rham criterion, proved for finite extensions of Q_p, applies over a p-adic field containing Q_p-breve; it should be supplied over such fields; affects the proof.
- **Gap** in HKII at Proposition 2.3.1, p. 16: the source says the B_dR case follows from a v-stack result for vector bundles; it should be proved by a separate effective v-descent of finite projective B_dR-modules; affects the proof.
- **Misprint** in HKII at §5.1, p. 33, before Lemma 5.1.1: the source says the quotient of the reductive overgroup G′ by G is G/G′; it should be G′/G; affects nothing.
- **Misprint** in HKII at the proof of Theorem 9.1.3, p. 57: the source says the Hodge–Tate level is refined by H(Q_p); it should be the inner form H_(b_H)(Q_p), conjugated into G_b(Q_p); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "57fb70a", "job": "RT-AdmissiblePairsAndPadicHodgeStructures~1b", "model": "opus", "worker": "fable-rt23"} -->
