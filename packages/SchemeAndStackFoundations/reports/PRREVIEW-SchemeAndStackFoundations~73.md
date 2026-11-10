# Review of SchemeAndStackFoundations (pull request #1276 at 8792e09)

**Verdict:** needs changes

This is a full review, because the folder changed by 177 lines since `618343f`.

- **Previous review (r72).** Five of its seven findings are repaired at this head: R03, R05, R06 and R07 as asked, R04 by a different route. Its R01 and R02 are not repaired. Both are steps for the worker, so they are carried as R01 and R02.
- **This round.** There is one false Check (R03) and two locator problems in the seeded sample (R04, R05).
- **Blocking.** The only blocking finding is R01.

## R01 (P2) — The branch still pins Tau Ceti `358314d4`, where most of the README's Tau Ceti citations do not exist

Re-raised: H01. The repair report is right that a folder repair cannot merge `origin/main`. That does not settle the finding: at this head the citations fail at the pin this review must check, and another folder-repair round cannot fix them. The step that remains is the worker's merge, or a human's.

- **Location.**
  - `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`.
  - `README.md:423` says "**From Mathlib** (`1b1ccf4b`)" and `:464` says "**From Tau Ceti** (`2fd255d9`)".
  - `Suggested.lean` still restates the definitions that Tau Ceti has at `2fd255d9`, for example `:119 def Ring.IsJapanese`, `:281 def IsAlgebraicSpace` and `:1132 def ChowGroup`.
- **Claim.** The README names 80 distinct `TauCeti/….lean` files. 59 of them are absent at `358314d4`, so those citations do not resolve at the branch pin. Examples:
  - `RingTheory/Japanese.lean`, `SerreCondition/Basic.lean`, `Modules/Tilde/Hartogs.lean` (§0.17);
  - `AlgebraicSpace/Basic.lean` (§1.3);
  - `Cohomology/FlatBaseChange.lean` and `Curves/Genus/BaseChange.lean` (§3.1);
  - `Chow/Basic.lean` (§5.1);
  - the whole `IntersectionNumber/` directory, which the new §5.9 Check cites as Tau Ceti's `LineBundleClass.intersectionNumber`.
- **New this round.** The §3.6 bullet of the module docstring is true at `358314d4` but false at `2fd255d9`. It reads "The pins have the presheaf … but not its fppf sheafification, its degree decomposition or its representability". At `2fd255d9`, `relativePicardFppfSheaf` (`PicardFunctor/Fppf.lean:104`) and `relativePicardDegreeZeroFppfSheaf` (`PicZero/Fppf.lean:114`) exist. Only representability is missing.
- **Witness.** Of the 80 files, 79 open at `2fd255d9`. The 80th, `Cohomology/FormalFunctions.lean`, is §4.9's planned home. I opened 54 Tau Ceti lines this round, and all of them open at `2fd255d9` at the declaration the README names: 28 in §0.17, 12 in §0.27, 5 in §0.23, 3 in §2.6, 2 in §3.1, and the 4 cited in this finding.
- **Repair.**
  1. The worker merges `origin/main`. `git merge-tree --write-tree HEAD origin/main` exits 0 at `3090489`.
  2. A folder repair then:
     - replaces the restated definitions with Tau Ceti's, keeping `PseudoCoherence.IsPseudoCoherentModule` and `Proetale.IsReplete` as aliases, because `AdicEtaleGeometry` and `EnhancedDerivedSheaves` on main open them by name;
     - writes `Curve.vectorBundleDegree_pullback` with `FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean:82`);
     - rewrites the §3.6 bullet to "the pins have the fppf sheaf `relativePicardFppfSheaf` and its degree-zero subsheaf, but no representing scheme `Pic^d_{X/k}`".
- **Tested.** At `2fd255d9`, `Fppf.lean:104` is `def relativePicardFppfSheaf : Sheaf (Scheme.fppfTopology.over S) AddCommGrpCat`, and its docstring says it "makes no representability claim". `IntersectionNumber/Basic.lean:111` is `def intersectionNumber (a : LineBundleClass X) : ℤ`.

## R02 (P3) — The description still describes a §4.10A this head lacks and states no order with the four conflicting heads

Re-raised: H02. The description is pull-request text, which a repair may not edit, but it is unchanged.

- **Location.** `scratch/pull-request.md` contains "New section 4.10A constructs that scheme …" and "This README-only addition changes no Lean declarations".
- **Witness.**
  - `grep -c '4\.10A' README.md` returns 0.
  - `Suggested.lean` gained `Chow.intersectionNumber` and `hodge_index` in this round alone.
  - `scratch/overlaps.md` lists #1656, #1807, #1808 and #1854 as conflicting with this head.
