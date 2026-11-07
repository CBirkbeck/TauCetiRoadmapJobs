# Review of CompletedCohomologyAndLocalGlobalCompatibility (pull request #1270 at bd1e251)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/` at `bd1e251e5c6ac8ee831f2c44ed2db214fa96b4cb`. The change since `3bb343b` (178 lines) adds two §0.7 targets (unitary level forms with norms; split-place Hecke operators and the tame Hecke algebra), drops the QuaternionicModularForms citation, renames Tung's typed ring, and gives `Suggested.lean` seven declarations. The gate fails (two `statement-hygiene` hits, two build warnings), so the roadmap cannot be accepted at this head.

## R01 (P2) — The rank-n completed definite unitary coefficient space has two owners

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:143` (“the completed degree-zero object `lim_s colim_{U_p} S_{ξ,τ}(U_pU^p, O/ϖ^s)` with its tame Hecke and `GL_n(F̃^+_p)`-actions”), with the scope row at line 21 and §0.7's colimit bullet at line 379.

**Claim.** This roadmap constructs CEGGPS's completed cohomology `S̃_{ξ,τ}(U^p,O)` of a rank-n definite unitary group as its own target. The object is the same: one varying place above p, fixed types `ξ⊗τ` at the other p-places, `f(gu)=u⁻¹f(g)`, limit over `ϖ^s` of the colimit over p-levels, with its integral lattice and its local and tame Hecke actions. OverconvergentAutomorphicForms §0.7 already constructs it for every n ≥ 2, and that roadmap comes earlier in the merge order. It is already a supplier here, but only through its §0.6. The README cites neither the overlap nor how the two constructions differ.

**Witness.** OverconvergentAutomorphicForms README (#1422) lines 398–412: for definite unitary G of rank n≥2 it defines `Π = (lim_k colim_{U_wp} S(U_wp U^wp, ξ⊗τ, O_E/ϖ^k)) ⊗ E` with integral lattice, local and tame-Hecke actions. Merge order: 251, before this roadmap at 252.

**Repair.** Cite OverconvergentAutomorphicForms §0.7 for the completed unitary coefficient space and its finite-level function spaces when n ≥ 2 and the tame level is small, which covers every CEGGPS use in §5.1, where p ∤ 2n and the level is small. Do this in the scope table (line 21), in the CompletedCohomologyPartII §8.5 extension (line 143), in the colimit bullet (line 379) and in §5.1 step 4. Keep here only what that section does not state, and say in one clause in Scope and ownership how it differs. That leaves rank one, arbitrary non-small levels with stabilizer invariants, and the explicit split-place operators, Hecke polynomial and auxiliary Iwahori place. Test on n = 2, p = 5, small `U^p`: the object then becomes the cited one. For n = 1 it stays a target here.

## R02 (P3) — `haveI` in two theorem signatures (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/Suggested.lean:166` and `:179` (`haveI := glnIntegral_isHeckeTriple L n`).

**Claim.** The gate rule forbids `haveI` in a signature: the multiplication of `HeckeRing ⊤ (glnIntegral L n) ℤ` is obtained by a `haveI` inside the statements of `splitHeckeT_one_mul_self` and `splitHeckeT_mul_inverse`.

**Witness.** Gate output on this head: “line 166: P3 `haveI` in the signature of theorem `splitHeckeT_one_mul_self`”; same at line 179 for `splitHeckeT_mul_inverse`.

**Repair.** Replace each `haveI` by the binder `[IsHeckeTriple (⊤ : Submonoid (GL (Fin n) L)) (glnIntegral L n) (glnIntegral L n)]` before the colon. Tested on a scratch copy: it elaborates with only the four `sorry` warnings. If R04 is applied, the two theorems go and this finding with them.

## R03 (P3) — Build warnings: `Suggested.lean` is not a module (gate: build)

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/Suggested.lean:1` (`import Mathlib` with no `module` header).

**Claim.** The targeted build emits two warnings besides `sorry`, so the gate's build check fails.

**Witness.** Gate build log on this head: “imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file” (twice).

**Repair.** Make `module` the first line of the file, as SmoothRepresentationsOfLocalGroups's `Suggested.lean` and 26 roadmaps on main do. Tested together with the R02 repair on a scratch copy: `lake env lean` reports only the `sorry` warnings. This repair is needed whether or not R04 is applied.

## R04 (P3) — `Suggested.lean` now catalogues §0.7 API facts, not headline theorems

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/Suggested.lean:126–185` (`glnIntegral`, `glnIntegral_isHeckeTriple`, `minusculeDiag`, `splitHeckeT`, `splitHeckeT_degree`, `splitHeckeT_one_mul_self`, `splitHeckeT_mul_inverse`); README lines 9, 396, 401–403.

