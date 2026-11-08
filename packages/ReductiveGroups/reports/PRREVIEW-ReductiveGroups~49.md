# Review of ReductiveGroups (pull request #1797 at 51ebd8a)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ReductiveGroups/` at `51ebd8a598c4ad276c52389faf337733ef12c4e4`. The folder changed by 185 lines since `c065862`, the head the previous review read. Measured against `origin/main`, the README changes by about 3,260 lines. All five findings of the previous review are repaired (see "Previous findings"). The gate passes, the dependency check is clean and `Suggested.lean` elaborates with exactly the five expected `sorry` warnings.

Six findings remain. Two are P2:
- the module docstring calls two Layer 7 headlines unstatable, but both elaborate at the pins (R01);
- Layer 3A.5 claims to own and construct the complex-point topology, which the pinned Tau Ceti already provides (R02).

Four are P3: an unmapped layer renumbering (R03), no stated order against five conflicting pull requests (R04), four page or theorem locators (R05), and a counterexample that fails in characteristic 2 (R06).

Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`. `TauCeti/…` is the pinned Tau Ceti `2fd255d9` and Mathlib is `1b1ccf4b` (the `lake-manifest.json` pins).

## R01 (P2) — two Layer 7 headlines are statable at the pins but the docstring says they are not

Location: `Suggested.lean:51–52` lists as not statable "the unconditional conjugacy of maximal tori, the all-field Levi complement of a parabolic subgroup". The missing carriers named at `:59–61` are completeness of `G/P`, the reflection subgroup and a root datum. Neither statement needs any of them. The matching README targets are at `README.md:1857–1862` and `:1878–1879`.

Claim: neither theorem can be stated with pinned carriers.

Witness: a scratch module elaborates both statements, with only `sorry` warnings. It imports `TauCeti.Algebra.AlgebraicGroup.{Torus.Maximal, Parabolic.Basic, Reductive.Basic, HopfIdeal.Conjugation}`.
- (i) Under `[IsAlgClosed k]`, with `IsMaximalTorus k (CommHopfAlgCat.of k H) I` and the same for `J`, conclude `∃ g, I.conjugate g = J`. This is `exists_conjugate_eq_of_isMaximalTorus` (`TauCeti/Algebra/AlgebraicGroup/Torus/Conjugation.lean:149`) without `hcontainI`/`hcontainJ`.
- (ii) With `reductiveCommHopfAlgProperty k (FiniteTypeCommHopfAlgCat.of k H)` and `IsParabolic k (CommHopfAlgCat.of k H) I`, conclude `∃ J : HopfIdeal k (quotient _ I), Bijective ((mkₐ k J.toIdeal).comp (unipotentRadicalDefiningIdeal (quotient _ I)).coinvariants.val)`. This has the same form as `exists_levi_complement`.

Both are true: Milne 17.10 (p. 354), and `conrad-feng` lines 5334–5346 (p. 127: every parabolic of a connected reductive group over any field is `L ⋉ U`).

Repair:
- State both in `Suggested.lean`, in `StructureAcceptance` under a `/-! ## Layer 7 … -/` comment. Suggested names are `exists_conjugate_eq_of_isMaximalTorus` (with Milne's smooth, geometrically connected hypotheses; the probe also elaborates without them) and `exists_levi_of_isParabolic`.
- Name both in README Layer 7.
- Remove both from the docstring list, keeping the complete-quotient equivalence and the root datum there.

Tested: the two statements elaborate at the pins with exactly two `sorry` warnings.

## R02 (P2) — Layer 3A.5 plans as its own construction the point topology that Tau Ceti pins

Location: `README.md:19` reads "Layer 3A.5 owns the classical complex-point topology". `README.md:1174–1178` reads "construct the classical topology on X(ℂ) … Prove independence of the presentation …, compatibility with principal opens, and gluing along any affine open cover". No supplier contract names `TauCeti/Topology/Algebra/PointTopology/`.

Claim: this roadmap constructs and owns the topology on `X(ℂ)`.

Witness:
- `PointTopology/Scheme.lean:49, 127, 165`: `TauCeti.SchemePointTopology.Points f` is the set of morphisms `Spec R → X` over `Spec k`; `topology` is the final topology of the affine open charts; `affineHomeomorph` identifies it with the evaluation topology on affine schemes.
- `Basic.lean:245`: `isClosedEmbedding_eval_generators`, so every presentation gives the zero-locus topology.
- `Localization.lean:92`: `isOpenEmbedding_localization`, for principal opens.