- **Repair.** Post the replacement description and merge order already drafted in the r72 repair report. No file change is needed.

## R03 (P3) — A §5.10 Check says `Num(E × E)` has rank 3 only in characteristic zero; it has rank 3 for every curve whose `j` is transcendental

- **Location.** `README.md:7512–7514`: "`3` without complex multiplication (possible only in characteristic zero), `4` with complex multiplication or for an ordinary curve in characteristic `p`, and `6` for a supersingular curve".
- **Claim.** In characteristic `p`, `End(E) ⊋ ℤ` forces `j(E) ∈ 𝔽̄_p`. Deuring's lifting theorem lifts `(E, α)` to characteristic 0 with CM by an order `O`, so `j(E)` is a root of the monic Hilbert class polynomial `H_O` reduced mod `p`. A curve with transcendental `j` therefore has `End(E) = ℤ` and `Num(E × E) = ℤ³`. It is ordinary, since supersingular `j` lie in `𝔽_{p²}`. Both halves of the Check fail for it.
- **Witness.** Take `p` odd and `E : y² = x(x − 1)(x − t)` over an algebraic closure of `𝔽_p(t)`. Then `j(E) = 2⁸(t² − t + 1)³/(t²(t − 1)²)` is transcendental over `𝔽_p`, so `rank Num(E × E) = 2 + 1 = 3`.
- **Repair.** Replace the bullet's second sentence with: "`3` when `End(E) = ℤ` (in characteristic `p` exactly when `j(E)` is transcendental over `𝔽_p`, e.g. `y² = x(x − 1)(x − t)` over an algebraic closure of `𝔽_p(t)`), `4` when `End(E)` is an imaginary quadratic order (in characteristic `p`, an ordinary curve with `j(E) ∈ 𝔽̄_p`), and `6` for a supersingular curve".
- **Tested.**
  - On the witness, the corrected Check gives 3.
  - For `y² = x³ + x` over `𝔽̄_p` with `p ≡ 1 mod 4`, `j = 1728 ∈ 𝔽_p` and the curve is ordinary, so `End ⊇ ℤ[i]` and the rank is 4.
  - For `p ≡ 3 mod 4` the same curve is supersingular, and the rank is 6.

## R04 (P3) — §2.19 cites a nonexistent item "48.17.9(5)", and cites the `𝔸¹` lemma for the smooth `Ω^d` formula

- **Location.** `README.md:4196–4199`: "`upperShriek_smooth` (… `f^! K ≅ f^* K ⊗ Ω^d_{X/Y}[d]`; Lemmas 48.17.3, 48.17.11)" and "for Gorenstein `f` … `f^! O_Y ≅ ω_{X/Y}[d]`; [Stacks, Lemmas 48.17.9(5) and 48.17.11]".
- **Claim.**
  - Lemma 48.17.9 (0B6U) has items (a)–(e). "(5)" is step (5) of its proof. The formula `f^!K ≅ Lf^*K ⊗ f^!O_Y` is item (e).
  - Lemma 48.17.3 (0AA1) treats only `𝔸¹_Y → Y`, with a noncanonical isomorphism.
  - Lemma 48.17.11 (0B6V) gives only invertibility of `f^!O_Y`.
  - Neither identifies `f^!O_Y` with `Ω^d[d]`, and neither treats Gorenstein `f`.
- **Witness.** In the cached Stacks book (`stacks-project`, book.pdf, version ed88ff78):
  - lines 196752–196759 (p. 4129): the items (a)–(e) of 48.17.9;
  - line 196774: "(5)" is a proof step;
  - line 196663 (p. 4127): 48.17.3;
  - line 196231 (p. 4119): 48.15.7 (0BRT), `∧^dΩ[d] ≅ a(O_S)` for smooth proper `f`;
  - line 197447 (p. 4144): Remark 48.23.4 (0C10).
- **Repair.**
  - For `upperShriek_smooth`, cite "Lemma 48.17.9 (e) with Lemma 48.15.7 (0BRT) and, locally on `X`, Lemma 48.29.2 (0E9Z); Lemma 48.17.3 is the case `𝔸¹_Y`". This is how §2.20 cites the same identification at `README.md:4414–4416`.
  - For the `upperShriek_lci` parenthetical, cite "Lemmas 48.17.9 (e) and 48.17.11 (1); for Gorenstein `f`, Remark 48.23.4 (0C10) with Lemma 48.21.7 (0BV8)".