**Claim.** The three theorems are the coset count, the `T^{(1)}` quadratic relation and the inversion identity in the local spherical Hecke ring of `GL_n(L)`. The README introduces them under “Prove the following API” (lines 398–403). The Summary's end results are Emerton's local–global compatibility, the quaternionic and Pan comparisons and the patched-module support theorems, and none of these three is among them. The three definitions exist only to state them. The objects are also SmoothRepresentationsOfLocalGroups SR.4.3's minuscule generators, which the scope table (line 20) assigns to that roadmap. `Suggested.lean` is the acceptance test for headlines, not an API list.

**Witness.** README line 398, “Prove the following API.”, followed by the bullets naming `splitHeckeT_degree`, `splitHeckeT_one_mul_self` and `splitHeckeT_mul_inverse`. README line 3 lists the end results; none is a local Hecke-ring identity.

**Repair.** Delete the seven declarations and the two `TauCeti.*` imports. Restore the docstring sentence that no headline is statable at the pins, keeping its list of missing carriers. In README lines 9, 396 and 401–403, write the Lean names as prose; the statements and Checks stay as §0.7 API. If they are kept instead, two further fixes are needed. The README must state `splitHeckeT_mul_inverse` at its Lean generality, which allows any unit ϖ and any j (for j > n both sides are 1). And R02 must be applied.

## R05 (P3) — Gaussian binomials and the subspace count are used without their owner

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:401` (“the Gaussian binomial coefficient `[n choose j]_{q_w}`”), line 402 (`[n]_q² = q^{n−1}[n]_q + (q+1)[n choose 2]_q`), lines 417–418; the *Needs:* line 420 names no supplier for them.

**Claim.** The coset counts rest on the Gaussian binomial coefficient and on its equality with the number of j-dimensional subspaces of `k_w^n`. Neither pinned library has these. ArithmeticStatisticsPartIV owns both and comes earlier in the merge order, but the README neither cites it nor states them as targets.

**Witness.** ArithmeticStatisticsPartIV README (#1172) line 130, §3.2 “Gaussian binomial coefficient”: defines `[n k]_t` and proves it counts the k-dimensional subspaces of `𝔽_q^n`. Merge order 109; Mathlib and Tau Ceti at the pins have no Gaussian binomial.

**Repair.** Add “ArithmeticStatisticsPartIV §3.2 (Gaussian binomial coefficient and subspace count)” to §0.7's *Needs:* and to the supplier contracts. The identity on line 402 then follows from `[n choose 1]_q = [n]_q` and the subspace count. Check at n = 3, q = 2: 49 = 4·7 + 3·7.

## R06 (P3) — The stated library pins are not the pins

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:64` (“Use Mathlib at `6b7abb3c…` and Tau Ceti at `a91d3aaf…`”); `Suggested.lean:12–13` (same hashes).

**Claim.** The file builds against the pins of `lake-manifest.json`, the same as on main, and those are different commits. The docstring's claims about what is statable “at these pins” therefore refer to the wrong libraries.

**Witness.** `lake-manifest.json` at this head (equal to `origin/main`): mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, TauCeti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; main's commit `a891cd19` bumped the Tau Ceti pin from `a91d3aa`.

**Repair.** Replace both hashes in README line 64 and `Suggested.lean` lines 12–13 with `1b1ccf4b…` and `2fd255d9…`. Alternatively, write “at the pins of `lake-manifest.json`” in both places.

## R07 (P3) — Lean names attributed to PadicLocalLanglandsForGL2Qp that it does not declare

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:253` (“Import `MontrealFunctor` … the block/Galois dictionary `GL2Block.residualGalois`”), line 299 (“Import `GL2Block` … (`WDTypeRing.blockIdentification`)”), *Needs:* lines 1978 and 2089 (“(MontrealFunctor)”).

**Claim.** The cited sections exist and supply the objects (§3.2 Montréal functor, §5.2 the bijection `B ↔ ρ̄_B`, §§5.6, 5.12 block centre and type rings). The backticked names, however, occur nowhere in that roadmap, in its README or its `Suggested.lean`, or in the pinned libraries. So they cannot be resolved.

**Witness.** PadicLocalLanglandsForGL2Qp at #1312: README and `Suggested.lean` contain no `MontrealFunctor`, `GL2Block` or `WDTypeRing`. The citation resolver reports `residualGalois` and `blockIdentification` as found nowhere.

**Repair.** Cite the objects in words by section: “the Montréal functor of PadicLocalLanglandsForGL2Qp §3.2”, “the block–residual-representation bijection of its §5.2”, and “its §§5.6, 5.12 block-centre and Weil–Deligne type identification”. Drop the four backticked names, and also the parenthesised name in the two *Needs:* lines.

## R08 (P3) — Page ranges that miss or overshoot the cited passage

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:1388` (“PAN, §4.1, Assumption and 4.1.3, pp. 37–38”), line 2062 (“TUNG-2, §4.2, … pp. 18–20”), line 2064 (“PAN, §4.4, … pp. 52–59”).

