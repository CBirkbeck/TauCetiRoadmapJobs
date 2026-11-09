# Review of DGFloerPartII (pull request #1799 at 05e7c01)

**Verdict:** needs changes

This is an incremental re-review of the 91 lines changed since `9de4d71`. All of them are in
`README.md`; `Suggested.lean`, `metadata.toml` and the pins are byte-identical to `9de4d71`.
Nothing changed outside the folder, and main is still at `3090489`.

The change repairs the previous R02 and R03:

- **The cotangent lift.** It now cites Tau Ceti's `Diffeomorph.cotangent`,
  `Diffeomorph.mpullback_cotangent_symplecticForm`, `TauCeti.CotangentBundle.restrictOpen` and
  `TauCeti.CotangentBundle.mpullback_restrictOpen_symplecticForm`. 1.3 now uses the lift in its
  forward direction.
- **The Serre property.** It now cites `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`
  for the sphere bundles of 4.2 and for the evaluations of 4.2a. 4.2a is restricted to `r ≥ 1`
  for `SO`.
- **Two new Checks**, one on each object.

I found no defect in the changed passages. The two remaining findings, R01 (P2) and R02 (P3), are
the previous R01 and R04. Both are repaired in the pull-request description, which is unchanged at
this head. The latest repair report marks them "answered", not "not actionable in this package",
so they are not settled. The gate passes with the moved order, the targeted build included.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B, §§6.3–6.4 and §7, and the description does not order DGFloer #1798 first

**Location.**

- README lines 38–44: "The base roadmap, cited as **DGFloer** by layer and item, owns every other
  numbered statement of the source".
- The description's Depends-on list names only #1742 and #942. Its merge-order paragraph ends
  "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull request** (#1799)".

**Claim.** This roadmap is the single owner of the following:

- Theorem B, with Corollaries D and E in their Theorem B forms;
- every numbered statement of §§6.3–6.4 and §7;
- the carriers and computations these rest on.

**Witness.** Main's (`3090489`) `TauCetiRoadmap/DGFloer/README.md` still owns Theorem B at Layer
10 item 5 (line 1562). It owns abundance, Theorem H, Theorem I and Theorem G at Layer 11 (line
1577). Only #1798 (`1004825`, draft, open) hands them over, at its lines 50–54.

**Repair.** The README needs no change. In the description:

1. Add "#1798 DGFloer" to the Depends-on list.
2. Append this sentence to the merge-order paragraph:

   > #1798 (DGFloer) merges before this pull request or together with it. It moves the source's
   > Theorem B, §§6.3–6.4 and §7 out of DGFloer's Layers 10 and 11 and into this roadmap, with the
   > homogeneous carriers, explicit degree computations and projective loop-space computations
   > they rest on.

**Tested.** I checked that every DGFloer id this README cites resolves both on main and at #1798.
The ids the changed passages add are:

- **Layer 1 item 2 as the source of `TauCeti.TopCat.serreFibrations`.** On main, Layer 1 item 2
  (line 470) uses that predicate (lines 490–496). At #1798 the predicate is listed under "From Tau
  Ceti" (its line 112), and its numbering note (lines 163–177) maps Layer 1 item 2's fibration
  exact sequence onward.
- **Layer 6 item 5.** It is on main at line 1107, and at #1798 as §6.5.

`overlaps.md` lists no id that an open pull request drops.

## R02 (P3) — Not repaired: the description is stale

**Location.** These five passages of the description are stale:

- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones";
- "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps";
- "TangentialBordism's compact-image embedding";
- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`".

**Witness.** Each passage contradicts the folder at this head:

- "HomotopySpheres" occurs 0 times in `README.md` and 0 times in `Suggested.lean`.
- 2.3 uses degree gaps for `ΩHPᵈ` (README lines 1024–1025).
- 3.1 consumes TangentialBordism B5 and B6.3 (README lines 390–393).
- "rotation" occurs 0 times in `Suggested.lean`.

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

**Tested.** Every statement named in the replacement is in `Suggested.lean`, which is unchanged
since `9de4d71`. They are at lines 106, 115, 132, 164, 192, 219, 247, 262, 280, 310, 323,
362–397, 403–444 and 460.

## Previous findings

- R01 — not repaired: README lines 38–44 unchanged; description's Depends-on still lists only #1742 and #942; main's DGFloer still owns Theorem B (line 1562) and Layer 11 (line 1577). Carried as R01.
- R02 — repaired: 1.3 now reads "lifts to the symplectomorphism `Diffeomorph.cotangent ψ : T*M → T*N` … (`Diffeomorph.mpullback_cotangent_symplecticForm`)"; 4.2 reads ρ̂ as `Diffeomorph.cotangent` of `ρ|Ũ` "read through `TauCeti.CotangentBundle.restrictOpen`"; contract bullet added.
- R03 — repaired: 4.2 now cites "Tau Ceti `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`, applied to the trivializations of `S(V)` with fibre `Sⁿ` obtained from those of `V` by normalizing"; 4.2's *Needs:* and the contract name it.
- R04 — not repaired: the description is unchanged (it still mentions HomotopySpheres' James construction, the compact-image embedding and a rotation family in `Suggested.lean`). Carried as R02.

## Verified sound

### Gate, dependency check, build

The worker's gate at this head (`gate.md`) reports every check passing, `build=0` included.

I ran the gate twice:

- **The brief's command, with the configured order.** It reports one problem:
  `depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#335)`. Every other
  check is 0.
- **The same command with `--order merge-order-moved.txt --build`.** Every check is 0, with
  `build=0`, and the result is `OK`.

The UPWARD line in the first run is not a defect. The configured order still lists this roadmap at
#46, but the movable check places it after its last supplier, as reviews 11–18 found. The brief's
dependency check:

    depcheck: 235 roadmaps, 2265 edges, 0 problem(s)

The moved order puts TangentialBordism at line 14, GeneralAlgebraicKTheoryPartII at line 334 and
this roadmap at line 335. The change adds three edges (2262 → 2265), all of them Tau Ceti
citations.

Other checks:

- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

### The changed passages, claim by claim

- **Contract: the cotangent lift (README lines 335–346).** Each name exists at the pinned Tau
  Ceti `2fd255d` with the stated content:
  - `Diffeomorph.cotangent` (`Diffeomorph/Cotangent.lean` line 119) has type
    `CotangentBundle I M ≃ₘ CotangentBundle J N`, with different models allowed. By
    `cotangent_apply` (line 132) it is `(x, p) ↦ (h x, p ∘ d(h⁻¹)_(h x))`.
  - `cotangent_symm` (line 186) is `h.cotangent.symm = h.symm.cotangent`.
  - `mpullback_cotangent_symplecticForm` (`Cotangent/Bundle/Lift.lean` line 88) is
    `mpullback h.cotangent (symplecticForm J N) = symplecticForm I M`.
  - `restrictOpen` (`VectorBundle/Cotangent/Opens.lean` line 127) is
    `CotangentBundle I U ≃ₘ overOpen U`, where `overOpen U = {z | z.proj ∈ U}`.
  - `mpullback_restrictOpen_symplecticForm` (`Cotangent/Bundle/Opens.lean` line 96) says that the
    restriction of the ambient form, pulled back along `restrictOpen U`, is `symplecticForm I U`.
- **Contract: the Serre property (lines 347–353).** At the pin:
  - `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` (`SerreFibration/FiberBundle.lean`
    line 365) has the hypothesis `∀ b, ∃ e : Trivialization F p, b ∈ e.baseSet`, for
    `p : E ⟶ B` in `TopCat.{u}`, and nothing else.
  - Its cube form is at line 325.
  - `TauCeti.TopCat.serreFibrations` (`SerreFibration/Basic.lean` line 107) is the `rlp` of
    `TopCat.ι₀ : disk n ⟶ disk n ⊗ I`, as stated.
  - "The predicate of DGFloer Layer 1 item 2" is accurate on main (lines 470 and 490–496).