- **Tested.** On `𝔸¹_k → Spec k`:
  - 48.17.3 gives `f^!k ≅ O[1]`;
  - 48.15.7 applied to `ℙ¹` and restricted gives `Ω¹[1] = O·dx[1]`;
  - these are the same object, and the corrected citation covers every `d`.

## R05 (P3) — §§1.24–1.25 give Kisin's page numbers from the author manuscript, but the References cite the J. AMS article

- **Location.**
  - `README.md:3108`: "(Kisin 2017, §3.1.1, condition (1), pp. 34–35)".
  - `:3128` "§3.2.1, pp. 39–40", `:3195` "p. 35", `:3210` "pp. 35–36".
  - References `:7742`: "Kisin 2017: *Mod p points on Shimura varieties of abelian type*, J. AMS 30."
- **Witness.**
  - Crossref (DOI `10.1090/jams/867`) gives J. AMS 30, pp. 819–914, so pages 34–40 are not journal pages.
  - The author manuscript at `people.math.harvard.edu/~kisin/dvifiles/lr.pdf` (99 pages) has these items on those pages:
    - (3.1.1) on p. 34, with condition (1) on p. 35;
    - Lemma (3.1.2) on p. 35;
    - (3.2) on p. 39 and (3.2.1) on p. 40.
- **Repair.** Make the References entry: "Kisin 2017: *Mod p points on Shimura varieties of abelian type*, J. AMS 30 (2017), 819–914; locators here use the [author manuscript](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), whose pagination is 1–99." This is how Rydh 2013 is cited at `:7735`.
- **Tested.** All four locators fall on the manuscript pages they name.

## Previous findings (r72)

- **R01 — not repaired.** The manifest still pins `358314d4`, and `Suggested.lean:119` still has `def Ring.IsJapanese`. Carried as R01.
- **R02 — not repaired.** The description is unchanged. Carried as R02.
- **R03 — repaired.**
  - `README.md:598–600` now reads "for `f : X → S` quasi-compact and quasi-separated and a flat `g : S' → S`".
  - The negative Check at `:625–630` computes `(sⁿ)_n ∉ (∏k)⊗k(s)`.
- **R04 — repaired differently.**
  - `Suggested.lean:1174` defines `Chow.intersectionNumber` with the Euler-characteristic body.
  - `:1191` states `hodge_index` with `0 < H·H` in place of ampleness.
  - The README's reduction from the ample form at `:7479–7485` is correct; I recomputed `E·A = 0`, `E² = (D·A)²H² + (H·A)²D²` and `D·M' = H²(D·M)`.
  - The `H² > 0` form contains Hartshorne's form, since 0BEV makes `H² > 0` for ample `H`.
- **R05 — repaired.** `README.md:6589–6595` now says the theorem asks for `X̄_1` regular. It shows `m = (y)` at `y = 0` and records that `y² = u^p` is singular over `k(t^{1/p})`.
- **R06 — repaired.** `README.md:1213–1214` cites "Lemma 15.13.2 (09ZL), p. 1229" alone.
- **R07 — repaired.**
  - `Suggested.lean:660` adds `[QuasiCompact (X ↘ Spec (.of k))]`.
  - The Tsen docstring at `:481–484` and `README.md:3974–3980` give the reduction to finitely generated subfields.
  - The repair report rightly rejects `Algebra.FiniteType k K`, which Zariski's lemma makes vacuous for transcendence degree one.

## Verified sound

### Gate, dependency check, build

- **Gate.** The worker's gate at this head reports every counter 0 and `OK`, `build=0` included. My re-run of `gate … SchemeAndStackFoundations --base origin/main` printed every counter 0 and `OK`, and exited 0.
- **Dependency check.** The output of `gate --depcheck … --movable --pr 1276`, verbatim:

  ```text
  depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
  ```

  It exited 0, with no UPWARD, CYCLE or `moved:` line.
- **Suppliers.** The suppliers named in the changed *Needs:* lines (§5.10: §5.9, §4.19, §2.20, StableReduction Layer 2) are this roadmap's own sections or are on main. So are AlgebraicVectorBundles, JacobianChallenge, ClassFieldTheory, ProfiniteCohomology, QuadraticFormInvariants and GrothendieckEulerForms.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean <abs>/Suggested.lean` exited 0 in 59 s, with 45 "declaration uses `sorry`" warnings and nothing else. The file has 45 `sorry`.
- **Padding probe.** I made a scratch copy with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide`. It fails at all 45 positions, 45 errors on 45 distinct lines, so no theorem closes in one tactic.
- **Signatures.** I ran `#check @` on 12 declarations in one scratch file:
  - `Chow.intersectionNumber` and `hodge_index`;
  - `Curve.isAffine_or_isProper` and `Etale.brauer_functionField_curve_trivial`;
  - `Formal.DeJong.IsProjectiveOverSpec`, `weil_bound`, `GaloisGerbs.galois_descent_affine`;
  - `Spaces.EtaleLocal.baseChange`, `Groups.Action.free_iff_mono`;
  - `smallEtaleBaseChange_isEquivalence`, `QCoh.isAffine_of_H1_vanishing`, `Formal.DeJong.node_local_structure_dvr`.

  Each elaborated type matches its README statement. `hodge_index` carries `[IsAlgClosed k]`, `[IsIntegral S]`, `[SmoothOfRelativeDimension 2 …]` and `IsProjectiveOverSpec`. `scratch/signatures.md` reports 0 lost binders; its "Unknown identifier `on`" comes from a docstring word.
