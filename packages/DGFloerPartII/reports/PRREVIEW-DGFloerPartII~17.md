# Review of DGFloerPartII (pull request #1799 at f27b94b)

**Verdict:** needs changes

This is a full review: the folder changed by 242 lines since `ba8a414`, the head the previous
review read. The repair added three Lean statements (`contractibleHZCapacity_codiscBundle_lt_top_of_fiberedFamily`, `…_of_sphereBundle_even`, `…_of_sphereBundle_odd`) and the README text behind them. It also rewrote the
module docstring and the odd-case construction of 4.2. Main is at `3090489`.

Six findings, three of them blocking:

- **R01 (P2)** carries the previous R01: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7.
- **R02 (P2)** is new. Draft #1808 gives the compact-generation coreflection of 1.0 to AlgebraicTopology and 4.2a–4.2c to TopologicalKTheory. The Downstream bullet plans a cycle.
- **R03 (P2)** is new. For a disconnected fibre, the hypothesis of the new fibered-family statement is not the one Proposition 6.15's route needs, and one README sentence about it is false.
- **R04 (P3)** carries the previous R02: the description is stale.
- **R05 (P3)** and **R06 (P3)** are new.

The previous R03 (docstring carriers) and R04 (`q` versus `x` in 4.2) are repaired. The gate passes
against the moved order, with the build.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7, and the description does not order DGFloer #1798 first

**Location.** `TauCetiRoadmap/DGFloerPartII/README.md` lines 41–43: "The base roadmap, cited as
**DGFloer** by layer and item, owns every other numbered statement of the source". The
description's merge-order paragraph ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull
request** (#1799)", and its Depends-on list names only #1742 and #942.

**Claim.** This roadmap is the single owner of the following:

- Theorem B;
- the numbered statements of §§6.3–6.4 and §7;
- their homogeneous carriers, explicit degrees and projective loop-space computations.

**Witness.** On main (`3090489`), `TauCetiRoadmap/DGFloer/README.md` still holds all of it:

- Layer 1 item 7 (line 834) and item 8, "Degrees of explicit maps" (line 841);
- Layer 5 item 7, "Based-loop Morse–Bott energy on CPᵈ and HPᵈ" (line 1053);
- Layer 10 item 5, "Theorems A, B, C … (Theorems 5.10, 5.14, 5.15)" (line 1562);
- Layer 11, "manifolds abundant with 2-spheres, and knotted hypersurfaces" (line 1577).

Only #1798 (head `1004825`) hands this over. Its lines 50–54 do so ("are the subject of the
continuation roadmap DGFloerPartII"), and so do lines 4286–4288.

**Repair.** The README needs no change. Add #1798 to the description's Depends-on list. Add this
sentence to its merge-order paragraph:

> #1798 (DGFloer) merges before this pull request or together with it. It moves the source's
> Theorem B, §§6.3–6.4 and §7 out of DGFloer's Layers 1, 5, 10 and 11 and into this roadmap,
> together with the homogeneous carriers, explicit degree computations and projective loop-space
> computations they rest on. Every DGFloer id this README cites resolves on main and at #1798,
> through #1798's numbering note.

**Tested.** Each DGFloer id this README cites resolves in both places:

- "Layer 11 … the finite cover `T × K → G`" (README line 89) is main's Layer 11 item 3 (line 1623)
  and #1798's §11.1 (its line 4139).
- "Layer 4 item 5 (the base's §4.1)" is #1798's "Layer 4 item 5: Layer 4 item 1" (its numbering
  note, line 159).
- Corollary 2.13 is main's Layer 5 item 5, which states it.

## R02 (P2) — #1808 owns the coreflection of 1.0 and the content of 4.2a–4.2c, and the Downstream bullet closes a cycle

**Location.**

