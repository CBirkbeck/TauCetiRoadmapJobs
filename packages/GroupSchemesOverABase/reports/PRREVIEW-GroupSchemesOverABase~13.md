# Review of GroupSchemesOverABase (pull request #1522 at 9265182)

**Verdict:** needs changes

This is a full review of 9265182. It covers the 290 lines changed since eb66b2b and the rest of the folder. Eight of the nine findings of the previous review are repaired and one is partly repaired (see "Previous findings"). Two findings follow: R01 is blocking (P2) and comes from a change at the head of another open pull request since the last round; R02 is the second half of the previous R01, which the repair did not do.

The worker's gate passes. My rerun with the candidate merge order and `--build` gives every counter `0` and `OK`. `lake env lean` gives exactly 25 `declaration uses 'sorry'` warnings and nothing else. The dependency check reports 0 problems.

## R01 (P2) — PurityForFlatCohomology now owns the objects of Layers 1–2 too

**Location.** `TauCetiRoadmap/GroupSchemesOverABase/README.md` line 41: "**Owned here.** … diagonalizable groups `D_S(M)` for finitely generated `M` (Layer 1); groups of multiplicative type of finite type, tori, character and cocharacter sheaves and isotriviality (Layer 2)". Lines 1435–1448 (Downstream consumers) do not name PurityForFlatCohomology.

**Claim.** This roadmap is the single owner of `D_S(M)`, groups of multiplicative type, tori, `X*(H)`, subgroups, quotients and `Hᵗᵒʳ` over an arbitrary base.

**Witness.** PurityForFlatCohomology at the head of #1840, `TauCetiRoadmap/PurityForFlatCohomology/README.md`: lines 206–210, "Diagonalizable groups, groups of multiplicative type and tori over an arbitrary base scheme, with their homomorphisms, smoothness, exactness and kernels, character sheaves, subgroups, quotients and largest subtori (§§7.12a–7.12e), are likewise owned here … a later roadmap on group schemes over a base is to import them from these sections"; line 2478 (§7.12a defines `D_S(M)` as the base change of `TauCeti.DiagonalizableGroup.groupScheme` along `specULiftZIsTerminal`, the definition of 1.1 here); lines 2629–2640 (§7.12c: the same three predicates, `M_i` depending on `i`); line 3309. "GroupSchemesOverABase" occurs 0 times in that README. At the previous round that README cited §§1.1–1.2 here.

**Why it matters.** Two open roadmaps now own one object with no citation either way. The merge order settles the direction: this roadmap is at line 67 of the candidate order and PurityForFlatCohomology at line 219, so this roadmap is the owner and PurityForFlatCohomology the consumer; its §§7.12a–7.12e must cite 1.1–1.4, 2.1–2.3 and 2.7 here instead of restating them (that repair is on its pull request).