- **Headlines.**
  - The README's end theorems that are statable at the pins are stated: Artin's bootstrap, Grothendieck existence and algebraization, both de Jong theorems, Hodge index and the Weil bound.
  - The rest are named in the module docstring with the missing carrier: Keel–Mori, coherent duality, the Azumaya Brauer class, the Picard torsors, Schlessinger and GRR, plus §2.18 gluing and §5.7. For §3.6 see R01.
  - The pins have no derived pushforward between `DQCoh`: Tau Ceti `2fd255d9` has `R^q f_*` only, in `Cohomology/HigherDirectImage/Basic.lean`, and no `DerivedCategory` in `AlgebraicGeometry/`.

### Seeded locators

All checked in the cached Stacks book (`stacks-project`, book.pdf ed88ff78), at statement number and page, unless another source is named.

- **§0.17.**
  - 0FCC (10.72.10, p. 607), 00LI, 0AUI, 00LK (pp. 605), 00LX, 0AUK, 0337 (10.163.2, p. 889), 0AV5, 0AV7, 0AV8;
  - 00N3, 0AAH, 0AAG, 0C6G, 0BUS, 0AAF, 0AAE, 0AAI, 031P, 031Q, 031R (pp. 680–864);
  - 0E9I (31.5.11), 0DWR (51.2.2), 0AVZ (47.11.1).
  - The 28 Tau Ceti lines all open at `2fd255d9`, for example `Depth/Basic.lean:341 depth_le_supportDim` and `Tilde/Hartogs.lean:237 tilde_toOpen_bijective_of_two_le_depth`.
- **§0.23a.** 04DY (§59.45, p. 4828), 04DZ (Theorem 59.45.2, p. 4829: universal homeomorphism, `V ↦ V ×_Y X` an equivalence).
- **§0.27.** 07T8 (10.40.4, p. 526: element form with no finiteness, module form for finite `M`), 10.12.10 (00DF). The 12 Tau Ceti lines open at `2fd255d9`.
- **§1.4–§1.5.** 025Y (65.6.1, p. 5271), 022P (39.3.1), 02WS (65.9.2, p. 5275), 02VG, 03C5, 045Y, 045Z, 02VH (39.20.1–39.20.6, pp. 3608–3609).
- **§1.9.** 03HL (67.4.2), 03HI (67.9.2), 03ZM (67.40.1: separated, finite type, universally closed), 02X5 (65.13.2), 0AHR, 0AHS (66.3.3–66.3.4).
- **§1.13–§1.14.** 043H, 043Q, 06P8, 06P9, 043W (78.11.1, p. 6023), 0448 (78.16.2, p. 6034).
- **§1.24.**
  - Milne iAG2017: A.64 on printed pp. 580–581 (PDF 592–593), continuous semilinear actions and the Hopf-algebra corollary.
  - Kisin: see R05.
- **§2.6.** 01XH, 01XS, 0B5U (30.17.1), 01XO, 02O5, 02O6, 02V7 (30.20.9, stalkwise for coherent `F`), 0GN6, 07TB, 01XF (30.3.1, p. 2585), 01XB (p. 2584), 01XG, 0F83. The Tau Ceti lines `QuasiSeparated.lean:186/198` and `Affine.lean:256` open at `2fd255d9`.
- **§2.19.**
  - 0A9E (48.3.1, qcqs), 0A9I (48.3.5: one `N` with `H^i(K)=0, i≤c ⇒ H^i(aK)=0, i≤c−N`), 0A9D, 0B6I, 0A9Y, 0FWI, 0AU0, 0E9U, 0ATZ, 0A9W;
  - 0DA7 (85.20.4), 0D9X (Remark 85.16.6), Example 48.3.2 (0A9F);
  - see R04.
