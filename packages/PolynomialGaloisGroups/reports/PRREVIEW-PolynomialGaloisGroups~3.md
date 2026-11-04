# Review of PolynomialGaloisGroups (pull request #763 at 8a1ed65)

**Verdict:** needs changes

The folder was rewritten since the previous review (6324 changed lines), so this is a full review: the previous findings are assessed one by one under "Verified sound", and every passage of the current README and Lean files was reviewed. The mathematics of the four layers checks out on every instance I computed (table below); the three blocking findings are about ownership and the files that carry the roadmap, not about the theorems.

## R01 (P2) — A Part III continuation carried in the completed roadmap's folder, with its generated files

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1` "Roadmap: Galois groups of polynomials, part III"; `Suggested.lean:27` `namespace TauCetiRoadmap.PolynomialGaloisGroupsPartIII`; `STATUS.md:12` "Every milestone of every listed layer is proved"; `STATUS.md:34` "Nothing within the stated scope remains"; `README.md:186` "### From TauCetiRoadmap.PolynomialGaloisGroups".

**Claim:** this folder is a new continuation of the completed roadmap, importing the base by section.

**Witness:** main has no `TauCetiRoadmap/PolynomialGaloisGroups`; the completed roadmap is `Completed/PolynomialGaloisGroups` and the merge order lists `PolynomialGaloisGroups` (line 199) as that completed roadmap. The sibling continuations have their own folders (`TauCetiRoadmap/PolynomialGaloisGroupsPartII` at its open head, `TauCetiRoadmap/MultiquadraticPartII` beside `Completed/Multiquadratic`). `STATUS.md` records `readme_sha` `05deec1f…`, which is neither this README's hash (`53dcaf5f…`) nor the completed README's (`efbe8b47…`): it is the base roadmap's generated status, copied, and it asserts that Layers 0–6 and 9 are proved for a README whose Layers 1–4 have no proof. The supplier heading at line 186 cites the roadmap's own name, and a second open pull request (#986) carries a folder of the same name with the old full programme. The previous review's R01 asked for exactly this: a continuation under its own Part name.

**Repair:** move the folder to `TauCetiRoadmap/PolynomialGaloisGroupsPartIII/` (the namespace already says Part III; the module becomes `TauCetiRoadmap.PolynomialGaloisGroupsPartIII.Suggested`), delete `STATUS.md` and `PROGRESS.md` (they are generated for the completed roadmap, and a fresh one is generated after merge), keep `metadata.toml`, and leave line 186 citing `TauCetiRoadmap.PolynomialGaloisGroups`, which then unambiguously names the completed base. Test: the dependency check under the new name reports only `NOT IN ORDER: PolynomialGaloisGroupsPartIII (insert it after its last supplier)` and no cycle (I ran it: 178 roadmaps, 1179 edges, that one line), and the name `PolynomialGaloisGroups` again denotes one roadmap.

## R02 (P2) — The companion Lean files duplicate pinned declarations and base-roadmap proofs

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/Compatibility.lean:1`–46 (five `abbrev` aliases of native objects, five `rfl` theorems, one re-export); `PrescribedGenerators.lean:12`–14 "Proof bodies adapted without mathematical change from TauCeti `Generators.lean` at `65066c0…`"; `README.md:36` "Nothing of the base roadmap is planned again here: its results are consumed by section and by native declaration".

**Claim:** the folder contains only the continuation's own mathematics, consumed from the pins and the base roadmap by native name.

