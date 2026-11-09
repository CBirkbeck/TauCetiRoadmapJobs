# Review of DGFloerPartII (pull request #1799 at 9de4d71)

**Verdict:** needs changes

This is a full review: the folder changed by 176 lines since `f27b94b`, the head the previous
review read. The repair has four parts:

- It reduces the fibered-family statement to one fibre component on a finite covering, and
  descends the capacity along that covering (the source's Remark 6.2).
- It adds a Check on disconnected fibres.
- It requires `N` connected in Proposition 6.13.
- It rewrites the TopologicalKTheory bullet under Downstream consumers.

`Suggested.lean` changed only in a docstring. Main is still at `3090489`.

Four findings, one of them blocking:

- **R01 (P2)** carries the previous R01: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7,
  and the description still does not order DGFloer #1798 first.
- **R02 (P3)** and **R03 (P3)** are new. 1.3 and 4.2 use two objects that Tau Ceti has at the pin
  without citing them: the cotangent lift of a diffeomorphism with its symplectic naturality, and
  the theorem that a locally trivial map is a Serre fibration over any base.
- **R04 (P3)** carries the previous R04: the description is stale.

The previous R03 (fibered families with a disconnected fibre), R05 (line-range citation) and R06
(connected `N`) are repaired. So is the cycle half of the previous R02; its ownership half is not
carried, for the reason given under "Previous findings". The gate passes, with the build.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7, and the description does not order DGFloer #1798 first

**Location.** README lines 38–44: "The base roadmap, cited as **DGFloer** by layer and item, owns
every other numbered statement of the source". The description's merge-order paragraph ends
"#1742 (GeneralAlgebraicKTheoryPartII) → **this pull request** (#1799)", and its Depends-on list
names only #1742 and #942.

**Claim.** This roadmap is the single owner of the following:

- Theorem B with Corollaries D and E in their Theorem B forms;
- the numbered statements of §§6.3–6.4 and §7;
- the carriers and computations they rest on.

**Witness.** Main's (`3090489`) `TauCetiRoadmap/DGFloer/README.md` still owns:

- Theorem B, at Layer 10 item 5 (lines 1562 and 1567);
- abundance, Theorem H, Theorem I and Theorem G, in Layer 11 (line 1577).

Only #1798 (`1004825`, draft) hands these over (its lines 50–54).

**Repair.** The README needs no change. In the description:

1. Add #1798 to the Depends-on list.
2. Add this sentence to the merge-order paragraph:

   > #1798 (DGFloer) merges before this pull request or together with it. It moves the source's
   > Theorem B, §§6.3–6.4 and §7 out of DGFloer's Layers 10 and 11 and into this roadmap, with the
   > homogeneous carriers, explicit degree computations and projective loop-space computations
   > they rest on.

No repair report was available to this review.

**Tested.** Every DGFloer id this README cites resolves both on main and at #1798:

- **Layer 6 item 5**, new in 4.2's *Needs:*. Main line 1107 has it ("Almost existence and
  capacities"); at #1798 it is §6.5 (its line 2263).
- **Layer 4 item 5.** It resolves at #1798 through its numbering note: "Layer 4 item 5: Layer 4
  item 1" (its line 159).
- **Layer 11's finite cover `T × K → G`.** Main has it at Layer 11 item 3 (line 1623); at #1798 it
  is §11.1 (its line 4139).

`overlaps.md` lists no dropped id.

## R02 (P3) — 1.3 and 4.2 use the cotangent lift but do not cite Tau Ceti's `Diffeomorph.cotangent`

**Location.**

- README lines 750–753 (1.3): "A diffeomorphism `ψ : M → N` lifts to a symplectomorphism
  `T*N → T*M` carrying the codisc bundle of a metric `g` on `N` to that of `ψ*g`".
- README line 1321 (4.2, descent along a finite covering): "The cotangent lift `ρ̂ : T*Q̃ → T*Q`
  of `ρ` is a local symplectomorphism".

Neither place, nor the Tau Ceti contract (lines 221–334), names a Tau Ceti declaration for the
lift.

**Witness.** At the pinned Tau Ceti:

- `Diffeomorph.cotangent` (`TauCeti/Geometry/Manifold/Diffeomorph/Cotangent.lean` line 119) is
  `(x, p) ↦ (h x, p ∘ (dh_x)⁻¹)`.
- `Diffeomorph.mpullback_cotangent_symplecticForm`
  (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Lift.lean` line 88) proves `(T*h)^*ω_N = ω_M`.

**Repair.**

1. **Contract.** Add a bullet to "From Tau Ceti": `Diffeomorph.cotangent`, the cotangent lift of
   a smooth diffeomorphism, and `Diffeomorph.mpullback_cotangent_symplecticForm`, its pullback of
   the canonical form.
2. **1.3.** After "lifts to a symplectomorphism `T*N → T*M`", add "(the inverse of
   `Diffeomorph.cotangent ψ`, symplectic by `Diffeomorph.mpullback_cotangent_symplecticForm`)".
3. **4.2.** After "is a local symplectomorphism", add "(over each evenly covered open `U ⊆ Q` and
   each sheet `Ũ`, it is `Diffeomorph.cotangent` of the diffeomorphism `ρ|Ũ : Ũ → U` of open
   submanifolds, symplectic by `Diffeomorph.mpullback_cotangent_symplecticForm`)".
4. **Needs.** Add both names to the Tau Ceti items of 1.3's and 4.2's *Needs:* lines.

**Tested.** On `ρ : S² → ℝP²`, take a sheet `Ũ` over an open hemisphere-sized `U`; `ρ|Ũ` is a
diffeomorphism onto `U`. Its `Diffeomorph.cotangent` sends `(x̃, p)` to `(ρ x̃, p ∘ (dρ_x̃)⁻¹)`,
which is `ρ̂` on `T*Ũ`. It pulls `ω` back to `ω`, so `ρ̂` is a local symplectomorphism, as the
descent step needs.

## R03 (P3) — 4.2 cites Hatcher for a Serre-fibration fact that Tau Ceti proves at the pin

**Location.** README lines 1359–1360 (4.2, sphere bundles): "the projection `S(V) → B` is a Serre
fibration over any base (Hatcher, *Algebraic Topology*, Proposition 4.48)". 4.2's *Needs:* ends
with "Hatcher, *Algebraic Topology*, Proposition 4.48" (line 1403), and names no Tau Ceti
declaration for this.

**Witness.** In the pinned Tau Ceti's `TauCeti/Topology/Homotopy/SerreFibration/FiberBundle.lean`,
`TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` (line 365) makes a map with a
`Trivialization` around every point a Serre fibration, over any base. Its cube form,
`TauCeti.hasHomotopyLiftingProperty_cube_of_exists_trivialization`, is at line 325.

**Repair.**

1. **4.2.** Replace "(Hatcher, *Algebraic Topology*, Proposition 4.48)" at line 1360 with "(Tau
   Ceti's `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`, applied to the local
   trivializations of `S(V)` with fibre `Sⁿ` given by local orthonormal frames of `V`; Hatcher,
   *Algebraic Topology*, Proposition 4.48)".
2. **Needs.** Add the name to the Tau Ceti items of 4.2's *Needs:*.
3. **Contract.** Add a "From Tau Ceti" bullet naming both declarations and their file.

**Tested.** Over a trivializing open `U ⊆ B` of `V`, Gram–Schmidt for the continuous fibre metric
gives an orthonormal frame. That frame identifies `S(V)|_U` with `U × Sⁿ`, which is a
`Trivialization` with fibre `Sⁿ`. Every `b ∈ B` lies in such a `U`, so the hypothesis `h` of
line 365 holds with no assumption on `B`.

The relative lifting that the looped map `Ω²S(V) → Ω²B` needs is DGFloer Layer 1 item 2, already
in this *Needs:*.

## R04 (P3) — Not repaired: the description is stale

**Location.** These five passages of the description are stale:

- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones";
- "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps";
- "TangentialBordism's compact-image embedding";
- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`".

**Witness.**

- The folder never mentions HomotopySpheres; 1.0 and 4.2c build these objects here.
- 2.3 (README lines 993–995) uses degree gaps for `ΩHPᵈ`.
- 3.1 uses TangentialBordism B5 and B6.3 (README lines 1133–1135).
- `Suggested.lean` has no rotation family.

**Repair.** Make five edits to the description:

1. Replace "HomotopySpheres' James construction and Bott periodicity" with
   "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem".
2. Replace "with HomotopySpheres' convenient ones" with "with the convenient carriers of 1.0 on
   Mathlib's `CompactlyGenerated`".
3. Replace "its boundaries vanishing … degree gaps" with "the boundaries for `ΩCPᵈ` vanishing by a
   Hopf-fibration rank count, and those for `ΩHPᵈ` by the degree gaps once the Thom model is
   built".
4. Replace "TangentialBordism's compact-image embedding" with "TangentialBordism B5's structured
   Pontryagin–Thom and B6.3's rational oriented-bordism surjection".
5. Replace the last sentence with:

   > `Suggested.lean` states:
   >
   > - the compact-generation coreflection and product criterion of 1.0;
   > - Theorem B;
   > - the finiteness of the capacity in Theorem I for fibered families of 2-spheres, for sphere
   >   bundles over highly connected bases, for spheres, for manifolds `ℓ`-covered by
   >   diffeomorphisms, for non-aspherical compact Lie groups, and for `CPᵈ` and `HPᵈ`;
   > - the finite-to-stable range and the finite-rank Bott statements for `SO(n)`;
   > - Lemma 6.35's seven low-rank values, its splitting for odd `n ≥ 17` and its torsion for every
   >   odd `n`;
   > - Theorem G.

**Tested.** Every statement named in the replacement is in `Suggested.lean`, at lines 106, 115,
132, 164, 192, 219, 247, 262, 280, 310, 323, 362–397, 403–444 and 460.

## Previous findings

| Previous finding | Status at this head | Here |
| --- | --- | --- |
| R01 (P2): main's DGFloer owns Theorem B etc.; #1798 not ordered | Not repaired. The description is unchanged, and so are main's DGFloer lines 1562 and 1577. | R01 |
| R02 (P2): #1808 owns 1.0's coreflection and 4.2a–4.2c; the Downstream bullet closes a cycle | The cycle is repaired: lines 2069–2073 now say "TopologicalKTheory consumes nothing from this roadmap, in any section". The ownership half is not carried; see below. | — |
| R03 (P2): disconnected fibre; false sign sentence | Repaired. See below. | — |
| R04 (P3): stale description | Not repaired: the description is unchanged. | R04 |
| R05 (P3): line-range citation | Repaired. Line 1283 now reads "(the source paper, Corollary 2.13 and Remark 2.10, pp. 28–29)". The folder has 0 occurrences of "bdho-cotangent". | — |
| R06 (P3): Proposition 6.13 with disconnected `N` | Repaired at lines 1248–1251 and 1887 ("closed connected oriented manifold"). There is a new Check with `N = S⁰` (lines 1264–1265). | — |

**The repair of R03.**

- **The definition paragraph.** It now gives `Σ_p` the orientation that `Σ` and `Q` induce (lines
  1276–1279). That is Remark 2.10 (`bdho-cotangent` lines 1209–1212, p. 28).
- **The Lean statement.** Its hypothesis, with arbitrary `oF` and `e₀`, is reduced in four steps,
  which I checked (adversarial rows 1–6):
  - a component `F₁` with `j_*[F₁] ≠ 0`;
  - the finite covering of `Q` by fibre components, and its component `Q̃`;
  - lifting the family by Mathlib's `IsCoveringMap.existsUnique_continuousMap_lifts` (at the pin:
    `[SimplyConnectedSpace A] [LocallyPathConnectedSpace A]`, prescribed lift of one point);
  - the descent `c°_HZ(D*Q) ≤ c°_HZ(D*Q̃)`.
- **The descent against Tau Ceti's definition.** `TauCeti.SmoothTwoForm.IsContractibleHZAdmissible`
  (`TauCeti/Geometry/Symplectic/Capacity/HoferZehnder.lean` lines 102–191) asks for four things,
  and each passes to `H ∘ ρ̂`:
  - compact `tsupport` inside `interior W`;
  - vanishing on a nonempty open subset of `W`;
  - the maximum over the whole manifold, attained on a nonempty open set;
  - no fast orbit whose loop is nullhomotopic in `W`.

  The reasons are that `ρ̂` is a surjective, finite local homeomorphism with
  `ρ̂⁻¹(D*Q) = D*Q̃`, and that a nonconstant orbit has a nonconstant projection.
- **The locator.** Remark 6.2 (`bdho-cotangent` lines 4351–4353, p. 100) is stated for symplectic
  coverings of Liouville domains, which are compact, so the covering is finite. "For the finite
  coverings used here" is accurate.

**Why the ownership half of the previous R02 is not carried.** This agrees with reviews 14 and 16.

- **Main assigns the objects to HomotopySpheres.** Main's AlgebraicTopology gives the
  compact-generation coreflection to HomotopySpheres §3A.1 (its lines 117–118). Main's
  TopologicalKTheory takes real Bott periodicity from HomotopySpheres §4B (its lines 1605, 1635
  and 1740). HomotopySpheres is on the brief's never-cite list.
- **Only open revisions move them.** #1808 (`d724946`, draft) moves them to AlgebraicTopology
  Stage 4.5 (its AlgebraicTopology README lines 144 and 935, `Suggested.lean` line 110) and
  TopologicalKTheory T7.0a–T7.0b (its lines 1766 and 1831). It is an open revision of roadmaps on
  main, so it is not a supplier this roadmap may cite: "cite that roadmap as it is on main". The
  notion therefore moves down into 1.0 and 4.2a–4.2c.
- **The revisions disagree.** #1854 (`f28d376`, not a draft) keeps the HomotopySpheres §4B
  citations (its TopologicalKTheory lines 659 and 1314). #1807 (`5004f71`, draft) instead has
  TopologicalKTheory T7 consume 4.2a–4.2c (its lines 196 and 1676–1678).
- **Where the conflict is settled.** A roadmap on main cannot consume this one: depcheck flags
  that edge UPWARD. So #1807's edge is a defect of #1807, and the conflict among #1807, #1808 and
  #1854 is to be settled in those pull requests, not by this folder waiting on a draft.

## Verified sound

### Gate, dependency check and build

The worker's gate at this head reports every check passing, `build=0` included.

The brief's dependency check, with `--order merge-order-moved.txt --movable`:

    depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

The moved order puts GeneralAlgebraicKTheoryPartII at line 334, this roadmap at line 335 and
TangentialBordism at line 14.

Other checks:

- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.SG"`).
- There are no process words, no `lemma` and no LaTeX delimiters.

### Elaboration, signatures and padding

- **Elaboration.** I elaborated a scratch copy of `Suggested.lean` with `lake env lean`, with
  `#check @name` appended for all 31 declarations and four library declarations. It exits 0 with
  27 `sorry` warnings and no other message: the 31 declarations less `SO`, `soBlockInclusion`,
  `soBlockInclusion_one` and the `CPᵈ` instance.
- **Signatures.** The elaborated types match `signatures.md` and the README statements. The
  fibered-family signature keeps every binder its README paragraph names: `ConnectedSpace Q`,
  `CompactSpace F`, `hF`, `hp`, `hσ`, `he₀`, `hj` and `hσj`. Nothing changed in any signature
  since `f27b94b`: the diff of `Suggested.lean` is lines 158–163 of one docstring.
- **One-tactic probe.** On a scratch copy I replaced each of the 27 `sorry`s by
  `first | infer_instance | rfl | (simp; done) | exact?`. All 27 fail, each with "`exact?` could
  not close the goal", at lines 108, 118, 145, 184, 209, 241, 256, 270, 295, 317, 330, 365–444 and
  495. No statement is padding.
- **Library leads.** `library-matches.md` lists no pinned declaration that proves a statement of
  the file.

### Headline theorems

- **Stated:**
  - Theorem B (Theorem 5.14), line 132;
  - Theorem I's capacity form: fibered families (164), even and odd sphere bundles (192, 219),
    spheres (247), compact Lie groups (262), `ℓ`-covered manifolds (280), `CPᵈ` and `HPᵈ` (310,
    323);
  - Lemma 6.35 (403–444) and the finite-rank range and Bott statements for `SO` (362–397);
  - Theorem G (460);
  - 1.0's coreflection and product criterion (106, 115).
- **Named in the docstring as not statable:** Theorem H and abundance (no shriek map of the
  evaluation fibration at the pins), products, Proposition 6.36 (no smooth `G ⧸ H`), stable `O`
  (no carrier), and the Clifford chain (no manifold structure on `Ω_k(n)`, `k ≥ 1`).
- **Statable but absent:** none.
- **Padding:** none (probe above).

### Seeded source sample

Locators are `bdho-cotangent` line numbers unless another source is named. Printed pages are the
page footers.

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | Mathlib `ContinuousMap.compactOpen`; the instance that sequential spaces are compactly generated; Strickland Prop 2.6 (`strickland-cgwh` line 122) | as stated |
| 1.2 | Prop 6.18 (4685–4687, p. 108); Hatcher §4.J; GeneralAlgebraicKTheoryPartII §4.30b at `ca44359` (its line 13 and contract) | as stated |
| 1.4 | proof of Prop 6.17 (4759–4773, pp. 109–110, footnote 16); second proof of Prop 6.34 (5122–5139, pp. 117–118) | as stated |
| 1.5 | DGFloer Layer 1 item 5 (main); GeneralizedCohomology G5 (main line 1373); TangentialBordism B5.1, B5.5 at `d2fece9` (lines 1480, 1828) | as stated |
| 2.2 | Prop 6.38 (5218–5241, p. 120) | as stated; the source's "twice" is a source issue |
| 2.3 | Prop 6.39 (5247–5260) | as stated; gaps recomputed |
| 2.5 | GeneralizedCohomology G4.0, G4.3–4.5 on main | resolves; degrees recomputed |
| 2.6 | Props 6.38–6.39; Remark 6.19 (4792–4796); Example 6.37 (5201–5210) | as stated |
| 3.1 | proof of Thm 5.14 (4273–4279, p. 98: Thom, `N·α = φ_*[S]`, `d = Nb`); TangentialBordism B6.3 at `d2fece9` (line 2922, the rational SO surjection) | as stated |
| 3.2 | Thm B (243–246, p. 7); Thm 5.10 (4140–4150); Thm 5.14 (4267–4272, p. 98) | as stated; the README reaches Thm 5.10's condition 2, the source goes through Prop 5.13, and both are valid |
| 4.1 | Def 1.7 and Thm H (415–426, pp. 10–11); Def 6.11 and Thm 6.12 (4517–4528); Prop 6.13 (4608–4616, p. 106) | as stated, with `N` connected |
| 4.2 (changed) | Def 6.14 and Prop 6.15 (4621–4643, p. 106); Remark 2.10 (1209–1212, p. 28); Cor 2.13 (1237–1241, p. 29); Remark 6.2 (4351–4353, p. 100) | as stated |
| 4.2a | Tau Ceti `TauCeti.subsingleton_homotopyGroup_sphere_of_lt`; Hatcher §4.2 | as stated |
| 4.2c | `eschenburg-hanke-bott` lines 284–290 (Thm 3), 299–354 (Thm 4, Case 1), 360–404 (Case 2) | as stated; `w = c·m_k/4` and the bound `(s − |c|)/4` recomputed |
| 4.5 | Thm I (430–445, pp. 10–11); Props 6.38–6.39; the CROSS remark (5214–5217) | as stated, without `CaP²` |
| 4.6 | §7 setting (5354–5364, p. 123); Thm 7.1 (5366–5372, p. 123); Lemma 7.7 (5503–5505, p. 126) and its use with `d = k − 2`, `2k − 3` (5534–5539, p. 127) | as stated, with Lemma 7.7 for `m ≥ 1` |

The README flags no locator as unverified.

### Adversarial table

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1. fibered family (Lean), new Check | `Σ = SO(3) ⊔ SO(3)` over `S²`, `F = SO(2) ⊔ SO(2)` | product `e₀`: `j_*[F] = 2α′`; swap-and-reverse `e₀′`: `α′ − α′ = 0`; copies oppositely oriented: `σ_*[Σ] = 0` while `j_*[F] = 2α′` | hypothesis weaker than Def 6.14; the reduction takes `F₁ = SO(2)`, `Q̃ = S²`, class `±α′ ≠ 0` | none |
| 2. trivial-bundle sentence | `S² × (S¹ ⊔ S¹)`, circles in the degree-1 component | a slice is a section of `ev` on `Map₁(S², S²)`, i.e. a map `S² × S² → S²` of bidegree `(1,1)`; it exists iff `[ι₂, ι₂] = 0`, but `[ι₂, ι₂] = 2η ≠ 0` in `π₃(S²) = ℤ` | true | none |
| 3. component step | compact manifold `F` | finitely many components; `j_*[F] = Σ ±j_*[F_i] ≠ 0` forces some `j_*[F_i] ≠ 0` | true | none |
| 4. covering descent | `ρ : S² → ℝP²` | admissible `H` on `D*ℝP²` gives `H ∘ ρ̂` with compact support `ρ̂⁻¹(supp H)` and the same maximum; orbits project with the same `T`; so `c°(D*ℝP²) ≤ c°(D*S²) < ∞` | true; matches the source's lines 5214–5217 | none |
| 5. descent, degenerate | `Q̃ = ∅`; infinite `ℝ → S¹` | `Q̃ = ∅`: nowhere to attain the maximum; `ℝ → S¹`: `ρ̂⁻¹(supp H)` is not compact | "surjective" and "finite" are needed, and both are stated | none |
| 6. descent vs Tau Ceti fields | `IsContractibleHZAdmissible` | `tsupport ⊆ interior W`, `IsMaxOn F univ`, loop in `C(AddCircle T, W)` nullhomotopic in `W`; all pull back under `ρ̂` with `ρ̂⁻¹(D*Q) = D*Q̃` | consistent | none |
| 7. Theorem B (Lean) | `T^r`; `ℝP³`; `U = ∅` | `π₂ = π_(ℓ+3)(T^r) = 0`: `hQ` false; `π₃(ℝP³) = ℤ`: `hQ` true; `H_n(∅) = 0`: `hU` false | true | none |
| 8. Theorem B route | `d = Nb` | an infinite-order element of `π_ℓ` is not `d^m`-torsion for any `m`: Thm 5.10 condition 2 (4146–4147) | sound | none |
| 9. Prop 6.13 | `N = S⁰` | `M × S⁰ = M ⊔ M`, not connected | now excluded | none |
| 10. Theorem G (Lean) | `k = 2, 3, 4` | `ℓ = 2, 2, 6`; Lemma 7.7 used at `d = 1, 1, 5` (5536), `ℓ = d + 1`; no ℕ-subtraction junk for `k ≥ 2` | as stated | none |
| 11. 1.4 degrees | `n = 1, 2, 3, 4` | rotation family `1 + (−1)^(n−1)` = `2, 0, 2, 0`; Stiefel map `1 + (−1)ⁿ` = `0, 2, 0, 2` | as stated | none |
| 12. 2.1 indices | `k = 2`, `d = 2` | `CP²`: `3 + 2 = 5 = 2d(k−1) + 1`; `HP²`: `9 + 4 = 13 = 2(k−1)(2d+1) + 3` | as stated | none |
| 13. 2.2–2.3 cells | `CP²`; `HP²` | `0, 1, 4, 5, 8, 9`, with `a₂ − b₁ = 1`; `3, 10, 13, 20`, with gap `3` | as stated | none |
| 14. 2.5 degrees | `E_(2d,1) → E_(0,2d)`; `E_(4d,3) → E_(0,4d+2)` | totals `2d+1 → 2d` and `4d+3 → 4d+2` | as stated | none |
| 15. 2.6 | `HPᵈ` fibre `S² × S¹ → S³` | the `n = 3` family has degree `1 + (−1)² = 2`; `dim Σ_p = 4d + 1` | `±2g` | none |
| 16. 3.1 | torsion `α` | `S = ∅`, `0 = Nα` | excluded by 3.2 | none |
| 17. 4.2 sphere bundle, even | twistor `S² → CP³ → S⁴` | `π₄(S⁴) = ℤ`, so `hB` fails at `i + 1 = 4 = 2n`; `π₃(CP³) = 0` kills the class | hypothesis sharp | none |
| 18. 4.2 sphere bundle, odd | `B` a point, `n = 3`, `u = ix`, `w = jx` | `⟨x, ix⟩ = 0`, `⟨ix, jx⟩ = ⟨x, −kx⟩ = 0`, independent | true | none |
| 19. 4.2a range (Lean) | `(n, i) = (2,1), (3,3), (4,3)` | `ℤ → ℤ/2` onto, not injective; `ℤ → ℤ²` not onto; `ℤ² → ℤ` onto | bounds sharp | none |
| 20. 4.2b | `dim Ω₁` | `(128m² − 8m) − 64m² = 64m² − 8m = n²/4 − n/2` | as stated | none |
| 21. 4.2c bounds | `k = 0, 1, 3, 4, 5, 7`; `k = 2, 6` | `n/m_(k+1) − 1 = 8m−1, 4m−1, 2m−1, 2m−1, 2m−1, m−1`; winding `c·m_k/4 = c, 2c`; `p + q ≥ s`, `p − q = c`, so the index is at least `(s − |c|)/4` | as stated | none |
| 22. Bott (Lean) | `j mod 8` | `{1,3,4,5} ↦ i ≡ 2,4,5,6`; `{0,7} ↦ i ≡ 1,0`; `{2,6} ↦ i ≡ 3,7`; `m ≥ j + 3 = i + 2`; periodicity `m ≥ j + 11 = (i + 8) + 2` | as stated | none |
| 23. Lemma 6.35 (Lean) | `n = 17`; `n = 7` | `n = 17`: `π₁₆(SO(18)) = ℤ/2` and the Stiefel term `ℤ/2` give `(ℤ/2)²`; `n = 7`: the formula gives `0 ⊕ ℤ/2`, but `π₆(SO(7)) = 0` | `n ≥ 17` right | none |
| 24. 4.5 small cases | `CP⁰`, `HP⁰`; `S¹` | a point has capacity `0 < ⊤`; `S¹` has capacity `∞`, so `2 ≤ n` is needed | as stated | none |
| 25. 4.5 metric change | `D*_(g₁) ⊆ λ·D*_(g₂)` | nonconstant orbits lie in `supp H ⊆ D*_(g₁)`; `π₁` injects, since both sets retract onto the zero section; `c°(λ·W) = λ·c°(W)` | sound | none |
| 26. 1.3 and 4.2 cotangent lift | `ρ : S² → ℝP²`, one sheet | `Diffeomorph.cotangent (ρ\|Ũ)` is `ρ̂` on `T*Ũ` and pulls `ω` back to `ω` | object pinned, uncited | R02 |
| 27. 4.2 Serre property | `S(V) → B`, any `B` | orthonormal frames give `Trivialization`s with fibre `Sⁿ`, so Tau Ceti's lemma applies | pinned, uncited | R03 |

### Citations and ownership

- **Suppliers on main (`3090489`).**
  - GeneralizedCohomology: G5 (line 1373), G4.0b (lines 39–40 and 939), G2.10 (line 405).
  - ComplexKahlerGeometry: K7.1 (line 1407).
  - SmoothBundlesConnections: B1.4, B2.2, B2.5, B6.2 and B6.3 (lines 421, 605, 802, 1668, 1716).
  - RiemannianGeometry: R1–R3 (lines 186, 322, 369).
  - MorseTheory: M5 (line 857).
  - GeometricTopology: Layers 1 and 3 (lines 783, 1429).
  - LieGroups: Layer 2 (line 356).
  - AlgebraicTopology: Stages 2, 4, 6 and 8 (lines 326, 499, 946, 1602), with
    `cofibrationTowerHomotopyEquivalence` (683) and 8.11a (1949).
  - DGFloer: Layers 0–6, 10 and 11 (R01's Tested).
- **Open suppliers.**
  - TangentialBordism #942: its checkout is at `d2fece9`, which descends from the indexed head
    `4e86746`. B5.1, B5.5 and B6.3 are at its lines 1480, 1828 and 2922; B6.3 still gives the
    rational SO surjection with geometric preimages.
  - GeneralAlgebraicKTheoryPartII #1742 (`ca44359`) owns §4.30b (its line 13).
- **New contract entry.** `IsCoveringMap.existsUnique_continuousMap_lifts`
  (`Mathlib/Topology/Homotopy/Lifting.lean` line 489) is as the contract describes.
- **Remark 6.2.** Neither main's DGFloer nor #1798 states it (no match for "Remark 6.2"), so the
  new Scope clause "which the base roadmap does not state" is accurate.
- **Who cites this roadmap.** Nothing on main cites it.
  - #1798 does, consistently with this README. Its consumer bullet (its line 4286) omits Layer 6
    item 5, which 3.2 and 4.2 consume; that is #1798's list to complete.
  - #1652 lists this roadmap as a consumer of `cofibrationTowerHomotopyEquivalence` (its line
    4543), consistently.
  - #1807 consumes 4.2a–4.2c in TopologicalKTheory T7; see "Previous findings".
- **Ownership of 1.0 and 4.2a–4.2c.** See "Previous findings". HomotopySpheres #1287 also states
  stable `O` and Bott periodicity; it is on the never-cite list, so that overlap is for it to
  settle.

### Library declarations opened at the pins

- **Tau Ceti.**
  - `TauCeti.SmoothTwoForm.IsContractibleHZAdmissible` and `contractibleHZCapacity`
    (`HoferZehnder.lean` lines 102–196);
  - `Diffeomorph.cotangent` (`Diffeomorph/Cotangent.lean` line 119) and
    `Diffeomorph.mpullback_cotangent_symplecticForm` (`Cotangent/Bundle/Lift.lean` line 88);
  - `TauCeti.hasHomotopyLiftingProperty_cube_of_exists_trivialization` and
    `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` (`SerreFibration/FiberBundle.lean`
    lines 325, 365).
- **Mathlib.** `IsCoveringMap.existsUnique_continuousMap_lifts` (`Topology/Homotopy/Lifting.lean`
  line 489).

## Not verifiable

None of these texts has an open copy cached for this roadmap, and this review edits no manifest:

- **Ziller**, *The free loop space of globally symmetric spaces*. I recomputed the indices by
  conjugate points instead (table row 12).
- **Milnor**, *Morse Theory*, §§22–24, and **Bott**, *The stable homotopy of the classical
  groups*. I checked Eschenburg–Hanke §§2–4 instead.
- **Steenrod; Milnor–Stasheff; Pontryagin; Thom 1954; BDHO**, *Morse homology with DG
  coefficients*; **[Jap87]**. The values that depend on them were recomputed.

Ownership against #1807, #1808 and #1854, for which the brief gives no checkout, was checked through
the `roadmaps` tool at their indexed heads.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed p. 116: the source says `π₈(SO(9)) = ℤ/4`; it should be `(ℤ/2)²`, the stabilization to `π₈(SO) = ℤ/2` being split with kernel `ℤ/2` (css-derivative, proof of Lemma 2.2); affects nothing.
- **Error** in bdho-cotangent at proof of Proposition 6.38, printed p. 120: the source says the class is up to sign twice the first critical manifold's class; it should be a generator, the fibre circle map having degree `±1` (Remark 6.19 at `d = 1`); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed p. 118: the source says it concludes with Proposition 6.29; it should be Proposition 6.33, since the proof shows only that `Sⁿ` is 2-covered; affects the proof.
- **Gap** in bdho-cotangent at Lemma 7.7, printed p. 126: the source states the lemma for `d ≥ 2`, yet p. 127 applies it with `d = 1` when `k = 2, 3`; it should be stated for `d ≥ 1`, which its proof covers; affects the proof.
- **Error** in bdho-cotangent at §7 before Theorem 7.1, printed p. 123: the source says `ℓ`-connectivity of `Y` forces `n ≥ 3k − 1` or `n ≥ 2k`; it should exclude `k = n`, where `Y` is a point and every hypothesis holds; affects nothing.
- **Gap** in bdho-cotangent at Definition 6.14 and proof of Proposition 6.15, printed p. 106: the source orients `Σ_p` freely and leaves `Σ`'s orientability unstated; it should require `Σ` orientable and `Σ_p` oriented as induced (Remark 2.10), which matters for disconnected fibres; affects the proof.
- **Gap** in bdho-cotangent at Proposition 6.13, printed p. 106: the source allows any closed oriented `N`; it should require `N` connected, Definition 6.11 applying only to connected manifolds; affects a stated result.
- **Gap** in bdho-cotangent at Proposition 6.36, printed pp. 118–119: the source concludes abundance for every closed positive-dimensional `H`; it should treat nonorientable `G/H` separately, Definition 6.11 being stated for oriented manifolds; affects a stated result.
- **Gap** in bdho-cotangent at Theorem I(ii), printed p. 11: the source says non-`K(π,1)` manifolds covered by diffeomorphisms in the sense of 6.26 and 6.32 are abundant; it should add Proposition 6.33's condition for `ℓ`-covering; affects a stated result.
- **Misprint** in eschenburg-hanke-bott at proof of Theorem 4, printed p. 9: the source calls each minimal invariant subspace an irreducible `Cl_k`-module; it should be a `Cl_(k+1)`-module, since `J_(k+1) = J_kJ′` also acts; affects nothing.
