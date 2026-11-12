# Review of ReductiveGroupsPartIII (pull request #2131 at a77c7a9)

**Verdict:** needs changes

Four findings: one P2, three P3. The gate passes at this head (all checks 0, OK), `lake env lean`
on `Suggested.lean` gives six `sorry` warnings and nothing else, and the dependency check reports
`depcheck: 235 roadmaps, 2132 edges, 0 problem(s)`. All six findings of the previous review are
repaired (table below).

## Previous review: repair status

| Id | Status | Evidence at this head |
|---|---|---|
| R01 (P2) Serre-unit criterion and density statable | repaired | `Suggested.lean` lines 168–246 define `IsSerreTorus`, `IsPrimeUnit`, `IsPrimeWeilNumber`, `IsPrimeWeilPoint`, `IsNeatPoint` and state `isPrimeWeilPoint_iff_isPrimeUnit` and `exists_pow_isNeatPoint_dense` (the neat form); the "not statable" bullet is gone; README lines 210–219 add the point-topology and torus contracts; §§3.1–3.7 name the declarations. |
| R02 (P2) `χ+cχ` bullet without the Serre hypothesis | repaired | README line 960: "Under the condition, for every geometric character `χ`, …", with the `ℚ(√3)` failure recorded. |
| R03 (P3) old build labels | repaired | The RG3 label paragraph and both "These replace …" sentences are deleted. Note, no change requested here: the earlier witness covered main and the open heads only. The board package ShimuraVarietiesPartII (design not yet accepted) cites `RG3.0/conjugacy-quotient`, `RG3.0/character-separation`, `RG3.0/faithful-quotient-finite`, `RG3.0/orthogonal-outer-action`, `RG3.2/elliptic-maximal-torus`, `RG3.3/cyclic-torus-and-neatness` and `RG3.5` (its README lines 11, 31, 98–110, 892, 964). It also drafts six gaps on this roadmap. When it is packaged it has to repoint to ArithmeticGaloisRepresentations §1.11, §0.5, §0.6, §0.7, §2.3, §3.5 and Layer 5 here. |
| R04 (P3) BunGAndNewtonStrata named as consumer | repaired | Line 123 ends at "**BunGAndNewtonStrata**."; line 1757 names no earlier roadmap as consumer. |
| R05 (P3) contracts vs `*Needs:*` | repaired | The AutomorphicBundles/MotivesAndAlgebraicCycles contract is deleted and lines 65–67 and 97–99 say they are not consumed. §7.0i and `abelian_absolute_hodge` (line 301), AdelicAlgebraicGroups §4.1 (line 280), Layer 8 (line 231) and RG2.1.1 (lines 236–245) are out of the contracts. Line 922 adds §3A.5, line 1417 adds ET §1.1, and lines 1745–1747 add RG2.2, RG Layers 4/6/7 and ET §§1.1–1.2, 1.5–1.6. |
| R06 (P3) undefined `τ, τ′` and conjugacy type | repaired | Lines 1564–1565 (second embedding, §1.4 transport) and 1515–1517 (centralizer of a maximal `ℚ̆_p`-split torus, KZ25 lines 2584–2587, confirmed). Its §5.5 `*Needs:*` was not updated: see R04 below. |

## R01 (P2) — The five declared supplier gaps are owned here; plan and README disagree on the owner

**Location.** `TauCetiRoadmap/ReductiveGroupsPartIII/README.md` lines 69–72: "The localization exact
sequence in §2.0, the local centralizer openness in §2.1a, the Galois-stable maximal-torus embedding
theorem in §4.3, the pointwise building intersection in §5.3a and the relative inner-form obstruction
in §5.7a are owned here." The README contains no `gap:` line.

**Claim.** The README owns these five interfaces. But the accepted design still declares each one as a
supplier gap, and the intake announces those gaps to the suppliers. Each object then has two owners,
and the declared gaps ask for what this roadmap already provides.

**Witness.** `design/plan.json` `gaps`: `torus-localization-sequence` (EndoscopicTransferAndUnitaryTraceComparison
1.2), `regular-centralizer-openness` (ReductiveGroupsPartII RG2.0.2), `quasi-split-torus-embedding-class`
(ET 1.6), `parahoric-intersection-same-derived` (RG2.3.4), `relative-global-obstruction` (ET 1.15). These
match §§2.0, 2.1a, 4.3, 5.3a and 5.7a word for word, and `grep -c 'gap:' README.md` gives 0.