Repair:
- Add a contract "Native point topology" citing these declarations, together with `polynomialHomeomorph`, `localizationAwayXHomeomorph`, `relativeTensorProductHomeomorph`, `isClosedEmbedding_comap_of_surjective`, `instT2Space`, `continuous_chartPoint` and `exists_mem_range_chartPoint`.
- In 3A.5, take `X(ℂ)` with `SchemePointTopology.topology` at `R = ℂ`. Delete the construction, presentation and principal-open targets.
- Keep as 3A.5's targets: the charts are open embeddings over ℂ, functoriality along scheme morphisms, immersions, non-affine fibre products, reduction, Hausdorffness for separated `X`, compactness from properness, and smooth charts.
- In Scope, change "owns the classical complex-point topology" to "owns the comparisons on the native point topology of `X(ℂ)`".

Tested: `polynomialHomeomorph` gives `𝔸¹(ℂ) ≃ₜ ℂ` and `localizationAwayXHomeomorph` gives `D(t)(ℂ) ≃ₜ ℂˣ`, which are 3A.5's own first Check.

## R03 (P3) — Layers 8 and 7g are renumbered with no old → new map

Location: `README.md:2498` is "## Layer 8: split groups and pinnings", `:3421` is "## Layer 9D: classification, relative groups and forms", and `:3545` is "## Layer 9E: Steinberg endomorphisms …".

Claim: ids that other roadmaps cite keep their meaning.

Witness: on main the content README has "### Layer 8: classification and existence" (line 1023, with the relative-reductive bullet at 1028) and "### Layer 7g: Steinberg endomorphisms" (line 968). Open heads cite the old Layer 8 for content that now sits in 9D:
- GroupSchemesOverABase `README.md:54`: "ReductiveGroups Layer 8, bullet *Relative reductive groups over an affine Noetherian base*";
- GlobalGaloisDeformationsPartII `:301`;
- FormalConnectionsOpers `:1486`;
- ClusterAlgebras `:1775`.

Repair: in Scope and ownership, add one line per moved id: "former Layer 8 (classification and existence; relative reductive groups) → Layer 9D"; "former Layer 7g → Layer 9E"; "Layer 8 now denotes §§8.1–8.2, split data and pinnings". Alternatively, keep main's numbers. Tested: with the map, GroupSchemesOverABase's bullet resolves to Layer 9D's "Relative reductive groups over an arbitrary affine base" (`README.md:3431`).

## R04 (P3) — five open pull requests that change this folder conflict with it, and no order is stated

Location: the pull-request description names none of #1332, #1676, #1807, #1808 or #1854. It also says "No statement changes", which does not describe this folder: here `plane_braid` is renamed, Lang moves into Layer 7a and the layers are renumbered.

Claim: the merge order between conflicting heads is settled.

Witness: the overlap report (`roadmaps overlaps ReductiveGroups`) shows that #1332, #1676 and #1808 conflict in `README.md` and `Suggested.lean`, and #1807 and #1854 in `README.md`. #1676 changes 3A.5 differently: its `README.md:407–438` cites the PointTopology carriers that R02 asks for here.

