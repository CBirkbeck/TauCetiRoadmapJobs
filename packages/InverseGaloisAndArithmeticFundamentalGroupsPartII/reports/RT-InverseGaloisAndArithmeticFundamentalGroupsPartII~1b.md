<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13130#issuecomment-6792223261 -->
Red team round 1 pass b (claude) of 3489b8d

Verdict: needs_changes

1. **F01** (P1) the arc order contradicts the half-twist orientation: §2.5's face formula is false as stated

   **Location.** `README.md:1089-1090` (§2.2): "Order a simplex by the counterclockwise order of its
   tangent directions at `∗`"; `README.md:1050-1052` (§2.1): "The loop exchanging two adjacent points
   counterclockwise lifts to the positive half twist"; `README.md:1164-1167, 1173, 1183` (§2.5):
   "`b L_q ↦ b · v_q` is an equivariant isomorphism of augmented semisimplicial sets", "Deleting the
   `i`-th arc of `v_q` is `s_(q,i) · v_(q−1)`".

   **Claim.** With `σ_i` the counterclockwise half twist (the convention of ReductiveGroups
   Layer 11A, with `Mod(D, P)` a group under composition acting on arcs by image) and simplices
   ordered counterclockwise at `∗`, `∂_i(v_q) = s_(q,i) v_(q−1)` with `s_(q,i) = σ_(i+1) ⋯ σ_q`.

   **Witness.** `n = 2`, `q = 1`. `∂_1(v_1) = v_0` forces `P_1, P_2` to be met in the order of the
   simplex (EVW16 lines 1203–1205 say so; the README omits it). Put `∗` at the top, so
   counterclockwise order is `P_1` left, `P_2` right; `a_0, a_1` the straight arcs. The
   counterclockwise half twist `h` carries `P_2` over the side nearer `∗`, so `h(a_1) = a_0`, and
   carries `P_1` round the far side, so `h(a_0)` passes behind the other marked point and is not `a_1`.
   Hence `∂_0(v_1) = a_1 = σ_1⁻¹ v_0`, not `s_(1,0) v_0 = σ_1 v_0`; `L_(2,0) = 1`, so the cosets differ.
   The map of §2.5 does not commute with `∂_0`. EVW16 fixes the arc order but not the direction of the
   half twist (lines 360–368), so this is not a source error: the README added "counterclockwise" on
   both sides.

   **Second witness (the roadmap's own conventions pick the other order).** Take `∗` at the bottom,
   `z_1 < z_2` on the real axis, `γ_i` the counterclockwise loop along the straight arc, Mathlib's
   product in `π_1` (`p * q` is `q` first), and the transport `f ↦ f ∘ h_*⁻¹`. Then
   `h_*(γ_1) = γ_2`, `h_*(γ_2) = γ_2⁻¹ γ_1 γ_2`, so `(a, b) ↦ (a b a⁻¹, a)`, the move of the
   conventions, and the boundary loop is `γ_1 * γ_2`, the product `g_1 g_2`. In this picture the
   points are met from `∗` in clockwise order, and `h(a_0) = a_1`.

   **Repair.** Replace the order in §2.2 and fix the base point in the Layer 2 preamble:

   - Layer 2 preamble, add: "The marked points `P_1, …, P_n` are numbered so that the straight
     segments from `∗` to them leave `∗` in clockwise order; for the base configuration
     `z_j = j/√(1 + j²)` of §5.1 this is `∗ = −i`."
   - §2.2: "Order a simplex by the clockwise order of its tangent directions at `∗`" (and say in
     *Notes on the sources* that EVW16 §5.5 and line 1204 use the counterclockwise order, which goes
     with the opposite half twist).
   - §2.5: "the standard simplex `v_q` of straight arcs from `∗` to `P_1, …, P_(q+1)`, in this order".
   - Add to §2.5 the Check: "`n = 2`, `q = 1`: the counterclockwise half twist `σ_1` carries `P_1`
     along the side of `∗`, so `σ_1 · a_0 = a_1 = ∂_0(v_1)`, and `∂_1(v_1) = a_0 = v_0`; with the
     counterclockwise order of arcs one gets `∂_0(v_1) = σ_1⁻¹ v_0` instead." Add to §2.1 the Check
     with the two-term monodromy computation above (`h_*(γ_2) = γ_2⁻¹ γ_1 γ_2`, action
     `(a, b) ↦ (a b a⁻¹, a)`), which is the witness that ties the half twist to the move of §IG.3.2;
     the parent leaves that comparison open ("may correspond to the inverse generator").

   Tested on the refuting instance: with `∗` below and clockwise order, `h(a_0) = a_1`, so
   `∂_0(v_1) = σ_1 v_0` holds.

2. **F02** (P2) §2.6's induction uses arc complexes the roadmap does not define

   **Location.** `README.md:1086-1089` (§2.2: "an arc from `∗` to a point of `P`", in the disc `D`)
   and `README.md:1193-1195` (§2.6): "the link maps to a join of arc complexes of the cut surfaces,
   which is `(n − p − 2)`-connected by induction".

   **Claim.** The connectivity of the arc complex of `(D, ∗, P)` follows by induction on `n` from the
   same statement for the cut surfaces.

   **Witness.** HW10 lines 1625–1630 and 1659–1663: the induction is over `A(S; Δ_0, Λ)` with `Δ_0` a
   finite set of boundary points, and the cut pieces `S_i` carry the image `Δ_0^i` of `Δ_0`, several
   points. Cutting `D` along two arcs from `∗` to one `p` gives two discs, one with two copies of `∗`.
   §2.2 and §2.6 state nothing for these.

   **Repair.** State §2.2 and §2.6 at the generality the induction needs, and keep the present object
   as the case used:

   - §2.2: "For a closed disc `S`, a finite nonempty set `Δ` of boundary points and a finite set `Λ`
     of interior points, `A(S; Δ, Λ)` has as vertices the isotopy classes of arcs from a point of `Δ`
     to a point of `Λ` …, and a simplex is a set of classes with representatives disjoint except at
     common endpoints in `Δ` and with distinct endpoints in `Λ`; `F(S; Δ, Λ)` drops the last
     condition. The arc complex of Layer 2 is `A(D; {∗}, P)`."
   - §2.6: "Prove: `F(S; Δ, Λ)` is contractible for `|Λ| ≥ 1` (HW10 Lemma 7.1) and `A(S; Δ, Λ)` is
     `(|Λ| − 2)`-connected (HW10 Proposition 7.2), for every such `(S, Δ, Λ)`"; the ordered
     semisimplicial structure and the coset model stay for `Δ = {∗}` only.
   - Check: "Cutting `D` along two arcs from `∗` to the same `p` gives two discs, the inner one with
     two base points; with `|Δ| = 1` the induction does not close."

3. **F03** (P2) gap `geomtop-arc-isotopy-extension` describes other arcs, in another layer, and partly asks for what is on main

   **Location.** `README.md:340-342`: "in Layer 1, smooth isotopy extension for a finite system of
   disjoint properly embedded arcs in a compact surface, relative to a closed subset of the boundary,
   together with cutting a surface along such a system"; the same sentence in `design/plan.json`
   (`gaps`, slug `geomtop-arc-isotopy-extension`, section `Layer 1`).

   **Claim.** This is what §2.2 and §2.5 need and GeometricTopology lacks.

   **Witness.** The arcs of §2.2 share the endpoint `∗` and end at interior marked points: they are
   neither disjoint nor properly embedded. On main, `TauCetiRoadmap/GeometricTopology/README.md`
   §3.3 (*Isotopy extension*, relative and continuous forms; Layer 3, not Layer 1) and §1.7.2
   (*Cutting*, for a proper arc, with the isotopy to a diffeomorphism fixing a tube) already exist.

   **Repair.** Same slug, supplier section `§3.3`, and the `needs` sentence, in the README contract and
   in the plan's `gaps` entry: "For a compact surface `F` with boundary, a finite set `Λ` of interior
   points and a finite system of smooth arcs from boundary points to distinct points of `Λ`, disjoint
   except at common boundary endpoints: isotopy extension for such systems relative to `∂F` and to
   `Λ` (§3.3 states it for boundaryless targets and compact sources), and the cut surface along the
   system as a compact surface with the diffeomorphisms fixing the arcs pointwise restricting to it
   (§1.7.2 states this for one proper arc)." Repoint the `*Needs:*` of §2.2 and §2.5 to
   "GeometricTopology §3.3 (gap:geomtop-arc-isotopy-extension), §1.7.2".

4. **F04** (P2) the evaluation bundle of §2.1 is taken from a paper; its owner on main is not cited

   **Location.** `README.md:1033-1038` (§2.1): "The evaluation map `Diff(D, ∂D) → Conf_n(int D)`,
   `φ ↦ φ(P)`, is a locally trivial fibre bundle … (PAL60, Theorem A and §3)"; the `*Needs:*` at
   `README.md:1053-1058` names no supplier for it.

   **Claim.** Local triviality of the evaluation map is available to the proof.

   **Witness.** PAL60 is an uncertified citation, not a supplier. On main,
   `TauCetiRoadmap/GeometricTopology/README.md` §3.3 has the target "Prove the restriction fibration:
   … `Diff_c(M) → Emb(N, M)`, `g ↦ g ∘ e` … has continuous local sections … locally trivial principal
   bundle"; with `N = P` (a compact 0-manifold) and `M = int D` this gives the local sections.

   **Repair.** In the proof sketch: "By GeometricTopology §3.3 (the restriction fibration, with `N`
   the finite set `P` and `M = int D`), `Diff_c(int D) → PConf_n(int D)` has continuous local
   sections; `Diff_c(int D)` is a subgroup of `Diff(D, ∂D)` by extension by the identity, so the
   action of `Diff(D, ∂D)` on `PConf_n(int D)` has local cross-sections and the evaluation map is
   locally trivial (PAL60, Theorem A)". Add "GeometricTopology §3.3 (restriction fibration)" to the
   `*Needs:*` of §2.1 and to *From TauCetiRoadmap.GeometricTopology*.