**Repair.** Choose one owner per interface.

- (a) Keep the five targets here and have the operator withdraw the five slugs from `plan.json` and
  from the supplier announcements. The package cannot remove plan gaps itself. The targets are stated
  at exactly the missing interface: ET §1.2(b) (its line 204) identifies the global-mod-local group
  but not the sum of local Tate–Nakayama maps; ET §1.6 (line 357) transfers tori only from an inner
  form; ET §1.15 (line 579) states only `G₀=G`; RG2.0.2 (main line 590) has no openness; RG2.3.4
  (main line 4530) has no same-derived intersection.
- (b) Restore `What <Supplier> must provide (gap:<slug>): <needs>` under each supplier's contract and
  replace §§2.0, 2.1a, 4.3, 5.3a and 5.7a by citations of those contracts. Their Checks move to the
  consuming targets §§2.1, 2.2, 4.5, 5.4 and 5.8.

Tested: neither supplier states any of the five at its head, so (a) leaves this README as the single
owner.

## R02 (P3) — Local compactness and closed embeddings of local points are cited from ReductiveGroupsPartII although the Tau Ceti pin has them

**Location.** `README.md` lines 215–216: "Local compactness of the points over a local field is not taken
from the pin; it is ReductiveGroupsPartII §RG2.0.2." Also §3.2 `*Needs:*`, lines 989–990: "ReductiveGroupsPartII
§§RG2.0.1–RG2.0.2 (closed embeddings give closed embeddings of local points, local compactness)".

**Witness.** At Tau Ceti 2fd255d997:

- `TauCeti.PointTopology.locallyCompactSpace_of_finiteType`
  (`TauCeti/Topology/Algebra/PointTopology/Basic.lean:261`; `R` locally compact and T1, `A` of finite
  type), made the instance `instLocallyCompactSpaceWithConv` (`…/PointTopology/Separation.lean:113`);
- `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective` (`…/PointTopology/Functoriality.lean:110`);
- `ℚ_[p]` is locally compact (Mathlib `NumberTheory/Padics/ProperSpace.lean:68`).

**Repair.** In the From Tau Ceti contract, replace the sentence with these three declarations and their
files. In §3.2 `*Needs:*`, cite them in place of RG2.0.1–RG2.0.2. Then drop "ReductiveGroupsPartII
§§RG2.0.1–RG2.0.2" from the Layer 3 Dependencies (line 1196): §3.2 is its only user in Layer 3.
Tested on `G_m` over `ℚ_v`: a closed point set of `ℚ_v²` cut out by `xy=1`, locally compact by the
pinned instance.

## R03 (P3) — §2.1a has no locator for its own statement

**Location.** `README.md` lines 784–786: "This differential argument supplies the local input to Harder's
approximation theorem (Borovoi98 Lemma 5.6.3, p.37; KMPS22 Lemma 1.2.2, p.14), rather than assuming the
local openness assertion…"

**Claim.** The openness of the set of regular semisimple elements with centralizer `G(F)`-conjugate to `T` is
the target, but the parenthesis locates only the consumer theorem.

**Witness.** Borovoi98 lines 1448–1451 state Harder's approximation and defer to "[Ha], II, Lemma 5.5.3";
KMPS22 lines 625–629 likewise ("[Har66, Lem. 5.5.3]"). Neither text states the openness in `Lie(G)(F)`.

**Repair.** Give §2.1a a locator that states or proves the openness. One option is the proof of Harder's
Lemma 5.5.3 (Math. Z. 92, 1966, Teil II), the place both texts defer to, cited by locator and recorded
in `sources.toml`, uncertified if it cannot be read. A textbook statement also works. Keep the present
parenthesis only as the locator of "Harder's approximation theorem".

## R04 (P3) — Layer 5 dependency bookkeeping

**Location.** (a) `README.md` line 1743: "ArithmeticGaloisRepresentations §1.11, §0.6, §§1.3–1.6, §2.2." Line
1747: "…RG2.3.3 and RG2.3.4, and §5.3a." (b) §5.5: its statement (lines 1564–1565) uses "the inner-form
identification `Conj(G)≅Conj(G′)` of §1.4", but its `*Needs:*` (lines 1575–1576) omits §1.4.

