# Review of FreeGroupsAndLimitGroups (pull request #2221 at 4189a6a)

**Verdict:** needs changes

## R01 (P2) — Fourteen definitions in `Suggested.lean` have `sorry` in their bodies

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean:159` "def ofSimpleGraph … rev_rev := by sorry"; likewise lines 180, 445, 452, 458, 465, 516, 801, 807, 932, 957, 974, 985 and 997.

**Claim:** A definition whose body contains `sorry` is forbidden. This head carries main's API-catalogue `Suggested.lean`, which this pull request leaves untouched, so the gate fails at this head.

**Witness:** The worker's gate at `4189a6a` reports `sorry-data=14 … FAIL`. #2205's head `11a9d0f` has a 288-line `Suggested.lean` in which all 12 `sorry`s are in theorems.

**Repair:** Rebase this branch onto #2205's head `11a9d0f` (or onto main once #2205 has merged), taking that `Suggested.lean` unchanged and resolving the README as in R02. Then rerun the gate.

## R02 (P2) — The branch lacks #2205's repairs, including two blocking ones, and conflicts with its head

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1815` "For finite A and `X`, state the recursive decidability of the set of finite equation–inequation systems"; README:1868–1870 (§7.10 sketch) and :1880 (§7.11), which #2205's head also rewrites.

**Claim:** The previous review's R01 is unrepaired here: §7.7 holds only at a fixed rank, so §7.11's "recursive set" has no supplier. So is its R02: the Grushko headline can be stated but is absent. Its R03–R06 and the stale pins at README:56 and :127 also remain. #2205's head repairs all of them, and the two heads no longer merge cleanly.

**Witness:** `git merge-file` on this README, merge base `496de49` and #2205's head `11a9d0f` gives two conflicts, in the §7.10 sketch and in §7.11. #2205's README:1817 states §7.7 for pairs `(n, s)`, and its `Suggested.lean:80` states the Grushko headline.

**Repair:** Rebase onto `11a9d0f`. In §7.10 keep this head's three sentences, but write "`n_i` larger than the maximum item count in the cancellation family of `S` times `|S|`". In §7.11 keep this head's paragraph, but replace "Together with §7.7 this states the positive theory as a recursive set." with "Together with §7.7, applied over `F(A∪X)` of rank `|A|+k` with the constraints `y_i∈F(A∪{x₁,…,x_i})`, this states the positive theory as a recursive set; the rank grows with the sentence, so §7.7 is needed uniformly in the rank." I applied this resolution to a scratch copy: no conflict remains, and this pull request's §§7.2–7.3 text survives unchanged.

## R03 (P3) — Six theorems conclude `Nonempty (… ≃* …)` (gate `statement-hygiene`)

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean:213` `graphPresentation_free`; also lines 227, 837, 841, 942 and 948.

**Claim:** An isomorphism conclusion stated as `Nonempty` must state the canonical map, or be a corollary named `nonempty_*`.

**Witness:** The worker's gate reports `statement-hygiene=6`, each hit P3, at these six lines.

**Repair:** As in R01. #2205's `Suggested.lean` contains none of these six declarations, and the README keeps their statements.

## R04 (P3) — The README names a pull request (gate `prnum`)

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:26` "[Mathlib PR #42677](https://github.com/leanprover-community/mathlib4/pull/42677), commit `b38ce379…`, proposes `FreeGroup/Center.lean`"

**Claim:** The README must not cite pull-request numbers.

**Witness:** The gate reports `prnum=1` at line 26. #2205's line 26 instead reads "A proposed Mathlib change, commit `b38ce379d898d1284bae5582be27de1d2af39f67` (not in Mathlib at the pin), adds".

**Repair:** Take #2205's line 26 with the rebase of R01. Failing that, replace the link and "proposes" with "A proposed Mathlib change, commit `b38ce379d898d1284bae5582be27de1d2af39f67` (not in Mathlib at the pin), adds".

## R05 (P3) — §§7.1 and 7.3 still say what the new §7.2 refutes or leaves undefined