**Claim.** The first range starts a page too early and omits the page that carries the cited definition of pro-modular primes. The other two each start one page early.

**Witness.** PAN line 1590: §4.1 begins on p. 38. PAN line 1644: the pro-modular definition is on p. 39. TUNG-2 line 905: §4.2 begins on p. 19. PAN line 2236: §4.4 begins on p. 53.

**Repair.** Change the ranges to “pp. 38–39”, “pp. 19–20” and “pp. 53–59”.

## R09 (P3) — Process vocabulary: “node”, “new”, “present”

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:1573` (“the new §2.4 node”), line 175 (“The present at-least-3 node”), line 159 (“local-lifting-ring node”), line 1989 (“from this node”), line 2128 (“this node’s proof”), line 2269 (“the node uses”).

**Claim.** “Node” is catalogue vocabulary, neither the literature's term nor one defined here, and “new”/“present” narrate the editing history. The README must be timeless prose.

**Witness.** The six quoted passages. The house style forbids process narrative, and its vocabulary rule requires every term to be the literature's or one defined in the roadmap.

**Repair.** Line 1573 becomes “These are explicit inputs of §2.4.” Line 175 becomes “ModularCurvesPartII §14.9, stated for p ≥ 3, is not sufficient …”. Line 159 becomes “LocalGaloisDeformationRings §1.1's local lifting ring supplies representability only”. In lines 1989, 2128 and 2269, replace “node” by “section”.

## Previous findings

- Review at `3bb343b`, R01 (P3, Tung's typed ring under two names) is **repaired**. Line 984 now reads “the `ψ_T` and `σ_T` of the Tung typed deformation-ring quotient below”, with image `T^{Tung}_{ψ_T,σ_T,α}` and ring `R^{Tung,S}_{ψ_T}(σ_T)`. Line 996 (CC1) reads “with its `R^{Tung,S}_{ψ_T}(σ_T)`-action”. Line 2094 (§5.6(1)(c)) reads “`R^{Tung,S}_{ψ_T}(σ_T)`, §2.8’s Tung typed global ring on this section’s ψ and σ”. The single remaining `R^S_ψ(σ)` (line 1018) describes Tung's own notation in a source locator, which is correct.
- The findings of the earlier reviews (ordinary Eisenstein seed, §6.3 exponent, Serre-weight locators, Lean API names, Pan/Tung transport) were verified repaired before `3bb343b`. The passages are unchanged at this head; §6.3's `b+1` was re-verified below.

## Verified sound

### Gate, dependency check and elaboration

```text
gate CompletedCohomologyAndLocalGlobalCompatibility: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=2 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
depcheck: 240 roadmaps, 2453 edges, 0 problem(s)
```

The worker's run on this head also recorded `build=2` (R03). There is no UPWARD, CYCLE or `moved:` line, and nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty). `lake env lean` on `Suggested.lean` gives exactly four `sorry` warnings.

Every declaration was passed to `#check @name` in one scratch file. `glnIntegral` and `splitHeckeT` keep only `[Field L] [ValuativeRel L]`, and `minusculeDiag` only `[Field L]`. These are harmless, since the definitions make sense over any valued field. The four theorems keep `[TopologicalSpace L] [IsNonarchimedeanLocalField L]`. Each elaborated type matches its README statement, except for the generality of `splitHeckeT_mul_inverse` (R04). The one-tactic probe tried `infer_instance`, `rfl`, `simp`, `simp [splitHeckeT, minusculeDiag, glnIntegral]`, `decide` and `exact?` on all four theorems. None closed: the degree goal reduces to a `relIndex` and the products stay unevaluated.

### Library declarations opened at the pins (11, plus 31 supplier-contract names)

Mathlib:
- `IsHeckeTriple` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:75`). Its fields are both subgroups in Δ, commensurability, and Δ in the commensurator. Nothing in it says anything about topology.
- `HeckeRing` (same file `:189`, notation `𝕋`).
- `IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean:46`).
- `IsUltrametricDist` (`Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`).
- `Module.support_eq_zeroLocus` (`Mathlib/RingTheory/Support.lean:216`, needs `Module.Finite`).
- `range_comap_of_surjective` (`Mathlib/RingTheory/Spectrum/Prime/RingHom.lean:236`).
- `PrimeSpectrum.zeroLocus_eq_univ_iff` (`Mathlib/RingTheory/Spectrum/Prime/Basic.lean:302`).
- `Representation.IntertwiningMap` (`Mathlib/RepresentationTheory/Intertwining.lean:36`) and `ContIntertwiningMap` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:81`).
- All 31 `mathlib:` names of README lines 66–96 exist in their stated files.

