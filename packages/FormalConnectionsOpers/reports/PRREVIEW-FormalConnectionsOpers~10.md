# Review of FormalConnectionsOpers (pull request #1056 at ccaed5e)

**Verdict:** needs changes

This is a full review of head `ccaed5e`. Since `0694f07`, 218 lines changed, all in `TauCetiRoadmap/FormalConnectionsOpers/README.md`. `Suggested.lean`, `metadata.toml`, `lake-manifest.json` and everything outside the folder are unchanged.

**Previous findings.** All three findings of the review of `0694f07` are repaired. Two of the locators added for R02 need correcting; that is reported as R03 and R04 below.

- R01 (re-planned loop decompositions): repaired. §3A.5 (1363–1366) now says "The Cartan and Iwahori–Bruhat decompositions of `G(ℂ((t)))` are ReductiveGroupsPartII RG2.4's … they are cited, for every isogeny type and central torus, and not proved again. What is proved here is the dictionary." §3A.3 (1261–1275) takes `W̃`, `W_a = W ⋉ Q^∨` and `Ω` from RG2.1 and RG2.4.1. The ReductiveGroupsPartII contract (340–354), the Scope bullet (98–108), the `*Needs:*` lines (1305–1306, 1415–1418), the layer Dependencies (1491–1493) and the Iwahori–Matsumoto reference (2723–2728) were rewritten as the previous review asked. Every RG2 anchor resolves on main (listed under Verified sound).
- R02 (missing locators): repaired. Line 2338 now reads "Frenkel, Lemma 4.2.2, p. 112, and the paragraph preceding Lemma 8.3.2, p. 247". §3.3 (1079–1081), §3.4 (1100–1105), §7.3 (2371–2375) and §8.4 (2636–2640) now carry locators. Two of these new locators are wrong (R03, R04).
- R03 (deprecated name): repaired. Lines 234 and 2041 now cite `nhds_basis_isClopen`, which elaborates at the pin without a deprecation warning (`Mathlib/Topology/InductiveDimension/Classes.lean:146`, `[ZeroDimensionalSpace X]`).

## R01 (P2) — KacMoody and this roadmap each assign the comparison of their loop groups to the other, and the README misstates what KacMoody consumes

**Location.** `TauCetiRoadmap/FormalConnectionsOpers/README.md:145–149`: "KacMoody KM8A owns … the rotation/global-form comparison with the polynomial loop group of Layer 3A. … Layer 3A constructs … independently, and KacMoody consumes them." Lines 1323–1324 say the same ("that comparison is KacMoody's"), and so do lines 2694–2697 ("KacMoody KM8A consumes Layer 3A's …").

**Claim.** KacMoody's Layer 8 consumes Layer 3A and owns the comparison between its groups and Layer 3A's polynomial loop functors.

**Witness.** KacMoody on main, `TauCetiRoadmap/KacMoody/README.md:81–86` (repeated at 1278–1280): this roadmap "is later … so Layer 8 uses none of it … the identification of FormalConnectionsOpers' functors at `R = ℂ` with these complex-point groups is … stated on its side". No section here states it.

**Repair.**
- Rewrite the Scope bullet (145–149) as follows. KacMoody Layer 8 (KM8A) owns the following for the simply connected pinned `G_sc` of ReductiveGroups Layer 9, on complex points: the root-element generation of `G_sc(ℂ[t, t⁻¹])`, its affine Bruhat decomposition, the positive-root bounds and the conjugation formula for `I = ev₀⁻¹(B⁺(ℂ))`, and the generation of `G_sc(ℂ[t])` by `I` and the finite negative simple root groups (8.1). It also owns the minimal-group homomorphism, the central kernel and the global-form maps (8.2–8.4). KacMoody consumes nothing from this roadmap. §3A.4 keeps the reductive and all-`R` versions and says in one clause how they differ.
- Add a target to §3A.4. For `G = G_sc` and `R = ℂ`, identify `L_poly G(ℂ)`, `L_poly⁺G(ℂ)`, `ev₀`, `I_poly(ℂ)` and `x_α(u t^n)` with KacMoody 8.1's `G_sc(ℂ[t, t⁻¹])`, `G_sc(ℂ[t])`, `ev_0`, `I` and root elements, through ReductiveGroups Layer 0's Hopf/scheme-points dictionary. For connected reductive `G`, compare with KacMoody 8.4's maps through the derived central isogeny.
- Add a `### From TauCetiRoadmap.KacMoody` contract for Layer 8.1–8.4 and the matching `*Needs:*` item. KacMoody is on main, so the edge points downward.
- Replace the sentence at 1323–1324. Replace the Downstream bullet at 2694–2697 with: "KacMoody Layer 8 is earlier and consumes nothing here; the comparison with its complex-point groups is §3A.4's."