**Location:** README:1731 "items are nonempty, which is how inequations `w ≠ 1` are encoded (§7.2)"; README:1761 "with `W = P(U)`" and "the `F`-homomorphism `π_Ω : F_{R(S)} → F_{R(Ω)}` of the word maps".

**Claim:** §7.2 now shows that nonempty items do not encode `t ≠ 1`. It also gives no word map to a variable that does not occur in `(S,T)`, so §7.3's `π_Ω` and `P(U)` have no value on such a variable. "Takes arbitrary values" also ignores a constraint on that variable.

**Witness:** Take `X={x}` and `S=T=∅`. The family has one member, with `ρ=0` and `F_{R(Ω)}=F`, while `F_{R(S)}=F∗⟨x⟩`. Nothing sends `x` anywhere. §7.2's own table `(z₁,z₂,z₂⁻¹z₁⁻¹)` refutes the §7.1 Check.

**Repair:**
- At 1731, write "Assigning the empty word to an item is not a solution: items are nonempty. Nonempty items alone do not encode `w ≠ 1`; §7.2 encodes it through a fresh variable whose words are sides of basic equations."
- At 1761, write "with `W(x) = P_x(U)` for every variable `x` occurring in `(S,T)`".
- Also at 1761, write "the `F`-homomorphism `π_Ω` from `F_{R(S)}` to the coordinate group of `Ω*` in the items and the variables `X₀` not occurring in `(S,T)`, given by the word maps and the identity on `X₀`". This is well defined: for every solution `(h, x₀)`, `(P(h), x₀)` solves `S` by IFT Lemma 14(4).
- At 1745, write "takes arbitrary values (in the subgroup on its sub-basis when it is constrained)".

#2205 keeps the first two sentences unchanged, so this repair applies after the rebase too.

## R06 (P3) — §10.9's Sources line and the KM06 reference contradict the new attribution, and one JSJ page is wrong

**Location:** README:2544 "§12, Theorems 12.6–12.7, p. 94" and "[KM06] Theorem 32 (the cited prerequisite)"; README:2803 "The constrained-factorization source contract is stated in §10.9."

**Claim:** The new §10.9 text says that KM06 Theorem 32 states only decidability, without proof, and that no listed source proves the constrained theorem. The Sources line and the KM06 reference still present KM06 as its source contract. Theorems 12.6–12.7 are in §12, on pp. 197–198. Page 94 only restates them in the introduction.

**Witness:** JSJ line 5182 (Theorem 12.6, printed p. 197) and line 5209 (Theorem 12.7, printed p. 198). Line 351, on p. 94, is in the introduction.

**Repair:** At 2544, write "§12, Theorems 12.6–12.7, pp. 197–198 (restated in the introduction, p. 94)" and "[KM06] Theorem 32, p. 513 (decidability, stated without proof)". At 2803, replace the last sentence with "Cited in §10.9 for the statement of decidability of solvability over a limit group (Theorem 32, p. 513)."

## R07 (P3) — §2.4 states §2.5's theorem but needs only §2.3

**Location:** README:469 "prove existence of a finite folded quotient with a surjective based label-preserving quotient morphism, preserving connectedness and the accepted subgroup"; README:482 "*Needs:* §2.3".

**Claim:** That folding preserves the accepted subgroup is §2.5(1) (KM02 Lemma 3.4), and §2.5 needs §2.4, so the two targets depend on each other. §2.4's sources (KM02 Definition 2.4 and Lemma 2.5) do not contain this part.

**Witness:** KM02 line 173 (Lemma 2.5, p. 4) gives connectedness, image paths and the edge count only. The subgroup statement is Lemma 3.4, at line 276 (p. 7).

**Repair:** At 469, end the sentence at "…quotient morphism, preserving connectedness." At 471, write "(a finite folded quotient with its quotient morphism)". In §2.5(1), after "accepts the same subgroup at the image of `v`", add "; in particular the folded quotient of §2.4 accepts `Γ v`".

## R08 (P3) — Three sampled locators name the wrong section or page

**Location:** README:1348 "§4, Lemma 15 and Theorem 5, p. 40"; :1122 "[ALG] §1 (introduction) and §2, pp. 2–5"; :1519 "[GL-JSJ] §5.1, p. 42: Compact surfaces with nonempty boundary have free fundamental group".