**Witness:** `Compatibility.lean:17` declares `abbrev numTransitiveGroups : ℕ → ℕ := TauCeti.numTransitiveGroups`, a second name for a pinned declaration; it has no `import Mathlib` line, its namespace is `TauCetiRoadmap.PolynomialGaloisGroups`, not the Part III namespace, and none of its eleven names appears in the README. `PrescribedGenerators.lean` proves six equalities about `TauCeti.referenceSubgroup 3 ⟨1,_⟩` … `referenceSubgroup 5 ⟨4,_⟩`, rows of the base roadmap's Layer 6, copied from a Tau Ceti commit later than the pin: that is library work pulled into a roadmap and a second owner for base-roadmap objects. The README's supplier contracts (lines 150–159) already cite the native names directly, and BelyiMaps' supplier table at its open head (`README.md:546`–547) consumes `TauCeti.numTransitiveGroups`, `TauCeti.referenceSubgroup`, `TauCeti.TransitiveGroupLabel` and `Equiv.Perm.fullCycleType`, not these aliases. The previous review's R07 asked for both files to be deleted; both are unchanged.

**Repair:** delete `Compatibility.lean` and `PrescribedGenerators.lean`. The generator equalities stay where they are owned (the base roadmap's Layer 6 and Tau Ceti's `Generators.lean`); the README's 1.3 Checks already state the degree-six generators. Test: `Suggested.lean` imports neither file, so the targeted build is unchanged; the six closures still have orders `6, 4, 12, 24, 60, 120` in the library.

## R03 (P2) — Gassmann's theorem has a second open owner, and the scope does not resolve the direction

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:51`–53 "Gassmann's theorem …, the conjugacy criterion for isomorphic fixed fields, and the existence of nonisomorphic arithmetically equivalent number fields"; `README.md:73`–74 "The converse of Gassmann's theorem …, which needs Chebotarev density" (no owner named).

**Claim:** this roadmap is the sole owner of the sufficient direction of Perlis' theorem and of its consequences.

**Witness:** the open roadmap `FiniteGroupInvariants` (its head is in this brief) states at `README.md:857`–867 the biconditional "`NumberField.dedekindZeta F = NumberField.dedekindZeta F'` iff `AlmostConjugate H K`" as its 7.4, named `dedekindZeta_eq_iff_almostConjugate`, with the sufficient direction proved through Artin `L`-functions, and at `README.md:883`–886 (7.6) the count of fields arithmetically equivalent to a given one "by 7.4 and the Galois correspondence (conjugate subgroups ↔ isomorphic fields)"; its `Suggested.lean:611`–615 declares that biconditional with `sorry`. Both pull requests therefore build the implication of 4.1, and FiniteGroupInvariants uses the criterion of 4.2 as if supplied. FiniteGroupInvariants already consumes this roadmap's reference rows (`README.md:838`–840 "the reference groups of Polynomial Galois Groups Layers 6 and 1C–1D"), so the only consistent direction of supply is this roadmap below FiniteGroupInvariants; neither README says so. `Gassmann.AlmostConjugate` is absent from the pinned Tau Ceti (checked by grep), so the object is a roadmap target on both sides.

**Repair:** in "Scope and ownership", state the division of Layer 4 against FiniteGroupInvariants Layer 7: this roadmap owns the sufficient direction at the level of `TauCeti.dedekindZetaCoeff` (4.1), the conjugacy criterion (4.2) and the explicit pair (4.3); the converse and the count of arithmetically equivalent fields are FiniteGroupInvariants 7.4 and 7.6, which consume 4.1 and 4.2 (name that roadmap under "Outside this roadmap" in place of the unowned sentence at line 73). Test: after the edit every object of Layer 4 has one named owner, FiniteGroupInvariants is cited only as a consumer (no `*Needs:*` line names it), and the dependency check still reports no cycle.

## Verified sound

**Scope of this check.** Head `8a1ed65`, clean worktree; `git diff --stat origin/main...HEAD` outside the folder is empty. The root `README.md` and `CONTRIBUTING.md` were read, with `Completed/PolynomialGaloisGroups/README.md`, `Completed/NumberFieldArithmetic/README.md` and `TauCetiRoadmap/RepresentationTheory/InductionRestriction/{README.md,Suggested.lean}` on main. No file of the pull request was changed.