- **§2.20.** 0DI0 (p. 3155), 0E2T (p. 4153), 0E2D, 0E2F, 0E2G, 0DI2, 0E2U, 0E2W, 0E2X, 0E2Y, 0BV8, 0C0Z, 0C10, 0AWQ, 0E9W, 0C08, 0E9Z, 0BRT, 0FVU, 0FW0, 0E31, 0GEW.
- **§2.23.** `kings-sprang` A.1 starts on p. 79 (line 3754), Definitions A.2–A.3 and (A.1.1) are on p. 80 (lines 3771–3794).
- **§3.6.**
  - 0BA0 (44.6.7 (1), p. 3930), 0C1A (53.8.4, p. 4447);
  - `milne-av`: printed page = PDF page − 6. III Theorem 1.6 (p. 88), Remark 1.4 (e) (p. 86), Remark 1.11 and Propositions 1.13–1.14 (p. 90).
  - `poonen-stoll-1999` (arXiv page = journal page − 1108): §2 on Pic^i torsors (pp. 1113–1114), §8 on period and index (p. 1126, line 661).
  - `bhargava-gross-wang-2017`: Proposition 21 (p. 10).
- **§4.18.** 0BXX (§53.2), 0CCL (53.2.4), 0AB1 (29.55.8). The de Jong locators are uncertified (see below).
- **§5.6.** 0FDP (37.62.18), 0FBR (§42.60), 0FC0 (§42.62), 067R (31.23.8), 0FF2, 0FF3, 0FF4 (42.59.3–42.59.5).
- **§5.9–§5.10 (new).**
  - 0BEM (33.45.1, p. 2918), 0BEP (33.45.3, p. 2920: coefficient of `n₁…n_d`), 0BEU (33.45.8: `(O(D)·L·X) = (L·D)`), 0BEV (33.45.9, p. 2921);
  - 0BFI (42.41.4, p. 3772);
  - Proposition 20.20.7 (02UZ, §20.20 p. 1825).

### Library declarations opened

- **Branch pin `358314d4`.**
  - `Cohomology/EulerCharacteristic.lean:105` `eulerCharBelow`: `Σ_{i<n} (−1)^i finrank k Hⁱ`, with junk 0 for infinite dimension; the `[X.Over (Spec k)]` instance is in scope;
  - `LineBundle/Dual.lean:44` `dual` (internal Hom into `O`), `TensorProduct.lean:63` (`:65` at `2fd255d9`), `Basic.lean:131` `trivial`;
  - `PicardFunctor/Relative.lean:78`.
- **Main pin `2fd255d9`.**
  - `IntersectionNumber/Basic.lean:111` (degree of a class on a curve, not a pairing of two classes, so no duplicate of `Chow.intersectionNumber`);
  - `PicardFunctor/Fppf.lean:104`, `PicZero/Fppf.lean:114`, `VectorBundle/Degree.lean:82`;
  - `UniversalHomeomorphism.lean:64/162/174`, `Thickening.lean:124/131`;
  - `Cohomology/FlatBaseChange.lean:277`, `Curves/Genus/BaseChange.lean:72`.
- **Duplication.**
  - Neither pin has a `LineBundleClass ≃* CommRing.Pic` comparison (`grep CommRing.Pic`), so `Picard.lineBundleClass_spec_equiv_pic` stands.
  - Neither pin has a surface pairing of two classes or a Hodge index statement.
  - Mathlib has no flat-extension-of-intersections lemma for *ideal_map_iInf_finite*.

### Cross-roadmap citations and ownership