**Claim:**
- ALG §4 begins on p. 41; Lemma 15 and Theorem 5 close §3.6.
- ALG §2 begins on p. 14, so pp. 2–5 are §1 only.
- GL-JSJ p. 42 does not state that surface groups with boundary are free. Proposition 5.4 is on p. 43 and concerns one-endedness.

**Witness:** ALG lines 1533 and 1550 (p. 40) precede "4 Ideals" at line 1575 (p. 41). ALG line 510 opens §2 on p. 14. GL-JSJ line 2042 is Proposition 5.4, on p. 43, in §5.1.2.

**Repair:**
- At 1348, write "§3.6, Lemma 15 and Theorem 5, p. 40".
- At 1122, write "[ALG] §1 (introduction), pp. 2–5".
- At 1519, take #2205's sentence (its README:1520): "Use [GL-JSJ] §5.1.2, Proposition 5.4 and the remark after Corollary 5.6, p. 43: …".

## R09 (P3) — The description's statements about #2205 are stale

**Location:** Description: "It changes no line that #2205 changes, and `git merge-tree` of the two heads is clean."; Checks: "with #2205's head `8ecd6bb` reports no conflict"; After #2205: "not only in the variables as #2205 makes it".

**Claim:** #2205's head is now `11a9d0f`. It rewrites the §7.10 sketch and §7.11, and it makes §7.7 uniform in the rank.

**Witness:** The merge in R02. #2205's README:1817 reads "State the recursive decidability of the set of pairs `(n, s)` such that `s` has a solution in `F(Fin n)`".

**Repair:**
- Replace the first sentence with: "It is based on main and is to be rebased onto #2205, whose head `11a9d0f` also rewrites the §7.10 proof sketch and §7.11. The rebase keeps this pull request's text there, together with #2205's `times |S|` and its rank-uniform §7.7 sentence."
- Replace the `8ecd6bb` Check with the rebase.
- Drop the last "After #2205" item.
- In item 10, change "Theorem 9, p. 136" to "p. 135" (IFT lines 6727–6728).

## Verified sound

The previous review's findings (on #2205 at `8ecd6bb`), checked against this head:

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 §7.7 rank | README:1815 "For finite A and `X`, state the recursive decidability" | not repaired here; repaired at #2205 `11a9d0f` README:1817 (R02) |
| R02 Grushko | `Suggested.lean` has no Grushko declaration | not repaired; #2205 `Suggested.lean:64–87` (R02) |
| R03 Lean names | README:290 "(the test `LimitGroup.centralizerExt_proper_power` of Layer 8)" | not repaired; absent at #2205 (R02) |
| R04 locators | README:551 "(KM02 Proposition 6.7)"; :121 `subgroupIsFreeOfIsFree` | not repaired; #2205 README:552, :122 (R02) |
| R05 forest | README:415 "no loop in `F`, no two distinct darts of `F`" | not repaired; #2205 README:416 (R02) |
| R06 spans | README:1322 "ALG Proposition `12: I(Y) = ⋂ I(Y_i)`"; heading "6.`0b`" | not repaired; fixed at #2205 (R02) |
| R07 description | concerns #2205's text | not applicable |