**Previous review, finding by finding.** No repair report marked any finding "not actionable".

| Previous finding | Current passage and assessment |
|---|---|
| R01, re-plans the completed roadmap | README:3–37 now a continuation that names the base boundary and imports Layers 1, 4, 6, 9 by native declaration: **repaired in content**; the folder name, namespace and generated files are not, now R01. |
| R02, endpoint minimal polynomial | the cross-base dictionary is gone (README has no such target): **repaired by removal**. |
| R03, Vieta index bound | the Vieta target is gone: **repaired by removal**. |
| R04, Dummit's criterion weakened | README:503–528 proves separation from Chapman's note and states Dummit's criterion without a separation hypothesis; `Suggested.lean:77`: **repaired**. |
| R05, computational algorithm | README:68–70 "Programs, searches, stored certificates … are not a target"; 1.2 is a descent criterion with "How a finite statement is proved is not prescribed": **repaired**. |
| R06, headlines absent | `Suggested.lean` states the class count, the two radical headlines, Dummit's radical form, Gassmann's theorem and the nonisomorphic pair; the docstring names the two unstatable headlines and the missing carrier: **repaired**. |
| R07, companion files | `Compatibility.lean` and `PrescribedGenerators.lean` unchanged: **not repaired**, now R02. |
| R08, padding | 387 examples, instances and the full-cycle identities are gone; six sorried theorems remain, none closing in one tactic (below): **repaired**. |
| R09, roadmap shape | Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, four layers each ending in Examples and Dependencies, Downstream consumers, References: **repaired**. |
| R10, invariant columns | README:316–321 restricts the three column theorems to `n ≤ 5` and gives both failing instances; the degree-six table at 342–359 gives every value: **repaired** (all 64 values recomputed, below). |
| R11, locators | References now give theorem, page and line locators; Butler–McKay and Perlis are marked uncertified; no `sources.toml` exists in any roadmap on main, so its absence is not a defect here: **repaired**. |

**Gate, build, dependency check.** The worker's gate: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. The dependency check under the folder name returned exactly:

```text
depcheck: 177 roadmaps, 1177 edges, 0 problem(s)
```

and under the name `PolynomialGaloisGroupsPartIII` only `NOT IN ORDER` (placement after the last supplier, not a defect) with no UPWARD or CYCLE line. `Compatibility.lean` elaborates on its own.

**Elaborated signatures and padding probe.** A scratch file printed `#check @name` for all seven declarations of `Suggested.lean`; each elaborated type equals its README statement, with every binder present (`CharZero`, `FiniteDimensional`, `IsGalois`, `NumberField`, the embedding `ι`, `Monic`, `Irreducible`, `natDegree = 5`). The same file tried each sorried theorem with `simp`, `rfl` and `infer_instance` on a copy: all eighteen probes fail (`simp` makes no progress, `rfl` not definitional, no instance), so nothing in the file is padding. Two degenerate probes elaborate: `TransitiveSubgroupClass 0` is inhabited by the class of `⊥`, and for `q = 0` both sides of the polynomial headline hold.

**Headlines.** The README's end theorems are the class count through degree eleven and the labelled classification (1.1, 1.3), the unique polynomial label (2.1), the radical criterion in its field and polynomial forms (3.1, 3.2), Dummit's criterion in radical form (3.3), Gassmann's theorem (4.1) and the nonisomorphic pair (4.3). Six are stated; the labelled classification, the `6T6` comparison and the polynomial label are correctly declared unstatable: `TauCeti.numTransitiveGroups` at `TransitiveGroupLabel/Basic.lean:62`–67 is `0` for every `n ≥ 6`, so `TransitiveGroupIndex n = Fin 0` there (`Basic.lean:94`, `:99`).

**Adversarial calculations (52 rows).** Permutations are zero-based; values were computed by exact closure of the TransGrp generators (`transgrp` lines 43–61 for degree 6, 63–69 for degree 7; `transgrp-11` lines 19–28), by exact integer polynomial arithmetic in `ℤ[x₁,…,x₅]`, or by the calculation shown.