**Repair here.** Record the resolution so that both READMEs agree:
- Under "Downstream consumers", add: "PurityForFlatCohomology §§7.12a–7.12e consume 0.1, 1.1–1.4, 2.1–2.3 and 2.7 (`D_S(M)`, groups of multiplicative type and tori, `X*(H)`, subgroups, quotients and `Hᵗᵒʳ`) for its purity results." (This is the bullet the previous review's R06 asked for.)
- Under "Left to other roadmaps", nothing: this roadmap keeps the objects.

**Tested.** The two definitions of `D_S(M)` coincide term by term (same Tau Ceti carrier, same terminal map), and the two definitions of multiplicative type and torus coincide (fppf cover, `M_i` per member, torsion-free for tori); so a citation from PurityForFlatCohomology to 1.1 and 2.1 loses nothing.

## R02 (P3) — The ReductiveGroups ids §8.1, §8.2 and Layer 9D exist only at open revisions, and the description names none

**Location.** README lines 7, 62, 82, 154–155, 237–240, 280, 1207, 1229, 1261, 1296, 1322, 1332, 1380, 1432, 1438, 1448; `Suggested.lean` line 54. Pull-request description, "Depends on": six pull requests, none a ReductiveGroups revision.

**Claim.** The citations resolve on main, or the revision that defines them is named as a dependency.

**Witness.** ReductiveGroups on main (`TauCetiRoadmap/ReductiveGroups/README.md`): "### Layer 8: classification and existence" (line 1023), the bullet *Relative reductive groups over an affine Noetherian base* (1028), "#### 9B" (1610); no §8.1, §8.2 or Layer 9D. At #1676 (lines 2476, 2500, 3367, 3379), #1797 (2601, 2633, 3522, 3532) and #1808 (1971, 1995, 2871, 2881): "### 8.1 Split reductive data", "### 8.2 Pinnings", "## Layer 9D: classification, relative groups and forms" with the bullet *Relative reductive groups over an arbitrary affine base*. At #1332 the ids differ: "### 8.1 Split classification", "### 8.2 Relative reductive groups" (2490, 2527), no 9D. The content cited is at those places (9D's first bullet is the isomorphism and existence theorems, line 3368 at #1676; its relative bullet has `Bor(G)`, central isogenies and the simply connected cover).

**Repair.** Add the ReductiveGroups revision to the description's "Depends on" list (#1676; #1797 and #1808 share its numbering), with one clause that #1332's numbering differs (§8.2 and 9B.0). The README needs no change. While editing the description, its sentence "`Suggested.lean` states the headlines … (0.2, 1.2–1.4, 2.2, 2.5, 2.6, 3.1–3.3, 4.2, 4.3)" is stale: 4.5–4.9 are stated too.

## Previous findings

- **R01 — repaired in the README, not in the description (→ R02).** Lines 62, 82, 154–155, 237–240 and the Layer 6–7 *Needs:* lines now cite §8.1, §8.2, 9B and Layer 9D, and "affine Noetherian" is gone from the Scope bullet. Checked at #1676, #1797 and #1808 as above.
- **R02 — repaired.** Lines 637–639: over `Spec(k × k)` with `S₀` one point, `End(𝔾_m) = ℤ² → ℤ`, `(a, b) ↦ a`, surjective and not injective.
- **R03 — repaired.** The monomorphism paragraph is at the end of 4.5 (lines 873–891) with "*Needs:* `isSeparated_of_field` (4.5); Mathlib `Mono`, `QuasiCompact`, `IsClosedImmersion`, `LocallyOfFiniteType`"; `isClosedImmersion_of_mono` follows `isSeparated_of_field` in `Suggested.lean` (line 308) and its docstring names the separatedness step; Layer 4 Dependencies (lines 1061–1062) lists Layer 3 for 4.1, 4.6, 4.8 and Layers 6–7 for 4.4.
- **R04 — repaired.** Lines 885–887: the image is dense and not closed, VI_B 1.2.2 and 1.4.3; 1.2.2 is in the References.
- **R05 — repaired.** 2.1 has four API bullets (lines 464–474: invariance and base change, fppf-locality with the `Spec(k × k)` witness, commutativity and the affine faithfully flat finitely presented structure morphism, the smoothness criterion) and the Check `𝔾_m × μ₄` / `μ_p` (lines 486–487). Each bullet's locator checked: sga3-9 lines 103–109 (IX 1.5 a), b)), 126–140 (IX 2.1 a), b), e)).
- **R06 — partly repaired.** The **Overlap.** paragraph and the EquivariantIntersectionTheory bullet are deleted. The PurityForFlatCohomology consumer bullet was not added; with that roadmap's head now claiming ownership, it is R01.
- **R07 — repaired.** Lines 95–97, 249–250, 312–314, 333: ReductiveGroupsPartII RG2.3.1 (*smooth-affine-model*), *SmoothModel.identityComponent*, over a discrete valuation ring with connected generic fibre. On main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md` lines 3800–3819 state exactly that (open subgroup with special fibre `(𝒢_κ)°`, connectedness of the generic fibre a hypothesis).
- **R08 — repaired, and the previous review's pages were wrong.** Lines 1284–1287 cite Lemma 6.2 and Corollary 6.4 for every semisimple `G`, and Theorem 6.1 (b) with Lemma 6.3 for the polynomial statement. Pages: steinberg1965 lines 592–602 (6.1, 6.2, 6.3) are on extraction page 15, header "62 R. STEINBERG" (line 574); line 623 (6.4) is on extraction page 16, whose neighbours are printed 62 and 64, so printed 63 (the header's "65" at line 616 is an OCR slip). "pp. 62–63" is right; the previous review's "p. 64/65" was not.
- **R09 — repaired.** Lines 1240–1241 (6.3: "For `S = Spec k` this is 6.2; over a base it is this roadmap's own statement"), 1392 (7.7), 1412 (7.8).

## Verified sound

### Gate, build, dependency check, signatures, padding

- **Worker's gate** (`scratch/gate.md`): every counter `0`, `OK`.
- **My rerun** with `--order scratch/merge-order-candidate.txt --build`: every counter `0`, including `build=0`, `depcheck=0`, `outside-folder=0`; `OK`.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 239 roadmaps, 2328 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The candidate order places this roadmap at line 67, after FiniteFlatGroupsAndIntegralPadicHodgeTheory (65) and NeronModelsAndSemistableAbelianVarieties (66).
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GroupSchemesOverABase'` is empty.
- **Pins.** `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the same as at the previous review.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @…` appended for all 33 declarations: exit 0, 25 `sorry` warnings (lines 82, 115, 121, 128, 135, 142, 178, 195, 209, 225, 233, 243, 261, 273, 280, 285, 292, 301, 308, 317, 326, 334, 346, 361, 377), 33 types printed, no error. Every hypothesis is in its declaration's own signature: `[CharZero k] [LocallyOfFiniteType G.X.hom]` in `smooth_of_charZero`; `[LocallyOfFiniteType H.X.hom] [LocallyOfFiniteType G.X.hom] [QuasiCompact …] [Mono …]` in `isClosedImmersion_of_mono`; `[ConnectedSpace S] [IsLocallyNoetherian S]` and the stalk hypothesis in `IsMultiplicativeType.isotrivial`; `[QuasiCompact G.X.hom]` in `exists_isLimit_of_quasiCompact`. Each matches its README statement at the same generality; nothing changed.
- **One-tactic probe.** Every `sorry` replaced by `first | rfl | infer_instance | simp | exact AlgebraicGeometry.smooth_of_grpObj _ | exact ⟨_, 𝟙 _, …⟩ | (constructor <;> infer_instance) | exact fun _ _ h => h` on a scratch copy: all 25 theorems fail (errors at the 25 lines above), so nothing is padding.
- **Lean form.** `module`, `public import Mathlib` plus two `TauCeti.*` modules that exist at the pin, no `set_option`, no sorry'd data, `theorem` only, one module docstring naming the non-statable headlines and their missing carriers (1.5, 1.6, 2.3–2.4, 2.7, 3.1 affine target, 3.4–3.5, 4.1, 4.4, 4.9 quotients, Layers 5–7).

### Headline theorems

The README's end theorems (lines 10–37): 0.2; 1.2–1.4; 2.2, 2.5, 2.6; 3.1–3.3; 4.2, 4.3, 4.5 (four statements plus the monomorphism theorem), 4.6 (two), 4.7, 4.8, 4.9 (two); Layer 5 specialization; Layer 6 `Pic`; Layer 7 Steinberg map, section, resolution. The 25 statable ones are in `Suggested.lean`; the others are named in the docstring with the carrier each lacks. No stand-in.

### Library declarations opened at the pins

- All 21 Tau Ceti module paths named in the README exist at `2fd255d9` (listed in the supplier contracts; checked by `ls`), including `MultiplicativeType/GaloisModule.lean` (2.4). The 31 declaration names were resolved at this pin by the previous review (24 by `#check`, 7 by source); the pin is unchanged and the contract text is unchanged, so that resolution stands.
- **No duplication at the pins.** `grep` of Tau Ceti for `IsTorus`, `IsMultiplicativeType`, `isotrivial` and `Grp (Over` finds only Lie-group and E₆ files; `Mathlib/AlgebraicGeometry/Group/` has `Abelian.lean`, `Affine.lean`, `Smooth.lean` only, and no `Torus`, `MultiplicativeType` or `Diagonalizable` under `Mathlib/AlgebraicGeometry`. Tau Ceti's Cartier theorem (`Group/Cartier.lean`) and Mathlib's `smooth_of_grpObj` are cited, not restated (4.5).
- The two "Lean names found nowhere" of `scratch/citations.md` are this roadmap's own `IsMultiplicativeType.exists_etale_cover` (line 178) and `.isotrivial` (line 195).

### Cross-roadmap citations resolved

- **On main (34f48ff).** ReductiveGroups Layer 3 (line 234, with the bullets), Layer 6 (466), Layer 7 (627), 9B (1610); Layer 8 bullet (1028) and no §8.1/§8.2/9D (R02). ReductiveGroupsPartII RG2.3.1 (3800), *smooth-affine-model* (3802), *SmoothModel.identityComponent* (3819). SchemeAndStackFoundations §0.6 (678), §0.9 (848), §1.17 (2624), §2.3 `NonabelianH1` (3330–3344), §2.9 (3582), §2.11 (3656), §3.4 (4789). ModularCurves 0B (688), 0C (779), 0E (839). SchubertGeometry S3 (46), S7 (93). FlagVarieties line 19 ("GroupSchemesOverABase GS7 owns relative `Bor(G)`").
- **At open heads.** ReductiveGroups #1676/#1797/#1808 and #1332 as in R02. EquivariantIntersectionTheory #1685 §1.1 (268), §1.3 (312). NeronModelsAndSemistableAbelianVarieties #852 §2.3 (1232) and "GS4.2" (47). FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 R07.1.4 (805). InverseGaloisAndArithmeticFundamentalGroups #850 IG.0.3 (696), IG.0.4 (880). AlgebraicModuliForArithmeticGeometry #853 §7.9 (9792). AbelianSchemesAndArithmeticModuli #849 A0.1 (589). SpringerResolutionAndCharacteristicCycles #1828 line 11 names §7.6. PCurvature #1747 Layer 0 is restricted Lie algebras (145). PurityForFlatCohomology #1840: R01.
- **Ownership by object.** `roadmaps grep` over main and the 468 open heads: "Steinberg map" elsewhere is the Steinberg endomorphism of finite-group roadmaps (CFSGStatement, ChevalleyGroups, ReductiveGroups 7g); "Grothendieck–Springer" only here and in SpringerResolutionAndCharacteristicCycles, which names §7.6 as the owner of the multiplicative space; "universal centralizer" only here and in EndoscopicTransferAndUnitaryTraceComparison (the additive one over `𝔤 → 𝔠`); "Steinberg section", "specialization inequalit" (group ranks) and Perrin's approximation have no other owner; ReductiveGroups Layer 11 on main is the Lie-algebra spectral quotient over `ℂ`, not `G → T/W`.

### Sources read (the seeded sample and the changed passages)

- **0.2:** sga3-6b lines 808–810 (VI_B 3.9: `G⁰` open, quasi-compact over `S`, for `G` locally of finite presentation) and 821–826 (3.10 (i)–(iv)). ReductiveGroupsPartII as above.
- **1.1:** sga3-8 lines 273–282 (VIII 2.1 a) faithfully flat and affine, b) finite presentation iff `M` finitely generated, d) `D(0)` trivial, e) smooth iff the torsion order is prime to the residue characteristics); 84–88 (VIII 1.1: diagonalizable means isomorphic to `D_S(M)` for one `M`).
- **1.6:** SchemeAndStackFoundations §2.3 (`NonabelianH1`, lines 3330–3344) and §2.11 (Hilbert 90, 3656).
- **2.1:** sga3-9 lines 11–28 (IX 1.1, 1.3: fpqc-local definitions; isotrivial = diagonalizable after one finite étale surjective `S′ → S`), 103–109 (1.5 a), b)), 126–140 (2.1 a)–e)).
- **2.2, 2.5:** sga3-10 lines 716–718 (X 4.5), 1039–1045 (5.16: locally noetherian geometrically unibranch, and the proof's first step "on peut supposer S connexe"; see Source issues), 1063–1064 (N.D.E. 46: "normal" replaced by "géométriquement unibranche").
- **2.4:** sga3-10 lines 45–53 (X 1.2: connected `S`, isotrivial groups ↔ `π₁`-modules with open stabilisers), 61–67 (1.4: over a field, split by a finite separable extension; anti-equivalence with finitely generated Galois modules).
- **2.6, Linearity:** gille2022 lines 40–45 (Theorem 1.1: linear iff `rad(G)` isotrivial; over affine `S` a closed immersion into `GL_n`), 46 (`rad(G)` the maximal central subtorus), 247–252 (Theorem 3.3: multiplicative type, finite type, constant type: isotrivial iff linear), 256 (linear = monomorphism into `GL(E)`, `E` locally free of finite rank), 260–266 (Examples 3.4), 379–384 (Theorem 6.2: `S` separated noetherian with the resolution property, e.g. affine), 388–390 (Remark 6.3). sga3-11 lines 1004–1017 (XI, Remarque 4.6: multiplicative type of finite type over `S` locally noetherian connected is a subgroup of some `Aut_Mod(E)` iff isotrivial).
- **3.1 Check:** 1.2's `End(𝔾_m) = ℤ²` over `Spec(k × k)` (VIII 1.5, sga3-8 line 137).
- **3.4:** sga3-11 lines 819–821 (XI 4.2: `G` smooth affine, `H` of multiplicative type of finite type; smooth and separated); sga3-10 lines 903–905 (X 5.8: representable, twisted constant quasi-isotrivial of finite generation).
- **3.5:** sga3-11 lines 1046–1048 (5.3), 1101–1104 (5.3 bis), 1150–1157 (5.9: `Z` open and closed in `N`, `W_G(H)` quasi-finite étale separated).
- **3.6:** sga3-8 lines 696–699 (VIII 6.3), 703–712 (6.4), 801–810 (6.5 d), e): invariants closed for `G` essentially free and `X` separated); sga3-11 lines 321–325 (XI 2.4), 1198–1206 (6.1), 1235–1244 (6.2, with its smoothness clause), 1256–1262 (6.3), 1264–1267 (6.4).
- **4.3:** Demazure–Gabriel III §3 8.2: not readable (below).
- **4.5 monomorphisms:** sga3-6b lines 193–200 (VI_B 1.4 over an Artin local ring: proper iff a fibre is nonempty and proper iff the kernel is proper; its proof takes separatedness of `u` from VI_A 0.3).
- **4.7:** milne-iag2017 lines 1001–1016 (Proposition 1.29 and the universal property), 1017–1021 (1.30 (a), (b)), 1048–1053 (1.31), 1064–1069 (Remark 1.33 (a), (b)).
- **5.2:** sga3-12 lines 124–141 (XII 1.7 a)–d)), 213–218 (1.10: smooth, separated, finite type), 1189–1203 (7.1 a), b): `G` smooth separated of finite type with an fpqc-local maximal torus).
- **5.5:** AbelianSchemesAndArithmeticModuli A0.1 (#849 line 589); the statement is this roadmap's own computation (recomputed, row 30).
- **7.2:** steinberg1965 lines 592–625 (6.1–6.4) with the page headers at 574, 616, 658, 700 (R08).
- **7.4:** steinberg1965 lines 77–82 (1.4), 770–772 (7.1), 842–843 (7.9), 928–932 (8.1); ega4-4 lines 3056–3060 (17.9.5: `X` flat, both locally of finite presentation, isomorphism iff fibrewise); conrad-rgs lines 11841–11844 (Lemma B.3.1).
- **7.6:** steinberg1965 lines 42–43 (1.1: regular iff finitely many Borel subgroups contain it); 61–71 (1.3 and the remark extending 1.1–1.3 to reductive groups, for 7.3).
- **Research context:** cesnavicius2022 lines 667–669 (Conjecture 3.1.1), 704–706 (tori, Colliot-Thélène–Sansuc), 707–719 (`dim R ≤ 1`, Nisnevich; Henselian), 723–724 (equicharacteristic, Fedorov–Panin and Panin), 744–745 (unramified mixed characteristic with a Borel), 768–770 (open in mixed characteristic, especially ramified), 435–437 (Definition 1.4.1: ramified means `p ∈ 𝔪² ∖ {0}`).

### Adversarial table

Rows marked "(r11)" carry values recomputed in the previous round for passages that are unchanged and that I re-read; the others were computed this round.

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | 0.1 `baseChange` | `f = 𝟙 S`; `D_ℤ(ℤ/2)` to `𝔽₂`; `S′ = ∅` | chosen pullback, iso not equal; `𝔽₂[t]/(t² − 1) = 𝔽₂[t]/(t − 1)²`; `End(𝔾_m)` goes `ℤ → {∗}` | ok |
| 2 | 0.2 `exists_identityComponent` and the RGPartII comparison | `𝔾_m/ℤ_p`; `Spec(O × K)`; `μ₂/ℤ` | `G⁰ = G` on both sides; 0.2 gives `Spec O`, RGPartII excludes it (generic fibre two points), agreement stated for connected generic fibre; `μ₂` not smooth: fibre at `2` connected, over `ℚ` two points, union not open | ok |
| 3 | 1.1 Checks | `D_S(0)`; `D(ℤ)`; `D_ℤ(ℤ/2)` at `3`, `2` | `S`; `O_S[t^{±1}]`; `(t−1)(t+1)` two reduced points; `(t−1)²` | ok |
| 4 | 1.2 `bijective_diagonalizableMap` | connected `S`; `Spec(k × k)`; `∅`; `Hom(μ₂, 𝔾_m)` | `ℤ`; `ℤ²`; one map vs many `φ`; `Hom(ℤ, ℤ/2) = ℤ/2` | ok |
| 5 | 1.3 smooth/étale iff | `ℤ/6` over `ℤ`; `M = ℤ`; `M = 0`; `ℤ/p` over `𝔽_p`; `S = ∅` | smooth over `ℤ[1/6]` only; smooth, never étale; étale; `(t−1)^p`; both sides vacuous | ok |
| 6 | 1.4 kernel, flatness | `n·id`; `0 → ℤ`; `ℤ → 0`; `φ = 0` on `ℤ` | `μ_n`; `𝔾_m → S`, kernel `𝔾_m`; unit section, not flat (excluded), kernel `S`; kernel `D(ℤ/0) = 𝔾_m` | ok (r11) |
| 7 | 1.5 Cartier duality | `ℤ/n`; `0`; `(ℤ/2)²` | `μ_n` also over `𝔽_p`, `p ∣ n`; trivial; `μ₂ × μ₂` | ok (r11) |
| 8 | 1.6 torsors | `k`, `μ_n`; local ring; `ℤ`, `μ₂` | `k^×/k^{×n}`; `Pic = 0`; `ℤ^×/ℤ^{×2} = {±1}`, `Pic(ℤ) = 0` | ok |
| 9 | 2.1 bullet 1 (fibre products) | `D(M) ×_S D(N)` | `O_S[M] ⊗ O_S[N] = O_S[M ⊕ N]` | ok |
| 10 | 2.1 bullet 2 (fppf-locality; `IsDiagonalizable` not) | `Spec(k × k)`, `𝔾_m ⊔ μ₂` | fibre types `ℤ` and `ℤ/2` differ, no single `M`; composing fppf covers gives locality of the other two | ok |
| 11 | 2.1 bullets 3–4, Check | `μ_p/𝔽_p`; `𝔾_m × μ₄/ℤ`; a torus | affine, flat, commutative, torsion order `p = 0`: not smooth; `𝔽₂[t]/(t−1)⁴` at `2`, smooth over `ℤ[1/2]`; torsion `0`: smooth | ok |
| 12 | 2.1 Checks | `μ_p`; `𝔾_a`; norm-one torus; `M = 0` | multiplicative, not torus; `X* = 0`; split by `ℂ`, `X*(ℝ) = 0`; rank `0` | ok (r11) |
| 13 | 2.2 `exists_etale_cover` | `μ_n/ℤ`; norm-one torus; Kummer over `𝔽₂` | identity cover; `Spec ℂ`; `t ↦ t²` not étale at `2` | ok |
| 14 | 2.5 `IsIsotrivial`, `isotrivial` | `Spec(k × k)`, `𝔾_m ⊔ 𝔾_m²`; nodal curve; field | with VIII 1.1's single `M`: not isotrivial, each component split (README consistent; X 5.16 as printed is not, see Source issues); monodromy infinite; `X 1.4` | ok |
| 15 | 2.6 `exists_torus_not_isotrivial` | `n`-cycle; infinite chain; identity gluing; rank `1` | `[[1, n],[0, 1]] ≠ 1`; split; `𝔾_m²`; a rank-1 torus has monodromy `±1`, isotrivial, so rank `2` is needed | ok |
| 16 | Linearity paragraph | norm-one torus; 2.6 torus; `GL_n`; semisimple `G` | isotrivial ⇒ embeds in `GL₂` as rotations; not isotrivial ⇒ not linear (3.3); `rad = 𝔾_m` split ⇒ linear; `rad = 1` ⇒ linear (Gille line 51) | ok |
| 17 | 2.7 | `𝔾_m × μ₂`; `𝔾_m`; `μ_n` | `Hᵗᵒʳ = 𝔾_m`, quotient `μ₂`; `X_* = ℤ`; `Hᵗᵒʳ = 1` | ok (r11) |
| 18 | 3.1 thickening; new Check | `k[ε]`, `𝔾_m`; `𝔾_a`; `Spec(k × k)` → one point | `ℤ = ℤ`; `(1 + ε)t` (excluded); `ℤ² → ℤ`, `(a,b) ↦ a`, kernel `0 × ℤ` | ok |
| 19 | 3.2, 3.3 | `t, t⁻¹`; `Spec(k × k)`; `𝔾_a` char 0; `μ_n` | differ on every fibre; agree on one fibre, differ; `𝔾_a[n] = 1`; `H[n] = H` | ok (r11) |
| 20 | 3.4 Checks | `Hom(𝔾_m, 𝔾_m)`; `Hom(μ_n, 𝔾_m)`; `Hom(𝔾_m, GL₂)` | `ℤ_S`; `(ℤ/n)_S`; components for `a ≥ b`, infinitely many | ok |
| 21 | 3.5 Checks | diagonal torus; `±1`; `μ_p ⊂ SL_p` | `Z = T`, `N/Z = ℤ/2`; `Z = GL₂`; `Z = SL_p` smooth | ok |
| 22 | 3.6 transporter Check | `u = diag(t, 1)`, `K = diag(1, s)`; `K = u(𝔾_m)` | `a(t−1) = 0`, `d(1−t) = 0`: antidiagonal, misses `1`; `Z_G(u)` diagonal | ok |
| 23 | 4.1 Checks | `GL_n/B`; `𝔾_m/μ_n`; `G/G`, `G/e` | dim `n(n−1)/2`; `t ↦ tⁿ`; `Spec k`, `G` | ok |
| 24 | 4.2 `chevalley` | `A`; `A × 𝔾_m`; `A[2] × 𝔾_m`, char `≠ 2` | `L = 1`; `L = 𝔾_m`; `2^{2g}` components, not connected | ok (r11) |
| 25 | 4.3 `affinization` | `(ℤ/2)_k`; non-split `A`-by-`𝔾_a` | `k × k`; `G_affq = 1`, `L = 𝔾_a` | ok (r11) |
| 26 | 4.4 ranks | `E`; `𝔾_m`; `𝔾_a`; `GL_n`; `B ⊂ GL₂`; `A × GL_n` | `(1,0,1,0,0)`; `(0,1,1,0,0)`; `(0,0,1,1,0)`; `(0,n,n,0,n²−1)`; `(0,2,2,0,0)`; `(g,n,g+n,0,n²−1)` | ok |
| 27 | 4.5 separated, reduced, Cartier | glued `S`-group; `Y^p = tX^p`; `μ₃ ⋊ ℤ/2` over `𝔽₃`; `μ_n/ℚ`; `∏_ℕ 𝔾_a` | not separated; `(Y − t^{1/p}X)^p`; `G_red = ℤ/2` not normal; étale; reduced, not smooth | ok (r11) |
| 28 | 4.5 `isClosedImmersion_of_mono` and Checks | `ℤ_k → 𝔾_a` char 0; Frobenius of `𝔾_a`; `𝔾_m → 𝔾_m ⋊ ℤ/2`; `μ_n ↪ 𝔾_m` | image infinite in the irreducible `𝔸¹`, closure `𝔸¹`, not closed, not quasi-compact (excluded); kernel `α_p`, not mono; open subgroup, complement the other coset, closed; closed | ok |
| 29 | 4.5 route | `u : H → G` | `H → k` lft ⇒ `u` lft, qc ⇒ finite type; `H` separated ⇒ `u` separated; VI_B 1.4 ⇒ proper; EGA IV₃ 8.11.5 | ok |
| 30 | 4.6–4.8 | `μ₃/ℚ`; `μ_p/𝔽_p`; `ℤ_k`; `xy = 0`; `𝔾_m ⋊ ℤ/2`; `ℚ(i)`; `k[x]/(x²)`; `ℝ[x,y]/(x²+y²)` | `G⁰ = Spec ℚ`, `π₀ = μ₃` (2 points, 3 geometric); `G⁰ = μ_p`, `π₀ = 1`; unit section, `π₀ = ℤ_k`; reducible non-group; `π₀ = ℤ/2`; `π₀ = X`; `Spec k`; `Spec ℝ` | ok (r11) |
| 31 | 4.9 Perrin | finite type; `∏_ℕ 𝔾_m`; `ℤ_k`; `∏ GL₂ ⊇ ∏ B`; factorization of `t ↦ t^p`, `𝔾_m × ℤ_k → ℤ_k` | one-point system; `G_n = 𝔾_m^n`, kernel `∏_{m>n}`; limit of `ℤ/n` is `ℤ̂ ≠ ℤ_k`; `∏ ℙ¹` not a scheme; `Q = 𝔾_m` with kernel `μ_p`; `Q = ℤ_k` | ok (r11) |
| 32 | 5.1–5.2 | `𝔾_m`; `G^{(p)}`; abelian scheme; `GL_n`; torus | constant; `ρ_r: 1 → 0`, no maximal torus; `ρ_ab = ρ_n = dim`; diagonal torus; scheme of tori `= S` | ok (r11) |
| 33 | 5.3 `ρ_ab`, `d_s` | Weierstrass split multiplicative; `G^{(p)}`; abelian scheme; Iwahori of `SL₂` | `ρ_ab: 1 → 0`, `L̄` = unit section, `0 ≤ 1`; `L̄ = G`, fibre `𝔾_a`, `1 = 1`; equality; `d_s: 3 → 0` | ok (r11) |
| 34 | 5.4 | `G^{(λ)}`; `𝔾_m × 𝔾_a` | `ρ_r = 1` on `D(λ)`, `0` on `V(λ)`; `(1, 1)` | ok (r11) |
| 35 | 5.5 | supersingular `A_s`; class `0`; class `ω` | `F(ω̄) = 0`, `P = x^p`; `𝔾_a` on both fibres; `(G_s)_affq = 𝔾_a` by the dependent `F^k(ω̄)` | ok (r11) |
| 36 | 6.1–6.3 | `SL₂`; `PGL₂`; `GL_n`; torus; `S` normal | `𝓛(ϖ) = O(1)`, `Pic(ℙ¹_S) = Pic(S) ⊕ ℤ`, `D_α = ∞`; `ℤ/2`; `ℤ^{n−1}`, kernel `ℤ det`; `Pic(S)`; `Pic(𝔸^N_S) = Pic(S)` | ok (r11) |
| 37 | 7.1–7.2 | `SL₂`; `PGL₂`; `GL_n` | `ℤ[t^{±1}]^W = ℤ[t + t⁻¹]`, trace; isomorphism by Cor. 6.4 (6.1 (b) does not apply); `T/W = 𝔸^{n−1} × 𝔾_m` | ok |
| 38 | 7.3–7.4 | `SL₂`; `SL₂ × 𝔾_m` | `{±1}` codim `3`; `n = [[0,1],[−1,0]]`, `κ(c) = [[−c,1],[−1,0]]`, trace `−c`; `C` of dim `1 < 2` | ok |
| 39 | 7.5 | char `2` unipotent; `c ≠ ±2` over `ℚ`; `c = 2` | `k[a,b]/((a−1)²)`; torus split iff `c² − 4` square; `σ(2) = [[2,1],[−1,0]]`, char. poly `(x−1)²`, centralizer `μ₂ × 𝔾_a` | ok (r11) |
| 40 | 7.6–7.8 | `SL₂` regular semisimple, regular unipotent, `±1`; torus | fibres `{t, t⁻¹}` / `k[t]/(t−1)²` / `ℙ¹`; `Pic(G̃) = ℤ`, `Pic(G) = 0`; torus is its own `X̃` | ok (r11) |
| 41 | Research context, Grothendieck–Serre | split torus `𝔾_m^r`; DVR; ramified `R` | `H¹(R, 𝔾_m^r) = Pic(R)^r = 0`, injective; case (2); open, `p ∈ 𝔪²` is Def. 1.4.1's ramified | ok |
| 42 | Ownership of Layers 1–2 | PurityForFlatCohomology #1840 head | same `D_S(M)`, same three predicates, 0 citations of this roadmap; order 67 < 219 | R01 |
| 43 | ReductiveGroups ids | main; #1676/#1797/#1808; #1332 | no §8.1/§8.2/9D; shared numbering; different numbering; description names none | R02 |

## Not verifiable

- **Demazure–Gabriel, *Groupes algébriques* I** (4.3's III §3 8.2, seeded; also II §6 1.1, III §3 5.4, 7.5): a book with no legal online copy. III §3 7.5 is confirmed indirectly by Perrin's introduction (perrin1976 line 49).
- **Slodowy, LNM 815, ch. 3–4** (7.3, 7.6, seeded): paywalled; 7.6's other locator, Steinberg 1.1, was checked.
- **Jantzen II.1.8, II.4.4; Humphreys Theorem 1.12; Bourbaki Lie VI §3 no. 4; Popov 1974 §4; Milne's CUP print** (the author's 2017 PDF, which the README names, has the cited numbers).

## Source issues

- **Gap** in sga3-10 at Exp. X, Théorème 5.16, printed p. 87: the theorem says every group of multiplicative type of finite type over a locally noetherian geometrically unibranch base is isotrivial, with no connectedness hypothesis, and its proof opens by assuming the base connected; with VIII 1.1's diagonalizable groups `D_S(M)` for one `M`, a base with two components of different types gives only componentwise isotriviality; it should be stated for connected bases, or componentwise; affects a stated result (2.5 here adds connectedness and states the componentwise form).
- **Misprint** in sga3-11 at Exp. XI, Théorème 6.2, printed p. 114: the statement takes `K` to be a closed subgroup scheme of `H`; it should be of `G`, as in 2.5 and the proof; affects nothing.