The adversarial pass:

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.7 CSA ⇒ commutative transitive (sample) | `F(a,b)×ℤ`; `F(a,b)∗_{⟨a²⟩}(⟨a²⟩×⟨t⟩)`; `ℤ`; trivial group | `(a,0)`,`(b,0)` commute with `(1,1)`, not with each other; `a~a²~t`, `[a,t]≠1`; CSA; CSA vacuously | holds; ALG lines 116–117 (p. 4), 577–579 (p. 15); IFT line 302 (p. 7) | none |
| §2.2a `rank+#V=#O+#comp` (sample) | segment; loop rose plus a vertex; parallel pair; theta; empty | `0+2=1+1`; `1+2=1+2`; `1+2=2+1`; `2+2=3+1`; `0=0` | holds; HATCHER line 3687 (p. 84); DIESTEL lines 1223, 1320, 1349 (pp. 24, 26, 27) | none |
| §2.4 folds (sample) | flower `ab`,`ac`; loop `a` and edge `a:v→w` | 2 vertices, 3 edges, accepts `⟨ab,ac⟩`; `w=v` | Checks hold; subgroup clause is KM02 Lemma 3.4 (§2.5) | R07 |
| §5.1 `G[X]`, `eval` (sample) | `eval(x↦a²)(xax⁻¹a⁻¹)`; `x↦b`; `X=∅` | `a²aa⁻²a⁻¹=1`; `bab⁻¹a⁻¹≠1`; `G[∅]≅G` | holds; IFT line 148 (p. 4); ALG line 85 (p. 3) | R08 |
| §5.9 linear ⇒ equationally Noetherian (sample) | `SL(2,ℤ)`; `F(Fin 3)` | Hilbert basis on entries; Tau Ceti `Linear.lean:200,225` prove both | holds; ALG lines 163 (p. 5), 770 (p. 20) | none |
| §5.10 components (sample) | `⟨a⟩∪⟨b⟩ ⊆ F(a,b)` | two components; `Γ ↪ Γ(⟨a⟩)×Γ(⟨b⟩)` | holds; ALG lines 1445, 1474, 1503–1520 (pp. 37–39) | none |
| §5.11 irreducible ⇔ discriminated (sample) | `⟨a⟩∪⟨b⟩`; `V([x,a])`; `x²` | separated, not discriminated; `F∗_{⟨a⟩}ℤ²` discriminated; `Rad=ncl(x)⊋ncl(x²)` | holds; ALG line 1550 is §3.6, p. 40 | R08 |
| §6.2 surface groups (sample) | `S⁺(0,3)`, `S⁺(1,1)`, `S⁺(0,1)`; `S⁺(1,0)`; `S⁻(2,0)` | ranks `2,2,0 = 1−χ`; `ℤ²`; abelianisation `ℤ×ℤ/2` | holds; GL-JSJ Proposition 5.4 is p. 43 | R08 |
| §6.5 new convention (sample, PR) | `[x,y]=1` plus `w` over `G=1`; Check with `z₁,z₂,z₃` | `ℤ²∗ℤ`, abelian rank 3 ≠ 2; `κ=3+1=4` | consistent with §§6.6, 6.7, 8.8 type (4); IFT lines 326–358 (p. 8) | none |
| §6.7 regularity (sample) | `[x₁,y₁][x₂,y₂]`; `[x,y]`; `x₁²x₂²x₃²`; `[x,y]=[a,b]` | κ=4, commutative only; κ=2; κ=3; κ=3 with `d≠1` | matches IFT lines 394–401 (p. 9) plus the genus-two clause | none |
| §7.3 correspondence (sample) | `X={x}`, `S=T=∅`; `xy≠1` | one member, `ρ=0`, no word map for `x`; old encoding admits `z=1` | (2),(3) hold for occurring variables; IFT lines 970–983 (pp. 22–23); JSJ line 2126 (p. 132) | R05 |
| §7.7 satisfiability (sample) | rank 0; `[x,a]=[x,b]=1 ∧ x≠1`; `y∈⟨a⟩`, `y²=a²` | inequations fail; centralizers meet in 1; unique `y=a` | holds at fixed `A`; IFT lines 1146 (p. 26), 1310 (p. 30) | R02 |
| §9.4 infinite words (sample) | `a^t∗a`; `(a^t)⁻¹∗v` | `a^{t+1}`, length `t+1`; common prefix `{1,2,…}` has no maximum, so undefined | holds; MRS-REGULAR lines 453 (p. 10), 620–644 (p. 14); LENGTH lines 330–347 (p. 9) | none |
| §10.5 relative JSJ (sample) | `F(a,b)∗_{a=[x,y]⁻¹}F(x,y)` | eliminating `a` gives `F(b,x,y)`; QH punctured torus `F(x,y)` | holds; JSJ lines 302–308 (p. 93), 4326 (p. 179) | none |
| §11.1 lifts (sample) | `[x,y]=1` with square disjunction; `S:x=1` with `{1}`; empty family | one of `m,n,m+n` even, no square in `F∗ℤ²`; generic; `a=1` vacuous, no lift | holds; IFT lines 3070–3129 (pp. 66–67); LIFT pp. 224, 226 | none |
| §7.2 inequation encoding (PR) | `xy≠1` as `xyz⁻¹=1`; with `zz⁻¹=1` added | `(a,a⁻¹,a,a⁻¹)` gives `z=1`; then `z`'s word is a basic-equation side, nonempty and reduced, so `≠1` | sound; RECOMP lines 357, 392–393 (pp. 8–9) | R05 |
| §7.2 table count (PR) | `xx⁻¹=1` | tables `(z,z⁻¹)`, `(z⁻¹,z)`, `(1,1)`, `(a,a⁻¹)` for each `a∈A^{±1}` | grows with `|A|`; IFT line 898 overstated | none |
| §§7.2–7.3 constraints (PR) | `x` occurring once with items `a`,`a⁻¹` | value `1` lies in every subgroup; item labels force letters of `B_x` | sound in both directions | none |
| §7.10 sketch (PR) | `ba^mba^{m'}b`; inverse block in `h_l`; `θ` | overlapping blocks share one `b`, so a boundary cuts ≤1; `x_i` would enter `q_l`; `θ(P_i(Ũ))=x_i` | sound; IFT lines 1101, 1113–1139 (pp. 25–26) | none |
| §7.11 criterion (PR) | true sentence; false sentence; `∀x∃y y=xa` | `∀x∃y(1=1)` has one; `∀x∃y(a=1)` has none; `q=xa` | sound | R02 |
| §10.9 attribution (PR) | JSJ Theorem 3.23; Corollary 14.2 | cites [42] (preprint, 2002), no proof; follows from Theorem 14.1, credited to [41] | text correct; Sources and reference lines contradict it | R06 |
| §11.4b shared words (PR) | constant tuple `V` | `P_{i,V}=V` met the old clause, which was vacuous; a fixed branch gives fixed `P_i` | plausible; IFT lines 2898–2928 (pp. 62–63) | none |
| §§4.6, 4.9 GL-JSJ (PR) | §1.2; Proposition 1.1 | "1.2 Trees" at line 756 (p. 16); Proposition 1.1 at line 834 (p. 17) | correct | none |
| `merzljakov` (`Suggested.lean:1080`) | `k=0`; `∀x∃y y=xa` | `S=1` on both sides; `q=xa ∈ ⟨a,b,x₀⟩` | true | none |
| `isLimitGroup_iff` (`:1153`) | `ℤ²`; `F₂×ℤ`; trivial group | yes/yes; no/no (not commutative transitive); `n=0` marking in the closure | true; stand-in for Tau Ceti `isLimitGroup_iff_isFullyResiduallyFree` | R02 |
| §7.7 headline | `∀x∃y y²=x` over `F(a,b)` | needs constraints over rank 3 | absent here; #2205 `Suggested.lean:103` | R02 |
| §4.11(3) Grushko headline | trivial; `ℤ`; `ℤ²∗F₂` | `p=q=0`; `p=0,q=1`; `p=1,q=2` | absent here; #2205 `Suggested.lean:80` | R02 |
| §§10.2, 10.7, 11.6 headlines | carriers at `2fd255d` | no JSJ tree, `Hom`-diagram or NTQ carrier | not statable; this docstring does not name them, #2205's does | R02 |
| §11.5 headline | `hasLift_genusTwo` (`:1392`) | genus-two instance only | general form at #2205 `:268`, `:279` | R02 |