**Witness.** (a) ArithmeticGaloisRepresentations has its own §1.3 "Induction from open subgroups", §§1.4–1.6
and §2.2 "Ramification and Frobenius" (its lines 996–1125, 1797). The sentence therefore reads as a
citation of those sections. §5.3a is a target of Layer 5 itself, appended to a ReductiveGroupsPartII
list. (b) `grep '§1.4' README.md` in §5.5 hits only the statement.

**Repair.** Line 1743 → "§0.6, §§1.3–1.6 and §2.2 of this roadmap. ArithmeticGaloisRepresentations
§1.11." Delete ", and §5.3a" at line 1747. Add "§1.4 (inner-form transport of quotient points)" to
§5.5's `*Needs:*`.

## Verified sound

**Gate, build and Lean form.** I re-ran the gate at a77c7a9: all checks 0, OK, and the worktree is clean.
`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroupsPartIII'` is empty.
`lake env lean` on `Suggested.lean`: six `sorry` warnings (lines 96, 113, 130, 143, 225, 237), nothing else.

- **Elaborated types.** I compared all 12 elaborated types (the `signatures.md` regenerated at this head,
  plus `#check @isConj_iff_trace_eq` and `#check @exists_pow_isNeatPoint_dense` in a scratch probe) with
  the README statements. They agree: §0.1 over a commutative ring; §0.5 `IsAlgClosed Ω` with both points
  semisimple; §0.6 `H` arbitrary finite type, `G` reductive, `f` surjective, `q` fixed by `hq`; §1.2(a)
  finite `S`; §2.2 finite and archimedean places as two finsets; §3.6 torus and `IsSerreTorus` with `l`
  prime; §3.7 adds `T_{ℚ_l}` split. No binder is lost and nothing changed.
- **One-tactic probe.** On a scratch copy each `sorry` was replaced by
  `first | rfl | (simp; done) | infer_instance | decide | (exact?)`. `exact?` fails on four theorems and
  hits the heartbeat limit on two. No padding.
- **Definitions.** `IsSerreTorus` mirrors the pinned `HopfIdeal.IsMaximalTorus` pattern
  (`Torus/Maximal.lean:50`: `Minimal` among Hopf ideals, ideals reversing subgroup inclusion). So the
  minimal split-quotient ideal over `ℝ` is the maximal `ℝ`-split subtorus.
- **Form.** No `set_option`, no sorry'd data, a single `import Mathlib` plus thirteen pinned `TauCeti.*`
  modules, `theorem` only.

**Headline theorems (README Summary) and the Lean.**

- Stated: §0.5, §0.6, §1.2(a), §2.2, §3.6, §3.7.
- Named in the docstring as not statable, with the missing carrier: §0.3, §§2.1/2.5, §4.1, §§4.3–4.5,
  §4.6, §§5.5/5.7/5.9 and §§5.7a–5.8.
- §0.3: the pin's `BialgHom.weylGroup` (`DiagonalizableGroup/Normalizer/WeylGroup.lean:93`) is the image
  of rational normalizer points of a split diagonalizable subgroup in `MulAut X`. That covers neither
  the étale Weyl group scheme nor non-split maximal tori, so the docstring's reason holds for the
  any-field statement.

**Pinned declarations opened (Tau Ceti 2fd255d997, Mathlib 1b1ccf4b08), 24.**

- Hopf and comodule: `HopfAlgebra.conjugationAlgHom` (`Hopf/Conjugation.lean:66`),
  `productMap_comp_conjugationAlgHom` (:107), `tensorProduct_map_comp_conjugationAlgHom` (:118);
  `IsSemisimplePoint` (`SemisimplePoint/Basic.lean:81`); `Comodule.endOfPoint` (`PointsAction.lean:134`);
  `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:71`).
- Tori and Hopf ideals: `splitTorusCommHopfAlgProperty` (`Torus/Basic.lean:72`, `∃ n`, iso to the rank-`n`
  split coordinate ring) and `torusCommHopfAlgProperty` (:105, split over `AlgebraicClosure k`);
  `IsMaximalTorus` (`Torus/Maximal.lean:50`); `exists_isMaximalTorus` (`Torus/Existence.lean:99`);
  `HopfIdeal.conjugate` (`HopfIdeal/Conjugation.lean:75`, by a rational point);
  `baseChangeHopfIdeal` (`HopfIdeal/BaseChange.lean:116`); `BialgHom.weylGroup` (above).