- `scratch/citations.md` lists no cross-roadmap citation that resolves nowhere. Its Lean-name leads are this roadmap's own names.
- `scratch/overlaps.md` lists no dropped id in either direction.
- The four conflicting heads are covered by R02.
- `roadmaps grep` for `hodge_index|Hodge index theorem` and for pairing names (`intersectionPairing`, `NumericallyEquivalent`, `eulerCharBelow k S`) finds the surface pairing only in copies of this folder (#1656, #1807, #1808, #1854). The consumers cite this roadmap: CurvesOverFiniteFields (`README.md:363`, §5.11), K3Surfaces (`:181`, §§5.9–5.10) and DeligneWeightsAndPurity. No second owner was found.

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §0.17 *depth_localization_le* | `R=M=k[x,y]_(x,y)`, `p=(x)`; `M=R/(x)`, `p=(y)` | `1+1 = 2 ≥ 2`; without `dim R/p`, `1 ≥ 2` is false; `M_p = 0` has depth `⊤` | Pass |
| §0.17 `satisfiesSerreS_two_iff_hartogs` | `R/(x)` over `k[x,y,z]`; `k[x,y]/(x²,xy)`; `𝔪 ⊆ k[x,y]` | (S₂) holds / `Γ = k[y^{±1},z] ≠ k[y,z]`; Hartogs condition vacuous (dim 1) / (S₁) fails at `(x,y)`; `depth 𝔪_𝔪 = 1` / `1 ∉ image` | Pass: both hypotheses needed |
| §0.23a `smallEtaleBaseChange_isEquivalence` | `Spec 𝔽_{p²}→Spec 𝔽_p`; `k[t²,t³]→k[t]` | `𝔽_{p²}⊗𝔽_{p²} = 𝔽_{p²}²`, 2 points over 1, excluded; normalisation bijective with equal residue fields, a universal homeomorphism | Pass |
| §0.27 *ideal_map_iInf_finite* | `ℤ→ℤ[1/2]`, `(4),(6)`; `k[x,y]→k[x]`, `(x),(y)` | `(12)↦(3)` / `(1)∩(3)=(3)`; not flat: `(xy)↦(x²)` / `(x)` | Pass |
| §0.27 quotient annihilator | `M=⊕ℤ`, `Q=⊕nℤ`, `S=ℚ` | `Ann(⊕ℤ/n)=0` extends to `0` / the quotient is `0`, with annihilator `ℚ` | Pass: finiteness needed |
| §1.4 `AlgSpace` | `h_∅`, `h_{Spec ℤ}`, `h_{Spec ℚ(i)}` | `Hom(h_∅,F)=F(∅)=pt`; `Hom(h_{Spec k},h_∅)=∅`; `Hom(F,h_{Spec ℤ})=pt`; `End_ℚ` has 2 elements | Pass |
| §1.5 `EtaleEquivRel`, `quotientSheaf.restrict` | `Δ⊔Γ` on `𝔸¹`, char ≠ 2; empty pre-relation on `U⊔U` | `Δ∩Γ = V(2x)∩D(x) = ∅`; `s: U⊔D(x)→U` étale, not an iso; `U'/∅` has 2 points / `U/∅` has 1 | Pass |
| §1.9 separation Checks | folded line; `𝔸¹/ℤ`, char 0 | `R→V(y²−x²)` bijective, but `R` is smooth at 0 and the node is not, so not a closed immersion (not separated), quasi-compact (quasi-separated); `⨿_n Γ_{x+n}` not quasi-compact | Pass |
| `Groups.Action.free_iff_mono` | `𝔾_m` on `𝔸¹`; left translation | `λ·0=0`, not free / `(λ,0)↦(0,0)`, not mono; free / `(g,x)↦(gx,x)` an iso | Pass |
| §1.14 groupoid, stabilizers | `{1,z}`, `z²=z`; `𝔾_m` on `𝔸¹`; `μ_p`, char `p` | `z∘1 = z∘z = z ≠ 1`, so no `i`; `k[x,λ^{±1}]/((λ−1)x)`: fibre `𝔾_m` at 0, `{1}` elsewhere; `λ^p−1 = (λ−1)^p` | Pass |
| `GaloisGerbs.galois_descent_affine` | `ℂ/ℝ`, `A=ℂ[t^{±1}]`; non-open `χ` on `ℚ̄[t^{±1}]` | `B=ℝ[t^{±1}]`, `ℂ⊗B≅A`; the stabiliser of `t` is `ker χ`, not open, so `open_stabilizer` excludes it | Pass |
| `QCoh.isAffine_of_H1_vanishing` | `𝔸²∖0`; `ℙ¹`; `⨿ℙⁿ` | `x⁻¹y⁻¹ ∈ H¹(O) ≠ 0`; `H¹(O(−2)) = k`: the hypothesis fails for both; `Hⁿ(ℙⁿ,O(−n−1)) = k` for all `n` | Pass |
| §2.19 `upperShriek_lci` | `i: Spec k→𝔸¹`, `K=k` | `RHom(k,k)`: `H⁰=H¹=k` / `Li^*k ⊗ k[−1]`: degrees 0, 1; ordinary `i^*k⊗k[−1]` has `H⁰=0` | Pass |
| §2.19 `a_f` Checks | `ℙⁿ→Spec k`; `Spec k→Spec k[x]`; `𝔸¹→Spec k` | `O(−n−1)[n]`, degree `−n` only; `Ext¹(k,k[x]) = k`, so `k[−1]`; `Hom_k(k[x],k)` / `f^!k = O[1]` | Pass; R04 (locators) |
| §2.20 duality Checks | `k[x,y]/(x,y)²`; nodal cubic; `ℙ²` | 2-dimensional socle, dual needs 2 generators; `p_a=1`, `deg ω=0`; `H²(O(−3)) = k ↔ H⁰(O) = k` | Pass |
| §2.23 equivariant Checks | point, `ℤ/2`; `Γ=ℤ` | `Coind ℤ = ℤ[ℤ/2]`; `H^n_Γ = H^n(ℤ/2,F)`; `Ind = ℤ[ℤ]` / `Coind = Map(ℤ,ℤ)` | Pass |
| §3.6 Picard torsors | real pointless conic; elliptic `E` | `Pic X = 2ℤ`, `Pic_{X/ℝ}(ℝ) = ℤ`, cokernel `ℤ/2 = Br ℝ`; every `Pic^d = Spec ℝ`; `Pic^d ≅ E` | Pass |
| §4.18 component stage | `uv = st` | charts `k[u,a,t]` (`s=ua`, `v=at`) and `k[s,b,v]` (`u=sb`, `t=bv`); fibre over 0 is a chain of 3 lines with nodes `ua=s`, `bv=t` | Pass |
| §4.18 codimension-two stage | `uv = s²t`, `s³t`, `s⁴` | `u'v'=t`, `v=us'²t`; `s²(ab−st)`, `v=u²c³t`, one point left with embedding dimension 4 > 3; `u'v'=s²`, then regular | Pass |
| §4.18 non-split control | `U²−aV²−stW²`, `a` a nonsquare | partials `2u, −2av, −t, −s` vanish only at the origin; `u²−av² = st`, so `f⁻¹V(s)` has ideal `(s)`, Cartier | Pass |
| §5.6 products | doubled-origin `L`; constant `f: ℙ¹→ℙ¹` | `(0₁,0₂)` lies in the closure of `{(t,t)}`; `[0₁]·[L]=[0₁]`; `f^*[p]` factors through `CH^1(pt)=0` | Pass |
| §5.9 `Chow.intersectionNumber` | `ℙ¹×ℙ¹`, `χ(O(a,b))=(a+1)(b+1)`; `ℙ²`; conic | `1−(1−a)(1−b)−(1−c)(1−d)+(1−a−c)(1−b−d) = ad+bc`; `O(1,1)² = 2`; truncation at `n=2` gives `1`; `χ(L⊗M)−χ(O) = 3` vs `1`; `O(1)²=1`; `O(2)·O(1) = 2 = χ(O_{ℙ¹}(2))−1` | Pass |
| mixed difference = coefficient of `n₁n₂` | monomials `n₁n₂, n₁², n₁, 1` | `1, 0, 0, 0` (e.g. for `n₁²`: `0−1−0+1 = 0`) | Pass |
| `hodge_index` | `ℙ¹×ℙ¹`, `H=(1,1)`, `D=(1,−1)` | `D·H = −1+1 = 0`, `D² = −2 ≤ 0`; `D² = 0` only for `D = 0` | Pass |
| `hodge_index` negative controls | `H=(1,0)`; `H=(1,−1)`; `ℙ²⊔ℙ²`; `Bl_pℙ²` | `D=(1,0)`: `D²=0`, `D·(0,1)=1`, excluded by `H²=0`; `D=(1,1)`: `D·H=0`, `D²=2`, excluded by `H²=−2`; `D=(O(1),O(−1))`: `D²=2`, excluded by `IsIntegral`; `H=2L+E`: `H²=3`, `H·E=−1`; `D=L+2E`: `D·H=0`, `D²=−3` | Pass |
| §5.10 reduction from the ample form | `E=(D·A)H−(H·A)D`, `M'=H²M−(M·H)H` | `E·A=0`, `E²=(D·A)²H²+(H·A)²D²`; `M'·H=0`, `D·M'=H²(D·M)`, `(tD+M')² = 2t(D·M')+M'²` | Pass |
| §5.10 `Num(E×E)` Check | `y²=x(x−1)(x−t)` over `𝔽_p(t)^alg` | `j` transcendental, so `End=ℤ`, rank 3, ordinary / the Check says rank 3 occurs only in char 0 and an ordinary curve has rank 4 | **R03** |
| `alteration_theorem` | `𝔸¹`, `Z={0}`; `y²=x^p−t` over `𝔽_p(t)` | `X̄₁=ℙ¹`, boundary `{0,∞}`; at `y=0`, `m=(y)` so regular, identity separable; `y²=u^p` singular over `k^{1/p}` | Pass |
| `weil_bound` | `ℙ¹/𝔽_q`; `y²=x³+x` over `𝔽₃` | `0 ≤ 0`; affine points `x=0:1`, `x=1:0`, `x=2:2`, plus `∞`, total `4`, and `|4−4| ≤ 2√3` | Pass |
| `Curve.isAffine_or_isProper` | `𝔸¹`, `ℙ¹`, doubled origin | affine, not proper; proper, not affine; doubled origin fails `IsSeparated` | Pass |
| `Etale.brauer_functionField_curve_trivial` | `ℝ(t)`; `ℂ(s,t)`; `ℂ(t)^alg` | `(−1,−1)` nonsplit, excluded by `IsAlgClosed`; `(s,t)` nonsplit, excluded by `halg`; `Br = 0` | Pass |
| §0.1 `pushforwardAlgebra_baseChange` | `⨿_ℕ Spec k→Spec k`, `g=Spec k(s)`; `⨿_{n≤N}` | `(sⁿ)` is not in the image of `(∏k)⊗k(s)` / it is in `∏k(s)`; finite family: `k(s)^{N+1}` on both sides | Pass |
| `artinBootstrap` | `F=h_X`, `a=𝟙` | pullbacks are `h_T`; `𝟙` is flat, locally of finite presentation and surjective | Pass |
| `grothendieck_existence`, `algebraize_hom` | `A=k[[t]]`, `X=Spec A`; `𝔸¹_A` | `lim A/t^{n+1} = A`; `Σtⁿxⁿ ∈ lim Aₙ[x] ∖ A[x]`, so properness is needed | Pass |
| `semistable_alteration_theorem` | `ℙ¹_{k[[t]]}`, `Z=X_s` | `R₁=R`, `X̄₁=X`, `H=∅`; special fibre `ℙ¹_k` | Pass |
| `Curve.vectorBundleDegree_pullback` | `z↦z²` on `ℙ¹`, `E=O(1)` | `χ(O(2))−χ(O) = 2` / `2·1` | Pass |
| `Curve.genus_of_finite_etale` | `z↦z²` on `ℙ¹` | `−1` vs `2·(−1)`, excluded by `[Etale f]` | Pass |
| Azumaya splitting theorems | `ℍ/ℝ`, `d=2`; zero ring | `ℍ⊗ℂ≅M₂(ℂ)`, rank 4; `A=0`, `B=0`, both sides trivial | Pass |

## Not verifiable

- **de Jong 1996 and Hartshorne 1977.** The manifest settles both as uncertified. They are cited by locator only (§§4.18–4.20 and §5.9–§5.10, including V.1 Theorem 1.9, Remark 1.9.1 and Exercise 1.1).
- **Fulton 1998.** Cited in §5.6 for Propositions 8.1.1, 8.2 and 8.3. It is not in the manifest and is a Springer book with no legal open copy, so it was not opened. The Stacks counterparts 0FBR, 0FC0 and 0FF2–0FF4 were verified instead.
- **Grothendieck 1957 (Tôhoku) and Kleiman 1966.** Cited in §2.23 and §5.10. They are not in the roadmap's manifest, and this review edits no manifest, so neither was fetched.
- **Deuring's lifting theorem (R03).** No cached text states it. The finding's argument is self-contained, and the Hilbert-class-polynomial step is standard.
- **Elaboration at main's pins.** Only the branch pins can be elaborated with the commands this review allows. Whether `hodge_index` and the post-merge swap of R01 elaborate at `2fd255d9`/`1b1ccf4b` is unchecked. Their carriers (`InvertibleSheaf.dual`, `tensorProduct`, `eulerCharBelow`) exist at both pins.
- **Ownership against open pull requests.** Checked through `scratch/overlaps.md` and `roadmaps grep` for the new pairing and Hodge index. I did not read every open README.

## Source issues

- none