Tau Ceti:
- `HeckeCoset.degree` (`TauCeti/NumberTheory/HeckeRing/Basic.lean:902`, the relative index).
- `HeckeCosetModule.single` (same file `:969`).
- `LeftCosetModule.deg` (`TauCeti/NumberTheory/HeckeRing/Degree.lean:104`, a ring homomorphism; its docstring cites Shimura Prop. 3.3).
- `HeckeCosetModule.single_mul_single_of_mem_normalizer` (`TauCeti/NumberTheory/HeckeRing/Normalizer.lean:219`).
- `TauCeti.diagGL` (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/Basic.lean:107`).
- The Hecke ring instance (`TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`).

Neither library has a `GL_n(𝒪)` Hecke pair over a local field, nor a lemma making compact open subgroups commensurable. Tau Ceti's `HeckeRing.GLn` is the global `(posDetInt, SL_n(ℤ))` pair over ℚ. So `glnIntegral` and its triple duplicate nothing at the pins.

### Cross-roadmap citations resolved (24)

SmoothRepresentationsOfLocalGroups (#1688):
- SR.1.2 *hecke-ring-comparison* (README line 1265).
- SR.1.4 *positive-hecke-homomorphism* (1454).
- SR.1.5 *iwahori-matsumoto* (1566; its index clause `[IwI:I]=q^{ℓ(w)}` is present).
- SR.4.1 *satake-isomorphism* (3232).
- SR.4.3 *gln-generators* (3337; `S([K diag(ϖ^{(r)},1)K]) = q^{r(n−r)/2}e_r`).

AutomorphicFormsOnReductiveGroups (#1037):
- §7.4 (1219) has the abstract carrier, the evaluation equivalence, `LevelAlgebraicModularForm` and `inverseActionHeckeEquiv`. Its two hypotheses are compactness at infinity and the centre's rational points being discrete in its finite adelic points, which are exactly the two §0.7 verifies.
- §7.5 (1246) has finite stabilizers and smallness.

CompletedCohomologyPartII (#1035):
- §1.5 (498), §2.1 (539), §3.17 (1098), §8.4 (1777), §8.5 (1796), §8.7 (1832).

AdelicAlgebraicGroups (#792):
- Layer 1 (1008).

ArithmeticStatisticsPartIV (#1172):
- §3.2 (128), used in R05.

OverconvergentAutomorphicForms (#1422):
- §0.6 and §0.7 (398), the latter used in R01.

PadicLocalLanglandsForGL2Qp (#1312):
- §§3.2 (970), 5.2 (1727), 5.6 (1850), 5.12 (2013). The sections exist; the names cited from them do not (R07).

QuaternionicModularForms §2.1 (#934, 606):
- Its level-form API for `D_f^×` is the same generic statement as §0.7's unitary level forms. AutomorphicFormsOnReductiveGroups's scope gives each specialisation its own Banach structure, so this is a parallel specialisation, not a second owner.

PotentialModularityAndCompatibleSystems §8.3 (#1075, line 1444):
- It builds a rank-two definite unitary group with `ι_w`. This is earlier context for R01, not a separate finding.

### Seeded sample: 15 targets, read against the sources at their locators

The texts were fetched through the sources service: EM11 (author page), CEGGPS (arXiv v5), EP (arXiv v3), PAN (arXiv v2), TUNG-2 (arXiv v3), TUNG-P3 (arXiv v4), NAK (arXiv v2), DLB (arXiv v2) and EG14 (author page). Line numbers below refer to the cached extractions.

| Target | Source passage | Outcome |
|---|---|---|
| 0.2 | EM11 Assumption 3.3.1 and Theorem 3.3.2, p. 24 (lines 1215–1227); NAK p. 100 (lines 4350–4360) | Agrees: `MF(π̄)≅ρ̄`, central character `det(ρ̄)ε̄`, no finite-dimensional sub/quotient; `V̌(M)=V(M^∨)^∨(εψ)`, `V=MF(ε)`, `C^ψ` with centre by `ψ⁻¹`. |
| 1.1 | EM11 Conj. 1.1.1 and Rem. 1.1.2, p. 2 (lines 64–83); §5.1, pp. 44–45, (5.1.1)–(5.1.2), footnotes 10–11 (lines 2284–2375); Lemma 5.1.3, p. 46 | Agrees, including the `g↦(g⁻¹)^t` twist and the O-linear inductive-limit topology. |
| 2.3 | EM11 Def. 5.7.1, Rem. 5.7.2 (p. 63), Def. 5.7.5 (p. 64), lines 3295–3327 | Agrees. |
| 2.4 | EM11 Defs. 3.5.1–3.5.4, Lemma 3.5.5, pp. 31–32 (lines 1606–1665); Thm. 5.7.7, p. 64 (lines 3332–3345) | Agrees, including `T` by geometric Frobenius, `Z` by `det(ρ̄)(p)`, and Assumption 5.7.3 only for (2)–(3). |
| 2.7 | DLB Lemmes 4.5–4.7, pp. 21–22 (lines 877–911); PAN 3.2.10, p. 22 (line 965) | Agrees. DLB's last display does print `π_f^{K_p}`; checked on the rendered page (Source issues). |
| 3.1 | EM11 Def. 5.2.1, footnote 12 (p. 46), Def. 5.2.2, Rem. 5.2.3 (p. 47), Lemma 5.2.4, Def. 5.2.5 (p. 48), lines 2397–2516 | Agrees; Lemma 5.2.4(2) isomorphism once K lies in level `N_{Σ₀}`. EM11 misprint at p. 47 recorded below. |
| 3.8 | PAN §4.1.1–4.1.3, lines 1590–1644; Thm. 4.1.7 (p. 39) | Statement agrees; page range wrong (R08). |
| 4.4 | EM11 Conj. 6.1.6/6.1.9 (p. 67), Rem. 6.1.11 (p. 68), Thm. 6.2.13 (p. 75), Cor. 6.4.13, Thms. 6.4.16, 6.4.20, Prop. 6.5.2 (pp. 87–89); NAK Thm. 2.2, p. 20 | Agrees; the README correctly keeps θ in the split case, where EM11 Thm. 6.2.13 overstates (Source issues). |
| 4.5 | EM11 Thm. 1.2.1, p. 3 (lines 104–137); Thm. 6.2.1 (p. 71), Prop. 6.2.2 (p. 72), Prop. 6.1.17, Lemma 6.1.19 (p. 69), Rem. 6.1.23 (p. 70) | Agrees, including hypotheses (a), (b), p-distinguishedness and the embedding clause on V. |
| 5.1 | CEGGPS §2.1 (p. 15), Lemma 2.2 (p. 16), §2.8 (p. 24), Rem. 2.9 (p. 25), `R_∞`, `S_∞` (p. 27), Prop. 2.10 (p. 30), Cor. 2.11 (p. 33), Prop. 2.13, Rem. 2.14 (p. 34), §4.22 (p. 67), Prop. 4.23 (p. 68), Cor. 4.26 (p. 70), Thm. 4.35 (p. 73, proof p. 74) | Agrees; `Λ = closure O[S] ≅ O[[S]]` (lines 2766–2772); `C(O)` with Z by ξ, its smooth dual by `ξ⁻¹` (lines 2867–2876). |
| 5.3 | EP Def. 6.1 (p. 25), Lemma 6.2, Thm. 6.3, Rem. 6.4, Thm. 6.5 (p. 26), lines 1186–1218; Thm. 1.8 (p. 3); TUNG-P3 Props. 3.4–3.5, Thm. 3.7, Cor. 3.8, Prop. 3.9 (pp. 10–12, lines 512–607) | Agrees; Prop. 3.9's proof uses irreducible and reduced `Spec R^□`, as the README says. |
| 5.5 | TUNG-2 §4.2, Def. 4.2.1, Cor. 4.2.2, Lemma 4.2.4 (p. 19), Prop. 4.2.5 (p. 20), Lemma 4.4.1 (p. 21), §4.6 (p. 23), Def. 4.6.3 (p. 24), Props. 4.6.5–4.6.6 (pp. 25–26), Lemma 5.2.1, Prop. 5.2.2 (p. 27), §5.3 (p. 28); PAN Lemma 4.4.2 (p. 53), Cor. 4.4.3 (p. 54), Def. 4.5.6 (p. 58), Prop. 4.5.8 (p. 59), §§8.2–8.3 (pp. 126–129) | Agrees; two ranges start one page early (R08). |
| 5.5a | TUNG-2 §6.1, Rem. 6.1.1, Prop. 6.1.2 (p. 30, lines 1416–1437), Props. 6.2.1–6.2.4, Cor. 6.2.5, Lemma 6.3.1, Props. 6.3.2–6.3.5 (pp. 31–32), Prop. 5.4.1 (p. 29) | Agrees; the README uses the correct invariant ring where TUNG-2 misprints it (Source issues). |
| 5.8 | PAN Thm. 8.0.1 (p. 124, lines 5555–5575), Rems. 8.0.2–8.0.4, 8.0.5 (p. 125), Prop. 8.4.9, Cor. 8.4.10 (p. 132), Thm. 1.0.4 (p. 5) | Agrees word for word in substance, including the p = 3 exclusions and hypothesis (5). |
| 6.3 | EM11 Thms. 3.3.21–3.3.22, Rem. 3.3.23 (pp. 27–28, lines 1437–1453); §7.4, (7.4.1), Rem. 7.4.2 (pp. 96–98, lines 5111–5206) | Agrees; §7.4 prints `det^b` at lines 5129, 5138, 5180 against `det^{b+1}` in Thm. 3.3.22; README corrects it. |

The new §0.7 locators were also read:
- EG14 §5.2 (p. 22, lines 1092–1119): an outer form of `GL_n`, quasi-split at finite places, `U_n(ℝ)` at infinity, the model “as in section 3.3 of CHT”, and `f(gu)=u_p⁻¹f(g)`.
- EG14 §5.3 and Def. 5.3.1 (p. 23, lines 1120–1157): `T_w^{(j)}` and the characteristic polynomial with `(Nw)^{j(j−1)/2}`, matching README line 406.
- CEGGPS §2.3 (pp. 17–19, lines 648–740): Iwahori level at `v₁` (line 684), `f(gu)=u⁻¹f(g)` (line 715) and `T_w^{(j)}` (line 726), matching lines 370, 407 and 396.
- PAN §4.1 (lines 1590–1644) and TUNG-2 §4.1 `S_{ψ,σ}` (p. 18, line 867), the latter matching line 1018.

### Adversarial pass (values computed this round)

| Statement | Instances | Values on each side | Result; change |
|---|---|---|---|
| `splitHeckeT_degree` | n=2, q=3, j=1; n=3, q=2, j=1,2; n=0, j=0 | degree `[2 choose 1]_3=4`; `[3 choose 1]_2=[3 choose 2]_2=7`; n=0: one coset, one 0-subspace of `k⁰` | Holds; Checks at lines 412–413 agree. |
| same, `hj` control | n=1, j=2 | `minusculeDiag 1 ϖ 2 = ϖI`, central, degree 1; 2-dimensional subspaces of `k¹`: 0 | Fails without `j ≤ n`; hypothesis necessary. |
| `splitHeckeT_one_mul_self` | n=2, `F̃_w=ℚ_3`; n=3, q=2 | `4²=16=12+4·1`; `7²=49=28+3·7`, with `28=q^{n−1}[n]_q=4·7=q²(q²+q+1)` (cyclic colength-2 lattices: `(q⁶−q³)/(q²−q)`) | Holds; first coefficient 1 (unique intermediate lattice), second `q+1` (lines of `k²`). |
| same, `hn` control | n=1 | `splitHeckeT 1 ϖ 2 = splitHeckeT 1 ϖ 1`; degrees: LHS `1·1=1`, RHS `1+(q+1)` | Fails without `2 ≤ n`; necessary. |
| same, wrong-model Check (line 414) | “all determinant-valuation-2 matrices” | `[ϖ²]+T^{(2)}` with coefficient q, not `q+1`: degrees `q²+q+1 + q·1` vs `(q+1)²`, equal | Check discriminates the two normalisations. |
| `splitHeckeT_mul_inverse` | j=0; j=n; j=n+1 (junk); ϖ=1 | `T^{(n)}·1=T^{(n)}`; `ϖI·(ϖI)⁻¹=I`, `T^{(0)}=1`; j=n+1: `ϖI·(ϖI)⁻¹=I`, `n−j=0`; ϖ=1: all cosets `[K]` | Holds in all cases, including any unit ϖ; Lean is more general than README (R04). |
| `glnIntegral_isHeckeTriple` | `g=diag(p,1)` in `GL₂(ℚ_p)`; control `L=ℂ_p` (not locally compact) | `[K:K∩gKg⁻¹]=p+1` finite; over `ℂ_p` the index is `#ℙ¹(𝔽̄_p)=∞` | Local-field hypothesis necessary and present. |
| Hecke polynomial (line 406) | n=2 | `P=X²−T^{(1)}X+qT^{(2)}`; Satake `T^{(1)}↦q^{1/2}(X₁+X₂)`, `T^{(2)}↦X₁X₂` gives `(X−q^{1/2}X₁)(X−q^{1/2}X₂)`; general coefficient `(−1)^j q^{j(j−1)/2}q^{j(n−j)/2}e_j=(−1)^jq^{j(n−1)/2}e_j` | Agrees with EG14 Def. 5.3.1 and SR.4.3. |
| Iwahori count (line 407) | n=2, j=1; general j | `[Iw:Iw∩ηIwη⁻¹]`: upper-right block O→ϖO gives `q^{j(n−j)}`; n=2: q, vs hyperspecial `q+1` | Agrees with SR.1.5 (`q^{ℓ(t_μ)}`, `ℓ=⟨2ρ,μ⟩=j(n−j)`). |
| Conjugate place (lines 403, 415) | rank one | `G̃(F̃⁺_v)={(x,c(x)⁻¹)}`; `ι_{w^c}=c∘(ᵗ·)⁻¹∘ι_w` gives second projection; `η_{w^c}=ι_w⁻¹(ϖ_w⁻¹)`; eigenvalue `λ↦λ⁻¹`; without transpose-inverse `T_{w^c}=T_w` | Agrees; Check discriminates. |
| Well-definedness of `T_w^{(j)}` | `u=(u^v,u_v)`, `ug_iU=g_{σ(i)}U` | `u_i=g_{σ(i)}⁻¹ug_i` has away-from-v part `u^v`; trivial action at v gives `(Tφ)(xu)=(Tφ)(x)|u` | Needs the stated trivial action of `G̃(F̃⁺_v)`; present. |
| Unitary level-form norms | change of representative `x_i↦x_iu`; trace to `U′` | `‖a|u‖≤C_U‖a‖` and `‖a‖≤C_U‖a|u‖`; trace term `φ(x_jv)|(u′u⁻¹)`, one element of U, bound `C_U` (not `C_U²`) | Bounds as stated hold. |
| Norm Checks (lines 386–390) | `A=ℚ_p`, u by p; values `p⁻¹,1` | `x_iu^{−m}`: coordinate `p^{−m}φ(x_i)`, norm × `p^m`, so `C_U=∞`; form norm `p>1`, not in `S(U,ℤ_p)` | Checks correct. |
| Level Check (line 389) | index 2, u by −1 on ℤ | `res∘tr=1+⟨u⟩` kills `⟨u⟩φ=−φ`; `tr∘res=2` | Correct. |
| Centre hypothesis (line 370) | `z∈O_{F̃}^×`, `zc(z)=1` | `|z|_v=1` at every complex place, so a root of unity by Kronecker; finite in compact open | Both AutomorphicFormsOnReductiveGroups §7.4 hypotheses hold. |
| R01 object comparison | n=2, p=5, small `U^p` | this README: `lim_s colim_{U_p}S_{ξ,τ}(U_pU^p,O/ϖ^s)`; OverconvergentAutomorphicForms: `lim_k colim_{U_wp}S(U_wpU^wp,ξ⊗τ,O/ϖ^k)`; same varying place, other-place types, covariance | Same object; R01. |
| R05 subspace count | `[3 choose 1]_2` | `(2³−1)/(2−1)=7` = lines of `𝔽₂³` | ArithmeticStatisticsPartIV §3.2's statement; cite it. |
| §0.2 central character | `ρ̄=χ₁⊕χ₂`, `χ₁χ₂⁻¹≠ε̄^{±1}`; `ρ̄=1⊕ε̄` | `π̄=Ind(χ₁⊗χ₂ε̄)⊕Ind(χ₂⊗χ₁ε̄)`, central `χ₁χ₂ε̄=det(ρ̄)ε̄`; `1⊕ε̄` is `χ⊗(1 ∗;0 ε̄)` with χ=1, ∗=0 | Agrees; exclusion meaningful. |
| §0.2 duality | `V=MF(·)(ε)` | `V̌(M)=(MF(M^∨)(ε))^∨(εψ)=MF(M^∨)^∨(ψ)` | Agrees with NAK p. 100. |
| §1.1 reduction | toy `H¹(K^p)_O=O` | `Ĥ¹=lim_s O/ϖ^s=O`, `Ĥ¹/ϖ=k=H¹_k` | (5.1.2) at s=1. |
| §2.3 goodness | p=5, `ρ̄|I_p=ω⊕1` split | W = `{(Sym⁴)^∨⊗det, (Sym²)^∨, det}`; r=4=p−1 with `det¹∈W` | `(Sym⁴)^∨⊗det` is not good if `det` occurs globally; r=2 good. |
| §2.4 Hecke module | same ρ̄, `V=(Sym²)^∨` | `Hom_{I_p}(ε̄⁰,ρ̄)`: the line 1, dimension 1; T by its geometric-Frobenius value | Agrees with EM11 Def. 3.5.4(2). |
| §3.1 determinant | level 11, ℓ=2, weight 2 | `det ρ(Frob₂)=χ(2)·2=2=ℓS_ℓ` with `S₂=1` | README's `ℓS_ℓ` right; EM11 p. 47 prints `S_ℓ` (Source issues). |
| §3.8 pro-modular set | `φ:R↠R/I` | `I=0`: all of Spec R; `I=R`: empty; `ℤ→ℚ`: kernel 0, `(2)` not hit | Image `=V(ker)` needs surjectivity; retained. |
| §4.4 case split | `ρ̄_p` irreducible vs `χ₁⊕χ₂` distinct | `dim End = 1` vs `2`; Rem. 6.1.11 identifies θ with `π^m` only in the first | README keeps θ in the second; EM11 Thm. 6.2.13 overstates. |
| §4.5 hypotheses | p odd, `V̄|G_{ℚ_p}=1⊕1` | (b) holds since `1⊕ε̄≠1⊕1`; p-distinguished fails | Only (1) applies; README matches. |
| §5.3 annihilator | `M=R/I`, `S={1}`; `M=0`, `S=∅` | `Ann=I`; `Ann=R` | Agrees with EP Lemma 6.2. |
| §5.5 dyadic fibre | `ℤ₂[[z]]/(z(z+2))` | rank 2 over `ℤ₂`; mod 2 `𝔽₂[[z]]/(z²)`, length 2; × `2⁻¹` = 1 | Normalisation correct. |
| §5.5a empty tensor | one place above 2 | `σ^𝔭,°=O`, so `P′=M̃_∞` | Correct. |
| §5.8 p = 3 exclusion | `ω` of order 2 | `ηω` and `ηω⁻¹` coincide; both orientations of (η ∗; 0 ηω) excluded | Matches PAN Thm. 8.0.1(3). |
| §6.3 exponent | (a,b)=(0,−3), u=6 | `det^{b+1}`: `u²u⁻⁴=1/36`; `(Sym²)^∨`: `1/36`; `det^b`: `u²u⁻⁶=1/1296` | `b+1` correct. |
| Worked examples | 11a1 at 5 and 2 | `#E(𝔽₅)=5`, `a₅=1`, roots of `X²−X+5` valuations 0,1; `X²+2X+2` at geometric Frobenius gives `X²+X+1/2` at arithmetic | Correct. |
| Headlines H1–H10 | Lean statability | completed cohomology of modular curves, p-adic `B(V)`, Galois deformation rings, patched modules and cuspidal representations of `GL₂(𝔸_F)` all absent at the pins | Not statable; docstring names each (lines 20–101). |

The headline theorems are:
- H1: Emerton's local–global compatibility, Theorem 1.2.1 (§4.5).
- H2: refined compatibility (§4.4).
- H3: mod-p compatibility (§4.6).
- H4: dual compatibility for completed homology (§4.7).
- H5: the definite quaternionic theorem (§4.9).
- H6: Pan's semisimple compatibility and classicality (§4.11).
- H7: Scholze's Shimura-curve comparison (§4.12).
- H8: patched-module support and Breuil–Mézard (§§5.3–5.6).
- H9: Pan's nice-prime and residually irreducible theorems (§§5.7–5.8).
- H10: §§6.1–6.4.

None is statable at the pins, and the module docstring names each with its missing carrier, as required.

The duplication and ownership audit covered §0.7's objects through the roadmap tools: SmoothRepresentationsOfLocalGroups, AutomorphicFormsOnReductiveGroups, QuaternionicModularForms, OverconvergentAutomorphicForms, PotentialModularityAndCompatibleSystems, CompletedCohomologyPartII and ArithmeticStatisticsPartIV, plus `roadmaps grep` over every open head for the Lean objects. No other `Suggested.lean` declares a `GL_n(𝒪)` Hecke pair. The overlap report lists no dropped id, revision-only id or conflicting head. The unchanged sections outside the sample keep the computed rows of the reports at `b6c9115` and `3bb343b`; their text is unchanged at this head.

## Not verifiable

- CHT §3.3 (integral model and split identifications), cited at line 370. No legal copy was found: the author URL at Stanford returns 404, the copy at IAS returns 403, and the Publ. IHÉS article is paywalled. EG14 §5.2, p. 22 (EG14 line 1097) cites CHT §3.3 for the same model, which supports the locator.
- Shimura, *Introduction to the arithmetic theory of automorphic functions*, Proposition 3.3. This is a book with no legal copy available here. Tau Ceti's `Degree.lean` docstring cites it for the same degree homomorphism.
- RIBET-90, Proposition 3.8: settled as uncertified.

## Source issues

- **Misprint** in EM11 at §5.2, paragraph after Remark 5.2.3, p. 47: the source says the deformation `ρ(K_{Σ₀})` has determinant `S_ℓ` at `Frob_ℓ`; it should be `ℓS_ℓ`, as in Definition 5.2.2, the next sentence and `s_ℓ=ℓ⁻¹det`; affects nothing.
- **Error** in EM11 at Theorem 6.2.13, p. 75: the source says Conjecture 6.1.6 holds for every p-distinguished ρ̄; it should say 6.1.9 when `ρ̄_p` is a sum of distinct characters, since Theorem 6.4.20 proves only that; affects a stated result.
- **Misprint** in EM11 at §7.4, pp. 97–98: the source says the algebraic factor and lattice carry `det^b`; it should be `det^{b+1}`, as in Theorem 3.3.22 which §7.4 completes; affects nothing.
- **Misprint** in DLB at Lemme 4.7, p. 22: the source says the last decomposition has factors `π_f^{K_p}`; it should be `π_f^{K^p}`, the tame level, since `K_p` varies there; affects nothing.
- **Misprint** in TUNG-2 at §6.1, p. 30: the source says `R̃_∞` is free over `R^inv_∞ ⊗ R^{loc,p}(σ^p)`; it should be `R^inv_∞ ⊗ R^{loc,p}(C^p)`, matching `R̃_∞`'s own base change; affects nothing.