- Source locators checked against the text: 57 in 12 sources (IFT 15, ALG 10, JSJ 8, GL-JSJ 4, KM02 4, HATCHER 4, RECOMP 3, DIESTEL 3, MRS-REGULAR 2, LIFT 2, VAR-I 1, LENGTH 1). Of the 15 sampled targets, 11 verify cleanly; §§5.1, 5.11 and 6.2 have locator slips (R08) and §2.4 has a build-order defect (R07).
- Library declarations opened at Tau Ceti `2fd255d` (17): `TrivialIntersection.lean:115`, `GroupAlgGeom/Basic.lean:184,215,229,273`, `Linear.lean:184,200,225`, `Irreducible/Components.lean:100,125,161`, `Irreducible/Basic.lean:120`, `Separated.lean:111,117`, `LimitGroup/Characterization.lean:171`, `PresentationComplex.lean:42,59`. The lake manifest pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows Target 1.1 and §2.1 (main lines 224, 369). ClassifyingSpaces Stage 2 item 7 (README:29) loses its heading at #1807 and #1808, but both map it to `TauCeti.PresentationComplex` (their README lines 128–131 and 134), so it is no finding. The consumers SurfaceTopology, NeronModelsAndSemistableAbelianVarieties, ArithmeticFuchsianGroups and AutomorphyLiftingBeyondTaylorWiles cite §§2.1–2.2a and 6.0a–6.1a; all resolve.
- Gate (worker's run at `4189a6a`): FAIL with `sorry-data` 14 (R01), `statement-hygiene` 6 (R03) and `prnum` 1 (R04); every other check 0, build 0. Depcheck: `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 86 `sorry` warnings and no other diagnostic. `signatures.md` lists 173 types with 0 lost binders; not re-run, since R01 replaces the file.
- One-tactic probe: not run. The file is main's catalogue, with 15 `example`s (e.g. lines 170, 269, 1403) and a "Boundary examples" section (line 1399), all padding that R01's rebase removes.
- Merge: `git merge-file` (this README, base `496de49`, #2205 at `11a9d0f`) gives 2 conflicts; R02's resolution leaves none.
- Overlap check: read SurfaceTopology, RandomGraphs and GraphConnectivityAndFlows.
  - SurfaceTopology consumes §§2.1–2.2a and 6.0a–6.0d; this roadmap owns them.
  - RandomGraphs shares nothing.
  - GraphConnectivityAndFlows owns multigraph walks and multigraph forests (its §2.1). This head's §2.2a restates the forests (previous R05, in R02).
  - Tau Ceti `2fd255d` realizes Layers 1, 5 and §§8.1–8.4 (STATUS.md). That is progress on this roadmap, not a second owner.

## Not verifiable

- [KM06] Theorem 32, p. 513, cited in the new §10.9: J. Algebra 302, on an Elsevier host that the sources service treats as paywalled; not fetched.
- [MAK] (sources of §§7.2, 7.7 and 7.10): mathnet.ru, not fetched; §7.7 was checked through IFT p. 26 and RECOMP.
- [TREES] (§§4.6, 4.9): Springer paywall.

## Source issues

- **Error** in IFT at Lemma 13(1), p. 21: the source says the number of partition tables depends only on `|S(X,A)|`; it should also depend on `|A|`, since table words may contain letters of `A` (`xx⁻¹=1` has a table `(a,a⁻¹)` for each `a`); affects a stated result.
- **Gap** in IFT at Lemma 14(2)–(3), pp. 22–23: the source gives a word map `P_x` for every `x ∈ X` and `W = P(U)`; it should restrict to variables occurring in `S` (the empty system with `X={x}` has one member and one solution); affects a stated result.
- **Gap** in IFT at §4.4, condition 3), p. 25: the source excludes the blocks `ba^mb` of `g_i` from earlier `g_l`, `h_l` but not their inverses; it should exclude inverse blocks, which the replacement also rewrites; affects the proof.
- **Gap** in IFT at the proof of Merzljakov's Theorem, p. 26: the source assumes that the matching occurrence on the other side of a basic equation lies inside one item; it should choose a block uncut in every variable-occurrence word; affects the proof.
- **Gap** in IFT at the proof of Merzljakov's Theorem, p. 26: the source concludes that `X=P(Ũ)`, `Y=Q(Ũ)` gives the formal solution; it should note that `P_i(Ũ)=g_i′ba^m x_i bg_i″` and apply the `F`-automorphism sending it to `x_i`; affects the proof.
- **Error** in IFT at §2.7, remark after Definition 6, p. 9: the source says regularity is equivalent to κ≥4 with a non-commutative solution, or `[x,y]d=1`; it should add `[x₁,y₁][x₂,y₂]=1` (κ=4, only commutative solutions); affects a stated result.