5. **F05** (P3) §4.2's proof sketch takes a `b` that §4.1 does not give at `p = 0`

   **Location.** `README.md:1362`: "*Proof sketch.* §4.1 gives `b = A2 + 3 A0 p` in §1.19."

   **Claim.** `max(deg H_0 K(M_p), deg H_1 K(M_p)) ≤ A2 + 3 A0 p` for every `p ≥ 0`.

   **Witness.** §4.1 (`README.md:1340-1341`) gives this only "for `p > 0`"; at `p = 0` it gives
   `deg H_1 K(R) ≤ A2 + A0`, and §1.15 gives `A2 + 1`.

   **Repair.** "§4.1 gives `b = A2 + 3 A0 p` for `p > 0` and §1.15 gives `b = A2 + 1` for `p = 0` in
   §1.19; in both cases `n > 3 A0 p + A2 + A0 + 2` implies `n ≥ b + A0`." Checked: `p = 0`,
   `n ≥ A2 + A0 + 3 ≥ (A2 + 1) + A0`; the constants `A = 3 A0`, `B = A2 + A0 + 2` stand.

6. **F06** (P3) the Layer 0 heading of Suggested.lean is not the README's

   **Location.** `Suggested.lean:44`: "`## Layer 0: nonsplitting classes, the Hurwitz action and the
   stabilization operator`".

   **Witness.** `README.md:385`: "## Layer 0: nonsplitting classes, the Hurwitz representation and the
   component ring". The Layer 4 and Layer 5 headings agree.

   **Repair.** `/-! ## Layer 0: nonsplitting classes, the Hurwitz representation and the component ring -/`.

