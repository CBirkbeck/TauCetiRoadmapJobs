<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13130#issuecomment-6794015466 -->
Red team round 2 pass b (claude) of ec90633

Verdict: needs_changes

1. **F01** (P3) the base configuration of Layer 2 is indexed from the wrong origin

   **Location.** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:1037-1039`: "numbered `P_1, …, P_n` … the base configuration `P_j = j/√(1 + j²)` of §5.1".

   **Claim.** The `n` marked points `P_1, …, P_n` are the §5.1 images of the base configuration of ReductiveGroups Layer 11A.

   **Witness.** Layer 11A's half twist is `z_i = i + 1/2 − exp(πtI)/2` for `i < n − 1`, so its base points are `0, …, n − 1`. For `n = 2` the README formula gives `(1/√2, 2/√5)`; §5.1's own Check (`README.md:1608-1609`) gives `(0, 1/√2)`.

   **Repair.** Line 1038: "the base configuration `P_j = (j − 1)/√(1 + (j − 1)²)`, `1 ≤ j ≤ n`, the image under §5.1 of the points `0, …, n − 1` of ReductiveGroups Layer 11A". Lines 289-290 and 1586: write "`z_j = j`, `0 ≤ j ≤ n − 1`". Tested: `n = 2` gives `(0, 1/√2)`, as in the §5.1 Check; the clockwise order from `∗ = −i` is still the order of the real parts (arguments `90° > 54.7°`).

2. **F02** (P2) §2.1 attributes the counterclockwise convention to the parent, which leaves it open, and composes two suppliers' identifications of `π_1(Conf_n)` without a target comparing them

   **Location.** `README.md:1098-1101`: "compose with `π_1(Conf_n) ≅ TauCeti.BraidGroup n` of §IG.5.1 … The loop exchanging two adjacent points counterclockwise lifts to the positive half twist, the convention of §IG.3.2 and of ReductiveGroups Layer 11A".

   **Claim.** The identification of §IG.5.1 sends the counterclockwise exchange to `σ_i`, so it equals Layer 11A's identification transported to the disc, and the chain `Mod(D, P) ≅ TauCeti.BraidGroup n ≅ π_1(Conf_n)` is compatible with both.

   **Witness.** InverseGaloisAndArithmeticFundamentalGroups §IG.3.2, *The Hurwitz braid action*, at its open head: the geometric half twist "may correspond to the inverse generator; the comparison … is part of this target"; §IG.5.1 only says "with the orientation convention of Layer IG.3". Neither fixes counterclockwise. If the parent settles on clockwise, the two identifications differ by `σ_i ↦ σ_i⁻¹` and line 1100 is false.

   **Repair.** In §2.1 take the identification from one supplier and state the comparison as a target:

   - Line 1098: "compose with `π_1(Conf_n(int D)) ≅ TauCeti.BraidGroup n` of ReductiveGroups Layer 11A, transported along the homeomorphism of §5.1, and with `π_0 Diff(D, P; ∂D) ≅ Mod(D, P)`."
   - Lines 1099-1101: "Under it `σ_i` is the class of the counterclockwise exchange of `P_i` and `P_(i+1)`, which lifts to the counterclockwise half twist; the radial homeomorphism of §5.1 preserves orientation."
   - New bullet after line 1060: "The identification `π_1(Conf_n(𝔻)) ≅ TauCeti.BraidGroup n` of §IG.5.1 equals the transported identification of ReductiveGroups Layer 11A or differs from it by `σ_i ↦ σ_i⁻¹`; they are equal when the parent's loops `γ_j`, path product and transport are those of the convention witness below. Layer 2 uses Layer 11A's; §0.5 uses §IG.5.1's; `A(n)` (§§2.3–2.4) and the Hurwitz representation (§0.3) are defined on `TauCeti.BraidGroup n` and do not depend on the choice."
   - Drop "§IG.5.1" from the *Needs:* of §2.1 (line 1103) or keep it only for asphericity.

   Tested on the refuting instance: with a clockwise parent convention every statement of the repaired text stays true, since §§2.5–2.6 use only that `σ_i ↦` counterclockwise half twist is an isomorphism onto `Mod(D, P)`, and §§3.2–4.5 use `Hur_n ≃ EB_n ×_(B_n) c^n` abstractly.

3. **F03** (P3) five *Needs:* lines cite DGAInfinity Layer 5 as supplied for what the declared gap asks for

   **Location.** `README.md:787, 801, 863, 970, 987` (§§1.5, 1.6, 1.10, 1.16, 1.17): "DGAInfinity Layer 5".

   **Claim.** Layer 5 of DGAInfinity supplies free-resolution computation and long exact sequences of graded `Tor`, and the hyperhomology spectral sequence.

   **Witness.** DGAInfinity Layer 5 on main is "derived modules, twisted complexes, and perfect envelopes" for `A∞` modules; graded `Tor` over `TauCeti.GradedModuleCat` is exactly `gap:dga-graded-tor-spectral-sequences` (`README.md:396-402`), which lines 732, 758, 818 tag and these five do not.

   **Repair.** Append "(gap:dga-graded-tor-spectral-sequences)" to "DGAInfinity Layer 5" on lines 787, 801, 863, 970, 987.

4. **F04** (P3) `TauCeti.TopCat.serreFibrations` is used without a supplier contract

   **Location.** `README.md:1103, 1319`: "`TauCeti.TopCat.serreFibrations`".

   **Claim.** Every pinned declaration a *Needs:* line uses is described under *From Tau Ceti*.

   **Witness.** The name is pinned (`TauCeti/Topology/Homotopy/SerreFibration/Basic.lean:107`, a `MorphismProperty TopCat`), but *From Tau Ceti* (`README.md:201-252`) has no bullet for it, so what §2.1 takes from it (a predicate only, no long exact sequence) is unstated.

   **Repair.** Add to *From Tau Ceti*: "`TauCeti.TopCat.serreFibrations` (`TauCeti/Topology/Homotopy/SerreFibration/Basic.lean`): the class of Serre fibrations as a `MorphismProperty TopCat`. Only the predicate is pinned; that a locally trivial bundle belongs to it and the long exact sequence of homotopy groups are AlgebraicTopology Stage 8's."

5. **F05** (P3) "Downstream consumers" lists a roadmap that precedes this one and imports nothing from it

   **Location.** `README.md:1732-1737`: "## Downstream consumers — ArithmeticStatisticsPartVIII §5.19 uses the uniform étale Betti bound … in the form stated by ArithmeticStatisticsPartVIII §5.16".

   **Claim.** ArithmeticStatisticsPartVIII is a consumer of this roadmap.

   **Witness.** `merge-order/ORDER.txt`: ArithmeticStatisticsPartVIII is line 146, this roadmap line 224; `README.md:109` says "it imports nothing from this roadmap", and its own scope says the same of this roadmap.

   **Repair.** Replace the bullet's first sentence by: "No roadmap imports a target of this one yet. ArithmeticStatisticsPartVIII §5.19 takes the uniform étale Betti bound from its own §5.16 (*Uniform Betti numbers of Hurwitz schemes*), with the hypotheses of §5.3 here." Keep the second sentence.

6. **F06** (P3) the K-complex differential is displayed without its source degree

   **Location.** `README.md:873-874`: "`K(M)_q = k[c^q] ⊗_k M[q]`, `q ≥ 0`, and differential `(g_0, …, g_q) ⊗ m ↦ Σ_i (−1)^i …`".

   **Claim.** The displayed formula is the differential of `K(M)_q`.

   **Witness.** `(g_0, …, g_q)` has `q + 1` entries, so it lies in `K(M)_(q+1)`; EVW16 line 731 says "the differential `K(M)_(q+1) → K(M)_q`". Read on `K(M)_q`, §1.15's Check (`t` for `q` even) would be off by one: `K_1 → K_0` has one term, not two.

   **Repair.** "…and differential `K(M)_(q+1) → K(M)_q`, `(g_0, …, g_q) ⊗ m ↦ …`". Tested: `q = 0` gives `d((g) ⊗ m) = r_g m`, the first Check of §1.11.

7. **F07** (P3) the class locus of the unmarked scheme is attributed to §IG.5.3, which states it only for `c₁ = G ∖ {1}`

   **Location.** `README.md:275-276`: "for centreless `G` and a conjugation-invariant `c ⊆ G ∖ {1}`, the complex points of `Hn^c_{G,n}` are `CHur^c_{G,n}/G`"; used at `README.md:1655-1656`.

   **Claim.** §IG.5.3, *Analytic and topological Hurwitz comparison*, states this for every such `c`.

   **Witness.** At the parent's head that target states the class locus "in the same way" for the scheme marked at unramified infinity (the product-one part of `CHur^c_{G,n}`), and for the unmarked scheme only "the complex space is `CHur^{c₁}_{G,n}/G`".

   **Repair.** Line 275: "for centreless `G`, the complex points of `Hn_{G,n}` are `CHur^{c₁}_{G,n}/G`, `c₁ = G ∖ {1}`". In §5.3, after "§IG.5.3": "identifies `Hn_{G,n}(ℂ)` with `CHur^{c₁}_{G,n}/G`; the class locus `Hn^c_{G,n}` is the open and closed part where the inertia at each finite branch point lies in `c`, which is `CHur^c_{G,n}/G`, the fibre condition being conjugation invariant". Tested on `S₃`, transpositions, `n = 2`: `CHur^{c₁}/G` has fibre the generating pairs of non-identity elements modulo conjugation, and the locus with both entries in `c` is the one class of `(t, t')`.

One P2 (S02) and six P3 findings. No P1. Both Lean headlines were recomputed and hold as typed.

## Round 1 findings at this head

| Earlier finding | Status | Witness at `ec90633` |
|---|---|---|
| a/F01 (P3) five padding lemmas | repaired | `hurwitzAction_sigma`, `shiftHom_sigma`, `HurwitzFibre.smul_tuple`, `unmarked_smul_mk`, `unmarkedGlueSum_smul` occur in neither file (grep). Each of the 20 remaining proved lemmas is used by a kept definition or instance (chain checked, see ledger). |
| a/F02 (P1) ownership against ArithmeticStatisticsPartVIII §5.16 | settled (`not actionable in this package`) | Not re-raised: the reason (a scope and merge-order decision for a human) holds. The facts stated in `README.md:103-114` agree with §5.16 at its open head (stability for `CHur^c_{G,n}/G` and the Betti and étale bounds are stated there for centre-free `G` only). |
| a/F03 (P2) "no single map induces `U`" | repaired | `README.md:156-159`: "for a singleton class `c = {g}`, with `g` central, it is the single gluing map"; `README.md:117-118`: "no algebraic form of it is constructed here". §4.5 Check recomputed: `[ttt] + 2[tt t']` for both `(a)` and `(b)`. |
| a/F04 (P2) pinned fat realization | repaired | `README.md:223-229` cites `TauCeti.fatRealization`, `.ι`, `fatRealizationFunctor`, `.augment` (pinned file lines 89, 95, 193, 204); gap at `README.md:328-332` asks only for filtration and spectral sequence. |
| a/F05, b/F03 (P2) arc cutting | repaired | `README.md:372-379`, gap at §3.3 with arcs "from points of `∂F` to points of `Λ`"; *Needs:* of §§2.2, 2.5, 2.6 cite it. `plan.json` slug, supplier and section agree. |
| a/F06, b/F02 (P1) induction leaves `Δ = {∗}` | repaired | `README.md:1145-1151`, `1267-1288`: `F(S; Δ, Λ) ⊇ A(S; Δ, Λ)` for finite nonempty `Δ`. Recomputed: `|Δ|=2, |Λ|=1` gives two points, `(−1)`-connected; join bound `Σ(n_i−2)+2(c−1) = |Λ|−d−2 ≥ k−p`. |
| a/F07 (P1) coinvariants for a non-free action | repaired | `README.md:1503-1514` (permutation modules, then Cartan–Leray on `EG × X`); contract `README.md:318-325`. AlgebraicTopology §5.3 on main read: regular covers and the native permutation local system for nonregular ones. |
| b/F01 (P1) arc order against half twist | repaired | `README.md:1036-1040`, `1153-1154`, `1244-1246`, `1258-1263`. Recomputed with Layer 11A's formula `z_i = i + 1/2 − exp(πtI)/2`: the left point moves to negative imaginary part, towards `∗ = −i`, so `σ_1 a_0 = a_1`; `s_(q,i) v_(q−1)` deletes arc `i`. The repair left a wrong index in the preamble: S01. |
| b/F04 (P2) local sections of evaluation | repaired | `README.md:1076-1087`; GeometricTopology §3.3 on main has the restriction fibration for compact `N`, boundaryless `M`. |
| b/F05 (P3) `p = 0` in §4.2 | repaired | `README.md:1466-1467`. `G = 1`: `A2 = 2`, `A0 = 7`; `p = 0`: `n > 11 ⇒ n ≥ 10 = b + A0`. |
| b/F06 (P3) layer headings | repaired | `Suggested.lean:44, 462, 482` equal `README.md:422, 1440, 1570`. |
| b/F07 (P3) surgery flow attribution | repaired | `README.md:1273-1276`; HAT91 line 101, WAH08 lines 302–303, HW10 lines 1632–1634 verified. |

No repair introduced a false statement; one introduced an index slip (S01).

## Verified sound

**Suggested.lean ledger** (36 declarations read; `variable {n : ℕ}` throughout; `section BraidAction` has `{G : Type*} [Group G]`; after it `{G : Type} [Group G]`). Elaborated types in `scratch/signatures.md` compared with the README: no lost binder, both headlines carry `[Fintype G]`, `IsNonsplitting c`, `∀ (k : Type) [Field k]`, `↑(Fintype.card G) ≠ 0`.

| Declaration | Context | Instances and values | Result |
|---|---|---|---|
| `IsNonsplitting` | `{G : Type*} [Group G]` | `G = 1`: closure `{1} = ⊤`, true. `S₃` transpositions: true. `S₄`: `(12), (34) ∈ ⟨(12),(34)⟩` not conjugate there, false. `C₆` involution: closure of order 2, false. `A₄`, class of `(123)`: meets each `C₃` in one element, true | matches EVW16 line 537 |
| `hurwitzMoveFun`, `hurwitzMoveInvFun`, `hurwitzMove` | BraidAction | `((12),(23)) ↦ ((13),(12))`, product `(123)` both sides; inverse returns the pair | EVW16 line 102 |
| `hurwitzMove_comm`, `hurwitzMove_braid` | BraidAction | proved; used by `hurwitzAction` | kept (needed by a body) |
| `hurwitzAction` | explicit `(n) (G) [Group G]` | `S₃`, `n = 2`: orbits `3×1 + 2×3 = 9`, five orbits | ok |
| `hurwitzAction_iff`, `hurwitzAction_comm` | BraidAction | used by `hurwitzFibre_prop_iff`, `hurwitzAction_shift`, `smul_conjFibre` | kept |
| `shiftHom` | BraidAction (uses no `G`) | `n = 0`: trivial map; `shiftHom 1 2 (σ native 0) = σ native 1` by `natAdd_sigma` | ok |
| `hurwitzAction_shift` | BraidAction | used by `glue_smul` | kept |
| `hurwitzMoveFun_mem_iff`, `closure_range_hurwitzMoveFun`, `hurwitzFibre_prop_iff` | `{G : Type}` | used by `HurwitzFibre.instMulAction` | kept |
| `HurwitzFibre` (+ `tuple`, `mem`, `gen`) | `{G : Type}` | `S₃`, `n = 2`: 9 points (`full = false`), 6 (`true`); `n = 0`, `full = true`: empty unless `G = 1` | ok |
| `HurwitzFibre.instMulAction` | | `C₂`: one fixed point per `n` | ok |
| `glue`, `glue_smul`, `glueRepHom` | | `n = 0`: empty tuple ↦ `(g, …, g)`; generation preserved (closure monotone) | ok |
| `markedStabilizer` | `[Fintype G]` | `G = 1`: one summand, the map `H_p(B_n) → H_p(B_(m+n))`; `S₃`: three summands | ok |
| `conj_mem_carrier`, `conjFibre`, `hurwitzMoveFun_conj`, `smul_conjFibre`, `conjSetoid` | | used by `UnmarkedFibre` and its action | kept |
| `UnmarkedFibre`, `.instMulAction`, `.mk` | | `S₃`, `n = 2`: 2 points (`false`), 1 (`true`) | ok |
| `glue_conjFibre`, `unmarkedGlueSum`, `unmarkedGlueSum_conj`, `unmarkedGlueSum_eq_of_mk_eq` | | `S₃`, `m = 2`, `(a)` and `(b)`: both sums `[ttt] + 2[tt t']` | ok, used by `unmarkedStabilizer` |
| `unmarkedStabilizer` | `[Fintype G]` | map induced by `markedStabilizer` on conjugation coinvariants | ok |
| `hurwitz_homological_stability` | `[Fintype G]` | `G = 1`: `m = 1`, braid stability, true for every field. `full = true`: triangular argument below. Unmarked: coinvariants of a `k[G]`-isomorphism, `|G|` invertible. `n = 0`: excluded by `A p + B < n` | true as typed |
| `uniform_betti_bound` | `[Fintype G]` | `i = 0`: orbit count bounded by §0.8; `n ≤ A i + B + a`: `(2|G|)^n ≤ C^(i+1)` with `C = (2|G|)^(A+B+a+1)`; `S₄` transpositions excluded by `hc` | true as typed |

Padding probe: no remaining declaration is unused, restates a definition, or mirrors a Check. Headlines: the two statable ones are stated; the étale bound, EVW Theorem 4.2 and the arc-complex connectivity are named in the module docstring with the missing carrier. No `lemma`, `set_option`, `#eval`, sorry'd data, or extra import.

**README targets** (45 bold targets or definitions read, all 1782 lines).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.2 | `|G| = 2`, `S₃`, `C₆`, `S₄` | Sylow 2-subgroups of order 2; `C₆` fails generation; `S₄` fails the order hypothesis | ok |
| §0.6 centrality, relation | `(t, x)` with `∂t = 1` | positive moves give `(∂t x ∂t⁻¹, t) = (x, t)` | ok |
| §0.8 | `G = 1`; `S₃`; stratum `H` | `D = 1, N = 0`; diagonal coefficient `|c ∩ H|`, a divisor of `|H|`; all `r_g^(d)`, `g ∈ c ∩ H`, agree on generating tuples since `(w, x) ∼ (w^x, x)` for `∂w = 1` | ok |
| §1.4–1.10 | `R = k[t]`, `M = N = k` | `Tor_1 = k[1]`; `δ(k) = 1`; `A(k) = 0 ≤ 2`; §1.7 pieces `(b−u−1)A1 + a + δ + uA1 ≤ δ + bA1`; §1.9 `max(h_1, 3 deg R̄ + h_0) + deg R̄` | ok |
| §1.11 `d² = 0` | `(g, h) ⊗ m`; `A₄`, `g = (123)`, `h = (134)` | `r_h r_(h⁻¹gh) = r_g r_h`; wrong convention gives products `h²gh⁻¹ ≠ gh` | ok |
| §1.13 | general `(w; s)` | `i = 0` term `r(b g b⁻¹) s = s r_g`; others cancel since `∂w = ∂(w − w_i) · w_i^(suffix)` | ok |
| §1.15 | `R = k[t]` | `K_(q+1) → K_q` has `q + 1` signs: `t` for `q` even, `0` for `q` odd; `H_q = k` in degree `q`, `q` even | ok |
| §1.16–1.19 | `G = 1`, `M = k`; `C₂` | `j + A1 i ≤ A1 q`; with `A1 = 0` bound `2 < 3`; `A(M) ≤ b + 5A1 < b + A0`; `C₂`: `A1 = 2, A2 = 4, A0 = 14` | ok |
| §2.3–2.4 | `q = 2`, `i = 0`, `j = 1`; `n = 1, 2, 3` | `σ_2σ_1` against `σ_1σ_2σ_1 = σ_2σ_1σ_2 ≡ σ_2σ_1 mod L_0`; `A(1)_1 = ∅`; `|A(2)| = ℝ` | ok |
| §2.5 | `s_(q,i) v_(q−1)` | `σ_q: a_(q−1) ↦ a_q`, …, `σ_(i+1): a_i ↦ a_(i+1)`; `∗ = +i` reverses | ok |
| §2.6 | `|Λ| = 0, 1, 2`, `|Δ| = 1, 2` | `d ≤ (p+1)/2 ≤ p`; join `(|Λ| − d − 2)`-connected; link of a `q`-simplex has `|Λ| − q − 1` points | ok |
| §3.3 | `q = 1`, `S₃` | `σ_1⁻¹((12),(23)) = ((23),(13))`; `σ_1` gives `((13),(12))` | ok |
| §3.4–3.5 | `G = 1`, `n = 1` | `coker(K_2 → K_1)_1 = k`, `H_1 K(R)_1 = 0`; sequence `0 → 0 → k → k → 0 → 0` | ok |
| §4.1 | `j ≥ 2`; `j ≥ 1` | `A2 + A0(3P + 4 − 2j) ≤ A2 + 3A0P`; `A2 + A0(3P + 1 − 2j) < A2 + 3A0P`; `n ≥ 3 + 21P > P + 2` | ok |
| §4.3 | block triangular `U` | proper strata have isomorphic diagonal blocks `U_H` by induction on `|H|`; total and quotient isomorphisms give the `G`-block | ok; EVW (6.1.6) factor rightly dropped |
| §4.4–4.5 | `C₂` on `S²`, `𝔽₂`; `S₃`, `n = 2` | `H_1(ℝP²) = 𝔽₂`, coinvariants `0`; `5 → 2` | ok |
| §5.1–5.2 | `n = 2, 3`; reduction | cells `(1,1)`, `(1,2,1)`; `2^(n−1)|G|^n ≤ (2|G|)^n`; `m ≤ A i + B + a` | ok |
| §5.3 | `G = 1`; `ℓ > |G|` | `𝔽_ℓ` permitted; trivial group handled apart | ok up to S07 |

Counts: 36 declarations read; all 46 numbered subsections read (every target and definition in them); 44 locators opened in the cached texts and found on the stated page and line (EVW16 33 of its 54 line locators, covering every theorem, lemma and equation number cited; HW10 5; CD95 2; SMA59 2; HAT91 1; WAH08 1); the other EVW16 line locators were not opened. All 159 Check bullets were read; those with a computable value (the ones in the two tables above and in the round 1 table, about 70) were recomputed and none is false; the rest are qualitative and were read for consistency only. 27 supplier citations resolved (parent at its open head: 12 named targets of §§IG.3.2, IG.5.1–IG.5.3, IG.5.5; on main: ReductiveGroups Layers 11A, 11B; ClassifyingSpaces Stage 4 items 16–17; AlgebraicTopology §§5.1, 5.3, 5.5 through its Stage table, and the existence of Stages 2, 4, 8; GeometricTopology §§1.1, 1.5, 1.7.2, 3.1, 3.3, 3.4; DGAInfinity Layer 5). Pinned names: 30 Tau Ceti and 12 Mathlib declarations of the supplier contracts were opened at the pins with file and line; for the remaining names I rely on the worker's `roadmaps resolve` run (none missing) and on the file elaborating. The eight gaps have the same slug, supplier and section in `design/plan.json` and the README; none asks for something pinned (no graded `Tor`, Borel construction, join connectivity or skeletal filtration at the Tau Ceti pin). The pull request changes only the package folder. No process words, pull-request numbers or machine paths in the README or the Lean file.

Dependency check output: `depcheck: 236 roadmaps, 2140 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.

Ownership: `roadmaps grep` over main and all open heads finds no other declaration named `hurwitzAction`, `IsNonsplitting`, `HurwitzFibre`, `shiftHom` or `markedStabilizer`, and no other owner of the disc arc complexes; no Hurwitz action on tuples exists at either pin. The overlap with ArithmeticStatisticsPartVIII §5.16 is the settled a/F02.

## Not verifiable

- PAL60 Theorem A and ALEX23 pp. 406–407: settled as uncertified, cited by locator only.
- That the parent's §IG.5.1 identification uses the counterclockwise exchange: its text leaves the orientation to the target (S02).
- That `gap:geomtop-marked-disc-diffeomorphisms`, `gap:geomtop-arc-isotopy-extension` and the other six gaps will be met by their suppliers: declared contracts, not raised.
- The claim in *Notes on the sources* that HW10's cutting step fails in positive genus was checked only on the stated example (two arcs forming a nonseparating loop), not in general.
- No Lean was run in this pass; elaboration was read from `scratch/signatures.md`.

## Source issues

- **Misprint** in EVW16 at Definition 2.2, p. 9 (EVW16 lines 395–398, 411–413): the source says the fibres of the three subcovers are tuples in the class, generating tuples in the class, generating tuples in the group, in that order, and puts all surjections inside the class-valued homomorphisms; it should be class tuples, generating group tuples, generating class tuples, with only class-valued surjections inside; affects nothing.
- **Misprint** in EVW16 at proof of Lemma 4.6, p. 18 (EVW16 line 852): the source says the kernel is covered by the torsion module tensored on the right of the left module; it should be the torsion module on the left, as in (4.6.3); affects nothing.
- **Error** in EVW16 at (6.1.6), p. 29 (EVW16 lines 1325, 1333): the source says the stabilization operator acts on a stratum as the index of the subclass times the relative operator; it should be the relative operator itself, with coefficient one; affects the proof.
- **Error** in EVW16 at Proposition 4.13 with (4.5.3), pp. 18, 21 (EVW16 lines 825, 980–988): the source says the bound has slope the first constant, which may be zero; it should require that constant to be at least one, since the trivial group gives degree three against bound two; affects a stated result.
- **Gap** in EVW16 at proof of Lemma 4.7, p. 19 (EVW16 lines 877–883): the source says the spliced resolution has its first two terms unshifted; it should shift the second and later terms by the degree of the central element; affects the proof.
- **Gap** in EVW16 at §5.2, p. 23 (EVW16 lines 1062–1064): the source says the coset sets are defined for every simplicial degree; it should make them empty from degree equal to the number of points on; affects nothing.
- **Misprint** in EVW16 at (7.8.3), p. 35 (EVW16 lines 1599–1600): the source says stabilization adds the exponent of Lemma 3.5 to the number of branch points; it should add the degree of the central element, the exponent times the order of the class; affects the proof.
- **Gap** in EVW16 at §5.5 and §2.1, pp. 8, 25 (EVW16 lines 360–368, 1151–1153): the source says arcs are ordered counterclockwise and leaves the direction of the half twist open; it should fix the two together, counterclockwise order with the clockwise twist or the reverse; affects the proof.
- **Gap** in HW10 at Lemma 7.1 and Proposition 7.2, pp. 34–35 (HW10 lines 1626, 1661): the source says the boundary point set is finite and later that its images are nonempty; it should assume it nonempty from the start; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ec906334c99dc5ce7d3c3d15804df52f32d16bcd", "job": "RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2b", "model": "fable", "worker": "chris-x8"} -->