- **1.3, the change of projective model (lines 769–775).** I composed the two declarations the
  prose names, at the pin:
  - `TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_image` (`HoferZehnder.lean`
    line 295) takes `ψ : M ≃ₘ⟮I, I₂⟯ M₂` with `[FiniteDimensional ℝ E] [FiniteDimensional ℝ E₂]`.
    Its hypothesis `hψ` is literally `mpullback_cotangent_symplecticForm ψ`.
  - The dual-norm identity `|p ∘ (dψ_x)⁻¹|_g = |p|_(ψ*g)` holds: for `w = dψ v`,
    `sup |p(v)|/|dψ v|_g = sup |p(dψ⁻¹ w)|/|w|_g`. So the lift maps `D*_(ψ*g)M` onto `D*_gN`.
  - Every metric on `M` has the form `ψ*g`, so the capacity comparison holds "for all metrics at
    once".
- **4.2, the covering descent (lines 1348–1365).** Over a sheet,
  `restrictOpen U ∘ cotangent(ρ|Ũ) ∘ (restrictOpen Ũ)⁻¹` sends `(x̃, p)` to
  `(ρ x̃, p ∘ (dρ_x̃)⁻¹)`, which is `ρ̂`. The form identity holds on each `overOpen Ũ`, and these
  sets cover `T*Q̃`, so `ρ̂^*ω = ω` globally. The required smoothness classes are
  `IsManifold I 1` (`restrictOpen`) and `IsManifold I ∞` (form lemma), and both hold for closed
  smooth manifolds. `ρ̂⁻¹(D*Q) = D*Q̃` follows from the same dual-norm identity.
- **4.2, the sphere bundles (lines 1393–1401).** Write the normalizing map as
  `v ↦ (b, e_b v/|e_b v|)` and its inverse as `(b, s) ↦ e_b⁻¹s/|e_b⁻¹s|_b`.
  - Forward after inverse is `s/|s| = s`; inverse after forward is `v/|v|_b = v`.
  - The forward map is continuous because `e_b v ≠ 0` on `S(V)`. The inverse is continuous
    because the fibre metric is continuous (`IsContinuousRiemannianBundle`) and `e_b⁻¹ s ≠ 0`.
  - So these are `Trivialization`s with fibre `Sⁿ` over the base sets of `V`, and the Tau Ceti
    lemma applies over any `B`.
  - Hatcher's Proposition 4.48 (`hatcher-at` lines 16461–16462) gives homotopy lifting for all CW
    pairs, with no paracompactness. That is the Serre property.
- **4.2a (lines 1529–1546).** Let `s` be a local section with `s(x) e_r = x`.
  - Then `s(A e_r)⁻¹ A e_r = e_r`, so `s(A e_r)⁻¹ A` lies in `Stab(e_r) = diag(SO(r), 1)`. That is
    the image of `soBlockInclusion r`, whose new coordinate is last (`Suggested.lean` lines
    338–352). The inverse is `(x, B) ↦ s(x) B`.
  - SmoothBundlesConnections B1.4 (main line 421) supplies the principal-bundle projection of
    `G → G/H` (its line 441), hence the local sections.
  - The restriction `r ≥ 1` costs the Lean statements nothing (adversarial row N7).
- **The new Checks** (1.3 at lines 828–833, 4.2 at lines 1495–1499) are recomputed in rows N1, N2
  and N5.
- **The *Needs:* lines and Dependencies** (README lines 795–800, 934–940, 1437–1447, 1550–1552 and
  2105–2112) name exactly the declarations the prose uses.

### Library declarations elaborated at the pins

`TauCeti.Geometry.Symplectic.Cotangent.Bundle.Lift` and `…Bundle.Opens` had no object files, so I
built them first with `lake build` (it unpacked 6101 cached jobs and succeeded). A scratch file then
imported Mathlib, those two modules, `SerreFibration.FiberBundle` and `Capacity.HoferZehnder`, with
`#check @name` for nine declarations:

- `Diffeomorph.cotangent`, `Diffeomorph.cotangent_symm` and
  `Diffeomorph.mpullback_cotangent_symplecticForm`;
- `TauCeti.CotangentBundle.restrictOpen` and
  `TauCeti.CotangentBundle.mpullback_restrictOpen_symplecticForm`;
- `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`,
  `TauCeti.hasHomotopyLiftingProperty_cube_of_exists_trivialization` and
  `TauCeti.TopCat.serreFibrations`;
- `TauCeti.SmoothTwoForm.IsNondegenerate.contractibleHZCapacity_image`.

It exits 0 with no error. Each elaborated type matches the contract's description.