Repair: state in the description which pull request merges first and that the others rebase on it (for example this one first, with #1676 rebasing and keeping its PointTopology contract). Summarise this folder's statement changes.

## R05 (P3) — four locators are wrong

Locations and witnesses:
- (a) `README.md:1376`, "stability of diagonalizability under quotient groups (Milne, Theorem 12.8, p. 233". In the Milne 2017 author copy (cached as `milne17` in RootSystems' manifest), Theorem 12.8 at line 9673 is "diagonalizable iff `≅ D(M)`". Quotients are Theorem 12.9(c) (line 9689, p. 233). `:1370–1373` attributes the `D(X)` characterization to 12.12; it is Milne's Theorem 12.8.
- (b) `README.md:3509–3510`, "its p. 218, where Galois descent and Theorem F.3.7 give the separable-extension compatibility of `R_(u,k)`". `conrad-feng` line 9446 (p. 218) gives this for `R_k` and `R_us,k` over `k_s`. The statement for `R_u,k` is at lines 9127–9128 (p. 211), citing CGP 1.1.9(1).
- (c) `README.md:3934` and `Suggested.lean:198`, "Fox–Neuwirth, §7, pp. 123–126". In `fox-neuwirth`, line 153 opens §7 on p. 122 (header at line 118).
- (d) `README.md:867`, "§§3.3–3.7, pp. 53–57", and `:4286`, "pp. 53–60". `jantzen-1985` line 1507 (§3.3) is on printed p. 52, and §3.8 opens at line 1647 on p. 58.

Repair: (a) "Theorem 12.9(c), p. 233", and the `D(X)` sentence cites "Theorem 12.8, p. 233"; (b) "p. 211 (citing CGP 1.1.9(1))"; (c) "pp. 122–126"; (d) "pp. 52–58" and "pp. 52–60".

## R06 (P3) — the PGL₂ Klein four-subgroup example fails in characteristic 2

Location: `README.md:621–622`, "in `PGL₂` the Klein four-subgroup is diagonalizable and lies in no torus".

Claim: true over every algebraically closed field.

Witness: in characteristic 2, an element of order 2 of `PGL₂(k̄)` has equal eigenvalues and so is unipotent. A Klein four-subgroup then lies in a conjugate of `U ≅ 𝔾_a`, and the constant group `(ℤ/2)²` has no nontrivial character, so it is not diagonalizable.

Repair: write "in `PGL₂` over a field of characteristic not 2". Tested in characteristic 3: the images of `diag(1,−1)` and `[[0,1],[1,0]]` generate `V₄`, while `𝔾_m` has one element of order 2.

## Previous findings

- R01 (`plane_braid` with a `Nonempty` conclusion) — repaired. `Suggested.lean:199` is now `theorem nonempty_plane_braid` and `README.md:3899` names it. The gate's `statement-hygiene` is 0.
- R02 (`hcontain` misdescribed) — repaired. `README.md:617–623` now reads "provided each of them, if diagonalizable, lies in a conjugate of a fixed maximal torus `D`", and `:1839–1841` and `:1857–1862` discharge the hypothesis for maximal tori. R06 qualifies the example.
- R03 (native orbit action and base-point change) — repaired. `README.md:421–429` cites `orbitOver`, `orbitModObj`, `IsModHom G (orbitInclusion G x)`, `orbitSchemeIsoSmul`, `_hom_ι` and `toOrbit_…`. `:1133–1135` keeps only the factorization and `orbitBaseChangeIso` compatibility.
- R04 (7a natives) — repaired. `README.md:243–260` and `:2040–2049` cite `map_fixedSubgroup_frobeniusPoints_of_surjective`, `mapDomain_…` and `finite_fixedSubgroup_mapDomain_…`. `:2078–2090` consumes `exists_fixed_inv_mul_of_surjective_commutatorMap` in the right-coset convention and derives the left-coset form with `n = h⁻¹`.
- R05 (5.58, 12.12, Borel route) — repaired:
  - `README.md:461–470` and `:1012–1018` give `N = G°` from the two native inclusions;
  - `:516–525` and `:1370–1379` cite `essImage_coordinateRingFunctor` and `isInternal_weightSpace`, with a locator slip that R05 above reports;
  - `:624–630` and `:1842–1856` use the closed-projective-orbit criterion in Milne's flag route.

## Verified sound

**Gate and build.**
- The worker's gate passes every check. My rerun differs only in `outside-folder=43`, and all 43 entries are in the pull request's sibling folders: `git diff --name-only origin/main...HEAD` touches only its five folders.
- Depcheck: `depcheck: 242 roadmaps, 2453 edges, 0 problem(s)`.
- `lake env lean Suggested.lean`: exit 0, with `sorry` warnings at lines 113, 129, 151, 199 and 205 only.
- I compared the 12 elaborated signatures in the worker's `#check` table with the README statements; they match, and no binder is lost.
- One-tactic probe (`simp | rfl | infer_instance | trivial | decide | aesop`) on `lang_surjective`, `exists_levi_complement` and `permutation_nonsplit` closes none.
- `nonempty_plane_braid` and `exists_coordinatePresentation` were decided by reading the pin: no file under `Braid/` mentions `FundamentalGroup`, and `SpecialLinear/Basic.lean:38` says "no polynomial presentation". There is no padding.

**Library names.**
- All 109 fully qualified `TauCeti.*` names in the README resolve at the pin. The single module name among them, `…LinearlyReductive.Fixed`, is a file that exists.
- I opened the 21 declarations newly cited in this round: `Frobenius/FiniteField.lean:309, 468, 479`, `FixedSubgroup/Lang.lean:76, 96`, `Orbit/Action.lean:47, 50, 128`, `Orbit/Functoriality.lean:176, 189, 201`, `Connected/Comultiplication.lean:290`, `ComponentGroup/UniversalProperty.lean:66, 80, 96`, `DiagonalizableGroup/EssentialImage.lean:64, 77`, `DiagonalizableGroup/Weight.lean:113, 120`, `Borel/ProjectiveOrbit.lean:90` and `ProjectiveOrbit/Quotient.lean:241`. Each README description matches its hypotheses. The native `hstab` is a statement about rational points, and the README's route supplies it through `Stab_G(F) = B`.

**Seeded sample.**
- §1.1: `jantzen-1985` (printed page = marker − 5). §2.8 is at line 1100 (p. 36), §3.9 at line 1690 (p. 60), §4.2 at line 1923 (p. 69), §4.7 at line 1994 (p. 72), and §§4.14–4.16 at lines 2102–2159 (pp. 77–79a), all as cited; the §§3.3–3.7 range is R05(d).
- §8.1: `conrad-rgs` Definition 5.1.1, line 5651, p. 136. It allows a nonempty scheme base; the README restricts to affine bases, which is the Hopf-algebra carrier.
- §8.2: `conrad-rgs` Definition 6.1.1 and Remark 6.1.2, lines 7725–7751, pp. 186–187. The disconnected-base Check is exactly Remark 6.1.2.

**Other sources.**
- Milne 2017 author copy, printed page = PDF page − 12. These 23 locators are as cited: 4.9 p. 87; 5.14 p. 102; 5.34 p. 107; 5.58 p. 114; 9.18 p. 170; 12.8, 12.9 p. 233; 12.12 p. 234; 12.54 p. 248; 14.5 p. 281; 16.30 p. 334; 16.33 p. 335; 17.9, 17.10 p. 354; 17.16 p. 356; 17.95 p. 382; 17.96, 17.97 p. 383; 21.11 p. 428; 21.37 p. 435; 21.45 p. 438; 22.42 p. 477; 22.43 p. 478.
- Milne 17.97 ("connected group variety over a finite field", `g ↦ gF(g)⁻¹` surjective) carries exactly `lang_surjective`'s smooth and geometrically connected hypotheses. The proof of 17.96 (lines 15754–15766) is the README's `f^m = Int(y)F^m` route.
- `dudas-michel` Lemma 7.6, lines 1145–1153, p. 25: (i) needs only connected `A`, (ii) needs normality, as stated.
- `conrad-feng` Proposition 12.3.1 (p. 127), Definition H.1.1 (p. 238) and Theorem F.3.7 (p. 208).

**Adversarial table.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `exists_levi_complement` | `SL₂`; `𝔾_a`; trivial `H = k` | `I_u` = augmentation, coinvariants `O(G)`, `J = 0`; `I_u = 0`, coinvariants `k`, `J` = augmentation; `k → k` | Pass |
| same, wrong model | Borel of `SL₂`, `O = k[a^±,b]` | coinvariants `k[a^±]`; `J=(b)` bijective; `J=(a−1)`: `a ↦ 1`, not injective | Pass |
| `lang_surjective` | `𝔾_a/𝔽₂`; `𝔾_m/𝔽_q`; `μ₂`, `q` odd; constant `C₂` | `θ²−θ = 1`; `g^(q−1)` onto `K×`; `(±1)^(q−1) = 1` misses `−1`; Lang `≡ 1`: last two excluded by `hconn` | Pass |
| Lang route (7a) | `f(g) = xF(g)x⁻¹` | `f^m = Int(y)F^m`, `F^m(y) = y`, `f^(mr) = F^(mr)`; matches Milne lines 15760–15765 | Pass |
| `exists_coordinatePresentation` | `n = 0, 1, 2` | `det(∅) = 1`, relation `0`, both sides `ℤ`; `x − 1`, `ℤ`; inverse of `[[1,1],[0,1]]` over `ℤ/4` has entry `3` | Pass |
| `nonempty_plane_braid` | `n = 0, 1, 2` | point, `π₁ = 1`, `A(0−1) = A(0)` trivial; `ℂ`, `1`; `ℂ×ℂ*`, `π₁ = ℤ = A₁` | Pass |
| `permutation_nonsplit` | `n = 2`; `n = 0, 1` | a section needs `m` with `2m = 0` and `m` odd; `S_n` trivial gives a section, excluded by `2 ≤ n` | Pass |
| `permute` direction | `n = 3`, `σ = (012)` | `(0,1,2) ↦ (2,0,1)`; the wrong convention gives `(1,2,0)` | Pass |
| R01 probe (i) | `GL₂/k̄`; `SL₂/ℝ` | `T` and `uTu⁻¹` conjugate by `u`; diagonal torus vs `SO₂` excluded by `IsAlgClosed` | Statable |
| R01 probe (ii) | `GL₂`, `P = B`; `P = G` | `L = T`; `U = 1`, `J = ⊥` | Statable |
| Native fixed-coset lifting | `F̄_q×`, `J = {±1}`, `q` odd | Lang on `J` is `x^(q−1) = 1`; `{a,−a}` with `σ(a) = −a` has no fixed point; `n = h⁻¹` gives `nσ(n)⁻¹ = h⁻¹σ(h)` | Pass |
| `G^F` count | `SL₂(F_q)` | `q(q²−1)/(q(q−1)) = q+1 = #ℙ¹(F_q)` | Pass |
| 5.58 native route | `μ_p`; constant `S₃` | `G° = μ_p = N`; `G° = 1`, `A₃` not connected, so not a candidate | Pass |
| 12.12 native direction | `𝔾_m` on `k²`, weights `(1,1)` and `(1,−1)` | `V₁ = k²`, `V₀ = 0`; `V₁ = ke₁`, `V₋₁ = ke₂` | Pass |
| `hcontain` example | `PGL₂`, char 3 vs char 2 | `V₄` diagonalizable, `𝔾_m[2] = μ₂`; char 2: involutions unipotent | R06 |
| Layer 7 flag route | `SL₂`, `B⁺ = Stab⟨e₁⟩` | orbit `ℙ¹` closed, `dim = 3 − 2 = 1` | Pass |
| 7C rank-one; `A₂`, `w = s₁s₂` | `a = b = 1` | both sides `[[2,1],[1,1]]`; `A_w = {α₂}`; conjugate `= I + E₂₃ + E₁₃` | Pass |
| 7b common-torus control | `GL₂`, `Q = uB⁻u⁻¹` | `P∩Q = M` (dimension 2), right side `Z` (dimension 1) | Pass |
| 9A.1b folds | D₄ triality, E₆; A₃, A₄, D₄ | `6+6+2 = 14`, `24+24+4 = 52`; `C = [[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]` recomputed | Pass |
| 9A full-`Y` example | `γY = [[0,−1],[1,−1]]` | `det(γY−I) = 3`, Smith form `(1,3)`, `(1,−1)` fixed over `F₃` | Pass |
| 9B.1 big cell | `SL₂` | lower-right entry `(1+bc)/a = d`; `#SL₂(ℤ/4) = 48`; `[[2,1],[3,2]]` | Pass |
| 9C idempotent | `μ₀` on weight `n` | `binom(n−1,p−1) ≡ 1` iff `p ∣ n`; `E^(1)F^(1) = FE + H` | Pass |
| 10C, 10D | char 3, `n = 4`; torsor charts | `dim L(4) = 4`, missing `x²y²`; `s_a n(−1/(ac)) = s_c` | Pass |
| 7e twist; 7f Gassmann | `GL₂(𝔽₃)`; `S₃` | second columns `(2,0)` vs `(1,0)`; `1·2 = 2·1` | Pass |
| 9D, 9E | `H¹(ℤ/2, Aut 𝔾_m)`; `σ = τ^(2m+1)` | `ℤ/2`; `σ² = Frob_(2^(2m+1))` | Pass |
| 11 | `𝔰𝔩₂` | discriminant `4t²`; the loop lifts to end at `−1` | Pass |
| 3A.5 topology | `𝔸¹`, `D(t)` | native `ℂ` and `ℂˣ` homeomorphisms | R02 |

**Cross-roadmap.**
- `roadmaps resolve` reports 11 Lean-name leads, all declared in `Suggested.lean`, and no unresolved cross-roadmap citation.
- Main anchors `#layer-6-…` and `#9a-…` resolve.
- No roadmap on main cites the old Layer 8 or 7g.
- The Lang move-down from ReductiveGroupsPartII RG2.3.7 was the required repair of an earlier review (R02 of PRREVIEW-ReductiveGroups~20).
- GroupSchemesOverABase leaves the relative reductive theory here (R03 concerns its numbering only).

**Principles.** There is no copied passage, no algorithm, no `set_option`, no sorry'd data and no LaTeX, and `theorem` is used throughout.

## Not verifiable

- Waterhouse, Borel and Springer are settled as uncertified and cited by locator only.
- The manifest key `milne-iag` records Milne's v2.00 course notes, whose numbering differs from the 2017 book. I read the 2017 author copy that is already cached (RootSystems' `milne17`).
- Ownership was checked against the open pull requests through `roadmaps grep` and `roadmaps show`; I did not read board packages that are not open pull requests (ComplexComparisonPartII C-1.1).

## Source issues

- **Misprint** in dudas-michel at the proof of Lemma 7.2, p. 24: the last identity writes `(xF)^(ne) = F^(ne)`, but the conjugating element is named `g`; it should read `(ad g ∘ F)^(ne) = F^(ne)`; affects nothing.