- Point topology: `PointTopology.topology` (`PointTopology/Basic.lean:83`) and
  `instTopologicalSpaceWithConv` (:110); `isTopologicalGroup` (`PointTopology/Group.lean:102`); T2
  instances (`Separation.lean:59,64`); `locallyCompactSpace_of_finiteType` (`Basic.lean:261`);
  `isClosedEmbedding_comap_of_surjective` (`Functoriality.lean:110`).
- Number theory: `Chebotarev.hasDirichletDensity_frobeniusPrimeSet` and `infinite_frobeniusPrimeSet`
  (`Chebotarev/Density/Chebotarev.lean:51,74`); `GlobalNumberFields.weakApproximation_denseRange`
  (`Approximation/Weak.lean:208`).
- Mathlib: `LocallyCompactSpace ℚ_[p]` (`Padics/ProperSpace.lean:68`).
- Not at the pins (searched by object): Jordan's covering lemma (no Mathlib/Tau Ceti statement of
  "a subgroup meeting every class is everything" or of the derangement theorem), Weil numbers,
  prime-units, the Serre condition, class functions, Harder's approximation. The library near-matches
  file has no hit that states any target.

**Cross-roadmap citations resolved, 66 sections in 19 roadmaps** (main 4ec889e; open heads as indexed;
BunGAndNewtonStrata, named in the scope only, also read).

- ReductiveGroups (main) Layers 0–4, 6, 7, 9D, 10B (line 4143), 11C (line 4596), §3A.5 (line 1422).
- ReductiveGroupsPartII (main):
  - RG2.0.1 (463), RG2.0.2 (590), RG2.0a.1–3 (963, 1128, 1379), RG2.1.1, RG2.1.5, RG2.2 (2831), RG2.5.1 (6724);
  - RG2.3.3 *fixer-versus-parahoric* (5) (4353–4359) and *compact-elements-in-hyperspecial-subgroups* (4477);
  - RG2.3.4 *very-special-parahoric* (4605).
- Chebotarev Layer 10 and GlobalNumberFields Layer 1 (main, `Completed/`).
- ArithmeticGaloisRepresentations §1.11 paragraph *Reductive quotients over fields and DVRs* (#856, lines
  1437–1475: quotient, `Conj_H`, semisimple classes, semisimple part, `GL_n`).
- IntegralHeckeAndGaloisDeterminants §0.7 (#1689, 1287). SchemeKTheoryOperations §6.3.1 (#1229, 2265:
  split reductive over a field, onto `ℤ[X]^W`, triangularity). DeligneWeightsAndPurity §§0.1–0.2 (#929,
  561, 601).
- AdelicAlgebraicGroups §3.4 *class-number-finite* (#792, 3162) and §4.3 (4610–4670; `Neat.IsNeatAut` is
  declared at its `Suggested.lean` line 394, a different name from `IsNeatPoint`).
- EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.2, 1.3, 1.5, 1.6, 1.9, 1.11, 1.14, 1.15, 3.3 (#999).
- ShimuraData §§1.2–1.4, 4.2–4.3 (#1038). ShimuraVarieties §§P.5, 5.8, 7.0i, 7.0i.1 (#933).
- AbelianSchemesAndArithmeticModuli §§A1.3a, A3.7, A3.9 (rational inverse `λ⁻¹`, line 1702), A4.1
  (`AbelianTate.dualPairing`), A5.1, A5.7, A6.11, A6.21 (#849).
- NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0b (#852). PELModuli §M3.1, §M3.2 `hasseCases` (A)
  for odd `n` and `unitaryCentre_sha_vanishing` (#966, 2814–2856).
- Scope comparisons only: LanglandsParameterStacks §4.26 (#1202), GroupSchemesOverABase §7.2 (#1522:
  split, simply connected derived, over `ℤ`; the field statement here is wider and says so).
- AutomorphicBundles §1.1 and MotivesAndAlgebraicCycles §6.8: present, and stated as not consumed.

**Ownership.** I searched main and all 438 open heads by object: "conjugacy quotient", "Chevalley
restriction", "O(T)^W", "Weil point", "Serre condition", "Harder", "Jordan's lemma", `classFunctions`,
`IsSerreTorus`, `IsPrime*`, `IsNeatPoint`. Only the Lie-algebra quotients (ET §3.3, FormalConnectionsOpers,
SpringerResolution) and GroupSchemesOverABase §7.2 are related, and the Scope distinguishes each.
BunGAndNewtonStrata (closest in vocabulary) owns the local KMPS §1.1 objects, not the global tori of
Layer 2. No `Suggested.lean` declares one of these twelve fully qualified names. The overlaps file lists
no dropped id and no other pull request changing this roadmap.

**Source sample (15 targets plus the two new headlines).**

- **Confirmed.**
  - 0.3: Steinberg65 lines 599–624 (6.2–6.3 on printed p.62, 6.4 on p.63; semisimple, algebraically closed).
  - 1.1: KZ25 lines 2436–2439, p.55.
  - 1.4: KZ25 lines 2458–2462 (p.55) and 2622–2626 (p.59).
  - 1.6: KZ25 lines 2612–2617 (`H₁=H×^{Z_H}T`, pp.58–59).
  - 2.2: KMPS22 lines 625–629 (p.14); Borovoi98 lines 1448–1451 (p.37, number field `K`).
  - 2.3: KMPS22 lines 653–658.
  - 2.4: KMPS22 lines 665–669 (the source uses `n n̄⁻¹` with coboundary `gσ(g)⁻¹`, line 676; the README's
    inverse convention is stated).
  - 2.5: KMPS22 lines 648–683.
  - 3.3 and 3.4: KMPS22 lines 1107–1118.
  - 3.6: KMPS22 lines 1129–1146 (Lemma 2.2.4, `l` any prime).
  - 3.7: KMPS22 lines 1301–1322 (Lemma 2.2.10, `n` the roots of unity of a splitting field).
  - 3.8: KMPS22 lines 1323–1331, with the README's added reducedness and separatedness (source issue below).
  - 4.5: KMPS22 lines 1372–1393 (no type `D`, quasi-split at `p`), hypotheses (b)–(d) at lines 1095–1105,
    1122–1123, 974–981.
  - 5.4: KZ25 lines 2559–2591, 2592–2618, 2627–2646.
  - 5.5: KZ25 lines 2619–2655; Theorem 5.1.4 at lines 2104–2106 (p.48).
- **Not confirmed:** 2.1a (R03). The README flags no locator as unverified.

**Adversarial table** (values computed by hand; "R0n" marks a target a finding touches).

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `classFunctions` | `GL₂/ℚ`, `x=diag(2,3)`, `g`=swap; `G_m` | `(gxg⁻¹)₁₁=3`, `x₁₁=2`; trace `5=5`; `c*(t)=1⊗t` | `x₁₁` out, trace and `t` in | none |
| 0.3 Chevalley | `SL₂→PGL₂`, `α=a²` | `α+α⁻¹=s²−2`; `s=±5/2↦17/4`; char 2: `s↦s²` | as stated | none |
| 0.5 `isConj_iff_trace_eq` | `G_m`: `2` vs `1/2`; `[[1,1],[0,1]]` vs `1` | trace on `t`: `2≠1/2`; on `t⊕t⁻¹`: `5/2=5/2`; unipotent: all traces equal | iff true; `hx,hy` exclude unipotents | none |
| 0.6 `finite_classFunctions_map` | `G_m→GL₂`, `t↦diag(t,t⁻¹)`; `G=1` | `s↦t+t⁻¹`, `d↦1`; `t` root of `X²−sX+1`: rank 2 | finite, not injective | none |
| 0.7 `Out′` | `SO(8)`, `t` with 8 distinct eigenvalues | centralizer in `O(8)` = torus in `SO(8)`; reflection conjugate not `SO(8)`-conjugate | `Conj` differs, `Conj′` agrees | none |
| 1.1 Jordan | `S₃`, `Δ=⟨(12)⟩`; `Q₈`, `⟨i⟩` | Burnside `3+3·1+2·0=6=|S₃|·1`; misses 3-cycles; misses `±j` | holds; finiteness needed (`GL₂(ℂ)`, Borel) | none |
| 1.2(a) Lean | `K=ℚ(i)`; `K=ℚ(∛2)` | no embedding for `ℓ≡3 mod 4`; none for `ℓ≡1 mod 3` with `2` a non-cube | hypothesis fails for every finite `S` | none |
| 1.4 inner forms | `D^×` vs `GL₂`; `U(1)` vs `G_m` | `(trd,nrd)↦(s,d)`; units `ℚ^×` vs `ℚ^×t^ℤ` | identified; outer form excluded | none |
| 1.6 central product | `SL₂`, `T=G_m⊃μ₂` | `(g,t)↦tg`, kernel `(z,z⁻¹)`; `s↦(s,1)`; via `PGL₂` `±5/2↦17/4` | injective; torus needed | none |
| 2.0 localization (R01) | norm-one torus of `ℚ(i)` | `(X_*)_Γ,tors=ℤ/2`; `inv_∞+inv_3=1+1=0`; `inv_∞` alone `1≠0` | lifts / does not | ownership only |
| 2.1 | same torus | Frobenius at inert `3` equals `c` in `Gal(ℚ(i)/ℚ)` | auxiliary `ℓ` inert | none |
| 2.1a openness (R03) | `GL₂`, `X=diag(1,2)`; `X=1` | `[E₁₂,X]=E₁₂`, `[E₂₁,X]=−E₂₁` (factors `1,−1`); `0` at scalars | IFT only at regular points | locator |
| 2.2 Harder (Lean) | `S=S′=∅`; `GL₂/ℚ`, `S={∞,p}` | reduces to `exists_isMaximalTorus`; `Res_{E/ℚ}G_m`, `p` split in `E` | consistent | none |
| 2.3 | `G_m`; `Res_{ℚ(i)/ℚ}SL₂` | `G_m/G_m=1` elliptic; `SL₂(ℂ)` finite centre, no compact Cartan | hypothesis needed | none |
| 2.4 | `n=diag(i,−i)∈SL₂(ℂ)` | `c(n)=n⁻¹`, `n⁻¹c(n)=n⁻²=−1`; cocycles `ℝ^×`, coboundaries `ℝ_{>0}` | nontrivial class | none |
| 2.4 | `GL₃(ℝ)`, torus `ℂ^×ℝ^×`, `c=(12)`, `w=(13)` | `cwc=(23)`, `w⁻¹·cwc=(13)(23)≠1` | not in torus; anisotropy needed | none |
| 2.5 | route | `c(u)=c(g)c(t)⁻¹c(n)⁻¹=gt⁻¹n⁻¹=u`; `Int(u)(wμ)=Int(g)μ` | matches `g⁻¹σ(g)` | none |
| 3.1 `IsSerreTorus` | `G_m`; norm-one `ℚ(i)`; norm-one `ℚ(√3)`; CM `Res`, degree 4 | `J=⊥` minimal; augmentation minimal (`U(1)` has no split subtorus); over `ℝ`, `⊥ <` augmentation; ranks `1` vs `2` | true, true, false, false | none |
| 3.2 `IsPrimeUnit` (R02) | `G_m`, `γ=2,l=2`; `γ=6,l=2` | `|2ⁿ|_v=1` for `v≠2`; `|6^{−n}|_3=3ⁿ` unbounded | true; false | contract only |
| 3.3 `IsPrimeWeilNumber` | `(3+4i)/5,l=5`; `3,l=2`; `0` | minpoly `X²−(6/5)X+1`, roots of modulus `1=5⁰`, `5α=3+4i`, `5α⁻¹=3−4i`; `2ⁿ/3∉ℤ̄`; root `0` has modulus `0≠l^{w/2}` | true; false; excluded | none |
| 3.4 `IsPrimeWeilPoint` | `diag(l,1)`; upper unipotent; `q∈G_m` | weights `2,0`; eigenvalue `1` weight `0`; `q` not a unit at `q` | true; true; false | none |
| 3.5 `IsNeatPoint` | `−1∈G_m`; `diag(2,4)`; `√2` in `Res` | `{±1}` torsion; `⟨2⟩≅ℤ`; `±√2` generate `−1` | false; true; false | none |
| 3.6 iff (Lean) | `G_m`, `γ=−8`, `l=2`; norm-one `ℚ(√3)`, `2+√3` | `|−8|_v=1` for `v≠2`; `|(−8)^k|=2^{3k}`, `w=6k`; moduli `3.73`, `0.27` | both true; unit but not Weil, excluded by `hS` | none |
| 3.7 density (Lean) | `G_m`, `l=3`; norm-one `ℚ(i)`, `l=3` inert; `l=5` | Weil `±3ⁿ`, squares `3^{2n}`, a Laurent polynomial with infinitely many roots is `0`; `m=1` fails (`−1`); inert: Weil `={±1,±i}`, `t−1≠0` vanishes on 4th powers `{1}` | true; false without `hl`; dense | none |
| 3.8 rigidity | `k[ε]/ε²`, `ε↦2ε`; doubled origin | fixes the only point, not identity; swap fixes punctured line | reduced, separated needed | none |
| 4.3 (R01) | `D^×`, split torus `G_m²` | a rational embedding puts `ℚ×ℚ` (zero divisors) in `D` | quasi-split needed | ownership only |
| 4.5 | `I_ℝ=SL₂(ℝ)` | `SO(2)` compact Cartan; split torus image not anisotropic | (d) needed | none |
| 4.6 | `d=3` real place; `F⁺=ℚ` | `(ℝ^×)³/((ℝ_{>0})³ℝ^×)` has 4 elements; `T₁=Res_{E/ℚ}G_m`, `ker¹=0` | consistent | none |
| 5.3a (R01) | `G_m→G_m²` diagonal; `SL₂→GL₂` | `K^×∩(O^×)²=O^×`; `GL₂(O)∩SL₂(K)=SL₂(O)` | as stated | ownership only |
| 5.4 | `G=GL₂`, `F` quadratic | `dim H′=8`, `dim H=7`, derived `6` | `H≠H′` | none |
| 5.5 (R04) | `G_m→GL₂` | fibre over `(5/2,1)` is `{2,1/2}`, two geometric points | injectivity needed | `*Needs:*` |
| 5.6/5.7 | `G_m`, `ν=t²`; `GL₂`, `a=1,q=5` | `x²=r²`, `|x|=r ⇒ ±r`; discriminant `1−20=−19<0` | real elliptic | none |
| 5.7a (R01) | `SL₂` elliptic centralizer | `(−1)(−1)=1`; a single `−1` | product formula | ownership only |
| 5.9 | `q=4`, `a=4` | scalar `2` semisimple; companion of `(X−2)²` has a nilpotent part | scalar chosen | none |

## Not verifiable

- Noot09 (§§0.7, 4.5) and Kottwitz82 (§4.3): settled as waived; cited by locator, not read.
- Harder 1966, Teil II, Lemma 5.5.3 (R03): not in the manifest. This review edits no manifest, so it was
  not fetched.
- The Bruhat–Tits content of §§5.3a–5.4 (fixer intersection, very special points, torsion freeness of
  `X_*(H_ab)_I`) was checked on the Checks only. KZ25 asserts the conclusion without proof (KZ25 lines
  2579–2581).
- §4.6 for a general CM field: KMPS22 Remark 2.3.16(1) asserts it and Shin11 proves the case `F=F⁺E`.
  The general parity calculation was tested at degree 3, not proved.
- Deligne82 locators (§5.1, not in the sample) were not opened.

## Source issues

- **Error** in KZ25 at §5.1.3, arXiv v2 p.47: the source says `Conj_H(F)` is the set of semisimple `H(F)`-conjugacy classes for any characteristic-zero field; it should be over an algebraic closure (`SL₂(ℚ)` has two trace-zero classes); affects nothing.
- **Gap** in KZ25 at proof of Theorem 5.1.4, arXiv v2 p.55: the source takes a Frobenius at a prime above every `ℓ≠p`, ramified ones included; it should use only `ℓ` unramified in the Galois closure, which Chebotarev suffices for; affects nothing.
- **Error** in KMPS22 at §2.2.3, p.25: the source says an `l`-unit has bounded powers at every place not dividing `l`, the real place included; it should be every finite place, since `l` is unbounded in `ℝ^×`; affects a stated result.
- **Error** in KMPS22 at Lemma 2.2.11, p.29: the source says rigidity holds on any irreducible scheme of finite type; it should also assume reduced and separated (dual numbers, doubled line); affects a stated result.
- **Error** in KMPS22 at proof of Proposition 2.2.13, p.29: the source says the connected centralizer of a semisimple element is a Levi subgroup; it should be a connected reductive subgroup of maximal rank (`SL₂×SL₂⊂Sp₄`); affects the proof.
- **Misprint** in KMPS22 at §2.1.8, p.24: the source defines neatness of `γ` through the closure of the group generated by `x`; it should be the group generated by `γ`; affects nothing.
- **Misprint** in KZ25 at proof of Lemma 6.2.6(2), p.58: the source writes the conjugate of `g` as `g`, then flips the conjugation direction in one factor; it should be `g′` with one orientation; affects nothing.
- **Misprint** in KZ25 at §6.1.1, p.55: the source gives `H¹_B` Hodge types `(0,−1),(−1,0)`; it should be `(1,0),(0,1)`, the stated types being those of `H₁`; affects nothing.