### Elaboration of `Suggested.lean`, signatures, padding

- **Elaboration.** I ran `lake env lean` on a scratch copy with `#check @name` appended for all 31
  declarations. It exits 0 with 27 `sorry` warnings and no other message: the 31 declarations
  less `SO`, `soBlockInclusion`, `soBlockInclusion_one` and the `CPᵈ` instance.
- **Signatures.** The 31 `#check` types are those of `signatures.md`. Its two extra entries, `of`
  (line 130) and `on` (line 298), are docstring words, not declarations. The file is unchanged, so
  the review-18 comparison of every signature with its README statement still holds, including
  the fibered-family binders `ConnectedSpace Q`, `CompactSpace F`, `hF`, `hp`, `hσ`, `he₀`, `hj`
  and `hσj`.
- **One-tactic probe.** It is carried from review 18, on the byte-identical file and pins. All 27
  `sorry`s survive `first | infer_instance | rfl | (simp; done) | exact?`.
- **Headlines.** They are carried from review 18:
  - stated: Theorem B; Theorem I's capacity forms; Lemma 6.35; the finite-rank range and Bott
    statements; Theorem G; 1.0's coreflection and product criterion;
  - named as not statable: Theorem H and abundance, products, Proposition 6.36, stable `O`, the
    Clifford chain;
  - statable but absent: none. Padding: none.

### Seeded source sample

Locators are `bdho-cotangent` line numbers unless another source is named.

| Target | Where checked | Result |
| --- | --- | --- |
| 1.3 (changed) | the changed passage adds no source locator. Tau Ceti `Diffeomorph.cotangent`, `mpullback_cotangent_symplecticForm` and `contractibleHZCapacity_image` were opened and elaborated above. The rest of 1.3 is unchanged and was checked in reviews 14 and 16–17. | as stated |
| 4.2 (changed) | Hatcher Prop 4.48 (`hatcher-at` lines 16461–16462, PDF page 388); Remark 6.2 (lines 4351–4353, printed p. 100: symplectic coverings of Liouville domains); Tau Ceti declarations above | as stated |
| 1.1, 1.2, 1.4, 1.5, 2.2, 2.3, 2.5, 2.6, 3.2, 4.6 | untouched; review 18's sample table | as stated there |
| 2.4, 4.2b, 4.3 | untouched; review 17's sample table (DGFloer Layer 4 item 5 and Layer 5 item 4; `eschenburg-hanke-bott` lines 264, 284–350; Lemma 6.35 at lines 5073–5094, p. 117) | as stated there |

The README flags no locator as unverified.

### Adversarial table