7. **F07** (P3) HW10 Lemma 7.1 is cited for a surgery argument it does not contain

   **Location.** `README.md:1191-1192`: "contractible by the surgery argument (HW10 Lemma 7.1)".

   **Witness.** HW10 lines 1632–1634: the proof of Lemma 7.1 refers to its references [16] (Hatcher,
   *On triangulations of surfaces*, Topology Appl. 40 (1991), 189–194) and [44] (Wahl, *Homological
   stability for the mapping class groups of non-orientable surfaces*, Lemma 2.5), and adds only that
   interior endpoints do not matter.

   **Repair.** "is contractible (HW10 Lemma 7.1, p. 34, whose proof is the surgery flow of Hatcher,
   *On triangulations of surfaces*, Topology Appl. 40 (1991), 189–194, in the form of Wahl, Invent.
   Math. 171 (2008), Lemma 2.5)", with the two works added to `sources.toml` and *References* through
   the sources service (uncertified if not readable legally).

Seven findings: one P1, three P2, three P3. All are in Layer 2 of
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` (the arc complex and its
suppliers) except R05 (§4.2) and R06 (`Suggested.lean`, a heading). The two Lean headlines were
found true as typed on every instance tried (table below). The ownership question with
ArithmeticStatisticsPartVIII §5.16 is settled as not actionable in this package by the earlier
rounds and is not raised.

## Verified sound

**Dependency check.** `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)`; no UPWARD, CYCLE or
`moved:` line. The roadmap is line 224 of `merge-order/ORDER.txt`; its suppliers
(InverseGaloisAndArithmeticFundamentalGroups at line 55; ReductiveGroups, ClassifyingSpaces,
AlgebraicTopology, GeometricTopology, DGAInfinity on main) all precede it.

**Diff.** `git diff --stat origin/main...HEAD` touches only the package folder (README.md,
Suggested.lean, design/plan.json, two reports).

**Counts.** 41 declarations of Suggested.lean read (every line); 46 numbered README targets read
(every line of the README, with its 154 Check bullets). Locators: the EVW16 line ranges of every
target of Layers 0, 1, 3, 4 and 5 and of §§2.3–2.5 were opened and agree with the statements and
printed pages (about 45 ranges; `§1.11, p. 8` was checked for its lines only); HW10 Lemma 7.1,
Proposition 7.2 and Definition 3.4; CD95 Theorem 1.4.1 and Corollary 2.2.3; SMA59 Theorem B and
Theorem 4. Checks recomputed: those in the table below (about 60 bullets, all Layers); the
remaining Checks were read and none was found false, but the topological ones of §§2.1–2.2 and
§2.6 were not computed beyond R01. Sibling citations resolved: 27 (list below). Pinned
declarations grepped at the pins: 18 Mathlib and 26 Tau Ceti names, all present in the files the
README names.

**Suggested.lean.** No Lean was run; the elaborated types in `scratch/signatures.md` were compared
with the README statements (41 of 41 agree; no declaration lost a binder: `G : Type`, `[Group G]`,
`[Fintype G]`, `k : Type`, `[Field k]` are in each signature that needs them). Single
`import Mathlib` plus `TauCeti.GroupTheory.SpecificGroups.Braid.Basic`, which exists at the pin and
is used. No `lemma`, `set_option`, `#eval`, `#print`, sorry'd data, or process words. Every Lean
name is backticked in the README. Padding probe: each of the 20 proved theorems is consumed by a
later definition or instance (`hurwitzAction` by `lift`, the two `MulAction` instances,
`glueRepHom`, `unmarkedStabilizer`), none is a headline, and neither headline follows from one
library lemma (their content is EVW16 Theorem 6.1). The three headlines not stated are named in the
module docstring with the missing carrier; none is statable with a short definition (the K-complex
needs the braid-orbit monoid as a quotient monoid over all lengths). No fully qualified name of the
file occurs in another roadmap (`roadmaps grep --lean-only`: no match).