**Test (`SL₂`).** KacMoody's Check describes `I` as the matrices of `SL₂(ℂ[t])` with `c(0) = 0`. §3A.4's Check has `[[1, 0], [t, 1]] ∈ I_poly(ℂ)`, and `[[0, 1], [−1, 0]] ∉ I_poly(ℂ)` since its constant term is not upper triangular. The identity map matches the two groups on these elements.

## R02 (P2) — §4.4 gives tori a trivial oper groupoid, which contradicts its own fibre statement

**Location.** `README.md:1817–1819`: "For a torus `T`, `Op_T(D×)(R) = 𝔱 ⊗ F_R dt` with the trivial groupoid structure." The Check at 1831–1832 says the same.

**Claim.** For a torus, the oper groupoid has no arrows other than identities.

**Witness.** Line 1811: "A torus oper is exactly a torus connection". Bullet 1817–1818 at `G = T` gives automorphisms "the horizontal `Z(G)`" `= ℂˣ`. By §3.3's check `gauge(t, A) = A − t⁻¹`, `d ≅ d − t⁻¹dt`.

**Repair.** Two objects share the name `Op_G(D×)`: the Drinfeld–Sokolov coefficient functor (bullet 1815) and the intrinsic groupoid (bullet 1817). Give the coefficient functor its own name, for example `Op^DS_G`, and replace bullet 1819 with: "For a torus `T`, the coefficient functor is `𝔱 ⊗ F_R dt` with only identity arrows. The intrinsic groupoid `Op_T(D×)` is `Loc_T(D×)`: its arrows are the gauges `A ↦ A − dlog g`, `g ∈ T(F_R)`, and its automorphism groups are the horizontal `T(R)`. The comparison functor from the coefficient functor is faithful and not full, and on objects it reaches the connections on the trivial torsor." Rewrite the Check at 1831 the same way.

