<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1138#issuecomment-6637319088 -->
Red team round 2 pass b (claude) of 41e8611

Verdict: needs_changes

1. **F01** (P3) BunGAndNewtonStrata §0.5 and §1.21 no longer exist at the cited head; the Newton order is owned by VStackSheavesAndLisseCategories §VS4.0

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/README.md:23` ("BunGAndNewtonStrata §§0.5–0.6 and 1.7–1.45 owns B(G), … Newton invariants and their order"); `:171` ("Consume §§0.5–0.6, G-isocrystals and B(G)"); `:173` ("§1.21, partial-order-on-B-of-G"); Needs at `:1104`, `:1135`, `:1251` ("BunGAndNewtonStrata §1.21, partial-order-on-B-of-G"), `:1289`, `:1715`, `:1727`; the three gap contracts `newton-poset-length`, `newton-cell-strong-purity`, `newton-cell-greatest`, whose `plan.json` `section` is "§1.21".

   **Claim.** BunGAndNewtonStrata has a §0.5 and a §1.21 and owns the partial order on B(G).

   **Witness.** BunGAndNewtonStrata at its open head (#1241, c7d0555): Layer 0 has §§0.2, 0.6–0.9 only (show-lines 100–208); Layer 1 jumps from "1.20 Division-algebra Morita comparison" (show-line 666) to "1.22 Representations detect Newton dominance" (680). Its Scope (show-line 16) says "VStackSheavesAndLisseCategories §VS4.0 owns … Newton order, HN filtrations", and Layer 1 (show-line 235) consumes "the Newton and Kottwitz maps and order supplied by VStackSheavesAndLisseCategories §VS4.0". VStackSheavesAndLisseCategories at #1230 (3a80c09), VS4.0 "Newton geometry" (show-line 1096): "Define the partial order by equality of Kottwitz invariants and dominance of Newton points". VStackSheavesAndLisseCategories is earlier in the merge order (ORDER.txt line 149; BunG is line 241). The round-1 passes resolved "§1.21" at an earlier index; the head has since been renumbered.

   **Repair.** (1) Replace every "BunGAndNewtonStrata §1.21, partial-order-on-B-of-G" / "BunGAndNewtonStrata Layer 1, partial-order-on-B-of-G" (`:173`, `:1104`, `:1135`, `:1251`, `:1289`, `:1715`, `:1727`) by "VStackSheavesAndLisseCategories §VS4.0, Newton geometry (the partial order on B(G): equal κ and Newton dominance)", and add VStackSheavesAndLisseCategories to the Scope list (`:23`: "… integral κ and Newton invariants; VStackSheavesAndLisseCategories §VS4.0 owns the Newton order on B(G)") and a one-line supplier contract "### From TauCetiRoadmap.VStackSheavesAndLisseCategories: Consume §VS4.0, Newton geometry, for the partial order on B(G) by equal Kottwitz invariant and Newton dominance, for every nonarchimedean local field." (2) Replace "§§0.5–0.6, G-isocrystals and B(G)" (`:23`, `:171`) by "§0.6, the Kottwitz set B(G), and §0.8, families of G-isocrystals". (3) For the three gaps, change the README's subsection text and the `plan.json` `section` from "§1.21" to "§1.8 (Newton and Kottwitz invariants; required …)" so that the intake announces them on a section that exists; the `needs` sentences stay. Tested on the instance that uses the order: §4.6's chain [τ]≤[b]≤[b_w] for GL₂, w=s t^(1,0), κ=1: both classes have κ=1 and (1/2,1/2)≤(1,0), the VS4.0 order; the dimension values 1 and 1 are unchanged.

2. **F02** (P3) RootSystemsPartII "RS2.1, integral-order" does not exist at the open head; the object is its §1.1

   **Location.** `README.md:22` ("RootSystemsPartII RS2.1 owns integral dominance on the retained lattice"); `:140` ("Consume RootSystemsPartII RS2.1, integral-order, for the order determined by the pinned positive root cone on the retained lattice and its flipped coroot version"); Needs/Dependencies at `:1334`, `:1372`, `:1384`, `:1807`, `:1819`; the seven RootSystemsPartII gaps' `plan.json` `section` "RS2.1 (…)".

   **Claim.** RootSystemsPartII has a section RS2.1 with a target integral-order.

   **Witness.** RootSystemsPartII is now the open pull request #1731 (head 04a1a06, the checkout the brief names). Its README has Layers 1–4 ("Layer 1: integral dominance and the Stembridge step", lines 69–111) and no label RS2.1 or integral-order; the object is "### 1.1 Integral root dominance" (line 71): "Define integral root dominance x ≤ y on P and b by y − x ∈ Q⁺, stated literally as membership of the difference in `TauCeti.posRootCone P b` … use the flipped pairing and base for coweights", with the PGL₂ Check "0 is below 2 and is not below 1" that this README repeats at `:142`. The board design folder still uses RS2.1–RS2.4, but the brief resolves citations at the open head. The head's scope line 13 states that "Dominant subtraction, affine Bruhat/Demazure theory, twisted Newton reduction and the affine action … are not part of this roadmap" and its Downstream consumers (line 379) defer them to a continuation; the seven gaps remain declared contracts (not raised here), but the maintainer should know the named supplier has now excluded them in writing.

   **Repair.** Replace "RootSystemsPartII RS2.1, integral-order" by "RootSystemsPartII §1.1, Integral root dominance" at `:140`, and "RootSystemsPartII RS2.1" by "RootSystemsPartII §1.1" at `:22`, `:1334`, `:1372`, `:1384`, `:1807`, `:1819`; in the seven gap `section` fields of `plan.json` and in the README's RootSystemsPartII subsection, write "§1.1 (required … extension)" in place of "RS2.1 (…)". Tested on the instance: adjoint A₁, positive coroot 2 in ℤ, 0 ≤_ℤ 2 and 0 ≰_ℤ 1 is exactly §1.1's first Check (membership of 2 in ℕ·2, non-membership of 1).

Read in full: `packages/HeckeStacksAndLocalShtukasPartII/README.md` (1865 lines), `packages/HeckeStacksAndLocalShtukasPartII/Suggested.lean` (137 lines), `design/plan.json` (gaps), `sources.toml`, both repository rule files, the round-1 reports (pass a F01–F09, pass b F01–F07) and the round-1 repair report. `git diff --stat origin/main...HEAD` touches only the package folder (README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, reports/). Pins read from `lake-manifest.json`: Mathlib `f6090c7`, Tau Ceti `358314d4` (both newer than the pins the round-1 passes used; every pinned declaration was re-resolved at these pins, see Verified sound).

## Verification of the round-1 findings at 41e8611

| Finding | Status | Witness at this head |
|---|---|---|
| a-F01 / b-F01 (combinatorial bound absent from Suggested.lean) | repaired (b-F01 applied differently, correctly) | `Suggested.lean:59–133`: `residueBasis`, `semiModuleJump`, `ExtendedSemiModule` (every clause of vie06 Definition 3.1/3.4, lines 106–146), `chartIndices`, `IsCyclic`, `chartIndices_bound`, `exists_isCyclic_chartIndices_eq`. The repair's refusal of "equality for every cyclic module" is right: I recomputed (h,m)=(4,5), type (0,2,0,3), basis {−2,0,3,5}: φ=(0,0,1,2,1,3,2,3,2,4,3,…) on A={−2,0,2,3,4,…}, V={(3,4),(5,6),(5,8)}, 2|V|=6 < 8=Σ(2i−3)μ_i−3 for μ=(0,0,2,3); the type-(0,0,2,3) module (basis {−4,1,3,6}) has V={(3,4),(3,5),(3,6),(3,9)}, 2|V|=8. README `:761–763` records exactly this. |
| a-F02 (chart nonemptiness quantified over occurring types) | repaired | README `:709–712`: "For every extended semi-module (A,φ) for μ, with S_(A,φ) defined by its lattice conditions and not assumed nonempty … every extended semi-module for μ occurs"; `:737` "nonempty if and only if Σμ_i=m"; matches vie06 Theorem 4.3 (line 266, "nonempty open subscheme") and line 82. §3.8 proof order `:1023–1025` uses the cyclic charts. |
| a-F03 (adjoint transport assumed nonemptiness) | repaired | README `:816–822`: "For every label α with κ̃(w)=κ̃(b)+(σ−1)α, and without assuming either side nonempty … Such a label exists if and only if κ_G(w)=κ_G(b). Deduce that X^G_w(b) is nonempty if and only if …". The lifting step `:835–840` is sound: a lift of b′_ad exists because κ̃(b′_ad)=κ̃(b_ad) lies in the image of π₁(G)_I, and a central correction z∈Z°(L) (Kottwitz for tori is surjective onto X_*(Z°)_I, whose image is the kernel of π₁(G)_I→π₁(G_ad)_I by right exactness of coinvariants) gives κ̃(b′)=κ̃(b). ghn15 Corollary 2.2.2 is on PDF p. 7 (line 246), ghnerr Proposition 0.0.1 p. 1 (line 16). |
| a-F04 (basic-seed gap irreducible only) | repaired | README `:155` and `plan.json` gap `finite-coxeter-basic-class` (texts identical): "semisimple extended affine root datum whose irreducible components are permuted transitively by the based σ … includes the reduction from a transitive σ-orbit of d irreducible components to one component with σ^d (he14, Proposition 11.7, pp. 400–401, stated for simple G)". he14 line 1289 reads "Assume that G is simple", PDF p. 34 = printed 400. Res PGL₂ Check `:1653`. |
| a-F05 (M-maximal undefined) | repaired | README `:199` and `:893–896`: Σ(μ)={λ∈X_*(T): dom_G(λ)≤_ℤμ}, Σ(μ)^(M-max) = maximal elements of Σ(μ)∩X_*(T)^(M-dom) for ≤_M; plan text identical; GL₂/T Check `:920`. |
| a-F06 (§1.4 Checks non-discriminating) | repaired | README `:585–587`: three computed Checks. Recomputed: w=s₀s₁s₀=t^(2α∨)s (x=1, λ=2α∨, y=s, ℓ=0+4−1=3, η=s), v=s₁ (η=s), u=s₁s₀=t^(−α∨) (η=1). Basic class: dims 2,1, required (3+1−1−1)/2=1 ✓; translation class: dim X_w=(3+2+1)/2−2=1, X_v=∅ ✓; at [t^(α∨)]: dims 1,0, required (3+1−2−0)/2=1 ✓; at b=1 X_u=∅, dim X_w=2 ✓. |
| a-F07 (Newton-sign witness) | repaired | README `:76–77`: "This basic witness cannot detect the Newton sign, since 〈ρ,ν〉=0" and the μ=ν=(1,0) Check: 〈(1/2,−1/2),(0,0)〉=0 versus 〈ρ,(2,0)〉=1 ✓. |
| a-F08 (rank-zero torus) | repaired | README `:429`: "ℤ^r and has dimension 0. It is infinite when r>0 and a single point when r=0" ✓. |
| a-F09 (scope excluded §3.2/§7.5 inputs) | repaired | README `:29–30`: "The comparisons of κ-labelled components … in §3.2, and the P-alcove image comparisons of §7.5, are dimension and nonemptiness inputs owned here"; `:36` "None of these excluded items is a dimension-theorem input here." |
| b-F02 (SR.1.5 attribution) | repaired | README `:222`: "the generic Iwahori–Hecke algebra over ℤ[v,v⁻¹] with q=v² stated with bernstein-presentation (split datum), and iwahori-matsumoto for its specialization v↦q^(1/2)". SmoothRepresentationsOfLocalGroups at #1688 head 4178a1e, show-lines 1597–1606: Bernstein presentation, "The same holds for the generic affine Hecke algebra over ℤ[v, v⁻¹], which specialises … by v ↦ q^{1/2}" ✓. |
| b-F03 (RG2.1 descriptive names) | repaired | README `:120–122` names *apartment*, *echelonnage-root-system*, *affine-roots-and-filtrations*, *algebraic-fundamental-group*, *kottwitz-homomorphism*; §0.3 Needs `:344` cites echelonnage-root-system. All five anchors exist on main: `TauCetiRoadmap/ReductiveGroupsPartII/README.md:1852, 2185, 1999, 2448, 2706`. |
| b-F04 (§4.3 Needs) | repaired | README `:1181–1187`: two Needs lines; the comparison line adds "BunGAndNewtonStrata §1.10, straight-weyl-classification; gap:straight-finite-parabolic … (mv20, Theorem 3.10 and Corollary 3.11)". mv20 Theorem 3.10 line 358 (PDF p. 7), Corollary 3.11 line 370 ✓. |
| b-F05 (coset wording) | repaired | README `:58` and `:285`: "minimal in W₀·t^λy (its coset in W₀\W̃, he21's ^S W̃)" ✓. |
| b-F06 (ham17 page) | repaired | `sources.toml:260` and README `:1865`: "Corollary 2.7, PDF p. 6"; ham17 line 260 lies after the page-6 marker (line 240) ✓. |
| b-F07 (he21 cited_for) | repaired | `sources.toml:157` now lists "§0.4", "§0.5" ✓. |

No repair introduced an error that I could find: the new Lean file elaborates per the worker's `signatures.md` (7 declarations, no dropped binder), the new §3.2 route is checked above, and the new Checks recompute (table below).

## Verified sound

Counts: 7 Lean declarations read and compared with the worker's elaborated signatures (none lost a section binder; the only section variables are `{m h μ}`, present in every type; I ran no Lean, as the brief forbids builds, and relied on the elaborated-signature inventory the worker produced for this head for the `#check` comparison); 47 numbered README targets read; 13 declared gaps checked for slug agreement between README and `plan.json` (all 13 identical in text and slug), supplier naming (none `none`) and minimality; 62 source locators opened in the cached extractions with PDF-page recomputation (he21 ×17, he14 ×13, vie06 ×12, mv20 ×12, zhu17 ×11, ghn15 ×6, ghnerr ×2, ham15 ×2, ham17 ×2, he15 ×5, hn14 ×5, gh10 ×4, ghkr06 ×6, ckv15 ×1, vie14 ×2); 17 pinned declarations re-resolved at Mathlib f6090c7 and Tau Ceti 358314d4; 48 cross-roadmap citations resolved at the heads the brief names (ReductiveGroupsPartII on main: RG2.0.4 `:852`, apartment `:1852`, echelonnage-root-system `:2185`, affine-roots-and-filtrations `:1999`, algebraic-fundamental-group `:2448`, kottwitz-homomorphism `:2706`, parahoric-subgroup `:4289`, associated-parahorics `:4532`, lang-theorem `:5203`, lang-for-pro-algebraic-groups `:5222`, affine-tits-system `:5713`, iwahori-weyl-group `:5535`, length-and-bruhat-order `:5656`, dominant-coinvariant-cocharacters `:5994`, dominant-normal-form `:6127`, translation-length-formula `:6104`, kottwitz-quotient `:5748`, iwahori-bruhat-decomposition `:5730`, simple-cell-multiplication `:5817`; BunGAndNewtonStrata #1241 §§0.6, 1.7, 1.8, 1.10, 1.11, 1.13, 1.14, 1.15, 1.18, 1.27, 1.30, 1.43 (p-adic scope stated at show-line 1031), 1.45 present, §§0.5 and 1.21 absent (S01); GeometricSatakeAndFusion #1235 GS0 "Witt bounds, determinant lines and projective models" (show-line 546) with 0.28 perfect models, 0.29 equal-characteristic Schubert models, 0.32 integral parahoric ind-properness, 0.38 relative-position flag correspondences, 0.39 flag convolution fibre bounds stating (ℓu+ℓv−ℓuv)/2 and ℓu+ℓv−ℓ(u*v) (show-line 1023), GS1 1.4 affine semi-infinite intersections, GS2 2.4 ambient Hecke convolution and 2.6 rational Witt convolution and semismallness; SmoothRepresentationsOfLocalGroups #1688 SR.1.5 (show-lines 1565–1610); HeckeStacksAndLocalShtukas #1252 HS0–HS4 (show-lines 313–2259) cited only in Scope and Downstream; TraceFormula #196 Layer 11 Grothendieck–Lefschetz (show-line 381), geometric-Frobenius convention (show-line 93), EllAdicRealization (show-line 89); SchemeAndStackFoundations on main §0.7 `:755` with `fibre_dimension_formula` `:785`, §0.9 `:848`, §§0.23–0.26 `:1475–1640`, Layer 1 `:2044`; RootSystems on main Layers 3, 4, 6 `RepresentationTheory/RootSystems/README.md:274, 296, 356`; RootSystemsPartII #1731 §1.1 (S02)). Dependency check output, run unchanged:

```text
depcheck: 208 roadmaps, 1795 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Policy: no `lemma`, no `set_option`, single `import Mathlib`, no pull-request numbers or process narrative in README or Lean (the grep hits for "Lemma" are source citations; "Repair the printed variable" at `:1638` is mathematics about the source), every target has a locator, no computational algorithm, no sorry'd data, no `example`. All seven Lean names appear in the README (`:622, :644, :651–658, :747, :749`) and the README's backticked names of its own are exactly these seven.

Pinned declarations (file:line at the current pins; scope as the README states): `DoubleCoset.doubleCoset` `Mathlib/GroupTheory/DoubleCoset.lean:37` (sets, `[Mul α]`), `mem_doubleCoset` `:44`, `doubleCoset_eq_of_mem` `:51` (subgroups); `QuotientGroup.leftRel` `Coset/Defs.lean:66`, `leftRel_apply` `:71` (x⁻¹y ∈ s); `Finset` `Finset/Defs.lean:75`; `Set.ncard` `Set/Card.lean:613` with `Infinite.ncard` `:651` (0 on infinite sets, as the README says); `finsum` `Finprod.lean:99`; `WithBot` `Order/TypeTags.lean:22` with `bot_add` (⊥ + x = ⊥, `Unbundled/WithTop.lean:465`); `DoubleCoset.mul_mem_doubleCoset_iff` `TauCeti/GroupTheory/DoubleCoset/Basic.lean:100` (`hb : b ∈ H`); `CoxeterSystem.parabolic` `Coxeter/Parabolic.lean:101`, `IsMinimalCosetRep` `:233` (∀ v ∈ W_J, ℓu ≤ ℓ(uv), i.e. minimal in uW_J), `length_mul_of_isMinimalCosetRep` `:280`, `existsUnique_isMinimalCosetRep_mul` `:330` (∃! (u,v), u minimal, v ∈ W_J, w = uv; no finiteness); `TauCeti.inversions` `Inversions/Basic.lean:50`; `isLeast_ncard_inversions` `Length.lean:148` and `ncard_inversions_mul_le` `:172` under `[Finite ι] [CharZero R] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]` (`:82–85`); `RootPairing.weylGroup` `Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean:55`. The newer Tau Ceti pin still has no cancellation lemma ℓ(wy)=ℓw−ℓy under a root-sign hypothesis (only `ncard_inversions_mul_ofIdx_*` single-reflection steps, `Exchange.lean:106`), no Demazure product, no affine or Iwahori–Weyl group, no Deligne–Lusztig locus and no semi-modules (greps over `TauCeti/` and `Mathlib/`), so no declared gap asks for what the pins provide and the headline geometric theorems remain unstatable, as the docstring says. Ownership by object: `roadmaps grep` over main and the 446 open heads for affine Deligne–Lusztig loci, extended semi-modules, cordial elements and class-polynomial dimension finds them only in supplier reference lists; this roadmap is the owner (unchanged from round 1). The board package `RootSystemsPartII/design` and the open #1731 both exist; neither states the gap objects.

### Suggested.lean, declaration by declaration (section context: `namespace … ExtendedSemiModule`, `variable {m h : ℕ} {μ : Fin h → ℕ}`)

| Declaration (line) | README statement | Instances and values | Result |
|---|---|---|---|
| `residueBasis h A` (60) | §2.1 B=A∖(h+A) | h=2, A=ℕ: {0,1}; A=1+ℕ: {1,2}; h=1, A=ℕ: {0}; h=0: ∅ (junk, excluded by `hh`) | matches vie06 line 108 |
| `semiModuleJump m h A a` (65) | §2.2 max{n≥0: a+m−nh∈A} | (m,h)=(1,2), A=ℕ: ⌊(a+1)/2⌋; (4,5) example at a=−1: {n: 3−5n∈A}={0,1} → 1; (5,4) type (0,2,0,3) at a=5: 10,6,2,−2∈A, −6∉ → 3; h=0 gives sSup of an unbounded set = 0 (junk, excluded) | matches Definition 3.4(3), line 137 |
| `ExtendedSemiModule m h μ` (75) | §2.2 all clauses of Definition 3.4 | positive: A=ℕ, h=2, m=1, φ=⌊(a+1)/2⌋, one sequence per residue, initial values (0,1); negative: φ≡0 fails `φ_add_h` (0+1≤0 false); finite φ(−1) fails `φ_eq_bot_iff`; ∅ fails `nonempty`; the (4,5) noncyclic φ(−1)=0 satisfies `φ_le_jump` (0≤1) and fails `IsCyclic` | clause-by-clause identical to lines 132–146 (the `nonempty` field is the README's documented addition) |
| `chartIndices E` (106) | §2.2 V(A,φ) | (2,1,(0,1)): ∅; (3,4,(0,0,4)): {(5,6),(5,7),(5,10)} (recomputed φ=(0,1,0,2,1,4,3,2,5,4,3,6,…) on A={−3,0,1,3,4,5,…}); (5,4) noncyclic: 4 pairs (vie06 Example 5.5, line 560); (4,5): 3 and 4 pairs as in the repair table | matches (4.1), line 265 |
| `IsCyclic E` (111) | §2.2 equality in the upper bound on all of A | cyclic: A=ℕ, h=2; noncyclic: the (5,4) example at −1 | matches line 146 |
| `chartIndices_bound` (118) | §2.5 combinatorial bound | (2,1,(0,1)): 0≤0; (3,4,(0,0,4)): 6≤6; (5,4,(0,0,0,2,2)): 8≤8; (4,5,(0,0,2,3)) noncyclic-order module: 6≤8; h=1, μ=(m): V=∅, RHS=(1−1)m−0=0; wrong model: `Monotone μ` dropped, μ=(4,0,0): RHS=(−2)4−2=−10<0≤2|V|, so the hypothesis is load-bearing; theorem is vie06 Theorem 5.3 (line 431, "Let (A,φ) be an extended semi-module for μ") with a purely combinatorial proof (lines 498–557, induction on the Lemma 3.6 sequences) | sound; finiteness of V follows from (3): for a with Ici a ⊆ A, φ(a−h)=φ(a)−1 leaves no room for φ(b) |
| `exists_isCyclic_chartIndices_eq` (128) | §2.5 attainment | existence of A of type μ: Lemma 3.3 (line 123) needs ν≼μ′, which for increasing μ with Σμ=m and gcd(m,h)=1 is Σ_{i≤k}μ_i<km/h for 0<k<h (equality would force h∣k); cyclic φ on it is for μ_dom=μ (lines 147–151); Prop. 5.2 (line 382) gives 2|V|=RHS: 8=8 at (4,5,(0,0,2,3)); 6=6 at (3,4,(0,0,4)); 0=0 at (2,1,(0,1)) | sound |

Padding probe: every definition is used by a `sorry`'d headline; no API lemma, no boundary theorem, no example. The two theorems are not one-tactic consequences of anything at the pins (no semi-module theory exists there).

### Computed target ledger (one row per numbered target; only values I recomputed this round are listed, the round-1 tables cover the rest and were spot-checked)

| Target | Instances and computed values | Result |
|---|---|---|
| 0.1 | S₃, I=1, b=(12), g=(123): g⁻¹bg=(13)≠(12); I=〈(12)〉: r_b(gi)=i⁻¹r_b(g)σ(i), same double coset | holds |
| 0.2 | A₁, w=s, b=1: (1+1−0)/2=1; GL₂, w=b=t^(1,0): (1+0)/2−1/2=0; GL₂ w=s t^(1,0) basic: (2+1−1)/2=1 | holds |
| 0.3 | A₂ λ=6ω₁∨=4α₁∨+2α₂∨: 〈α₂,λ〉=−4+4=0, strip kept; λ−2ρ∨=2α₁∨ | negative control holds |
| 0.4 | k[ε]/ε², g=1+εt⁻¹E₁₂: σ(g)=1, r_1(g)=1−εt⁻¹E₁₂∉GL₂(R[[t]]); G_m, μ=0, b=ϖ: κ 1≠0 | holds |
| 0.5 | split torus rank r: X_0(1)=X_*(T)=ℤ^r, dim 0; r=0: one point | holds (F08 repaired) |
| 0.6 | (hg)⁻¹b′σ(hg)=g⁻¹bσ(g) for b′=hbσ(h)⁻¹; S₃: (123)(12)(132)=(23) | holds |
| 1.1 | t^(1,0): 1−1=0; A₁ s: 1−0=1 | holds |
| 1.2 | s₀s₁s₀: 1+max(−∞,1)=2 | holds |
| 1.3 | T_w≡zT_(s₁s₀)+T_s₁; (3+1+0)/2=2; v-degree would give 3, q-degree 5/2 | holds |
| 1.4 | three new Checks recomputed in the repair table (1≥1; ∅ vs 1; 1≥1; ∅ vs 2) | holds |
| 2.1 | h=2,m=1: B={0,1}, type (0,1); A=1+ℕ: ΣB=3, shift −1; h=1: ℕ | holds |
| 2.2 | (5,4) example: ΣB=10, φ(−1)=0<1=jump | holds |
| 2.3 | h=2,m=1 standard lattice: A=ℕ, φ=⌊(a+1)/2⌋; shift by 1: ΣB 1→3, component 0→1 | holds |
| 2.4 | (3,4,(0,0,4)): B={−3,1,5} (3b₀+12=3), V three pairs, U=A³ | holds (vie06 Theorem 4.3(2)) |
| 2.5 | nonemptiness iff Σμ=m (vie06 line 82, for dominant μ partial averages ≤ total average); 2d=Σ(2i+1−h)μ_i−(h−1): 0, 6, 8, 8 | holds |
| 3.1 | G_a with b acting by t^k: k>0 bijective on t^aO (correction 0), k<0 maps t^aO onto t^(a+k)O (correction k): Σmin(〈α,ν〉,0) ✓; GL₂ a−b=−2: −2=〈ρ,ν_M−ν_G〉 | holds (sign re-derived) |
| 3.2 | GL₂→PGL₂: ℤ→ℤ/2; G_m, b=ϖ, w=1: 0=1+(σ−1)α has no solution; lifting step derived above | holds |
| 3.3 | GL₂ ordinary: J_b/Z=G_m split rank 1, rejected; basic 1/2: rank 0 | holds |
| 3.4 | GL₂/T, μ=(1,−1), μ_M=0: 0+1+0−0=1; b=diag(1,t), μ_M=(0,1): 0+(−1)−(−1)=0 | holds |
| 3.5–3.6 | d=2: UV=[[2,1],[1,1]]≠VU=[[1,1],[1,2]]; τ_i=σ^(−i)τ₀ | holds |
| 3.7 | GL₂ ((1,0),(1,0)): endpoint (2,0) fibre 0, (1,1) fibre P¹, 〈ρ,(1,−1)〉=1 | holds |
| 3.8 | GL₂ μ=(1,0) basic: 1/2−1/2=0; μ=(1,−1), b=1: 1; μ=(1,0), b=1: κ 0≠1 empty | holds |
| 3.9 | t^(1,0): 0≤0; A₁ s: 1≤1 | holds |
| 4.1 | GL₂ λ=(1,0): ν=(1/2,1/2)≤λ nonempty; (2,−1) not ≤ | holds |
| 4.2 | t^λ: generic [t^λ]; τ: [τ] | holds |
| 4.3 | GL₂ s t^(1,0): basic dim_I N=1+0, c=1; ordinary 1+1=2, c=0; dim I/I_n=4n | holds |
| 4.4 | t^(1,0): 1−0=1−0; A₁ s: 1−1=0−0 | holds |
| 4.5 | D=3,2, d=4,3: both −1 | holds |
| 4.6 | GL₂ s t^(1,0): ordinary (2+1)/2−1/2=1, basic (2+1−1)/2=1; chain (1+1−0)/2=1 | holds |
| 4.7 | x=s, λ=(1,0): ℓ=2, ℓη=1, 〈λ,2ρ〉=1; 〈λ,2ρ〉=〈λ^♦,2ρ〉 since 2ρ is σ-invariant | holds |
| 5.1 | A₁ λ=ω∨, y=s: 0−_domω∨=ω∨; unitary A₂ λ=ρ∨, y=s₁: λ^♭♭=ω₁∨, λ−λ^♭♭=ω₂∨∉Q∨ | holds |
| 5.2 | A₁ x=y=s, λ=2ω∨: w₁=s t^ω∨ (ℓ2), w₂=t^ω∨s (ℓ0), product t^(−2ω∨), 2+0=2 | holds |
| 6.1 | u=v=s: ordinary endpoint fibre A¹, Demazure endpoint G_m, both dim 1 (GS 0.39 bounds 1 and 1) | holds |
| 6.2–6.3 | A₁: N₁=(0+2−2)/2=0, N₂=0+0−0=0; unitary A₂: N₂=1+1−1=1=ℓη−ℓa=2−1 | holds |
| 6.4 | A₁: γ=2ω∨, a=1, support ∅⊇∅ | holds |
| 7.1 | split A₂, x=s₁, y=s₂, λ=2ρ∨: x-conjugate t^λs₂s₁ (2,2); y-conjugate (0,−2) | holds |
| 7.2 | GL₂ torus: {(1,0),(0,1)} over κ=1 | holds |
| 7.3 | A₁ t^(nα∨), b=1: gap nα∨>0, empty; b=t^(nα∨): 2n−2n=0 | holds |
| 7.4 | A₁ a=s, γ=α∨: T_(s₁s₀s₁)≡zT_(s₀s₁)+T_s₀, (3+1+0)/2=2; T_s²=(v−v⁻¹)T_s+1 from (U_s−q)(U_s+1)=0 with T_s=v⁻¹U_s | holds |
| 7.5 | G_m over 𝔽₂, ζ³=1: (ζ,ζ)↦ζ·ζ·ζ^(−2)=1; (ζ,1)↦ζ² | holds |
| 7.6 | GL₂ a=s, γ=(1,0): both dims 1 | holds |
| 8.1–8.2 | PGL₂ s t^(nα∨): alcove (2n,2n+1), dim n+1; unitary A₂: (4+2)/2=3 | holds |
| 8.3 | λ≠0 dominant: positive on every simple coroot of each component where nonzero; σ-transitive on components ⇒ λ^♦ positive everywhere; Res PGL₂ (1/2,1/2) | holds |
| 8.4 | 2ρ∨−ρ_J∨−η_J∨ has fundamental-coweight coefficients in {0,1,2}, dominant; A₁ λ=α∨: dim 2 | holds |

Gaps: the 13 slugs agree between README and `plan.json` (texts identical, checked mechanically, the two revised ones included); each names an earlier supplier; none asks for what the pins or an earlier roadmap provide (greps above). Only their section labels drift (S01, S02).

## Not verifiable

- No Lean was run (the brief forbids builds); the `#check` comparison uses the elaborated-signature inventory the worker produced for this head, and the repair report's statement that `ExtendedSemiModule 1 1 ![1]` is inhabited.
- The universal-homeomorphism form of §3.2 at residue characteristics dividing |π₁(G_ad)|, the mixed-characteristic chart morphisms of §2.4 and all "general local-field transfer" clauses are this roadmap's own targets; the sources prove the equal-characteristic or good-characteristic cases (ghn15 Corollary 2.2.2(1) an isomorphism under the characteristic hypothesis, (2) a bijection of points in mixed characteristic). They were checked for consistency, not proved.
- The he21 extraction is OCR; Theorem 6.1's printed hypothesis (line 481) is partly unreadable and was read from Theorem 1.1 and Remark 6.2, as in round 1.
- Ownership against open pull requests was checked through `roadmaps grep` at the index of 2026-11-04 and the sibling checkouts the brief lists; package folders at the design stage were read from their plans.

## Source issues

- none new beyond those recorded by the round-1 passes (re-verified this round: he14 Proposition 11.7, line 1289, is stated for simple G only; zhu17 §3.1.3, line 2226, prints the embedding cycle τ_i=σ^i(τ₀) against its own norm order; ghn15 Proposition 3.5.1, line 505, lacks the basic hypothesis, corrected in print at ghnerr Proposition 0.0.2; ghn15 Proposition 2.2.1 corrected in print at ghnerr Proposition 0.0.1).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "41e861129dd3fb136025967fd8b779fb365b4400", "job": "RT-HeckeStacksAndLocalShtukasPartII~2b", "model": "fable", "worker": "chris-x10"} -->