**Adversarial table (values computed).**

| Statement | Instance | Computed | Result |
|---|---|---|---|
| `IsNonsplitting` | `G = 1`; `S₃` transp.; `S₄` transp., `H = ⟨(12),(34)⟩`; `C₆` involution; `A₄`, `c ∋ (123)` | holds; `c ∩ H` = `c, ∅, 1 elt, ∅`; `(12), (34)` not `H`-conjugate; closure of order 2; `|c| = 4`, `c ∩ C₃` one element, `c ∩ V₄ = ∅` | Checks true |
| `hurwitzMoveFun` | `a = (12), b = (23)` | `(aba⁻¹, a) = ((13), (12))`, product `(123)` both sides; EVW16 line 102 same move | ok |
| fibres, `S₃`, `n = 2` | — | 9 tuples, orbits 3 + 2 (sizes 1, 1, 1, 3, 3), 6 generating, 2 conjugation classes | ok |
| `shiftHom` | `m = 1, n = 2`; `n = 0` | `σ_0 ↦ σ_1` of `B_3`; trivial map out of `B_0` | ok |
| `glue_conjFibre` | block entry | `h (h⁻¹ g h) h⁻¹ = g` | ok |
| `hurwitz_homological_stability` | `G = 1`; `G = C₂`; `full = true`, `G ≠ 1`, small `n`; unmarked, `G` with centre; `n = 0` | `H_p(B_n) → H_p(B_(n+m))`, stable (Arnold); same; excluded by `A p + B < n` or empty fibre handled by triangular induction (total and proper strata iso ⇒ top stratum iso, five lemma); coinvariants of `k[G]`-isomorphism, `|G|` invertible; `n ≥ 1` forced | true as typed |
| uniformity in `k` | Lemma 3.5 | thresholds come from bijections of finite sets and `|c ∩ H|` a unit; no field enters | ok |
| `uniform_betti_bound` | `n = 0`; `n ≤ A i + B + a`; `n` large | rank 1 or 0; `(2|G|)^n ≤ (2|G|)^((A+B+a+1)(i+1))`; descent in steps of `a` with sources `> A i + B` | true |
| §0.6 centrality | `∂t = 1` | block past `s` gives `(∂t s ∂t⁻¹, t) = (s, t)` | ok |
| §0.8 diagonal | `S₃`, `H` of order 2 | `|c ∩ H| = 1`, divides `|H|` | ok |
| §1.5 | `R̄ = k[t]/t³`, `V = k` | Tor degrees `1, 3, 4, 6 ≤ 2i` | ok |
| §1.11 `d² = 0` | `(g, h)` | `r_h r_(h⁻¹gh) = r_g r_h`; wrong sign: products `h²gh⁻¹` vs `gh`, `A₄` `g = (123), h = (134)` same class, `h² = (143)` does not commute with `g` | ok |
| §1.13 `S_g` | `(∅; s)`, general `w` | prefix `b g b⁻¹`, `r_(bgb⁻¹) s = s r_g`; boundary of `d(w; s)` terms unchanged | ok, EVW16 line 955 |
| §1.15 | `R = k[t]` | `d : K_(q+1) → K_q` is `t` for `q` even, `0` odd; `H_q = k` in degree `q` (even), `0` (odd) | ok |
| §1.16 with `A1 = 0` | `G = 1`, `M = k` | bound `2`, `deg H_3 K(k) = 3` | EVW16 Prop. 4.13 fails at `A(R) = 0`; README's `A1 ≥ 1` repairs it |
| §1.7 with shift | — | `(b−u−1)A1 + a + δ + A1 u ≤ b A1 + δ` iff `a ≤ A1` | ok |
| §1.19 | — | `A(M) ≤ b + 5 A1 < b + A0` | ok |
| constants | `G = 1`; `G = C₂` | `A1, A2, A0 = 1, 2, 7`; `2, 4, 14` | ok |
| §2.3–2.4 | `q = 1`; `q = 2` | faces `bσ_1L_0, bL_0`; vertex 2 `= bσ_1σ_2σ_1L_0 = bσ_2σ_1L_0` | ok (algebra); geometry R01 |
| §2.1 non-closed `Diff_c` | `φ = e^(−1/(1−r)²)` | `φ(1 − 1/j) = e^(−j²)`; support of `φ_j − φ` in `r > 1 − 2/j` | ok |
| §3.3 faces | `((12), (23))`, `σ_1⁻¹` and `σ_1` | `((23); (13))` and `((13); (12))` | ok, EVW16 line 1122 |
| §3.5 | `G = 1`, `n = 1` | `0 → 0 → k → k → 0 → 0` | ok |
| §4.1 | `j ≥ 2`; `j ≥ 1`; `P < n − 2` | `A2 + A0(3P+4−2j) ≤ A2 + 3A0P`; `A2 + A0(3P+1−2j)`; `n ≥ 3 + 21P` | ok |
| §4.3 (6.1.6) | stratum `Q` | terms `g ∈ c ∩ Q` stay, each once: diagonal `U_Q` | README's correction right |
| §4.4 | `S₃`, `n = 2` | 5 orbits, conjugation joins the 3 constants and swaps the two others: 2 | ok |
| §5.1 | `n = 0, 1, 3` | `1 ≤ 1`; `1 ≤ 2|G|`; cells `(1, 2, 1)`; `2^(n−1)|G|^n ≤ (2|G|)^n` | ok |
| `Homeomorph.unitBall` | `1, 2` | pin: `x ↦ (√(1 + ‖x‖²))⁻¹ x`; `1/√2`, `2/√5` | ok |
| §5.3 | `G = 1`, `n = 0, 1` | unramified part over `Conf_0`: one point; no cover with one branch point | ok |