| Statement | Instances tried | Values on the two sides | Result |
|---|---|---|---|
| 1.1 `TransitiveSubgroupClass n` count | `n = 1,…,11` | computed classes `1,1,2,5,5,16,7,50,34,45,8` (degrees 6, 7, 11 from the rows below; 8–10 are the row counts of the data files); `card_transitiveSubgroupClass` list identical | Equal. |
| 1.1 degenerate `n = 0` | `Perm (Fin 0)` | one subgroup, vacuously transitive; one class; native count `0` | README states the count from `n = 1`; correct. |
| 1.1 Check `n = 4` | all 30 subgroups of `S₄` | transitive subgroups `9` with orders `4,4,4,4,8,8,8,12,24`; classes `5` | Equal; the wrong definition gives 9. |
| 1.1 Check `n = 2` | `⊥`, `⊤` | `⊥` not transitive; classes `1`; without transitivity `2` | Equal. |
| 1.1 Check `6T7`/`6T8` | both rows | both order 24, element orders `1:1,2:9,3:8,4:6`; parity `+`/`−` | Isomorphic, not conjugate; count twice. |
| 1.2 descent, degree 3 | `𝓡 = {S₃, A₃}` | maximal subgroups of `S₃`: orders `3,2,2,2`, transitive `T,F,F,F`; of `A₃`: trivial | Hypothesis holds; `6 → 3`. |
| 1.2 descent, degree 4 | `𝓡 = {S₄,A₄,D₄,C₄}` | maximal subgroups of `A₄`: four of order 3 (intransitive), one of order 4 (transitive, the Klein group); of `D₄`: orders `4,4,4`, transitive `F,T,T` | Fails at `A₄` and `D₄` exactly as the Check says. |
| 1.2 separating invariants | `6T1` vs `6T2` | cycle types `{1⁶, 2³, 3², 6}` vs `{1⁶, 2³, 3²}` | `6T1` has a 6-cycle; separated. |
| 1.2 separating invariants | `6T3`/`6T4`, `6T9`/`6T10` | parity `−/+`, `−/+` | Separated. |
| 1.2 order-24 rows | `6T6`, `6T7`, `6T8` | `6T6` orders `1:1,2:7,3:8,6:8` (no 4); `6T8` has order-4 elements; `6T7` even | Separated. |
| 1.3 degree-six table | all 16 rows | orders `6,6,12,12,18,24,24,24,36,36,48,60,72,120,360,720`; parity `−−−+−−+−−+−+−−+−`; primitive only `12,14,15,16`; solvable all but `12,14,15,16` | All 64 entries equal the table. |
| 1.3 degree-six counts | the table | primitive `4`, even `5`, solvable `12` | Equal; CHM Table 2 primitive count 4. |
| 1.3 degree-seven rows | 7 rows | orders `7,14,21,42,168,2520,5040`; parity `+−+−++−`; all primitive; solvable first four | Equal to the Check. |
| 1.3 degree-eleven rows | 8 rows | orders `11,22,55,110,660,7920` (A₁₁, S₁₁ by definition); parity `+−+−++` and `+`, `−`; all primitive; solvable first four | Equal; `transgrp-11` lines 30–37 record the same signs. |
| 1.3 primitive counts | degrees 7–11 | CHM Table 2 line 284: `7,7,11,9,8`; unrestricted degree-five formula would give `16,7,50,34,45,8` | Check correct. |
| 1.3 columns unrestricted | `6T6`, `6T16` | primitivity formula `6 ≠ 4 ∨ 3 ≤ 5 = T`, actual `F`; solvability formula `6 ≠ 5 ∨ 15 < 3 = T`, actual `F` | Restriction to `n ≤ 5` is necessary. |
| 1.3 `6T6` comparison | `r = (0 2 4)(1 3 5)`, `t = (2 5)` | closure order 24; equals the closure of the TransGrp row `(3,6),(1,3,5)(2,4,6)` shifted; blocks `{0,3},{1,4},{2,5}` preserved; image on blocks order 3 | Equal. |
| 1.3 `6T6` structure | conjugates of `t` | `r t r⁻¹ = (1 4)`, `r² t r⁻² = (0 3)`; they generate an abelian group of order 8 of exponent 2; `(0 3)(1 4)(2 5)` central; even part order 12 with element orders `{1,2,3}` | `A₄ × C₂`. |
| Conventions, composition | `(0 1) * (1 2)` on `Fin 3` | `((0 1)(1 2)) 0 = 1`, `((1 2)(0 1)) 0 = 2` | Right-to-left; Check correct. |
| Conventions, conjugation direction | `(2 5)` by `r`, by `r²` | `(4 1)`, `(0 3)` | `r⁻¹ = r²` exchanges them; direction pinned. |
| Conventions, zeta coefficient | `ℚ` at `0`, `n ≥ 1`; `ℚ(i)` at 5 | `1`, `1`; `2` from `(2+i),(2−i)` | `Trivial.lean:59` gives the value 1 at 0. |
| 2.1 Check `X⁶ − 2` | discriminant, degree, label | `(−1)^{15}·6⁶·(−2)⁵ = 1492992 = 2¹¹·3⁶`, not a square; `[ℚ(2^{1/6},ζ₆):ℚ] = 12`; `6T3` is the only odd row of order 12 | Label `6T3`. |
| 2.1 Check `Φ₇` | regular `C₆` | `6T1` is the only cyclic row | Correct. |
| 2.1 negative controls | `(X²−2)(X⁴+1)`, `(X²−2)³` | intransitive / inseparable | No label; `HasGaloisLabel` requires separability (`Label.lean:111`). |
| 3.1 field headline | `E = F` | trivial group solvable; `ι x ∈ F ⊆` radical closure | Both sides true. |
| 3.1 field headline | splitting field of `X⁵ − 2` | `F₂₀` solvable; `ℚ(2^{1/5}, ζ₅)` radical | Both true. |
| 3.1 field headline | splitting field of `X⁵ − 4X + 2` | `f(−2),f(0),f(1),f(2) = −22, 2, −1, 26`: three real roots, two nonreal; `S₅`; no radical root | Both false. |
| 3.1 closure in `E` versus in `Ω` | cyclic cubic of `X³ − 3X + 1` | discriminant `81 = 9²`, `C₃`; an `x ∈ E∖ℚ` with `xⁿ ∈ ℚ` would have conjugates `ζx` real, so `ζ = ±1`, but `x` has three conjugates; `solvableByRad ℚ E = ℚ` | Statement false with `E` as ambient; the Check is right. |
| 3.1 route, prime index | `S₃`; trivial group | `A₃` normal of index 2; `exists_normal_index_prime` needs `Nontrivial` (`Solvable.lean:78`) | Induction stops at the trivial group. |
| 3.1 route, roots of unity | `N = 20` for `X⁵ − 2` | `ζ₂₀^{20/5} = ζ₅`; `HasEnoughRootsOfUnity (AlgebraicClosure F) n` needs `NeZero (n : F)` (`AlgebraicallyClosed.lean:46`), true in characteristic zero | Route sound. |
| 3.2 polynomial headline | `q = 0`, constant `q` | `q.Gal` trivial; `rootSet` empty | Both true (probe elaborated). |
| 3.2 polynomial headline | `(X² − 2)²` | `C₂`; roots `±√2` radical | Both true. |
| 3.2 some-root negative control | `(X⁵ − 4X + 2)(X − 1)` | root `1` radical; group contains `S₅` | Some-root form fails for reducible `q`; the headline quantifies over all roots. |
| 3.2 prime degree | `X³ − 2`, `X⁵ − 4X + 2` | `p = 3`: two nonreal roots, `S₃` solvable; `p = 5`: `S₅` | `p ≥ 5` necessary. |
| 3.3 Dummit invariant | `θ₁` as at `dummit-quintics` lines 45–50 | stabilizer in `S₅` has order 20 and equals `⟨(1 2 3 4 5),(2 3 5 4)⟩`; `θ₁,…,θ₆` pairwise distinct polynomials | Equal. |
| 3.3 Chapman identities | both in `ℤ[x₁,…,x₅]` | `θ₂ − θ₃` and `θ₄ − θ₅` equal the stated products exactly | Identities hold. |
| 3.3 five-cycle on the `θ` | `c = (1 2 3 4 5)` by `xᵢ ↦ x_{c(i)}` | `θ₁ ↦ θ₁`, `θ₂ ↦ θ₆ ↦ θ₃ ↦ θ₄ ↦ θ₅ ↦ θ₂` | Agrees with the README and Dummit line 115. |
| 3.3 Chapman in characteristic 2 | the two bracket equations | `(x₂−x₃)²(x₂−x₅) = (x₂−x₁)²(x₂−x₅)`, so `(x₂−x₃)² = (x₂−x₁)²`, so `x₁ = x₃` | Contradiction without dividing by 2; Check correct. |
| 3.3 characteristic 5 | `5x₂ = Σxᵢ` | gives `Σxᵢ = 0`, no contradiction | Hypothesis `5 ≠ 0` necessary and present. |
| 3.3 `X⁵ − 2` | sextic from the six `θ` values | `X⁶ − 50000X`; roots distinct (`0, 8.7055, …`) | Equal to (2′). |
| 3.3 `X⁵ − 5X − 12` | sextic | `[1,−40,1000,−20000,250000,−66400000,976000000]`; value at 40 is `0` | Rational root 40. |
| 3.3 `X⁵ − X − 1` | sextic | constant `9375 + 256 = 9631`, prime; values at `±1` are `6267`, `13877` | No rational root; `S₅`. |
| 3.3 `X⁵ − X` | sextic | `(X−2)⁴(X²+16) = [1,−8,40,−160,400,−512,256]`; `θ` values `2,2,2,2,4i,−4i` | Reducible input breaks separation; native collision example. |
| 3.3 radical form | hypotheses of `Quintic/Solvable.lean:104` | monic, separable (from `CharZero` and irreducible), irreducible, degree 5, separable sextic (3.3) | All discharged. |
| 4.1 headline | `H = K`; `E = ℚ` | both sides equal trivially | True. |
| 4.1 hypothesis content | `H = ⊥`, `K = ⊤`, `E ≠ ℚ` | class of 1: `1 = 1`; a nontrivial class `C`: `0 ≠ |C|` | Not almost conjugate; hypothesis is not vacuous. |
| 4.1 Check, equal order | `ℚ(√2),ℚ(√3),ℚ(√6)` at 3 and 5 | `3`: inert, ramified, ramified: `0,1,1`; `5`: `2,3` nonresidues, `6 ≡ 1`: `0,0,2` | Equal order does not suffice. |
| 4.1 route, local counts | `p^k` | ideals of norm `p^k` are `∏ 𝔮^{k_𝔮}` with `Σ f k_𝔮 = k` | Determined by residue degrees. |
| 4.1 route, residue degrees | a `D`-orbit `O` of size `ef` | `I`-orbits in `O` all of size `e`, `f` of them, permuted cyclically by Frobenius | Full cycle type of Frobenius on `I`-orbits. |
| 4.1 route, product determines multiset | `∏(1 − Z^d)` | lowest-order term `1 − m Z^{d₀}` with `d₀` the least part, multiplicity `m` | Strip and induct. |
| 4.2 criterion | `X³ − 2`, two order-2 subgroups | conjugate; `ℚ(∛2) ≅ ℚ(ζ₃∛2)` | Both directions. |
| 4.2 Check 3 | `X⁴ + X + 1`, two Klein groups | discriminant 229 prime, group `S₄`; normal Klein fixes a Galois sextic, non-normal a non-Galois one | Isomorphic subgroups, nonisomorphic fields. |
| 4.3 pair | `C₄ × C₄`, `Q₈ × C₂` regular on 16 points | element orders `1:1, 2:3, 4:12` both; full types `1¹⁶, 2⁸, 4⁴`; abelian versus not | Almost conjugate, not conjugate; degrees `15! = 1307674368000`. |