- README lines 48–54 and 491–507 (1.0's coreflection), with `Suggested.lean` lines 106–108
  (`compactlyGeneratedToTop_isLeftAdjoint`).
- README lines 70–73 and 1388–1640 (4.2a–4.2c), with `Suggested.lean` lines 327–392.
- README lines 1999–2000: "TopologicalKTheory can consume 4.2a–4.2c in T7, its real `K`-theory".

**Claim.** This roadmap is the only owner of the following:

- the coreflection `k` and `compactlyGeneratedToTop_isLeftAdjoint`;
- the stable `O` and `SO` with the finite-to-stable range;
- the Clifford chain and real Bott periodicity.

The README also says that TopologicalKTheory may consume 4.2a–4.2c.

**Witness.**

- **The coreflection.** Draft #1808 (`9ae8cc0`) revises AlgebraicTopology:
  - `TauCetiRoadmap/AlgebraicTopology/README.md` line 138: "Stage 4.5 owns the compact-generation
    coreflection `k` … (`compactlyGeneratedToTop_isLeftAdjoint`)". Line 902 adds "Own the single
    compact-generation coreflection used here and below".
  - Its `Suggested.lean` line 110 states `theorem compactlyGeneratedToTop_isLeftAdjoint`.
  - Its scope line says any convenient category "consumes it rather than constructing a second
    one".
- **4.2a–4.2c.** #1808's `TauCetiRoadmap/TopologicalKTheory/README.md` covers the same ground:
  - Lines 149–152: "T7.0a owns the stable orthogonal and special orthogonal groups O and SO …
    T7.0b owns real Bott periodicity, the eight stable Bott maps and the stable homotopy groups of
    O".
  - T7.0a (line 1766) has the block inclusion `diag(A,1)` with the new coordinate last and the
    range "bijective for i≤r−2 and surjective for i=r−1".
  - T7.0b (lines 1831 and 1848) builds the Clifford chain.
  - Neither section cites this roadmap.
- **The cycle.** Main's `TauCetiRoadmap/GeneralizedCohomology/README.md` line 2612 says "G4.0a/b
  consume TopK T1.5–6". This README consumes G4.0b in 4.2a–4.2b (its line 400). So TopologicalKTheory
  T7 consuming 4.2a–4.2c gives the roadmap-level cycle TopologicalKTheory → DGFloerPartII →
  GeneralizedCohomology → TopologicalKTheory. #1807's TopologicalKTheory (`7871afe`, its line 196)
  plans exactly that edge.
- **Order.** TopologicalKTheory is on main, hence earlier than this roadmap, so the edge is also
  upward.

**Repair.** One owner, fixed by the merge order. AlgebraicTopology and TopologicalKTheory are on
main, and neither can consume this roadmap: this roadmap consumes AlgebraicTopology Stages 2, 4.4,
6 and 8, and it consumes TopologicalKTheory through GeneralizedCohomology G4.0b. So the owners are
AlgebraicTopology Stage 4.5 and TopologicalKTheory T7.0a–T7.0b, as #1808 has them. In this folder:

1. **1.0.**
   - Replace the "The coreflection" bullet (lines 491–507) with a citation of AlgebraicTopology
     Stage 4.5 for `k`, its counit and `compactlyGeneratedToTop_isLeftAdjoint`.
   - Delete that theorem from `Suggested.lean`, together with its bullet in the module docstring.
   - Keep `compactlyGeneratedSpace_prod` only if Stage 4.5 states the locally compact product only
     for CW complexes, and say in one clause how it differs.
   - Delete the sequential-colimit bullet (lines 545–563): it has no consumer once 4.2a–4.2c go.
2. **4.2a–4.2c.**
   - Delete them and their Scope bullet (lines 70–73).
   - Add a "Left to named roadmaps" row and a supplier-contract entry for TopologicalKTheory
     T7.0a–T7.0b.
   - Point 4.3's *Needs:* there for the stable term.
   - Delete `bijective_map_soBlockInclusion`, `surjective_map_soBlockInclusion`,
     `nonempty_pi_add_eight_SO_mulEquiv`, `subsingleton_pi_SO_of_stable`,
     `nonempty_pi_SO_mulEquiv_zmod_two` and `nonempty_pi_SO_mulEquiv_int`. Keep `SO` and
     Lemma 6.35's statements. Delete `soBlockInclusion` and `soBlockInclusion_one` once nothing
     uses them.
3. **Downstream.** Replace the first Downstream bullet with "TopologicalKTheory consumes nothing
   from this roadmap."
4. **Description.** Name #1808 in the merge-order paragraph, before this pull request.

If #1808's Stage 4.5 and T7.0a–T7.0b are withdrawn instead, step 3 is still required, because of
the cycle.

**Tested.** After the repair, the new edges go to two roadmaps on main, AlgebraicTopology and
TopologicalKTheory, so neither is upward. T7.0a's *Needs:* are T1.5, T1.6a, T1.6c, DGFloer Layer 1
item 2 and Tau Ceti; none of them is this roadmap, so no cycle remains.

## R03 (P2) — Fibered families with a disconnected fibre: the hypothesis is not the class Proposition 6.15 shrieks to, and the README's sign claim is false

**Location.** README lines 1277–1280: "the fibre class is `j_*[F]` … through a trivialization at
`q₀`. The sign of `j_*[F]` depends on that trivialization and its vanishing does not." The matching
Lean hypotheses are `Suggested.lean` lines 164–176: `oF`, `e₀` and `hσj`.

**Claim.** The route is Proposition 6.15 through Corollary 2.13. The README says this route proves
the statement for any orientation `oF` of `F` and any trivialization `e₀` with `j_*[F] ≠ 0`.

**Witness.** Remark 2.10 and Corollary 2.13 (`bdho-cotangent` lines 1209–1212 and 1237–1241,
pp. 28–29) shriek `[Σ]` to the fibre class for the orientation that `Σ` and `Q` induce.
`Definition 6.14` (line 4621) leaves that orientation implicit. A two-circle example shows both
defects:

- **The sign claim.** Take `Q = S²`, `F = S¹ ⊔ S¹`, `S = S² × F`, and on both circles the `SO(2)`
  family of Example 6.37, of class `α′ ≠ 0`.
  - The product trivialization gives `j_*[F] = 2α′`.
  - Composing it with the fibre homeomorphism that swaps the circles and reverses one gives
    `α′ − α′ = 0`.
- **The route.** Keep the same `S`, but reverse the family on the second circle and give `S` the
  product orientation.
  - The induced fibre class is `α′ − α′ = 0`.
  - With the second circle reversed in `oF`, `hσj` holds with `2α′`.
  - Reorienting `S` component by component would repair this example. The README does not do
    that, and it is unavailable when monodromy permutes the components of the fibre.

**Repair.** The Lean statement stays as it is (it is true). In the README:

1. Replace the sentence "The sign of `j_*[F]` depends on that trivialization and its vanishing does
   not." with:

   > For connected `F` another trivialization or orientation changes `j_*[F]` by a sign. For
   > disconnected `F` it can change which components cancel, and `oF` need not be the orientation
   > that `oS` and `oQ` induce on the fibre, which is the one Corollary 2.13 uses (Remark 2.10). The
   > route therefore first picks a component `F₁` of the fibre over `q₀` with `j_*[F₁] ≠ 0`. One
   > exists, because `j_*[F]` is a signed sum of these classes.
   >
   > The components of the fibres of `p` form a finite covering of `Q`; pass to its component
   > `Q̃ → Q` through `F₁`. Restrict the pulled-back bundle to the sub-bundle with fibre `F₁`,
   > oriented by pulling back `oS`, and lift `σ`. `S²` is simply connected, so the based mapping
   > spaces of `Q̃` and `Q` agree. Proposition 6.15 and Theorem H on `Q̃`, for the lifted metric,
   > give `c°_HZ(D*Q̃) < ∞`, and the source's Remark 6.2 (p. 100) descends this to `D*Q`.

2. Add the two-circle example above as a Check.
3. Add "the source's Remark 6.2" to 4.2's *Needs:*.
4. Optionally, in the docstring at `Suggested.lean` line 158, add that a disconnected fibre is
   first reduced to a component on a finite cover.

**Tested.** On the witness, `F₁` is the first circle, `Q̃ = S²` and `j_*[F₁] = α′ ≠ 0`. Proposition
6.15 applies to `S² × F₁` with either orientation, giving the shriek `±α′`, whichever
trivialization is used. Remark 6.2 (`bdho-cotangent` line 4351) states that finite capacity on the
cover gives finite capacity on the base.

## R04 (P3) — Not repaired: the description is stale

**Location.** The description says:

- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones";
- "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps";
- "TangentialBordism's compact-image embedding";
- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`".

**Witness.**

- The folder has 0 occurrences of "HomotopySpheres"; 1.0 builds the convenient carriers.
- 2.3 (README lines 988–989) uses the degree gaps for `ΩHPᵈ`.
- 3.1 uses TangentialBordism B5 and B6.3 (README lines 1128–1129).
- `Suggested.lean` has 0 occurrences of "rotation". It now also states the fibered-family and
  sphere-bundle theorems.

**Repair.** Make five edits to the description:

1. Replace "HomotopySpheres' James construction and Bott periodicity" with
   "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem".
2. Replace "its boundaries vanishing … degree gaps" with "the boundaries for `ΩCPᵈ` vanishing by a
   Hopf-fibration rank count, and those for `ΩHPᵈ` by the degree gaps once the Thom model is
   built".
3. Replace "with HomotopySpheres' convenient ones" with "with the convenient carriers of 1.0 on
   Mathlib's `CompactlyGenerated`".
4. Replace "TangentialBordism's compact-image embedding" with "TangentialBordism B5's structured
   Pontryagin–Thom and B6.3's rational oriented-bordism surjection".
5. Replace the last sentence with:

   > `Suggested.lean` states Theorem B; the finiteness of the capacity in Theorem I for fibered
   > families of 2-spheres, for sphere bundles over highly connected bases, for spheres, for
   > manifolds `ℓ`-covered by diffeomorphisms, for non-aspherical compact Lie groups and for `CPᵈ`
   > and `HPᵈ`; Lemma 6.35's seven low-rank values, its splitting for odd `n ≥ 17` and its torsion
   > for every odd `n`; and Theorem G.

   Then list whichever statements of 1.0 and 4.2a–4.2c remain after R02.

**Tested.** Every statement named in the replacement is in `Suggested.lean`, at lines 132, 159,
187, 214, 242, 257, 275, 305, 318, 398–439 and 455.

## R05 (P3) — 4.2 cites the source by a line range of a text extraction

**Location.** README line 1268: "takes the total space closed and orientable (`bdho-cotangent`
lines 1237–1239)".

**Witness.** No README on main cites a source by extraction line; a search of main's READMEs gives
0 hits. The statement is the source's Corollary 2.13, on printed p. 29 (footer at
`bdho-cotangent` line 1279).

**Repair.** Replace the parenthesis with "(the source paper, Corollary 2.13, p. 29)".

## R06 (P3) — Proposition 6.13 with a disconnected factor leaves the definition of abundance

**Location.**

- README lines 1242–1243: "if `M` is abundant and `N` is closed oriented, `M × N` is abundant".
- README lines 1818–1819: "products of any of these with a closed oriented manifold".

**Witness.** Take `N = S⁰`, a closed oriented `0`-manifold. Then `M × S⁰ = M ⊔ M` is not
connected, and 4.1's definition (line 1232) applies only to closed connected oriented manifolds.
The source makes the same slip (Proposition 6.13, p. 106, against Definition 6.11).

**Repair.** In both places write "closed connected oriented `N`", respectively "closed connected
oriented manifold".

**Tested.** For connected `N`, `M × N` is closed, connected and oriented. The class `α × [N]` has
degree `deg α + dim N` and shriek `j_!α × 1`, as in 4.1's third Check.

## Previous findings

| Previous finding | Status at this head | Here |
| --- | --- | --- |
| R01 (P2): main's DGFloer still owns Theorem B etc.; #1798 not ordered | Not repaired. The description is unchanged. Main's DGFloer lines 834, 841, 1053, 1562 and 1577 are unchanged. | R01 |
| R02 (P3): stale description | Not repaired. The description is unchanged and `Suggested.lean` has grown. | R04 |
| R03 (P3): docstring names missing carriers that the pins have | Repaired. Lines 73–86 now state fibered families and sphere bundles, and give the Clifford-chain reason as the missing manifold structure on `Ω_k(n)`, `k ≥ 1`. | — |
| R04 (P3): 4.2 odd case introduces `q` and uses `x` | Repaired. Lines 1316–1317 now read "For `x ∈ Q`, a unit vector in the fibre of the ambient rank-`n+1` Euclidean bundle, put `V_x = u(x)^⊥` in that fibre". | — |

The docstring repair checked out at the Tau Ceti pin:

- `TauCeti.Lie.isEmbeddedLieSubgroup_unitarySubgroup` is at `Geometry/Lie/Subgroup/Unitary.lean`
  line 117.
- `TauCeti.Manifold.energy` is at `Geometry/Manifold/Riemannian/Energy.lean` line 64.
- `TauCeti.Manifold.IsConjugateOn` is at `Riemannian/Jacobi/Conjugate.lean` line 80.

No repair report marks a finding "not actionable in this package".

## Verified sound

### Gate, dependency check and build

The worker's gate with the configured order gives `depcheck: UPWARD: DGFloerPartII (#46) ->
GeneralAlgebraicKTheoryPartII (#335)`. This is the moved case: the moved order lists
GeneralAlgebraicKTheoryPartII at line 334 and this roadmap at line 335.

With `--order merge-order-moved.txt --build`:

    gate DGFloerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

The brief's dependency check:

    depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

Other checks:

- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

### Elaboration, signatures and padding

- **`#check`.** I elaborated `#check @name` for all 31 declarations, plus
  `HomologicalOrientation.mapFundamentalClass`, `IsContinuousRiemannianBundle` and
  `Bundle.Trivialization`, in one scratch copy. It exits 0 with 27 `sorry` warnings: 31
  declarations less `SO`, `soBlockInclusion`, `soBlockInclusion_one` and the `CPᵈ` instance.
- **New signatures.** Every binder the README states is present:
  - fibered family: `ConnectedSpace Q`, `CompactSpace F`, `hF`, `hp`, `hσ`, `he₀`, `hj`, `hσj`;
  - even sphere bundle: `Even n`, `2 ≤ n`, `2n`-connectivity as `i + 1 ≤ 2 * n`;
  - odd sphere bundle: `n % 4 = 3`, `(n+1)`-connectivity, and continuity, orthogonality and
    independence of `u`, `w`.
  - `mapFundamentalClass` takes `[CompactSpace M]` before the map, so `oF`'s use needs
    `CompactSpace F`, which is present.
  - `S` is compact without the hypothesis. `Q` is compact Hausdorff, so finitely many compact
    `K_q ⊂ e_q.baseSet` cover it, and each `p⁻¹(K_q) ≅ K_q × F` is compact.
  - `oS` forces `dim ES = dim E + dim EF` for nonempty `S`, by invariance of domain on
    `U × F`.
- **One-tactic probe.** On the three new theorems, `first | infer_instance | rfl | (simp; done) |
  exact?` fails three times with "`exact?` could not close the goal". The other 24 sorried
  statements are textually unchanged since `ba8a414`, where the same probe failed on all of
  them. There is no padding.
- **Library leads.** `library-matches.md` lists no library declaration that proves any new
  statement. Its LeanSearch hits are `FiberBundle` API.

### Headline theorems

- **Stated:**
  - Theorem B (5.14);
  - Theorem I's capacity form for fibered families, even and odd sphere bundles, spheres,
    `ℓ`-covered manifolds, non-aspherical compact Lie groups, `CPᵈ` and `HPᵈ`;
  - Theorem G;
  - Lemma 6.35;
  - the finite-rank Bott statements;
  - 1.0's coreflection and product criterion (but see R02).
- **Named as not statable:**
  - Theorem H and abundance (no shriek map at the pins);
  - products (their hypothesis is abundance);
  - Proposition 6.36 (no smooth `G ⧸ H`);
  - stable `O` (no carrier);
  - the Clifford chain (no manifold structure on `Ω_k(n)`).
- **Statable but absent:** none.

### Seeded source sample

Locators are `bdho-cotangent` line numbers unless named. Printed pages come from the page footers.

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | Mathlib `ContinuousMap.compactOpen` and sequential ⇒ compactly generated; 1.0's Dowker Check | as stated |
| 1.2 | Prop 6.18 (4685–4687, p. 108); Hatcher Thm 4J.1; GeneralAlgebraicKTheoryPartII §4.30b at `ca44359` lines 1212–1231, which has the James map, the flat tensor-algebra homology and Bott–Samelson | as stated |
| 1.5 | DGFloer Layer 1 item 5 (main); GeneralizedCohomology G5 item 2 (main line 1523, unframed collapse); TangentialBordism B5.1 (#942 line 1453, coefficient collapse, sign under reframing) and B5.5 (line 1801, signed count) | as stated |
| 2.1 | Prop 6.39 proof (5283–5288, p. 121); Ziller not verifiable | indices recomputed below |
| 2.2 | Prop 6.38 (5218–5241, p. 120) | as stated; the source's "twice" is a source issue |
| 2.3 | 5283–5311 | gaps recomputed |
| 2.4 | DGFloer Layer 4 item 5 and Layer 5 item 4 on main; #1798 numbering note line 159 | resolves |
| 3.1 | Thm 5.14 proof (4273–4279, p. 98: Thom, `N·α = φ_*[S]`, `d = Nb`) | as stated |
| 3.2 | Thm B (243–246, p. 7); Thm 5.10 (4140–4150); Thm 5.14 (4267–4272); Hatcher Thm 3.26 (pdf p. 245) | as stated. The README routes through 5.10's condition 2, the source through Prop 5.13; both are valid. |
| 4.1 | Def 1.7 and Thm H (415–426, pp. 10–11); Def 6.11 and Thm 6.12 (4517–4548, p. 104); Prop 6.13 (4608–4616, p. 106) | as stated, except R06 |
| 4.2 (new) | Def 6.14 and Prop 6.15 (4621–4643, p. 106); Cor 2.13 and Remark 2.10 (1209–1241, pp. 28–29); Prop 6.23 (4849–4856, p. 112) and proof (4884–4917, p. 113); Remark 6.25 (4878–4881); Remark 6.2 (4351–4353, p. 100); Hatcher Prop 4.48 (HLP for CW pairs, any base); DGFloer Layer 2 item 2 on main (locally trivial bundles over paracompact bases are Hurewicz) | as stated, except R03 |
| 4.2b | `eschenburg-hanke-bott` 264 (eq. (3)), 284–290 (Thm 3), 299–350 (Thm 4 and proof); Milnor not verifiable | as stated |
| 4.2c | `eschenburg-hanke-bott` 314–350: `T_{J_k}P_k`, minimal invariant subspaces, Cases 1–2 at `k+1 ≡ 3 (mod 4)` | as stated |
| 4.3 | Lemma 6.35 (5073–5094, p. 117); first and second proofs of 6.34 (5095–5139); Defs 6.26 and 6.32; Props 6.29, 6.31 and 6.33 (4919–5062) | as stated, `π₈(SO(9))` corrected |
| 4.4 | Prop 6.36 (5156–5200, pp. 118–119); Example 6.37 (5201–5210) | as stated, with the nonorientable conclusion added |
| 4.5 | Thm I (430–445, pp. 10–11); Props 6.38 and 6.39 (5218–5250); CROSS covering remark (5214–5217) | as stated, without `CaP²` |
| 4.6 | §7 setting (5354–5364, p. 123); Thm 7.1 (5366–5372); Lemma 7.7 (5503–5505, p. 126) and its application (5534–5539) | as stated; the `d ≥ 2` gap is a source issue |
| 1.0 | `strickland-cgwh` 122 (Prop 2.6), 159, 177, 290; `rezk-cg-spaces` 313 (7.3), 382, 409, 433; Hatcher Thm A.6 (pdf p. 533) | as stated |

The README flags no locator as unverified.

### Adversarial table

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| fibered family (Lean) | `F` a point, `S = Q = T^r`, `σ` constant | `j_*[pt] = [pt] ≠ 0` in `H₀(Ω²T^r)`, yet `c°_HZ(D*T^r) = ∞` | `hF` needed and present | none |
| fibered family | `Q = S² ⊔ T²`, `F = O(2)` | class at `q₀ ∈ S²` nonzero (`±2x²` under `β_*`); `c° ≥ c°(D*T²) = ∞` | `ConnectedSpace Q` needed and present | none |
| fibered family | `F = ∅` | `[∅] = 0`, so `hσj` is false | consistent | none |
| fibered family | `Q = S²`, `F = S¹ ⊔ S¹`, `α′` on both circles | product `e₀`: `2α′`; swapped and reversed `e₀′`: `0`; induced orientation with the second family reversed: `0` against `oF`'s `2α′` | sign claim false, route incomplete | R03 |
| fibered family on `T^r` | `dim F ≥ 1` | `π_i(Ω²T^r) = π_(i+2)(T^r) = 0`, so `H_(≥1)(Ω²T^r) = 0` and `hσj` fails | consistent with `c° = ∞` | none |
| sphere bundle, even | `B` a point, `n = 2, 4` | `S(V) = S², S⁴`; matches the sphere statement | true | none |
| sphere bundle, even | `n = 0`, `B = T²`, trivial line | `S(V) = T² ⊔ T²`, `c° = ∞` | `2 ≤ n` excludes it | none |
| sphere bundle, even | twistor `S² → CP³ → S⁴` | `π₄(S⁴) = ℤ`, so `hB` fails at `i + 1 = 4 = 2n`; `π₃(CP³) = 0` kills the class | hypothesis sharp | none |
| sphere bundle, even (Serre) | `q ≤ 2n − 3` | sources `E_(r,q−r+1)` with `2 ≤ r ≤ q+1 ≤ 2n−2`; `H_r(Ω²B) = 0` there | fibre inclusion injective | none |
| sphere bundle, odd | `B` a point, `n = 3`, `u = ix`, `w = jx` | `⟨x, ix⟩ = 0`, `⟨ix, jx⟩ = ⟨x, −kx⟩ = 0`, independent | true | none |
| sphere bundle, odd | `n = 5` | `S⁵` has one field (`ρ(6) − 1 = 1`), so `huw` fails at every fibre; `hn` excludes it too | `hn` redundant (note only) | none |
| sphere bundle, odd (Serre) | `(n+1)`-connected `B` | `π_i(Ω²B) = 0` for `i ≤ n−1`, so `H_(n−2)(Ω²Sⁿ) = ℤ` injects | true | none |
| sphere bundle, any base | `B` arbitrary | Hatcher 4.48: HLP for CW pairs over any base, so `Ω²S(V) → Ω²B` is Serre; Gram–Schmidt gives local orthonormal frames from the continuous metric | generality supported | none |
| Theorem B (Lean) | `T^r`; `ℝP³`; `U = ∅`; `S² ⊔ T²` | `π_(ℓ+3)(T^r) = 0`, torsion, `hQ` false; `π₃(ℝP³) = ℤ`, `hQ` true; `H_n(∅) = 0`; excluded by `ConnectedSpace` | true | none |
| Theorem B vs 5.14 | nonorientable closed connected `Q` | Hatcher 3.26: `H_n(Q; ℤ) = 0`, so `hU` is false | orientability implied | none |
| Theorem B route | `x` of infinite order, `d = Nb` | `d^m x ≠ 0` for every `m`: condition 2 of Thm 5.10 (4146–4147) | sound | none |
| Theorem G (Lean) | `k = 2, 3, 4` | `if Even k then 2k−2 else k−1` = `2, 2, 6`; no ℕ-subtraction junk for `k ≥ 2` | as stated | none |
| Lemma 7.7 | `m = 1` (`k = 2, 3`) | source `d ≥ 2` (5503) applied with `d = k−2 = 1` and `2k−3 = 1` (5536) | README's `m ≥ 1` needed | none |
| 1.3 dimensions | `V_(n,2)`, `U(n)/U(n−2)`, `CPᵈ`, `HPᵈ` | `n(n−1)/2 − (n−2)(n−3)/2 = 2n−3`; `n² − (n−2)² = 4n−4`; `(d+1)² − d² − 1 = 2d`; `(d+1)(2d+3) − d(2d+1) − 3 = 4d` | as stated | none |
| Rotation convention | `R(p,u;θ)` | `Rp = cosθ p + sinθ u`, `Ru = cosθ u − sinθ p`, `det = 1` | as stated | none |
| 1.4 degrees | `n = 1, 2, 3, 4` | rotation family `1 + (−1)^(n−1) = 2, 0, 2, 0`; Stiefel domain `1 + (−1)ⁿ = 0, 2, 0, 2` | as stated | none |
| 2.1 indices | `CPᵈ`, `HPᵈ` | `(2k−1) + (k−1)(2d−2) = 2d(k−1)+1`; `3(2k−1) + (k−1)(4d−4) = 4dk − 4d + 2k + 1 = 2(k−1)(2d+1)+3` | as stated | none |
| 2.2–2.3 cells | `CP²`; `HP²` | `b_k = 2dk`, `a_(k+1) − b_k = 1`; `HP²`: `3, 10, 13, 20`, gap `3`, `H_(4d+2) = b₁` | as stated | none |
| 2.6 degrees | `CPᵈ`, `HPᵈ` | `dim Σ_p = 2d−1` gives `β_*` in degree `2d`; `(4d−1) + 2 = 4d+1` gives degree `4d+2` | as stated | none |
| 4.1 products | `N = S⁰` | `M × S⁰ = M ⊔ M`, not connected | outside Def 6.11 | R06 |
| 4.2a range (Lean) | `(n,i) = (2,1), (3,3), (4,3)` | `ℤ → ℤ/2` onto, not injective; `ℤ → ℤ²` not onto; `ℤ² → ℤ` onto | bounds sharp | none |
| Bott, stable values (Lean) | `j mod 8` | `{1,3,4,5} ↦ i ≡ 2,4,5,6`: `0`; `{0,7} ↦ i ≡ 1,0`: `ℤ/2`; `{2,6} ↦ i ≡ 3,7`: `ℤ`; `m ≥ i+2`; periodicity `m ≥ i+10` | as stated | none |
| Lemma 6.35 values | `n = 5, …, 15` | stable `π_(n−1)(O)` for `n−1 = 4, 8, 10, 12, 14` is `0, ℤ/2, 0, 0, 0`; plus Stiefel `ℤ/2` gives `ℤ/2, (ℤ/2)², ℤ/2, ℤ/2, ℤ/2`, matching the seven values (`n = 7` exceptional, `0`) | as stated | none |
| Splitting (Lean) | `k = 14` (`n = 17`) | `π₁₆(SO(18)) = π₁₆(O) = ℤ/2`, Stiefel `ℤ/2`, total `(ℤ/2)²`; `i = n−1`, `r = n+1 = i+2`, stable | true | none |
| 4.3 range | `n = 3, 7` | formula gives `0 ⊕ ℤ/2`; actual `π₂(SO(3)) = π₆(SO(7)) = 0` | `n ≥ 17` right | none |
| 4.2b–4.2c data | `m₀…m₈`; `λ_k` at `n = 16m` | E–H Thm 3: `1, 2, 4, 4, 8, 8, 8, 8, 16`; `n/m_(k+1) − 1 = 8m−1, 4m−1, 2m−1, 2m−1, 2m−1, m−1`; `λ₂(c) = (4m−|c|)/4`, `λ₆(c) = (2m−|c|)/4`; `dim Ω₁ = 64m² − 8m` | as stated | none |
| 4.2b energy Check | `A` with one pair `±3i` | `tr(AᵀA) = (n−2) + 18 = n + 16` | as stated | none |
| 4.4 `ℝP²` | `diag(A, −1)`, `det A = −1` | acts by `−A` on `T_[e₃]`, `χ = −1`; based lift of degree `−1` | as stated | none |
| 4.5 small cases | `CP⁰`, `HP⁰`; `S⁰`, `S¹` | point: capacity `0 < ⊤`; `S⁰`, `S¹`: capacity `∞`, so `2 ≤ n` needed | as stated | none |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `Ψ′*λ = p₁dq₁ + (p₂ − q₁)dq₂`, `−d` of it is `ω + dq₁∧dq₂` | consistent | none |

### Citations and ownership

- **Suppliers on main** (`3090489`):
  - GeneralizedCohomology G2.10 (line 533), G4.0b (1082), G4.3 (1224) and G5 item 2 (1523);
  - ComplexKahlerGeometry K7.1–K7.2 (1407, 1444);
  - SmoothBundlesConnections B1.4, B2.2, B2.5, B6.2 and B6.3 (421, 605, 802, 1668, 1716);
  - RiemannianGeometry R1–R3 (186, 322, 369);
  - MorseTheory M5 (857);
  - GeometricTopology Layers 1 and 3 (783, 1429);
  - LieGroups Layer 2 (356);
  - AlgebraicTopology Stages 2, 4, 6 and 8 (326, 499, 946, 1602), with
    `reducedSuspensionSphereHomeomorph` (544) and `cofibrationTowerHomotopyEquivalence` (683);
  - DGFloer Layer 2 item 2 (bundle and evaluation Hurewicz fibrations) and Layer 5 item 5
    (Corollary 2.13).
- **Open suppliers.**
  - TangentialBordism #942 (`4e86746`): B5.1 (line 1453), B5.5 (1801), B6.3 (2895).
  - GeneralAlgebraicKTheoryPartII #1742 (`ca44359`): §4.30b (line 1212).
- **Ownership.**
  - Theorem B and §§6.3–7 are also owned by main's DGFloer (R01).
  - The coreflection and 4.2a–4.2c are also owned by #1808 (R02).
  - #1807 and #1854 assign 4.2a–4.2c differently: #1807 consumes them from here, and #1854 keeps
    main's HomotopySpheres citations.
  - Nothing on main cites this roadmap.
- **Library declarations opened at the pins.**
  - `HomologicalOrientation.mapFundamentalClass` (`FundamentalClass.lean` line 275);
  - `IsContinuousRiemannianBundle` (`Mathlib/Topology/VectorBundle/Riemannian.lean` line 60,
    a continuous bilinear-form section that equals the fibre inner product);
  - `Bundle.Trivialization`;
  - the three declarations of the repaired docstring.

## Not verifiable

None of these texts is held in an author or publisher copy, and this review edits no manifest:

- Ziller, *The free loop space of globally symmetric spaces*. The indices were recomputed by
  conjugate points instead.
- Milnor, *Morse Theory*, §§22–24, and Bott, *The stable homotopy of the classical groups*.
  Eschenburg–Hanke §§2–4 was checked instead.
- Steenrod; Milnor–Stasheff; Pontryagin; Thom 1954; BDHO, *Morse homology with DG coefficients*;
  [Jap87]; Munkres §22. These are paywalled or not held. The values that depend on them were
  recomputed.

Ownership against open pull requests was checked through the `roadmaps` tool for #1807, #1808 and
#1854, which the brief gives without checkouts, and in the checkouts it gives.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed p. 117: the source says `π₈(SO(9)) = ℤ/4`; it should be `(ℤ/2)²`, the stabilization to `π₈(SO) = ℤ/2` being split with kernel `ℤ/2` (css-derivative, proof of Lemma 2.2); affects nothing.
- **Error** in bdho-cotangent at proof of Proposition 6.38, printed p. 120: the source says the class is up to sign twice the first critical manifold's class; it should be a generator, the fibre circle map having degree `±1` (Remark 6.19 at `d = 1`); affects nothing.
- **Misprint** in bdho-cotangent at proof of Proposition 6.23, printed p. 113: the source describes `Σ_p` as an `(n−2)`-sphere of unit tangent vectors at `p` orthogonal to `u(p)`, `v(p)`, which form an `(n−3)`-sphere; it should be the fibre-sphere points orthogonal to them, Example 6.20's equator; affects the proof.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed p. 118: the source says it concludes with Proposition 6.29; it should be Proposition 6.33, since the proof shows only that `Sⁿ` is 2-covered; affects the proof.
- **Gap** in bdho-cotangent at Lemma 7.7, printed p. 126: the source states the lemma for `d ≥ 2`, yet p. 127 applies it with `d = 1` when `k = 2, 3`; it should be stated for `d ≥ 1`, which its proof covers; affects the proof.
- **Error** in bdho-cotangent at §7 before Theorem 7.1, printed p. 123: the source says `ℓ`-connectivity of `Y` forces `n ≥ 3k − 1` or `n ≥ 2k`; it should exclude `k = n`, where `Y` is a point and every hypothesis holds; affects nothing.
- **Gap** in bdho-cotangent at Proposition 6.36, printed pp. 118–119: the source concludes abundance for every closed positive-dimensional `H`; it should treat nonorientable `G/H` separately, Definition 6.11 being stated for oriented manifolds; affects a stated result.
- **Gap** in bdho-cotangent at Theorem I(ii), printed p. 11: the source says non-`K(π,1)` manifolds covered by diffeomorphisms in the sense of 6.26 and 6.32 are abundant; it should add Proposition 6.33's condition for `ℓ`-covering; affects a stated result.
- **Gap** in bdho-cotangent at Definition 6.14 and proof of Proposition 6.15, printed p. 106: the source orients `Σ_p` freely and leaves `Σ`'s orientability unstated; it should require `Σ` orientable and `Σ_p` oriented as induced (Remark 2.10), which matters for disconnected fibres; affects the proof.
- **Gap** in bdho-cotangent at Proposition 6.13, printed p. 106: the source allows any closed oriented `N`; it should require `N` connected, Definition 6.11 applying only to connected manifolds; affects a stated result.
- **Misprint** in eschenburg-hanke-bott at proof of Theorem 4, printed p. 9: the source calls each minimal invariant subspace an irreducible `Cl_k`-module; it should be a `Cl_(k+1)`-module, since `J_(k+1) = J_kJ′` also acts; affects nothing.