**Sibling citations resolved.** InverseGaloisAndArithmeticFundamentalGroups at its open head:
§IG.3.2 *Branch tuples and Nielsen classes*, *The Hurwitz braid action*, *The braid-orbit monoid*,
*Extracting an element of a single class*; §IG.5.1 *Ordered and unordered configurations*,
*Configurations and punctured-disc groups* (which says the mapping-class identification is not part
of it, so §2.1 owns it); §IG.5.2 *Marked topological Hurwitz spaces*, *Forgetting the boundary
marking*; §IG.5.3 *Arithmetic Hurwitz stacks and schemes*, *Analytic and topological Hurwitz
comparison*; §IG.5.5 *Fixed-degree Hurwitz mod-`ℓ` comparison*, *Coefficient towers and rational
Betti dimensions*: all exist with the hypotheses the README repeats. ReductiveGroups on main, 11A
and 11B: as cited, two-skeleton only (the declared gap is real). ClassifyingSpaces Stage 4 items
16–17: as cited. AlgebraicTopology on main is numbered by Layers and carries the table "Stage k is
Layer k … item m of Stage k is §k.m", so the Stage citations stand (§§5.3 and 5.5 read; §§4.7,
5.1 and Layer 8 by heading only). GeometricTopology §§3.1 and 3.4 read and as cited, §§1.1 and 1.5
by heading only (see R03, R04 for §§1.7.2, 3.3). DGAInfinity
Layer 5 exists with derived tensor products. ArithmeticStatisticsPartVIII §5.16 (*Tor spectral
sequences over graded algebras*, *Uniform Betti numbers of Hurwitz schemes*) and §5.19 exist, and
its scope names this roadmap as later and unimported.