**Source sample (ten targets).** Milne Theorem 5.34 is at `milne-ft` line 3409, page 77 (characteristic zero, polynomial form): 3.1 and 3.2 derive the field form. Dummit: the invariant and its six conjugates at `dummit-quintics` lines 45–73, page 388; (2′) at lines 97–99 and Theorem 1 at lines 100–103, page 389, stated over `ℚ`; the proof (lines 104–116) has no distinctness argument, which Chapman supplies at `chapman-quintics` lines 16–30. Sutherland: Gassmann's example and the isomorphism-iff-conjugacy statement at `sutherland-arith-equiv` lines 22–31 (page 1, continuing at line 37); Proposition 2.6 (ii) at lines 195–197, page 5, with "rationally equivalent (or Gassmann equivalent)" at line 213; Theorem 2.10 at lines 252–256, page 7, citing [35, Theorem 1], and [35] is Perlis (line 283). Conway–Hulpke–McKay (Cambridge open-access copy): Table 2 at lines 282–285, page 7, transitive counts `1 2 5 5 16 7 50 34 45 8` and primitive counts `1 2 2 5 4 7 7 11 9 8` for degrees 2–11. TransGrp commit `165fc21`: `6T6` is `(3,6),(1,3,5)(2,4,6)` at `transgrp` line 48; `lmfdb-6T6` lines 200, 236, 289, 303, 327 give order 24, solvable, parity −1, imprimitive, the same generators. Every seeded section's statement is supported as written, with the hypotheses recorded above.