Rows 1–25 are carried from review 18 for the untouched statements; review 18's rows 26–27 were the
uncited objects and are replaced by rows N3–N4 and N6. Rows N1–N8 are new and cover the changed
statements.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1. fibered family (Lean), review 18 | `Σ = SO(3) ⊔ SO(3)` over `S²` | product `e₀`: `j_*[F] = 2α′`; swap-and-reverse: `0`; opposite copies: `σ_*[Σ] = 0` | reduction to `F₁ = SO(2)`, class `±α′` | none |
| 2. trivial-bundle sentence, review 18 | `S² × (S¹ ⊔ S¹)` | bidegree-`(1,1)` map `S² × S² → S²` would need `[ι₂, ι₂] = 0`; it is `2η ≠ 0` | true | none |
| 3. component step, review 18 | compact `F` | `j_*[F] = Σ ±j_*[F_i] ≠ 0` forces some `j_*[F_i] ≠ 0` | true | none |
| 4. covering descent, review 18 | `ρ : S² → ℝP²` | `H ∘ ρ̂` has compact support `ρ̂⁻¹(supp H)`, the same maximum, orbits project with the same `T` | true | none |
| 5. descent, degenerate, review 18 | `Q̃ = ∅`; `ℝ → S¹` | nowhere to attain the maximum; `ρ̂⁻¹(supp H)` not compact | "surjective", "finite" needed and stated | none |
| 6. descent vs Tau Ceti fields, review 18 | `IsContractibleHZAdmissible` | `tsupport ⊆ interior W`, `IsMaxOn F univ`, nullhomotopic loop in `W`; all pull back | consistent | none |
| 7. Theorem B (Lean), review 18 | `T^r`; `ℝP³`; `U = ∅` | `π = 0`: `hQ` false; `π₃(ℝP³) = ℤ`: `hQ` true; `H_n(∅) = 0`: `hU` false | true | none |
| 8. Theorem B route, review 18 | `d = Nb` | infinite order is not `d^m`-torsion: Thm 5.10 condition 2 | sound | none |
| 9. Prop 6.13, review 18 | `N = S⁰` | `M × S⁰ = M ⊔ M` disconnected | excluded | none |
| 10. Theorem G (Lean), review 18 | `k = 2, 3, 4` | `ℓ = 2, 2, 6`; Lemma 7.7 at `d = 1, 1, 5` | as stated | none |
| 11. 1.4 degrees, review 18 | `n = 1..4` | rotation `2, 0, 2, 0`; Stiefel `0, 2, 0, 2` | as stated | none |
| 12. 2.1 indices, review 18 | `k = 2`, `d = 2` | `CP²`: `5`; `HP²`: `13` | as stated | none |
| 13. 2.2–2.3 cells, review 18 | `CP²`; `HP²` | `0,1,4,5,8,9`; `3,10,13,20`, gap `3` | as stated | none |
| 14. 2.5 degrees, review 18 | two boundary maps | `2d+1 → 2d`; `4d+3 → 4d+2` | as stated | none |
| 15. 2.6, review 18 | `HPᵈ` fibre `S² × S¹ → S³` | degree `1 + (−1)² = 2`; `dim Σ_p = 4d + 1` | `±2g` | none |
| 16. 3.1, review 18 | torsion `α` | `S = ∅`, `0 = Nα` | excluded by 3.2 | none |
| 17. 4.2 sphere bundle even, review 18 | twistor `S² → CP³ → S⁴` | `π₄(S⁴) = ℤ` breaks `hB`; `π₃(CP³) = 0` | hypothesis sharp | none |
| 18. 4.2 sphere bundle odd, review 18 | `n = 3`, `u = ix`, `w = jx` | `⟨x, ix⟩ = 0`, `⟨ix, jx⟩ = 0` | true | none |
| 19. 4.2a range (Lean), review 18 | `(n,i) = (2,1),(3,3),(4,3)` | `ℤ → ℤ/2` onto; `ℤ → ℤ²` not onto; `ℤ² → ℤ` onto | sharp | none |
| 20. 4.2b, review 18 | `dim Ω₁` | `64m² − 8m = n²/4 − n/2` | as stated | none |
| 21. 4.2c bounds, review 18 | `k = 0..7` | `8m−1, 4m−1, 2m−1, …, m−1`; index `≥ (s − \|c\|)/4` | as stated | none |
| 22. Bott (Lean), review 18 | `j mod 8` | `{1,3,4,5}`, `{0,7}`, `{2,6}` ranges; `m ≥ j + 11` | as stated | none |
| 23. Lemma 6.35 (Lean), review 18 | `n = 17`; `n = 7` | `(ℤ/2)²`; formula `0 ⊕ ℤ/2` vs `π₆(SO(7)) = 0` | `n ≥ 17` right | none |
| 24. 4.5 small cases, review 18 | `CP⁰`; `S¹` | point: `0 < ⊤`; `S¹`: `∞` | `2 ≤ n` needed | none |
| 25. 4.5 metric change, review 18 | `D*_(g₁) ⊆ λ·D*_(g₂)` | `c°(λW) = λc°(W)`; `π₁` injects | sound | none |
| N1. 1.3 lift direction (new Check) | `ψ : ℝ/ℤ → ℝ/2ℤ`, `x ↦ 2x`, `g = dy²` | `(dψ)⁻¹∂y = ∂x/2`, so `p dx ↦ (p/2) dy`; `ψ*g = 4dx²`, `\|p dx\|_(ψ*g) = \|p\|/2 = \|(p/2)dy\|_g`; `q dy` pulls back to `(p/2)·2dx = p dx` | true; matches `cotangent_apply` | none |
| N2. 1.3 wrong model (new Check) | `(x, p) ↦ (2x, 2p)` | `q dy ↦ 2p·2dx = 4p dx`; `{\|p\| ≤ 2} ↦ {\|q\| ≤ 4} ≠ {\|q\| ≤ 1}`; preimage of `D*g` is `{\|p\| ≤ 1/2}` | negative control right | none |
| N3. 1.3 capacity transport | `cotangent ψ` for K7.1's `CPᵈ` → `TauCeti.ComplexProjectiveSpace d`, different models | `contractibleHZCapacity_image` takes `M ≃ₘ⟮I, I₂⟯ M₂`; total model `E × (E →L ℝ)` of dimension `4d`; `hψ` = `mpullback_cotangent_symplecticForm ψ` | composition elaborates at the pin | none |
| N4. 4.2 local symplectomorphism | `ρ : S² → ℝP²`, `Ũ` an open hemisphere | composite of `restrictOpen`, `cotangent(ρ\|Ũ)`, `restrictOpen⁻¹` is `(x̃, p) ↦ (ρx̃, p ∘ dρ⁻¹)`; 2 sheets; `ρ̂⁻¹(D*ℝP²) = D*_(ρ*g)S²` | true | none |
| N5. 4.2 normalizing trivialization (new Check) | `V = ℝ²`, `\|(x,y)\|_b² = 4x² + y²`, `e = id` | `(1/2,0) ↦ (1,0)`, `(0,1) ↦ (0,1)`; inverse `(1,0) ↦ (1,0)/2 = (1/2,0)`, `4·¼ = 1`; round trips `s/\|s\| = s`, `v/\|v\|_b = v` | true; bare `e` lands on the ellipse | none |
| N6. 4.2 Serre property, any base | `n = 0`; non-paracompact `B` (long line) | `n = 0`: double cover, `Trivialization` with fibre `S⁰`; the Tau Ceti hypothesis needs no instance on `B` (elaborated type); Hatcher 4.48 needs none either | true | none |
| N7. 4.2a `SO(r+1) → S^r` | `r = 0, 1`; Lean `(n, i) = (1, 0)` | `s(Ae_r)⁻¹Ae_r = e_r`; `r = 1`: `SO(2) ≅ S¹`, fibre `{1}`; `r = 0`: image `{e₀} ⊊ {±e₀}`, fibres `{1}`, `∅`; `surjective_map_soBlockInclusion 1 0` uses `r = 1` only | `r ≥ 1` right, costs nothing | none |
| N8. 4.2a `U`, `Sp` ranges | `r = 0, 1`; `Sp` at `i = 4, 5, 6` | `U(1) ≅ S¹`, `Sp(1) ≅ S³`; `π₁(U(1)) = ℤ ≅ π₁(U(2))`; `π₄(S³) = ℤ/2 = π₈(O)`, `π₅(S³) = ℤ/2 = π₉(O)`; `i = 6`: `ℤ/12 → π₁₀(O) = 0` onto, not injective | ranges right and sharp | none |

