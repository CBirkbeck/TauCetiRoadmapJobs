<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13151#issuecomment-6849225628 -->
Red team round 2 pass a (claude) of 491af8b

Verdict: needs_changes

1. **F01** (P3) "nondiscrete valuation ring" does not give a non-finitely-generated maximal ideal

   Location: `packages/LocalFieldsRamificationPartII/README.md:682–684` ("for a nondiscrete valuation
   ring `R` … `S = R[X]/(𝔪X)` … is not finitely presented, since `𝔪` is not finitely generated") and
   README.md:734–735 (Layer 1 Examples: "`A/𝔪` over a nondiscrete valuation ring is … not finitely
   presented").

   Claim: every nondiscrete valuation ring has a maximal ideal that is not finitely generated.

   Witness: value group `ℚ × ℤ` (or `ℤ × ℤ`), lexicographic, first coordinate dominant: least positive
   element `(0, 1)`, so `𝔪 = (π)`. Then `A/𝔪 = A/(π)` and `R[X]/(πX)` are finitely presented. The
   §1.5 Check at README.md:717 already states the hypothesis.

   Repair: in both places replace "a nondiscrete valuation ring" by "a valuation ring whose maximal
   ideal is not finitely generated (its value group has no least positive element, for example a
   valuation of height one with dense value group)". On the witness the Checks then assert nothing.

2. **F02** (P3) §2.1 route applies the source-side descent contract without its surjectivity hypothesis

   Location: README.md:752–755 ("put `A = A′ ∩ L`, a Prüfer domain by §1.1, over which `A′` is flat and
   of finite type, hence finitely presented by §1.5; descent from the source along `Spec A′ → Spec A`").

   Claim: `gap:source-side-fpqc-descent` applies to `Spec A′ → Spec A → Spec V`.

   Witness: README.md:294 states the contract for `f` "faithfully flat"; ega4 line 2750 likewise. The
   route gives only flat and finitely presented; surjectivity of `Spec A′ → Spec A` is neither stated
   nor proved (temkin17 lines 379–381 omit it too).

   Repair: after "hence finitely presented by §1.5" insert: "The image `U` of `Spec A′ → Spec A` is
   open (`AlgebraicGeometry.UniversallyOpen.of_flat`,
   `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean`), quasi-compact, and separated over
   `Spec V`; apply the two contracts to `Spec A′ → U → Spec V`, so that `U` is of finite presentation
   over `V` and étale at the image point; `W` is the local ring of `U` there, and a principal open
   `Spec A_f ⊆ U` in the étale locus exhibits `W` as a localization of the étale `V`-algebra `A_f`."
   Add the Mathlib name to the §2.1 *Needs:* line. Test: for `L = K`, `V` a discrete valuation ring and
   `A′ = B_g` a one-point localization of a split quadratic étale `B`, `A = V`, `U = Spec V`, and the
   conclusion is `V` étale over itself.

3. **F03** (P3) §6.5 Check contradicts the next Check

   Location: README.md:1637–1638 ("For the separable closure of `𝔽_p(t)` with any valuation the
   hypothesis holds for every `P`").

   Claim: both hypotheses of `isSeparablyTameField_of_isSeparablyPClosed` hold for every `P`.

   Witness: `P = ∅`: `hp : ringExpChar (ResidueField V) ∈ P` fails for every `V`, as README.md:1640–1641
   says ("the hypothesis on the residue characteristic never does").

   Repair: "For the separable closure of `𝔽_p(t)` with any valuation the closedness hypothesis holds
   for every `P`, and the residue hypothesis for every `P` containing `p`; `t^{1/p}` gives a non-tame
   algebraic extension: …". On `P = ∅` the repaired Check claims only closedness, which holds.

4. **F04** (P3) locator in §0.3 does not contain the statement

   Location: README.md:447–451 ("`IsSeparablyPClosed P K` holds exactly when the perfection …
   satisfies `IsPClosed P` (… Temkin 2017, Remark 2.4.7, p. 108, with …)").

   Claim: Remark 2.4.7 supports the equivalence between separable `P`-closedness and `P`-closedness of
   the perfection.

   Witness: temkin17 lines 478–483: Remark 2.4.7 lists separable analogues of the splitting conditions
   and mentions neither `P`-closed fields nor the perfection. The perfection and the identification
   `G_{lᵃ/l} = G_{kˢ/k}` are at temkin17 lines 469–470 (§2.4.6, proof of (0) ⇒ (4)).

   Repair: replace the locator by "the identification of the Galois groups of `K` and of its
   perfection is Temkin 2017, §2.4.6, proof of (0) ⇒ (4), p. 108; the equivalence itself is proved
   here".

5. **F05** (P3) §0.4 "analogous separable statements" is not a statement

   Location: README.md:470 ("The analogous separable statements hold inside `Kˢ`.").

   Claim: each statement of §0.4 has a separable analogue.

   Witness: the perfection statement has none: for `K = 𝔽_p(t)`, `P = {p}`, a maximal separable
   `{p}`-extension inside `Kˢ` is separably `{p}`-closed and imperfect (`t^{1/p} ∉ Kˢ`).
   AdicCoefficientsAndComparisonsPartII (README line 96) requests exactly the precise form as
   `gap:maximal-separable-p-extension`.

   Repair: replace the sentence by "Prove that inside `Kˢ` every separable `P`-extension of `K` is
   contained in a maximal separable `P`-extension, every finite subextension of which is separable of
   `P`-number degree, and that this maximal extension satisfies `IsSeparablyPClosed P`; it need not be
   perfect." and add the Check "for `𝔽_p(t)` and `P = {p}` the maximal separable `{p}`-extension is
   separably `{p}`-closed and does not contain `t^{1/p}`".

6. **F06** (P3) §6.1 *Needs:* line omits what the last clause uses

   Location: README.md:1547–1548 ("that `K_i` with residue characteristic exponent `1` is tame without
   induction … *Needs:* §0.3, §0.4, §5.1.").

   Claim: §§0.3, 0.4 and 5.1 suffice.

   Witness: the tameness clause is the §2.7 bullet at README.md:945 ("If the residue characteristic
   exponent is `1`, `IsTameField V` holds"), and the indexed coarsenings `K_i`, `κ_i`, `p_i` are
   defined in §5.2 (README.md:1402–1409), not §5.1. The Layer 6 Dependencies line (README.md:1654)
   omits §5.2 as well.

   Repair: "*Needs:* §0.3, §0.4, §2.7, §§5.1–5.2." and "Layer 5 (§§5.1–5.3, 5.6)" in the Dependencies
   line.

Six new findings, all P3 (S01–S06). No P1 or P2. All fifteen round-1 findings are repaired at this
head and no repair introduced an error. No Lean was run in this pass (read-only brief): the Lean
side was checked by reading `packages/LocalFieldsRamificationPartII/Suggested.lean` against the
elaborated signatures supplied with the job and against the pinned sources.

## Round-1 findings: status at this head

| Round-1 id | Status | Witness at 491af8b |
|---|---|---|
| 1a/F01 = 1b/F01 (P1), `cd_p(G_F) ≤ 1` had two owners | repaired | README.md:100–103 "belongs to ProfiniteCohomology, Layer 9, through the supplier contract below"; contract at README.md:350; plan `gaps` has `char-p-galois-h2-vanishing` (supplier ProfiniteCohomology, Layer 9); the Lean declaration is gone; heading "Layer 9: the Galois interface: Hilbert 90 and Kummer theory" exists on main. |
| 1a/F02 (P2), noncomplete Krasner absent | repaired | Suggested.lean:164–168 `isKrasner_of_henselianLocalRing`; README.md:1227–1232 "for a nontrivially normed field `K` with ultrametric norm whose valuation subring … is a henselian local ring". Truth recomputed below. |
| 1a/F03 (P2), compound descent gap | repaired | README.md:294–295: two contracts, 17.7.5(iv) and 17.7.7; plan `gaps` has both slugs; ega4 lines 2750–2758 and 2795 are separate results. |
| 1a/F04 (P3), wrong lemma in §6.3 Needs | repaired | README.md:1583–1585 cites `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn`; pinned statement (`IsIntegrallyClosedIn k F`, `Algebra.IsSeparable k k'`) matches the contract at README.md:250–254. |
| 1a/F05 (P3), Layer 0 example and §6.3 Check | repaired | README.md:507–509 "for any `P` containing a prime, while for `P = {1}` or `P = {4}` …"; README.md:1588–1595 (`ℚ(t)`, `√t`; degree `1 ≠ 2` recomputed). |
| 1a/F06 = 1b/F06 (P3), `GF.k` identifiers undefined | repaired | README.md:373–384, table headed "Former identifier / Section here". All 43 plan ids `GF.k/<name>` occur in it; the 12 ids cited by AdicCoefficientsAndComparisonsPartII and QuadraticFormInvariantsPartII are among them. |
| 1a/F07 (P3), restating Checks in §3.3 and §6.2 | repaired | README.md:1139–1144 (`ℚ_3(√3)` dimensions 2/2; `ℚ_3(√−1)` kernel of dimension 1); README.md:1567–1570 (`ℂ_p`, `ℚ_2`). |
| 1a/F08 (P1), unowned homogenization and graded finite presentation | repaired | README.md:638–684: two prose targets with 4 and 3 Checks; stacks-more-algebra lines 2879–2885 (tag 053D) and 2895–2903 (tag 05GS) agree with the restatement. One Check is imprecise: S01. |
| 1a/F09 (P2), Prüfer headline absent from Lean | repaired | Suggested.lean:77–94, two theorems with `[IsDomain A]`, `[Algebra.FiniteType A B]`, flatness and `hA` in the form of the pinned `Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`. |
| 1b/F02 (P2), total ramification versus the base convention | repaired | README.md:137–141 "that implies total ramification here, and the two disagree exactly when the residue extension is nontrivial and purely inseparable"; §2.9 target and Checks at README.md:990–1011; main's §3a.1 says `f(L/K_0) = 1` is "totally ramified" (its line 442). |
| 1b/F03 (P3), summary link | repaired | README.md:3 links `../../Completed/LocalFieldsRamification/README.md`; the folder is under `Completed/` on main. |
| 1b/F04 (P3), Mathlib root continuity not delimited | repaired | README.md:176–182; pinned `Mathlib/Analysis/Normed/Field/Approximation.lean:52,115` has exactly the stated hypotheses and radius. |
| 1b/F05 (P3), prose titles as citations | repaired | README.md:336–344 "From TauCetiRoadmap.ProfiniteProPGroups"; Layer 2, items 5.1–5.6 and Layer 6 exist in `Completed/ProfiniteProPGroups/README.md` (lines 354, 1094–1158, 1246). |

## Dependency check

```text
depcheck: 206 roadmaps, 1898 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Suppliers named: SchemeAndStackFoundations, ProfiniteCohomology,
RamificationOfCompleteDiscretelyValuedFields (main, active), LocalFieldsRamification,
ProfiniteProPGroups (main, completed), ClassicalAdicEtaleCohomology (open new roadmap, merge-order
line 75, before this roadmap at line 388). None is on the never-cite list.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsPNumber` | `n = 0`, `P` all primes; `P = ∅`; `P = {1}`, `{4}`; `6` for `{3}` | `0 < 0` false; only `n = 1`; only `n = 1`; `2 ∣ 6`, `2 ∉ {3}` false | determines the object | none |
| `IsPClosed`, `IsSeparablyPClosed` | `P = ∅`; `K = 𝔽_q`, `P = {ℓ}`; `K = 𝔽_p(t)ˢ`, `P = {p}` | every `E` of degree 1 is `⊥`; `𝔽_{q^ℓ}` degree `ℓ` refutes both; separable: no `E`, full: `K(t^{1/p})` degree `p` | agree with §0.3 Checks | none |
| §0.2 tower law | `M/L/K`, `L` infinite, `E = K(α)` | `[L_0(α) : K] = [L(α) : L]·[L_0 : K]`, `[E : K]` divides it | route sound | none |
| §0.3 perfection equivalence | `q ∈ P`, `q ∉ P` | finite extensions of `K^{perf}` are separable and descend with equal degree in both cases | true | locator: S04 |
| Prüfer algebra theorem | `A` field; `A = ∏𝔽₂`; valuation ring with `𝔪 = (π)`, `B = A/(π)`; `B = 0` | f.p.; not a domain, excluded; torsion, not flat, excluded; f.p. | true | none |
| Prüfer module theorem | `B = A[x]/(ax)`, `M = B/(x) ≅ A`; `B = A`, `M = A/𝔪`; `M = 0` | `M` flat, kernel `(x)` f.g.; torsion, excluded; f.p. | true; `B` need not be flat | none |
| §1.5 route, torsion quotient | `S ↦ S/S_tors` with `B = S_(f)` torsion free | `S_(f) = colim S_d`, torsion of `S_d` dies in `B`; `(S/S_tors)_0 = A` | sound; 053D(2) does not need `S` flat | none |
| §1.5 Check "nondiscrete" | value group `ℚ × ℤ` lex | `𝔪 = (π)`, `R[X]/(πX)` f.p. | Check false as worded | S01 |
| `IsTameGaloisExtension` | `p = 1`; `V = ⊤`; `ℚ_p(ζ_p)`; `ℚ_2(i)`; unramified degree `p`; `ℚ(√2)` at 7; `X³ − X − 2` at 2 | coprime to 1 always; inertia 1; `p − 1`; 2; inertia 1, decomposition `p`; 1 at both; disc `−104`, `e = 2`, `f = 1`, `g = 3`, inertia 2 | inertia (not decomposition) is the discriminating law | none |
| `galoisTamePart` | henselian `V`; `p = 1`; `X³ − X − 2` at 2 | `Kᵗ`; `Kˢ`; cubic field fixed by `D` lies in `Kʰ`, not in the Galois part | largest Galois subextension of `Kᵗ` | none |
| `IsSeparablyTameField`, `IsTameField` | `V = ⊤`; `ℚ_p`; algebraically closed `K` | separably tame always, tame iff perfect; `ℚ_p(ζ_{p²})` inertia `p(p − 1)`; no nontrivial `L` | match `Kˢ = Kᵗ`, `Kᵃ = Kᵗ` | none |
| §2.6 purely wild iff totally ramified `{p}`-extension | henselian `K`, finite `F ⊆ L`; `p = 1` | `[FKᵗ : Kᵗ] = [F : K]` a `p`-power as `W` is pro-`p`; `Kᵗ = Kᵃ`, `L = K` | true | none |
| §2.9 Check | `y^p − y = s t^{−p}`, `z = ty` | `z^p − t^{p−1}z = s`, residue `z̄^p = s`, `e = 1`, `f = p` | total here, not there | none |
| §2.10 | same extension over `K^{perf}` | `c_n = s^{1/p^{n+1}} t^{−1/p^n}`, value `−1/p^n < 0` at every stage: immediate defect extension, still not unramified | consistent | none |
| `exists_continuous_section_of_isProP_ker` | kernel 1; `ℤ/p² → ℤ/p`; `Ẑ → ∏_{ℓ≠p} ℤ_ℓ`; no `T2Space` binder | `f` homeomorphism (compact to Hausdorff); `cd_p ℤ/p = ∞`, excluded; `cd_p = 0`, section is the inclusion; totally disconnected topological group is `T1`, hence `T2` | true as typed | none |
| §3.1 route (b) | minimal `H`, open normal `U` | `H′ = {h : h̄ = β_U(f h)}` closed, onto `G`, so `H′ = H`; hence `H ∩ N ⊆ U` for all `U` | sound (gives `H ∩ N = 1`) | none |
| `sup_galoisTamePart_eq_top_of_henselian` | `p = 1`; `V = ⊤`; separably closed imperfect `K` | `E = ⊥`, `⊥ ⊔ Kᵃ = ⊤`; `E ∩ Kˢ = K` forces `E = K^{perf}`, sup `= Kᵃ`; `E = Kᵃ` | true; follows from kpr86 Theorem 2.1(ii) | none |
| §3.2 Check, non-normal maximal purely wild | `p` odd: `ℚ_p(ζ_p, p^{1/p})`; `p = 2`: an `A₄`-extension | `ℤ/p ⋊ (ℤ/p)^×` has no central-product decomposition; `V₄` not centralized by `C₃`, `A₄` not metacyclic | Check true | none |
| `isKrasner_of_henselianLocalRing` | `ℚ` at 7, `L = ℚ(√2)`; `L` with archimedean norm | `‖√2 − 3‖ ≤ 1/7 < ‖2√2‖ = 1`, `√2 ∉ ℚ`, `ℤ_(7)` not henselian; impossible: `‖n‖ ≤ 1` on `ℕ ⊆ K` forces `L` ultrametric | true; `IsIntegral K y` automatic | none |
| §4.1 root continuity | `f = X`, `g = X − 2`; `f = X² − 1/16`, `g = f + 2X`; `deg g ≠ n`; `f = g = X² − 1` at `ε = 1`, `2` | `ε = 1`, distance value 1; `ε = 1/2 − 2 < 0`, roots `5/4 + 8w`, `−13/4 − 8w` at value `≤ 0`; `v(f − g) ≤ 0`; two roots at `ε = 1`, one at `ε = 2` | statement and Checks correct; pairing is a bijection by counting | none |
| §4.3 Check | `ℚ(t)`, `E = Kʰ`, `√(1 + t)` | in `Kʰ` (simple root of `X² − 1`), not in `ℚ(t)` | henselian hypothesis needed | none |
| `algebraicIndependent_of_valuation_independent` | `x_i = 0`; `x_i = x_j`; `ι = κ = ∅`; `𝔽_p(t)` `t`-adic and Gauss | `n = e_i`: `0 ∈` range, excluded; `n = e_i − e_j`: `1 ∈` range, excluded; trivial; `(1, 0)` and `(0, 1)` against `trdeg = 1` | true; residue algebra instance is Mathlib's `IsLocalHom (algebraMap K₀ L₀)` | none |
| `ringKrullDim_le_ringKrullDim_comap_add` | `n = 0`; `ℚ(t)`, composite; restriction of height `∞` | equality; `2 ≤ 1 + 1`; trivially true | true | none |
| §5.4–5.6 | `i = 0`, `i = d`; `ℚ_p((t))`, `s^p = t`; `𝔽_p((t))((u))`, `i = 1` | reduce to separability plus the statement itself; coarse tame, residual trivial, quotient `ℤ/p`, `e = p`: not tame; `p_1 = p`, coarse field not tame | consistent with §2.3, §2.4 | none |
| `isTameField_of_isPClosed` | `p = 1`; `V = ⊤`, `p` prime; `ℚ_p`; `ℂ_p` | `P = ∅`, hypothesis empty, char 0 so perfect and coprime to 1; `{p}`-closed gives perfect; `X^p − p` breaks the hypothesis; holds | true | none |
| `isSeparablyTameField_of_isSeparablyPClosed` | `1 ∈ P`, `p = 1`; `P = ∅`; `𝔽_p(t)ˢ`; inertia of `L` versus `L·K^{perf}` | trivial; `hp` false; separably tame, not tame; residue fields differ by a purely inseparable extension, same kernel | true | Check wording: S03 |
| §6.1, §6.3 | `X^p − a`; `F/K_0` of `p`-power degree | root or irreducible of degree `p`; `F ⊗_{K_0} K` a field of the same degree | sound | Needs: S06 |
| Gaps (three) | identity of `Spec 𝔽₂`; `F = 𝔽_p`; `F` separably closed | conclusions hold; `cd_p Ẑ = 1 ≤ 1`; `0 ≤ 1` | precise, single statements, same slugs in plan and README | none |

## Headline theorems and padding

Headlines in the README: Temkin's tameness theorem (§6.4), the separable export (§6.5), the
Kuhlmann–Pank–Roquette splitting over henselian fields (§3.5) and in height one (§4.4), the section
theorem (§3.1), finite presentation over Prüfer domains (§1.5), Krasner over a henselian base
(§4.1), the Abhyankar inequality and height bound (§5.3), the tensor decomposition (§1.4),
decompletion (§4.2), the composition criteria (§§5.4–5.6). The first seven groups are stated; the
height-one splitting, tensor decomposition, decompletion and composition criteria are named in the
module docstring with the missing carrier (wild inertia and tame closure of a non-henselian field;
the henselization of a valued field), and neither exists at the pins (grep of both libraries). No
declaration is padding: none restates a definition, mirrors a Check or follows from one pinned
lemma. P3 note, not a finding: `hA` is not needed for the truth of the algebra statement over a
domain (Raynaud–Gruson 3.4.7, uncertified); the route and §2.1 use it.

## Verified sound

- Declarations read: 16 of 16 (7 definitions, 9 theorems), each against its elaborated signature;
  no section `variable`, no `set_option`, no `lemma`, no sorry'd data; imports are `Mathlib` and two
  existing Tau Ceti modules.
- README targets read: all 43 numbered targets in Layers 0–6, with every Check recomputed
  or tested; six defects, S01–S06.
- Pinned declarations: about 70 names grepped at the pins; statements opened for `IsKrasner`,
  `IsKrasner.of_completeSpace`, both root-continuity lemmas, `ValuationSubring.inertiaSubgroup`,
  the Prüfer flatness lemma, `Subgroup.exists_minimal_isClosed_le`,
  `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn`,
  `TauCeti.IsProPSylow.map_of_surjective`, `TauCeti.IsProPSylow.cohomologicalDimensionAt_eq`,
  the `HasExtension` valuation-subring instances. The pinned
  `TauCeti/Topology/Algebra/Group/Profinite/Section.lean` gives set-theoretic sections only, so §3.1
  is not a duplicate.
- Sibling citations checked: 11 (SchemeAndStackFoundations §§0.12, 0.13, Layer 1 §1.1;
  ProfiniteCohomology Layers 9, 11, §11.6 with `cd_p Ẑ = 1`; ClassicalAdicEtaleCohomology §5.1
  (a)–(c) and §5.3 (i)–(iii) at its open head; LocalFieldsRamification Layers 2–4 and its four
  names; RamificationOfCompleteDiscretelyValuedFields §3a.1; ProfiniteProPGroups Layers 2, 5, 6).
- Locators verified against the cached texts: about 50 (temkin17: §§2.1.1–2.6.5, Lemmas 2.3.2, 2.3.4,
  2.3.8, 2.3.11, 2.4.2, 2.4.4, 2.5.2, 2.6.3, Corollaries 2.5.3, 2.5.6, 2.6.4, Theorems 2.4.9, 2.5.5,
  2.6.6, Lemma 3.2.5, with printed pages; kpr86: Theorems 2.1, 2.2, 4.3, Corollary 2.5, pp. 42–44;
  stacks-more-algebra: tags 0A04, 0F0L, 0537, 053A, 053C, 053D, 05GS, 053E, 0ASJ, 0ASK; ega4:
  17.7.5, 17.7.7, 18.6.8, 18.6.14 with printed pages; cks23: Theorems 14, 16, Example 15; kkv16:
  Lemma 2.1, inequality (12)). One locator does not carry its claim: S04.
- Ownership against open work: searched by object (Abhyankar inequality, Krasner over a henselian
  base, tame fields, Pank splitting, sections with pro-`p` kernel, tag 053E, valued henselization)
  over main and the open heads; no second owner. Two open roadmaps consume this one through the
  `GF.k` identifiers, all of which the mapping table defines.
- Policy: the pull request changes only the package folder; no pull-request number or process word
  in the README or docstrings.

## Not verifiable

- serre-cg (I §3.4, Proposition 16; II §2.2, Proposition 3 and Corollary 1) and rg71 (Corollaire
  3.4.7): settled as uncertified; the locators agree with the citations of them in kpr86 (p. 44) and
  temkin17 (line 380) only.
- "Algebra, Lemma 10.57.10" (README.md:645): the Stacks Algebra chapter is not in the sources cache;
  the number agrees with the quotation in the proof of tag 053E (stacks-more-algebra line 2911).
- aid25 and temkin10 locators: not reopened in this pass; round 1 verified them and the passages are
  unchanged.
- Elaboration of `Suggested.lean` at this head: not run here; the supplied signatures are of the
  file as it stands.

## Source issues

- **Gap** in temkin17 at Lemma 2.3.8, proof of (a) ⇒ (b), p. 106: the source applies EGA IV 17.7.5(iv) to the map from the étale neighbourhood to its intersection with the smaller field without showing it surjective; it should pass to the open image or prove surjectivity; affects the proof.
- **Error** in temkin17 at Lemma 2.3.2, p. 104: the source indexes the factors by valued extensions on the field up to isomorphism; it should index them by the distinct prolongations (two conjugate ones for `ℚ(√2)` at 7); affects a stated result.
- **Misprint** in temkin17 at Lemma 2.3.4, p. 105: the source says every localization of the integrally closed subalgebra is a valuation ring; it should say every localization at a prime ideal; affects a stated result.
- **Error** in temkin17 at §2.4.6, assertion (4), p. 108: the source states a section of the quotient of the Galois group by wild inertia for any class of valued fields; it should restrict to henselian fields, where wild inertia is normal; affects a stated result.
- **Misprint** in temkin17 at Lemma 2.6.3(ii), end of proof, p. 112: the source calls `p` the characteristic of the coarse residue field; it should be that field's residue characteristic exponent for the induced valuation; affects the proof.
- **Misprint** in temkin17 at Theorem 2.6.6, proof, p. 112: the source refers to part (ii) of Corollary 2.5.6; it should refer to Corollary 2.5.6, which has one assertion; affects nothing.
- **Misprint** in cks23 at Theorem 16, proof of (a), p. 13: the source says the difference of two monic polynomials of different degrees is monic; it should say its leading coefficient is `±1`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "491af8b70f9e84aabca44c184ca3220523f665b5", "job": "RT-LocalFieldsRamificationPartII~2a", "model": "fable", "worker": "chris-x22"} -->