**Pinned declarations opened (file and line).** Mathlib `6b7abb3`: `FieldTheory/AbelRuffini.lean:194` (`solvableByRad` as an intermediate field), `:201`, `:301`, `:313`; `FieldTheory/KummerExtension.lean:563` (`isCyclic_tfae`, needs a primitive `finrank`-th root in the base); `RingTheory/RootsOfUnity/EnoughRootsOfUnity.lean:33`, `AlgebraicallyClosed.lean:46`; `FieldTheory/Galois/Basic.lean:281`, `:449`, `:462` (`IsGalois.map_fixingSubgroup`: fixing subgroup of `E.map σ` is `MulAut.conj σ • E.fixingSubgroup`), `:575`, `:641`, `:698`; `FieldTheory/Normal/Basic.lean:63`, `:190`; `FieldTheory/PrimitiveElement.lean:209`; `FieldTheory/Separable.lean:663`; `Analysis/Complex/Polynomial/Basic.lean:128`; `GroupTheory/Solvable.lean:297`; `GroupTheory/Perm/Cycle/Type.lean:491`; `Order/Atoms/Finite.lean:80`; `RingTheory/Ideal/Norm/AbsNorm.lean:258`; `NumberTheory/NumberField/DedekindZeta.lean:49`. Tau Ceti `a91d3aa`: `GroupTheory/Perm/TransitiveGroupLabel/Basic.lean:62`, `:94`, `:99`, `:138`, `:150`; `Primitive.lean:114`; `Solvable.lean:142`; `Parity.lean:37`; `Classification.lean:176`, `:468`, `:805`; `FieldTheory/GaloisGroups/Label.lean:111`, `:121`; `GroupTheory/Perm/Imprimitivity.lean:186`; `Resolvent/Spec.lean:151`; `Resolvent/Quintic/Basic.lean:70`, `:202`; `Resolvent/Quintic/Solvable.lean:104` (separable-sextic hypothesis `hres`); `Resolvent/Quintic/Collision.lean:197`; `GroupTheory/Solvable.lean:78`; `NumberTheory/ArithmeticDirichletSeries/Trivial.lean:54`, `:59`, `:63`; `RamificationInertia/DoubleCoset/Basic.lean:152`; `DecompositionOrbits.lean:164` (needs `p.IsMaximal`); `NumberField/SplittingField.lean:35`; `GaloisGroups/Symmetric/Basic.lean:35`; `Symmetric/Realization.lean:44`. Every name the README cites exists at the pin with the stated hypotheses; the three line numbers the README quotes (114, 142, 37) are exact.