**Declared gaps.** The eight slugs agree between `design/plan.json` and the README. The objects of
the three AlgebraicTopology gaps (thick realization, Borel construction of a group action, join
connectivity) and of the Salvetti and graded-Tor gaps occur in no section of their suppliers on
main; `geomtop-boundary-pointwise-disc-smale` and `geomtop-marked-disc-diffeomorphisms` ask for
more than §§3.4, 1.7.2 give. Only `geomtop-arc-isotopy-extension` is raised (R03).

**Ownership against open work.** `roadmaps grep` for the arc complex, marked-disc mapping class
groups, nonsplitting classes and the Lean names: the only other roadmap with these theorems is
ArithmeticStatisticsPartVIII §5.16 (settled). The 224 listed checkouts were searched through the
same tool.

## Not verifiable

- PAL60 and ALEX23: settled as uncertified; their locators were not read.
- The Lean file was not elaborated in this pass (no Lean command is given); the elaborated types of
  `scratch/signatures.md` were used.
- The end-to-end orientation of the Borel construction `Ẽ ×_{B_n} X` (deck action against `π_1`,
  which ClassifyingSpaces item 16 leaves to be stated) could not be fixed from the texts; R01's
  second witness assumes transport `f ↦ f ∘ h_*⁻¹` and Mathlib's product.
- Hatcher 1991 and Wahl 2008 (R07) are not in the cache and were not fetched.
- The sources of the parent roadmap's §IG.5 targets were not re-read; only its statements were
  compared.

## Source issues

- **Misprint** in EVW16 at Definition 2.2, p. 9: the source says the three fibres are tuples in the class, generating tuples in the class, generating tuples of the group, in that order, and calls the surjections a subset of the class homomorphisms; it should be the last two exchanged, and only the class surjections lie in the class homomorphisms; affects nothing.
- **Misprint** in EVW16 at proof of Lemma 4.6, p. 18: the source says the kernel is a quotient of the tensor product with the module on the left of the torsion ideal; it should be the torsion ideal on the left, as in (4.6.3); affects nothing.
- **Error** in EVW16 at proof of Lemma 4.7, p. 19: the source says the spliced resolution has both lowest terms equal to the ring with multiplication by the central element between them; it should be shifted by the degree of that element from the second term on; affects the proof.
- **Error** in EVW16 at Proposition 4.13 with (4.5.3), pp. 18 and 21: the source says the K-homology bound has slope the constant of (4.5.3), which is zero for the trivial group; it should be a slope at least one; affects a stated result.
- **Gap** in EVW16 at §5.2, p. 23: the source says the simplices in every degree are the cosets of the tail subgroup, trivial in high degrees; it should be empty in degrees at least the number of points; affects nothing.
- **Error** in EVW16 at (6.1.6), p. 29: the source says the central element acts on a stratum as the stratum's own element times the ratio of the class sizes; it should be the stratum's own element with coefficient one; affects the proof.
- **Misprint** in EVW16 at (7.8.3), p. 35: the source says the stabilization raises the number of branch points by the exponent of Lemma 3.5; it should be by that exponent times the order of the class elements; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3489b8da102563021f9af4714033705152ebd81a", "job": "RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1b", "model": "fable", "worker": "chris-x10"} -->