### Citations and ownership

- **Tau Ceti citations.** All nine names above were opened and elaborated at `2fd255d`. No new
  Mathlib name is cited.
- **Roadmap citations in the changed text.**
  - DGFloer Layer 1 item 2 (main line 470; #1798 line 112 and numbering note lines 163–177).
  - SmoothBundlesConnections B1.4 (main line 421).
- **Ownership.** The change only replaces a textbook citation and an unnamed construction with
  pinned Tau Ceti declarations, so it raises no new ownership question. `overlaps.md` lists no
  open pull request that changes this roadmap, and no dropped id.
- **Remark on untouched text.** `overlaps.md` says main does not define GeneralizedCohomology
  G4.0b. That is a false positive: main's `GeneralizedCohomology/README.md` defines it in the item
  text at line 1082 ("G4.0b: construct smooth real manifold structures …"), not in a heading. It
  is also named at its lines 39–40 and 939.
- The source issues recorded in review 18 still stand. This round found no new one.

## Not verifiable

No text this review needed was missing. Review 18's list still applies to untouched sections:
Ziller; Milnor, *Morse Theory*; Bott 1959; Steenrod; Milnor–Stasheff; Pontryagin; Thom 1954; BDHO,
*Morse homology with DG coefficients*; and [Jap87]. The values that depend on them were
recomputed.

## Source issues

- none