**Cross-roadmap citations resolved.** Induction–Restriction Layer 2.1 and 2.2 are `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:346` and `:433` on main; `Gassmann.AlmostConjugate` (`Suggested.lean:639`, identical to the inline hypothesis of `dedekindZetaCoeff_fixedField_eq_of_almostConjugate`), `almostConjugate_iff_permutation_equiv` (`:728`, any `CharZero` field), `restrictEquiv` (`:749`), `normalInvariantEquiv` (`:755`), `not_conj_comap` (`:775`), `almostConjugate_comap` (`:811`), `exists_S16_gassmann_pair` (`:825`, sorried) are declared there; `invariantOrbitSumBasis`, `orbitSumEquivariant` and `charpoly_reverse_eq_prod_fullCycleType` are 2.1's named targets at `README.md:415`–417 with the `∏ (1 − Z^d)` identity over the full cycle type. Number Field Arithmetic 1.4 is `Completed/NumberFieldArithmetic/README.md:548` with the `e·f = |HσD|/|H|` formula. The base roadmap's Layers 1, 4, 6, 9 are `Completed/PolynomialGaloisGroups/README.md:532`, `:777`, `:1172`, `:1385`, and its scope line 57 excludes degrees 6 to 11; line 1037 records that the radical direction "is absent from Mathlib and is not a milestone here". Part II at its open head owns ramified merging and partition laws and neither mentions radicals, Gassmann nor degrees 6–11. BelyiMaps at its open head consumes the reference family and the `6T6` comparison (`README.md:976`–985); its citations still name "Layers 1C–1D" and a data file this head no longer has, which is Belyi's drift to repair, not this roadmap's. Ownership against the open pull requests with files in this brief was checked by the roadmap service's grep over Gassmann, arithmetic equivalence, `solvableByRad`, the degree-eleven classification and `dedekindZetaCoeff`: FiniteGroupInvariants is the one overlap (R03); the open pull request #986 carries a same-named folder (R01).

## Not verifiable

- Butler–McKay, *The transitive groups of degree up to eleven*: the DOI landing page returned HTTP 403 and no legal copy was found; recorded in the missing-references file. The README cites it uncertified and takes the counts from Conway–Hulpke–McKay, which was read.
- Perlis 1977, Theorem 1: the DOI is on a paywalled publisher; the sources service recorded it uncertified. The sufficient direction was checked through Sutherland's Theorem 2.10 and by the elementary route in 4.1, not against Perlis' text.
- Dixon–Mortimer Theorem 2.6A is consumed through the base roadmap and was not reopened.
- The Conway–Hulpke–McKay copy on the author's page has a glyph-name text layer; the locators were verified on the Cambridge open-access PDF instead, whose line numbers (282–285) happen to agree with the README's.

## Source issues

- **Gap** in dummit-quintics at Theorem 1 proof, printed p. 389: the proof concludes that the remaining five roots of the sextic form an irreducible quintic without showing they are distinct; it should prove the sextic has no repeated root, as Chapman's note does; affects the proof.