**Test (`𝔾_m`, `R = ℂ`).** In the coefficient functor, `0` and `−t⁻¹` are distinct objects with no arrow between them. In the intrinsic groupoid, `g = t` joins them, and `Aut(d) = ℂˣ` (§3.4's check at 1126). This matches bullet 1817.

## R03 (P3) — Two locators point to the wrong lemma or page

**Location.**
- `README.md:2639–2640`: "The exported continuous cotangent algebroid is the one of Frenkel–Gaitsgory, §4.3, Lemma 4.3.1, p. 39".
- `README.md:2679`: "(Frenkel, Conjecture 10.1.2, p. 310)".

**Witness.** FrenkelGaitsgory2006 line 1825: Lemma 4.3.1 is `Ω¹(Conn_G(D×)) ≃ isomConn_G(D×)`; line 1851: Lemma 4.3.2 is `Ω¹(Op_g(D×)) ≃ isomOp_g`, the exported object. Frenkel2007 line 12936 (Conjecture 10.1.2) follows the running head "311" at line 12914.

**Repair.** At 2639, cite "Frenkel–Gaitsgory, §4.3, Lemma 4.3.2, p. 39 (proof pp. 39–40)". At 2679, write "p. 311". §7.1 (2299–2301) already cites both lemmas correctly.

## R04 (P3) — §3.4 cites Frenkel–Gaitsgory for fpqc-local triviality, but the source requires étale-local triviality

**Location.** `README.md:1103–1105`: "torsors trivializable after a coefficient-ring fpqc cover (Frenkel–Gaitsgory, §1.1, p. 16, for `R`-families of torsors on `D×` locally trivial over `Spec R`)".

**Witness.** FrenkelGaitsgory2006 lines 692–693 (p. 16): an `R`-family of `G`-bundles on `D×` is a `G`-bundle on `Spec R((t))` "locally trivial in the étale topology in `Spec(R)`". Nothing here shows the fpqc class agrees.

**Repair.** Either take Frenkel–Gaitsgory's étale-local condition, or keep fpqc and write "(Frenkel–Gaitsgory, §1.1, p. 16, require étale-local triviality on `Spec R`; the fpqc-local class used here contains theirs)". In the second case, any later identification of `Loc_G(D×)` with Frenkel–Gaitsgory's must be stated as a target.

## R05 (P3) — The headline `regularGauge_constantCoeff_bijective` has no locator

**Location.** `README.md:920–927`: "Prove regular formal horizontal trivialization by coefficient recursion in characteristic zero … `regularGauge_constantCoeff_bijective` states that taking the constant term is a bijection …". The docstring at `Suggested.lean:65–70` cites only "README F2.4".

**Witness.** FrenkelGaitsgory2006 lines 1894–1905, Lemma 4.4.2 and proof (pp. 40–41): for bundles on `Spec R[[t]]` with regular connection, `R` a `ℂ`-algebra, connection-preserving isomorphisms biject with isomorphisms of restrictions to `Spec R`.

**Repair.** Add "(over `ℂ`-algebras `R`: Frenkel–Gaitsgory, Lemma 4.4.2 and its proof, pp. 40–41; the `ℚ`-algebra form is the same coefficient recursion)" to §2.4 and to the docstring. The statement does not change.

## R06 (P3) — The `PGL₂` Check in §3A.3 puts a length-one element into `Ω`

**Location.** `README.md:1297–1299`: "`G = PGL₂`: `Y = ℤ(α^∨/2)`, `Y/Q^∨ = ℤ/2`, and the class of `diag(t, 1)` is the nontrivial element of `Ω`".

**Witness.** `Ω` stabilizes the base alcove. `diag(t, 1)` conjugates `[[a, b], [c, d]] ∈ I_form` to `[[a, tb], [c/t, d]]`, outside `I_form` at `c = t`; its length is `|α(α^∨/2)| = 1`. RG2.1's `not_all_of_N` (2280) says only `diag(ϖ, 1) ∉ W_a`.

**Repair.** Write: "the class of `diag(t, 1)` maps to the nontrivial element of `W̃/W_a ≅ Ω ≅ Y/Q^∨`; the nontrivial element of `Ω` itself is the class of `[[0, 1], [t, 0]]`".

**Test.** `[[0, 1], [t, 0]]` conjugates `[[a, b], [c, d]]` to `[[d, c/t], [tb, a]]`, which lies in `I_form` exactly when `c ∈ tℂ[[t]]`. So it normalizes `I_form`, and its image in `Y/Q^∨` is `α^∨/2 mod Q^∨ ≠ 0`.

## R07 (P3) — The `S = R × R` descent Check in §3.2 describes an empty overlap that is not empty

**Location.** `README.md:1067–1069`: "for `S = R × R` it is the statement that a module is determined by its two restrictions and the identification on the empty overlap of the two factors."

**Witness.** `S ⊗_R S ≅ R⁴` via `e_i ⊗ e_j`. Its `(1, 2)` and `(2, 1)` components are copies of `R`, so a descent datum includes `M₁ ≃ M₂`. The pair `(R((t)), 0)` has none, yet the Check accepts it.

**Repair.** Write: "for `S = R × R` the off-diagonal components of `S ⊗_R S` are copies of `R`; a descent datum is an isomorphism `M₁ ≃ M₂` satisfying the cocycle condition, and the descended module is `M₁`; `(R((t)), 0)` admits none."

## R08 (P3) — The unit Check in §4.1 cannot fail

**Location.** `README.md:1518–1519`: "for `R = ℂ[ε]/ε²` the series `ψ = ε + t⁻¹` is a unit of `R((t))`; the unit condition is tested in `R((t))`, not in `(R/ε)((t))` alone."

**Witness.** `εR((t))` squares to zero, so `x` is a unit of `R((t))` exactly when its image in `(R/ε)((t))` is. The named wrong model agrees on every series. No cover appears, so fpqc-locality is untested.

**Repair.** Replace it with: "`ψ = 1 + εt⁻¹` is a unit of `R((t))` with inverse `1 − εt⁻¹`, although its lowest coefficient `ε` is not a unit. A transversality test asking for an invertible lowest coefficient wrongly rejects it." Either drop "fpqc-local" or give an actual cover.

## Verified sound

**Gate and direction**
- Worker's gate (`gate.md`): every check passed, including `build=0`. Rerun here on `ccaed5e`: `set_option=0 … outside-folder=0 source-material=0 OK`, exit 0.
- Dependency check: `depcheck: 235 roadmaps, 2258 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Merge order: KacMoody 3, SmoothBundlesConnections 12, CrystallineCohomology 23, ComplexComparisonPartII 39, FormalConnectionsOpers 40. ReductiveGroupsPartII, ReductiveGroups, KacMoody, FormalLaurentPuiseux, LieHighestWeight, LieGroups, RootSystems, SchemeAndStackFoundations, AlgebraicVectorBundles, ComplexKahlerGeometry, ComplexManifolds, CharacteristicClasses, AffineMorseLefschetz and ProfiniteCohomology are on main, and AnalyticToricGeometry is under `Completed/`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `roadmaps resolve` returned one lead, `AffineWeylGroup.not_all_of_N` (README 1299). It is a Check name in ReductiveGroupsPartII on main (line 2280), README-only there ("*Lean:* none"). The citation resolves.

**Lean**
- `lake env lean TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean`: exit 0, with three `declaration uses sorry` warnings (lines 71, 130, 160) and nothing else.
- I ran `#check @name` on all nine declarations in a scratch copy. Each elaborated type equals `signatures.md`, and no binder is lost: `[Algebra ℚ R]`, `reductiveCommHopfAlgProperty ℂ H`, `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]` and `[HopfAlgebra k H] [Algebra k R]` are all present. Each type matches its README statement (§2.4 920–927, §3A.2 1232–1234, §6.2 2099–2104).
- One-tactic probes on scratch copies: `first | rfl | simp | infer_instance | aesop` and `exact?` fail on all three theorems. None is padding.
- Headlines in the Summary: Layer 2, Layer 3A and the cyclic-vector part of Layer 6 are stated. The docstring names each unstated headline with its missing carrier: F2.1/F2.3 flatness criterion, F4.3 Kostant slice and Drinfeld–Sokolov normal form, F4–F5 opers and `Fun Op(D×)`, F6.1/F6.5 Frenkel–Zhu and torsor triviality, and F7–F8 Poisson, Miura and isomonodromy.

**Library declarations opened at the pins (24).** The pins are unchanged since the previous review.
- Elaborated: `TauCeti.PointTopology.instTopologicalSpaceWithConv` (`Topology/Algebra/PointTopology/Basic.lean:110`), `isHomeomorph_ofConv` (`:115`), `isClosedEmbedding_eval_generators` (`:245`), `isTopologicalGroup` (`Group.lean:102`, `[IsTopologicalSemiring R]`), `instSecondCountableTopologyWithConv` (`Separation.lean`), `TauCeti.SchemePointTopology.affineHomeomorph` (`Scheme.lean:165`), `TauCeti.chartedSpaceOfIsOpenEmbedding` (`Geometry/Manifold/Gluing/Basic.lean:87`), `TauCeti.maximalAtlas_chartedSpaceOfIsOpenEmbedding_eq` (`:363`), `ContinuousMonoidHom.exists_mem_nhds_one_forall_le_ker` (`Analysis/Normed/Algebra/NoSmallSubgroups.lean:113`), `TauCeti.HopfAlgebra.finrank_lie_eq_ringKrullDim_of_charZero`, `TauCeti.smoothCommHopfAlgProperty_of_charZero`, `TauCeti.reductiveCommHopfAlgProperty`, `IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one`, `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`, `AlgebraicGeometry.Spec.homEquivAlgHom`, `HahnSeries.ofPowerSeriesAlg`, `LaurentPolynomial.eval₂`, `Differential`, `LieRinehartAlgebra`, `nhds_basis_isClopen`.
- Read in source, because the oleans of these modules are not built in this worktree: `TauCeti.zHat.cohomologicalDimensionAt_le_one` (`hp : p ≠ 0`), `cohomologicalDimensionAt_eq_one` (`[Fact p.Prime]`) and `cohomologicalDimension_eq_one` (`Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.lean:191, 199, 206`), and `TauCeti.Toric.regularAffinePointHomeomorph` (`Geometry/Toric/Analytic/RegularChart.lean`).

**Cross-roadmap citations resolved**
- ReductiveGroupsPartII on main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md`:
  - Conventions 125–131: `ModelField` is henselian, discrete, rank one, with perfect residue field. Line 147 normalizes the torus valuation by `⟨χ, v(z)⟩ = −ω(χ(z))`. §3A.3's group-level identification `t^λ ↦ (λ, 1)`, pinned by the `𝔾_m` Check at 1291–1295, is independent of that sign.
  - *affine-weyl-group* 2233: Coxeter system; `AffineWeylGroup.semidirect` 2247; `coxeterSystem` 2244; `not_all_of_N` 2280.
  - *parahoric-subgroup* 4289; *hyperspecial-vertices* 4447; RG2.3.2 Néron models of tori 4044, with *neron-finite-type-and-connected-models* at 4081.
  - *iwahori-weyl-group* 5535: `W̃ = N(K)/Z(K)_0`, `W_a ⊂ W̃`, `Ω` a complement. The Checks `splitTorus` (5574) and `sl2_eq_affineWeyl` (5576). *iwahori-weyl-exact-sequences* 5615: `1 → Z(K)/Z(K)_0 → W̃ → W_0 → 1` and `W̃ = W_a ⋊ Ω`.
  - *iwahori-bruhat-decomposition* 5730: `W̃ → I\G(K)/I` is a bijection for every model field.
  - *cartan-decomposition* 6215, second clause: `W_0\W̃/W_0 ≅ K\G(K)/K` at a special point for every model field. The third clause, written with `X_*(T)^+`, is stated over `E` only; the contract consumes only the second, as it says.
  - `glDecompositions_infinite_residue` 6647: `ℂ((t))` is a `ModelField`. RG2 cites nothing from this roadmap, so these edges make no cycle.
- KacMoody on main: Layer 8 (KM8A) at 1133–1236, Scope 79–86, Downstream 1278–1280 (R01).
- ReductiveGroups 3A.5b–3A.5e exist only at the open revision (the revision of #1676 at head `69572c37`, its lines 1319–1440); on main, ReductiveGroups 3A.5 is the single paragraph at line 335. The pull request's description names #1676 (and #1797, #1808) as the revision to merge first, so this is not an unnamed revision dependency. Its 3A.5b gives open embeddings, Hausdorffness for separated `X` and second countability for finite type. Its 3A.5c gives the evaluation topology through `affineHomeomorph` and `isClosedEmbedding_eval_generators`. Its 3A.5d gives charts onto open subsets of `ℂᵈ`, holomorphic transitions and étale maps as local biholomorphisms. Its 3A.5e gives the Lie algebra by the chart at `1`. Lines 41–43 there say "FormalConnectionsOpers §2.4 consumes 3A.5c–3A.5d, and its §4.3 consumes 3A.5e", which matches the contract at 318–332.
- ComplexComparisonPartII (#848, via `roadmaps show`): its lines 153–154, 1090, 3103 and 3329 name F2.4 and C5.1 as in the contract at 383–406. CrystallineCohomology (#857): CR.1.3 at 1121, with this roadmap named at 128–134 and 11536.
- Consumers: SheafTheoreticSmithTheory (#1734) lines 674, 678 and 798 cite §3A.5 and RG2.4 consistently with the new split. ReductiveGroups #1332 line 1695 and #1676 line 2053 cite §3A.5's use of Layer 6B. No roadmap cites a dropped id; `overlaps.md` lists no pull request changing this roadmap.

**Ownership.** I grepped (`roadmaps grep`) for ownership of the affine Grassmannian, loop Grassmannian and affine flags. Only this roadmap constructs them over `ℂ`. ReductiveGroupsPartII line 63 disclaims affine Grassmannians, GeometricSatakeAndFusion owns the Witt version, and SheafTheoreticSmithTheory consumes §3A.5. The Cartan, Iwahori–Bruhat and affine Weyl objects now have one owner, RG2 on main.

**Seeded sample of sources.** I read every locator below in the cached text. Pages are the printed running heads. Frenkel2007's offset from the PDF page is 14 at p. 15 but 11 at p. 247 and 10 at p. 311, so the manifest's "PDF page minus 14" note does not hold throughout.

| Target | Source and locator | Supports the statement |
| --- | --- | --- |
| F1.2 | Frenkel §3.5.3 (from p. 90; `a₀ = 0`, `a₁ ≠ 0` and composition on p. 91, lines 4073–4077), §3.5.4 pp. 91–92 (4109–4120: `Aut O = ℂˣ ⋉ Aut⁺O`, `Der⁺O = t²ℂ[[t]]∂_t` pro-nilpotent), §3.5.7 p. 96 (4350) | Yes |
| F2.1 | CR.1.3 (#857, line 1121); no source locator, standard | Yes |
| F2.4 | ReductiveGroups 3A.5b–3A.5d at #1676; C−1.1; the headline has no locator | R05 |
| F3.2 | Drinfeld v4 Theorem 3.11 (line 490) | Yes |
| F3.3 | Frenkel (1.2-4), p. 15 (911), §1.2.6 (978), (1.2-7), p. 18 (994); FrenkelGaitsgory2006 (1.2), p. 15 (672), `R`-families, p. 16 (694–697) | Yes; misprint in (1.2), see Source issues |
| F3.4 | FrenkelGaitsgory2006 §4.3, (4.5) and the following display `IsomConn ≃ Conn × G((t))`, p. 39 (1813–1817); Frenkel (1.2-7) p. 18; FrenkelGaitsgory2006 §1.1 p. 16 (692–693) | Yes, except the étale/fpqc point (R04) |
| F3A.3 | Iwahori–Matsumoto §1 "On the Weyl group extended by translations", from p. 7 (cached text lines 116–135): `DW`, `D'W` and the length function; RG2.4.1 for `W̃` | Yes, for semisimple Chevalley groups, as cited |
| F4.1 | Frenkel §4.2.1, pp. 108–109 (4816–4865: `[n, n]^⊥/b ≅ ⊕ n_(−α_i)`, open `B`-orbit, transversality); §4.2.2 (4.2-1), p. 109 (4877) | Yes |
| F4.2 | Frenkel (4.2-2), p. 110 (4906) and the display after it | Yes |
| F4.3 | Kostant Proposition 0.4, Theorems 0.1, 0.6 and (0.1.8), all verified last round, unchanged; Frenkel §4.2.4 (4991, p. 112) and Lemma 4.2.2 (5011, p. 112) | Yes |
| F4.4 | FrenkelGaitsgory2006 §1.1 (621: `G` adjoint throughout Part I), Corollary 1.3.2, p. 17 (787) | Yes; internal inconsistency R02 |
| F5.1 | Frenkel §4.2.3 (4.2-3), p. 111 (4952); Lemma 4.2.1, p. 112 (4985) | Yes |
| F6.5 | Steinberg Theorem 1.9, p. 51 (cached text 134–136: `k` perfect, `dim k ≤ 1` ⇒ `H¹(k, G) = 0` for connected linear `G`) | Yes |
| F7.1 | Huebschmann Theorem 3.8 and Addendum 3.8.4, verified last round, unchanged | Yes |
| F7.2 | Frenkel §8.3.2 from p. 246 (10465); freeness sentence p. 247 (10505–10506); Lemma 8.3.2 p. 247 (10512) | Yes |
| F7.3 | Frenkel (3.1-3), p. 66 (3100: `[S̃_n, S̃_m] = (n − m)S̃_(n+m) + (n³ − n)c/12 δ`; with `c/12 = −½`, `c = −6`); §3.1.3 begins at 3103 on the same page; FrenkelGaitsgory2006 Remark 4.2.1, p. 38 (1802–1805) | Yes |
| F7.4 | FrenkelGaitsgory2006 Lemma 4.4.1 (1880–1888) | Yes |
| F7.5 | Frenkel §8.2.1, p. 233 (9938), Proposition 8.2.2, p. 235 (10011), §8.2.3 with (8.2-7)–(8.2-10), pp. 238–239 (10140–10201), Proposition 8.2.3, p. 239 (10208) | Yes |
| F8.2 | FrenkelGaitsgory2006 Proposition 4.1.1 (1764), §4.2 (1765–1784), (4.2)–(4.4), p. 38 (1790–1798), Lemmas 4.3.1–4.3.2, p. 39 (1825, 1851) | Yes |
| F8.3 | FrenkelGaitsgory2006 Lemma 4.4.2, pp. 40–41 (1894–1905) | Yes |
| F8.4 | Frenkel (2.1-9), p. 37 (1785: `S(z) = ½ Σ :J^a J_a:`); (3.1-3), p. 66; FrenkelGaitsgory2006 Lemma 4.3.1 | (2.1-9) and (3.1-3) yes; Lemma 4.3.1 is the wrong lemma (R03) |
| Downstream | Frenkel Conjecture 10.1.1, p. 310 (12882); Conjecture 10.1.2, p. 311 (12936) | 10.1.1 yes; 10.1.2 is on the wrong page (R03) |

**Adversarial table.** Each row gives values computed here; rows touched by a finding say so.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `regularGauge_constantCoeff_bijective` | `n = 1`, `A = 1`, `B = 0` over `ℚ`; `𝔽_p`, `A = B = 0`; `ℚ[ε]/ε²`, `A = εI`, `B = 0`; `n = Fin 0`; zero ring | `gAg⁻¹ − g′g⁻¹ = 0 ⇒ g′ = g`, `g = g₀eᵗ`; `1` and `1 + tᵖ` both solve `g′ = 0` with constant term `1` (not injective); `g′ = εg ⇒ g = g₀(1 + εt)`; singleton to singleton; trivial groups | holds; `[Algebra ℚ R]` needed | locator (R05) |
| `regularGauge` action law | `h, g` | `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹`; `regularGauge 1 A = A` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` | `G = 1`; `𝔾_m`, `R = ℂ`; `𝔾_m`, `R = ℂ[ε]/ε²`; `SL₂`, geometric series | point; `u = a tⁿ w`, `w(0) = 1`; `1 + εt⁻¹ = p`, `q = 1`; `(1 − t)⁻¹t⁻¹ − t⁻¹ = (1 − t)⁻¹` positive | holds | none |
| `exists_cyclicVector` | `V = 0`; `F²`, `D = 0`, `∂ = 0`; `𝔽_p(t)`, `F^(p+1)`, `D = ∂` | `Fin 0` family independent; iterates `v, 0`; `∂ᵖ = 0` on `𝔽_p[t]` and on `𝔽_p(t)` | both hypotheses needed | none |
| `IsDifferentialModuleMap` | `D = ∂` on `F`; `D = id`; `D = 0` with `∂ ≠ 0` | Leibniz holds; fails by `f′v`; fails by `f′v` | determines its object | none |
| F1.2 inverse, order, chain rule | `φ = t + t²`; `φ = 2t`, `ψ = t + t²`; `f = t⁻¹`; `φ = t²` | `ψ = t − t² + 2t³ − 5t⁴`, `φ(t − t²) = t − 2t³ + t⁴`; `ψ(2t) = 2t + 4t²` against `φ(ψ) = 2t + 2t²`; `(f′∘φ)φ′ = −t⁻²(1 − t² + ⋯)`, residue `1`; `Res(2t⁻¹) = 2` | as stated | none |
| F2.1 dual sign, negative control | `∇ = d + a dx`; `A = k[x, y]/(x, y)²`, `∇ = d + x dy` | `∇^∨e* = −a dx e*`; `Ω² = k·dx∧dy` (`x dx∧dy = y dx∧dy = 0`), `F(1) = dx∧dy ≠ 0`; `ξ(y) ∈ (x, y)` so `xξ(y) = 0`, `∇_ξ = ξ` | as stated | none |
| F2.4 charts, Nullstellensatz | `Spec ℂ[x]/x²`; `𝔾_m ⊔ 𝔸²`; `D(x − 1)` | cotangent rank `1`, Krull dimension `0`; ranks `1, 2`; point `x = 2` | as stated | none |
| F3.2 bounds | `g = t^M`, entry bound `0` | inverse pole orders `1, 2, 3` for `M = 1, 2, 3` | as stated | none |
| F3.2 `S = R × R` Check | `S ⊗_R S`; `(M₁, M₂) = (R((t)), 0)` | `≅ R⁴`, off-diagonal components `R`; no isomorphism `R((t)) ≃ 0` | Check false as worded | R07 |
| F3.3 gauge, locator | `𝔾_m`, `g = t`; `g = 1 + εx`; FrenkelGaitsgory2006 (1.2) | `A − t⁻¹`; `A + ε([x, A] − x′)`; `gAg⁻¹ − g⁻¹g′` composes to `hgA(hg)⁻¹ − hg⁻¹g′h⁻¹ − h⁻¹h′ ≠ gauge(hg, A)` for non-abelian `g` | README formula correct, source misprinted | Source issues |
| F3.4 classes, stabilizers | `𝔾_m`, `R = ℂ`; `ℚ[ε]/ε²`; `𝔽_p` | `a ↦ a − n t⁻¹ − f′`: classes (polar part in `t⁻²ℂ[t⁻¹]`, residue mod `ℤ`); stabilizer `ℂˣ`; `tᵖ` stabilizes in characteristic `p` | as stated | locator topology (R04) |
| F3A.3 identification | `𝔾_m`; `SL₂`; `PGL₂`, `diag(t, 1)` and `[[0, 1], [t, 0]]`; factor order | `t ↦ t`, the convention `t^(−λ)` gives `λ ↦ −λ`; `Ω = 1`; conjugates of `[[a, b], [c, d]]`: `[[a, tb], [c/t, d]]` (leaves `I`), `[[d, c/t], [tb, a]]` (stays); `(w, λ)(v, μ) = (wv, v⁻¹λ + μ)` matches `(λ, w) ↦ (w, w⁻¹λ)` | `PGL₂` Check misplaces `Ω` | R06 |
| F3A.5 Iwahori, Cartan, charts | `SL₂`: `x_α(1)`, `x_(−α)(1)`, `x_(−α)(t)`; BT convention `U_(α,x) = {n ≥ −α(x)}`; `GL₁`; `GL₂`, `L = ℂ[[t]]e₁ ⊕ t⁻¹ℂ[[t]]e₂` | `n ≥ 0` for `α > 0`, `n ≥ 1` for `α < 0` exactly on `0 < α(x) < 1`; in `I`, not in `I`, in `I`; `ℂ((t))ˣ = ⊔ ℂ[[t]]ˣtⁿ`; pole order `1`, not `0` | as stated | none |
| F3A.6–7 | `GL₂`, `diag(t, t)`; `(1 − t)⁻¹·1`; `PGL₂`, `α^∨/2` | component `2`; `det(1 + t)·1 = (1 + t)²` not a unit; `[diag(t², 1)] = [diag(t, t⁻¹)]` | as stated | none |
| F3A.4 and KacMoody 8.1 | `SL₂`: `[[1, 0], [t, 1]]`, `[[0, 1], [−1, 0]]` | in both Iwahoris; in neither; with `λ = α^∨`, `t^λ x_α(u tⁿ) t^(−λ) = x_α(u t^(n+2))` in both | agree, comparison unowned | R01 |
| F4.1 unit condition | `ℂ[ε]/ε²`: `ψ = ε + t⁻¹`, `ψ = 1 + εt⁻¹` | `(ε + t⁻¹)·t(1 − εt) = 1`, reduction `t⁻¹` a unit; `(1 + εt⁻¹)(1 − εt⁻¹) = 1`, lowest coefficient `ε` | first Check vacuous | R08 |
| F4.2 normalization | `[[a, b], [1, −a]]`, gauge `[[1, u], [0, 1]]`; `SL₂`, `ψ = 2` over `ℚ` | `[[a + u, b − 2au − u² − u′], [1, −a − u]]`, `u = −a` gives `b + a² + a′`; `s² = 2` has no root in `ℚ((t))` | as stated | none |
| F4.3 | `𝔰𝔩₂`; `𝔤𝔩₂`; `𝔰𝔩₃`; `a = t`; `a = εt⁻¹`; `μ₂ ⊂ 𝔾_m` | `det ↦ −h²`, slice `[[0, q], [1, 0]]` with `det = −q`, complement `{0}` of codimension `3`; degrees `1, 2`; exponents `1, 2`, `1 + 2 = 3`; `q = t² + 1`; `q = −εt⁻²`; even polynomials versus all | as stated | none |
| F4.4 lifts | `diag(√t, 1/√t)` on `[[0, q], [1, 0]]` | `[[−1/(2t), tq], [t⁻¹, 1/(2t)]]`, residue `−½ ∉ ℤ` | as stated | none |
| F4.4 tori | `𝔾_m`, `R = ℂ`: `d`, `d − t⁻¹dt` | gauge `t` joins them; `Aut(d) = ℂˣ` | trivial-groupoid bullet contradicts the fibre bullet | R02 |
| F5.1 | `{t + t², t}` | `−6/(1 + 2t)²` | as stated | none |
| F6.5 | `μ_n`; `0`-primary `ℤ`; `p = 2` | `ℂ((t))ˣ/n = ℤ/n`; `H²(ẑ, ℤ) ≃ ℚ/ℤ ≠ 0`; `2ᵏ·1 ≠ 0` | as stated | none |
| F7.1 | `{x, y} = 1`; `{x, y} = x`; `k[x, y]/(x², y²)` | `anchor(dx) = ∂_y`, `anchor(dy) = −∂_x`, `[dx, x dy] = 0`; `[dx, dy] = dx`, `anchor(dy)(x) = −x`; `{x², y} = 2x ≠ 0` | as stated | none |
| F7.2 sign | `x = t^m`, `y = t^n`, rank one | `−Res(t^m n t^(n−1) dt) = −nδ_(m+n,0)` | as stated | none |
| F7.3 Virasoro | `P_q(t^(m+1))`; `m = 2`, `n = −2` | `(m − n)L_(m+n) − ½(m³ − m)δ`; `4L₀ − 3`; `c/12 = −½` | as stated | none |
| F7.4 | `L_n = q_(−n−2)` | `L_n ∈ I ⟺ n ≥ −1`; `{L₂, L₋₂}|_(Op(D)) = −3`; `{L₋₁, L₋₂} = L₋₃ = q₁ ∉ I` | as stated | none |
| F7.5 Miura, screening | `[[−u, 0], [1, u]]`, gauge `[[1, εx], [0, 1]]` | `[[−u + εx, 2uεx − εx′], [1, u − εx]]`; `x′ = 2ux`; `δ(u² − u′) = −2ux + x′ = 0` | as stated | none |
| F8.2 | `𝔰𝔩₂`, `∇ = ∂ + f + qe`; `ε, η` | `∇_ad(xe) = x′e − xh`, class `(β + α′)e`; `𝔤/𝔟` part `y_f′ + 2y_h`; `1 − εη[x, y]`; `[F_e, F_f] = −F_h` | as stated | none |
| F8.3 | `𝔾_m`, `a, b ∈ ℂ[[t]]` | `nt⁻¹ + u′/u ∈ ℂ[[t]] ⟺ n = 0` | as stated | none |
| F8.4 | rank one | `κ₀(h, −) = α`, `κ₀∨(α, α) = 2` | as stated; locator R03 | R03 |

## Not verifiable

- Kazhdan–Lusztig 1980 §2 and 1988 §4, Lemmas 6 and 8: there is no legal copy, so they are cited by locator only. Frenkel–Zhu (cached, arXiv v2) attributes `[X] ≠ 0` to the 1988 paper.
- Chevalley 1955, Matsushima 1960 and Drinfeld–Sokolov 1985: uncertified and cited by locator only.
- Česnavičius–Fedorov Theorem 4.2: read only as restated in Česnavičius, Theorem 16. Kostant's full American Journal paper: not read; the Bulletin announcement was.
- ComplexComparisonPartII (#848) and CrystallineCohomology (#857): the brief gives no checkout for these, so I read them only through `roadmaps show` at their indexed heads.

## Source issues

- **Misprint** in FrenkelGaitsgory2006 at §1.1, equation (1.2), p. 15: the source conjugates by `Ad_g` and then subtracts `g⁻¹·d(g)`. With `Ad_g` it should subtract `d(g)·g⁻¹`, as Frenkel2007 (1.2-4) does; otherwise composites of gauges fail for non-abelian `g`. Affects nothing.
- **Misprint** in Frenkel2007 at §4.2.2, the display after (4.2-1), p. 110: the source again writes `gAg⁻¹ − g⁻¹∂_t g`. It should be `gAg⁻¹ − (∂_t g)g⁻¹`, matching its own (1.2-4) on p. 15. Affects nothing.
