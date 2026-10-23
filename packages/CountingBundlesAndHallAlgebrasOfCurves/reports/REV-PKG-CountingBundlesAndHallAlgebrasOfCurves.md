<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/937#issuecomment-6370398354 -->
Review (claude) of d9d4c34

Verdict: needs changes

1. **F01** (P1) the ≥0 expansion region of §5.1 is reversed, so §5.5 is false as written

   - **Location.** `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md` line 777 (§5.1): "The ≥0 rational function is expanded with z_1≫⋯≫z_s≫w⁻¹; the <0 expression has w large relative to all z_i⁻¹." Line 833 (§5.5): "The ≥0 and <0 functions are expanded in their respective regions."
   - **Claim.** Both regions make w large (z_s≫w⁻¹ means |z_s w|≫1), so §5.5's ≥0 formula is to be expanded in negative powers of w.
   - **Witness.** s=1: §5.5 gives V₁/(1−zw). Expanded with zw large this is −V₁∑_{d≤−1}(zw)^d, which is Y^{<0}; but Y^{≥0}=∑_{d≥0}V₁(zw)^d (S16 line 1551–1553; region "w≪1", S16 line 1545).
   - **Repair.** In §5.1 write: "The ≥0 rational function is expanded with z_1≫⋯≫z_s and w≪1 (power series in z_{i+1}/z_i and w); the <0 one with z_1≫⋯≫z_s and w≫1 (S16, Proposition 5.3, p.325; S16 line 1545)." Re-tested at s=1: V₁/(1−zw) at w≪1 gives ∑_{d≥0}V₁(zw)^d=Y^{≥0}; −V₁/(1−zw) at w≫1 gives ∑_{d<0}V₁(zw)^d=Y^{<0}. Add the s=1 pair as a negative-control Check in §5.1.

2. **F02** (P1) ten design gaps have supplier `none`

   - **Location.** `packages/CountingBundlesAndHallAlgebrasOfCurves/design/plan.json`, top-level `gaps`: records CountingBundlesAndHallAlgebrasOfCurves/G1–G6 and G8–G11 carry no `supplier`, `section` or slug; none appears in the README's `## Exact supplier contracts`.
   - **Claim.** Each is a declared prerequisite with no owner (G12 is R03).
   - **Witness.** plan.json gap records have keys only `id,title,neededBy,detail`; `grep 'gap:CountingBundles'` on the README finds nothing.
   - **Repair.** Every one of these obligations is already a target of this roadmap or a named contract, so record that owner instead of `none` (or retire the record as owned here), and say so in the README where the target sits:

   | Gap | Content | Owner already in the package |
   | --- | --- | --- |
   | G1 | finite-field H² neutrality | §1.6 (now with SPR66 Theorem 3.5, p.179, SPR66 line 6739, read) |
   | G2 | Fine–Herstein count | §1.4 |
   | G3 | invariant generic Hall form and descent | §4.8 |
   | G4 | universal-curve monodromy and Weil density | duplicate of `gap:universal-curve-weil-density` (see R07) |
   | G5 | BB–Hesselink filtration | §8.7 ("First prove the BB–Hesselink theorem") |
   | G6 | Hitchin properness, Λ Lagrangian, connectedness, ACK Lemma 5.5 two-line version, GIT | §7.3, §8.5 and `gap:reductive-character-git` |
   | G8 | Macdonald admissibility, integral HLV | duplicate of `gap:macdonald-admissibility` |
   | G9 | universal monomial positivity and origin value | §6.5, §9.2 |
   | G10 | parabolic Hall calculation, R_g | §11.2 (see R05 for the R_g clause) |
   | G11 | constructible Hall Hopf algebra | §11.5 |

     If the package may not edit these design records, the fix worker reports that and a human closes them; the README needs no new target for any of them.

3. **F03** (P1) §9.3's route uses nonabelian Hodge theory, which nobody owns (G12)

   - **Location.** README line 1395 (§9.3): "Prove genus-wise topological local constancy for the complex coprime Higgs spaces by their nonabelian-Hodge identification with the fixed genus-g twisted character variety"; plan gap G12, supplier `none`.
   - **Claim.** The route needs the Hitchin–Simpson homeomorphism of Higgs moduli with the twisted character variety; it is no target here, no supplier section and no pinned declaration.
   - **Witness.** `roadmaps grep -i 'non.?abelian Hodge|twisted character variet|Corlette'` finds only p-adic Simpson references (PerfectoidTowers, DiamondsAndVStacks, PadicHodgeTheory); no board package owns it.
   - **Repair.** Drop the genus-wise transport. A given complex curve and its coprime Higgs moduli are defined over a finitely generated subring R⊂ℂ; spread out over Spec R, choose by constructibility a dense open U on which Rπ_!ℚ_ℓ is locally constant, compare the stalk at Spec ℂ→η with that at a closed point of U (finite residue field; §8.10 holds in every characteristic), then apply ComplexComparisonPartII §C6.4. This uses only §7.3, CompactSupport Layers 6–8 and ComplexComparisonPartII §C6.4. Tested on rank one, genus one: both sides give t²(1−t)². Retire G12 with it.

4. **F04** (P2) a statable end theorem is absent from Suggested.lean: degree independence of A_X(r,d)

   - **Location.** `packages/CountingBundlesAndHallAlgebrasOfCurves/Suggested.lean` lines 23–24 and 29–30: "The all-characteristic coprime Higgs count lacks … rank-degree absolute bundle counts." and "Mellit's Laurent integrality and degree independence lack the modified Macdonald admissible kernel and universal curve specialization."
   - **Claim.** That A_X(r,d) cannot be stated at the pins, and that degree independence needs Macdonald kernels.
   - **Witness.** The block below elaborates at the pins (`lake env lean`, only the `sorry` warning). It uses TauCeti `FiniteLocallyFreeSheaf.FixedRank` (`TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean` line 69) and `Scheme.Modules.eulerCharBelow` (`Cohomology/EulerCharacteristic.lean` line 105), Mathlib `Indecomposable` (`CategoryTheory/Limits/Shapes/BinaryBiproducts.lean` line 1096).
   - **Repair.** Add to `Suggested.lean` (imports `TauCeti.AlgebraicGeometry.VectorBundle.FixedRank` and `TauCeti.AlgebraicGeometry.Cohomology.Genus`, both at the pin), back-tick the four names in §0.2 and §10.4, and correct the docstring: degree independence of A_X(r,d) is stated; Mellit's Laurent integrality is not statable because the plethystic logarithm on the rational coefficient ring is missing (not the Macdonald kernel); the coprime Higgs count should be reassessed with the same carriers. `hr` may be dropped (rank zero gives 0=0).

   ```lean
   open CategoryTheory CategoryTheory.Limits AlgebraicGeometry TauCeti.AlgebraicGeometry

   universe u

   variable (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]

   /-- The Riemann–Roch degree `χ(E) - r χ(𝒪_X)` of a rank-`r` vector bundle. -/
   noncomputable def bundleDegree {r : ℕ} (E : FiniteLocallyFreeSheaf.FixedRank X r) : ℤ :=
     Scheme.Modules.eulerCharBelow k X E.obj.obj 2 -
       (r : ℤ) * Scheme.Modules.eulerCharBelow k X (InvertibleSheaf.trivial X).obj 2

   /-- A bundle is absolutely indecomposable when its pullback to `X ×ₖ k̄` is indecomposable. -/
   def IsAbsolutelyIndecomposable {r : ℕ} (E : FiniteLocallyFreeSheaf.FixedRank X r) : Prop :=
     Indecomposable
       ((FiniteLocallyFreeSheaf.FixedRank.pullback
         (pullback.fst (X ↘ Spec (.of k))
           (Spec.map (CommRingCat.ofHom (algebraMap k (AlgebraicClosure k)))))).obj E).obj.obj

   /-- Isomorphism classes of absolutely indecomposable bundles of rank `r`, degree `d`. -/
   noncomputable def absIndecCount (r : ℕ) (d : ℤ) : ℕ :=
     Nat.card (Skeleton (ObjectProperty.FullSubcategory
       (fun E : FiniteLocallyFreeSheaf.FixedRank X r =>
         bundleDegree k X E = d ∧ IsAbsolutelyIndecomposable k X E)))

   /-- Degree independence of the absolute indecomposable count (Mellit). -/
   theorem absIndecCount_eq_of_degree [Finite k] [IsProper (X ↘ Spec (.of k))]
       [SmoothOfRelativeDimension 1 (X ↘ Spec (.of k))]
       [GeometricallyConnected (X ↘ Spec (.of k))] (r : ℕ) (hr : 0 < r) (d d' : ℤ) :
       absIndecCount k X r d = absIndecCount k X r d' := by
     sorry
   ```

5. **F05** (P2) §11.2 asserts membership in R_g, which its source does not prove

   - **Location.** README line 1551 (§11.2): "there is a unique `A_{g,p,α}∈R_g` specializing to `A_{X,p,α}` for every curve with distinct rational marked points of that type."
   - **Claim.** Parabolic counts lie in the unlocalized ring R_g (S16, Theorem 7.1).
   - **Witness.** S16 Theorem 7.1 allows N=0 (S16 line 3111), which would put A_{g,r,d} in R_g, yet S16 line 124 calls that conjectural; its proof is "parallel" to Theorem 1.1 (S16 line 3123), which yields only K_g (S16 line 119).
   - **Repair.** State §11.2 with K_g (what the parallel Hall/shuffle proof gives, as in §4.9 and §11.4), and move R_g membership for N≥1 to §11.6 as a formulated conjecture, unless a primary source proving parabolic integrality is read and cited. At N=0 the K_g statement is §4.9 and R_g is then §10.4, so nothing downstream is lost. Remove the R_g clause from G10.

6. **F06** (P2) `gap:fixed-source-good-lines` is compound and its first clause is already supplied

   - **Location.** README line 107: "Export the good-line theorem with the kernel bound for the fixed source L₁ raised to l₁=χ(L₁,F), and identify the locally free locus of the coherent canonical Higgs carrier of §3.7 with the GL_r bundle stack …"
   - **Claim.** EndoscopicTransferAndUnitaryTraceComparison must still provide the fixed-source kernel clause.
   - **Witness.** ET §3.7(c) (head of its open pull request) already states it for every vector space V′ (so for dim V′=l₁); and README §8.1 proves it for its explicit d₁,d₂ (kernel bound μ_min≥−d−(r+1)d₁, uniform in the source dimension).
   - **Repair.** Drop the first clause; keep the single contract "identify the locally free locus of the §3.7 coherent canonical Higgs carrier with the GL_r Higgs stack of §3.6 and its bounded charts in every characteristic", and cite ET §3.7(c) together with §8.1 for kernel generation. The same edit goes into plan.json's `needs` for that slug.

7. **F07** (P2) `gap:universal-curve-weil-density` asks for monodromy that an earlier roadmap supplies

   - **Location.** README line 147: "For g≥1, prove full symplectic geometric monodromy for the genus-g hyperelliptic moving-branch family over a suitable fixed odd finite field and … deduce Zariski density of genus-g curve Weil tuples …"
   - **Claim.** Full symplectic monodromy of a hyperelliptic family must be newly supplied by LefschetzPencilsAndVanishingCycles.
   - **Witness.** ArithmeticStatisticsPartVIII §5.17 (earlier in the merge order) states mod-ℓ monodromy Sp_{2g}(𝔽_ℓ) for every g≥1 and the integral lift to Sp_{2g}(ℤ_ℓ), for the universal odd-degree hyperelliptic family, which is Zariski dense in Sp_{2g}.
   - **Repair.** Cite ArithmeticStatisticsPartVIII §5.17 ("Mod l hyperelliptic monodromy is symplectic", "Integral lift of full mod l symplectic image") for the monodromy, and reduce the contract (or a target here) to the single step "DeligneWeightsAndPurity §10.5 applied to that family gives Zariski density of genus-g Weil tuples in T_g/W_g". Drop G4 as its duplicate.

8. **F08** (P3) locators that do not support or slightly misplace their statement

   - **Location.** README lines 254, 584, 729, 1299.
   - **Claim / witness.** §1.1 cites S16 Lemma 2.3 (S16 line 619), which states Krull–Schmidt and the radical facts, not the projectivization equivalence add(M)≃proj End(M)^op. §3.3 cites "§4.5, p.319" for the truncated characteristic functions, defined in §4.4 (S16 line 1137). §4.8 cites SV12 §1.11 "pp.13–14"; §1.11 is p.13 only (SV12 line 680–694). §8.8 cites "§6.5–6.9, pp.341–349"; §6.5 starts p.340 (S16 line 2551).
   - **Repair.** §1.1: cite a source that states projectivization, read and with its theorem number, or mark it as this roadmap's own standard argument; §3.3: "§4.4, p.319"; §4.8: "SV12 §1.11, p.13"; §8.8: "§§6.5–6.9, pp.340–349".

9. **F09** (P3) two statements are narrower than their source

   - **Location.** README line 324 (§1.6) "G a smooth connected linear algebraic k-group, or a smooth connected band"; line 1237 (§8.4) "With the framing of §8.1 and p>C(g,r,d), every γ-semistable point in the central-line locus".
   - **Witness.** SPR66 Theorem 3.5 (SPR66 line 6739) gives neutrality for every algebraic group over a perfect field of dimension ≤1 (e.g. constant C₂: H²(𝔽_q,C₂)=0). S16 Lemma 6.4 (S16 line 2744) is for all of (T*P)^ss and uses no bound on p.
   - **Repair.** State §1.6 for every algebraic k-group (connectedness only for the H¹ uniqueness clause) and §8.4's inclusion for all γ-semistable points of T*P without p>C; keep the central-line consequences as stated.

10. **F10** (P3) over-broad *Needs:* lines

   - **Location.** README line 304 (§1.4): "*Needs:* `Matrix.card_GL_field`; QSeriesPartitionsAndMockModularForms §§2.4, 3.5 and its complete-Adams and Macdonald contracts." The same blob appears in §§0.1, 2.3, 4.9, 5.2, 5.8, 6.1, 6.3, 6.6, 8.9, 8.10, 11.2, 11.4, 11.6.
   - **Witness.** The Fine–Herstein count needs Heine/q-binomial identities (QSeries §2.4) only; making the only stated headline wait on `gap:macdonald-admissibility` blocks Layer 1 behind Layer 10's supplier.
   - **Repair.** List items per target: §1.4 → `Matrix.card_GL_field`, QSeries §2.4; §0.1, §2.3, §4.9, §5.x, §6.x, §8.9–8.10, §11.x → QSeries §§2.4, 3.5 and `gap:complete-adams-series` only; keep `gap:macdonald-admissibility` in Layer 10.

11. **F11** (P3) supplier prose that does not match the supplier

   - **Location.** README line 11: "QuiverRepresentations Layers 1–2 owns representations and their module interpretation; its Layer 6 … own general categorical decomposition theory"; line 183: "through the supplier restrictionCharacter map"; line 77: "GS.0.5–GS.0.6 supply … scalar-extension compatible HN theory".
   - **Witness.** QuiverRepresentations (main): Layer 2 is "the Krull-Schmidt theorem", Layer 6 "Auslander-Reiten theory". ClassicalGroupsPartII §CG.2.6 names "the character restriction map"; no `restrictionCharacter`. GS.0.5 states existence and uniqueness only.
   - **Repair.** "QuiverRepresentations Layer 1 (representations as kQ-modules) and Layer 2 (Krull–Schmidt)"; "the character restriction map of ClassicalGroupsPartII §CG.2.6"; derive field-extension compatibility of HN filtrations here from GS.0.5 uniqueness and Galois descent (SchemeAndStackFoundations §§1.18–1.21), as AutomorphicSpectralTheory §6.22c does for Higgs bundles.

12. **F12** (P3) notation and a consumer that exists nowhere

   - **Location.** README line 1438 "Ω_g(T;z,q,α)" versus line 1483 "A_{g,r,d}=H_{g,r}(q,1,α)"; line 1545 "N=0 recovers A_X(r,d)"; line 1660 "YuCountingPartII consumes …".
   - **Witness.** With Ω_g's argument order (z,q,α), H_{g,r}(q,1,α) would set z=q, q=1. N is never defined in §11.1. YuCountingPartII is absent from main, from the 330 indexed pull requests, from the board index, from the merge order and from board issues (searched).
   - **Repair.** Write H_{g,r}(z=1;q,α) or fix one argument order; "with no marked points"; replace the YuCountingPartII sentence by a description of the consumer or the name of an existing roadmap.

Scope of this review: the whole README (1686 lines, Layers 0–11, every Check and supplier contract), `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` (gap records). There was no previous review. Twelve findings: three P1, four P2, five P3. The mathematics of most layers is careful and its witnesses recompute correctly (table below); the blocking defects are one reversed expansion convention that falsifies §5.5, eleven unowned design gaps (one of which hides a genuinely unowned input), a statable end theorem missing from `Suggested.lean`, an R_g overclaim in §11.2, and two non-minimal supplier contracts.

## Verified sound

**Principles.** No route-specific restriction: counts are for every finite field, genus zero is handled by splitting, the p>C deformation is kept as one proof while §8.10 gives every characteristic. No re-planned roadmap (WC.1 mass, GS.0.13 masses, ET §§3.6–3.7, AST §§6.22c/6.24, RG2.3.7 Lang, HabiroNahmSeries §5.1, HabiroCyclotomicCompletions §1.1 are imported, not rebuilt). No copied passage, no algorithm, no LaTeX delimiter, no process word, no machine path (grepped). `Suggested.lean`: single `import Mathlib`, one `theorem`, no `set_option`, `lemma`, `#eval`, sorry'd data or `opaque`.

**Lean.** `lake env lean packages/CountingBundlesAndHallAlgebrasOfCurves/Suggested.lean`, run from the content checkout: exit 0, one warning, "declaration uses `sorry`" at 47:8. `#check @nilpotent_matrix_count`: `∀ (K : Type u_1) [Field K] [Finite K] (n : ℕ), Nat.card {M // IsNilpotent M} = Nat.card K ^ (n * (n - 1))`, the README §1.4 statement exactly; there are no section variables, nothing changed. One-tactic probe on a scratch copy: `simp` (no progress), `rfl` (fails), `exact?` (none found without the local copy), `aesop` (fails); `decide` confirms the 2×2 count over 𝔽₂ is 4. Not padding: it is not in Mathlib or Tau Ceti at the pins (searched by object), restates no definition and mirrors no Check. The R04 block was elaborated the same way after `lake build` of its two Tau Ceti modules.

**Headline theorems** (README Summary): partition residue formula (§6.3), all-characteristic coprime Higgs count (§8.10), Higgs purity and compact Poincaré polynomial (§§9.1, 9.3), nilpotent-cone component formula (§9.4), Mellit integrality and degree independence (§§10.3–10.5); plus the Fine–Herstein count (§1.4). Not statable at the pins (correctly named in the docstring): every statement needing the universal ring evaluation at Weil numbers, Hall algebras, Higgs moduli or étale cohomology. Statable but absent: degree independence (R04).

**Source sample (all fifteen seeded targets read at their locators).**

| Target | Read | Result |
| --- | --- | --- |
| 1.1 | S16 Lemma 2.3, line 619; TauCeti DirectSum.lean 154, Indecomposable.lean 266 | statement true (projectivization over finite-dimensional End); locator does not state it — R08 |
| 1.6 | S16 proof of Lemma 2.6, lines 749–760 (cites Spr66 Th. 3.5); SPR66 line 6739, p.179 | supported; narrower than Springer — R09 |
| 3.3 | S16 §4.2, lines 1001–1010; §4.4, lines 1137–1141 | supported, coefficient corrected to v^{−rl} (S16 misprint); section number — R08 |
| 4.1 | S16 §4.3, lines 1064–1073, (4.3) | agrees |
| 4.3 | S16 Theorem 4.2(iii), lines 1103–1113, p.318 | agrees, both identities |
| 4.5 | S16 (4.4), lines 1149–1164, p.319 | agrees, three identities |
| 4.8 | S16 Theorem 4.4, lines 1176–1191; SV12 §1.11, lines 680–694 | supported; hedged descent obligation is accurate (SV12 works over K_a, bundle part only) |
| 5.5 | S16 Proposition 5.3, lines 1495–1547 | formulas agree; region convention of §5.1 contradicts S16 line 1545 — R01 |
| 5.9 | S16 (1.1)–(1.3), lines 262–366 | agrees (J_λ, ζ*, L, Res_λ order, substitution z^i q^{−r_<i}) |
| 7.6 | S16 §6.6, lines 2581–2660 | agrees (V=Hom(L₂,L₁), E=Hom(V₁⊗V,V₂), μ=(∑y_ix_i,−∑x_iy_i), P closure, conormal quotient) |
| 8.4 | S16 Lemmas 6.4–6.5, lines 2744–2787 | supported; corrected moment target is right (μ kills (Id,Id)); narrower — R09 |
| 8.8 | S16 Theorem 1.2, lines 136–139; count at lines 2946–2967 | agrees (q^{1−⟨α,α⟩}=q^D) |
| 9.2 | S16 Corollary 1.5, lines 197–203; (6.9)–(6.10), lines 2987–3019 | agrees; README's eigenvalue form q^D∏α^e is the correct reading |
| 11.1 | S16 §7.1, lines 3097–3110 | agrees |
| 11.2 | S16 Theorem 7.1, lines 3111–3121; LIN15 lines 232, 516–529, 994, 1690 | R_g overclaim — R05; the README's E_par equals ordinary χ minus ∑_{j<k}m_jn_k, matching flag Hom dimensions |

Also checked outside the sample: MS14 Theorem 1.2 (lines 75–104), Corollary 3.3 (386), Lemma 4.1/Corollary 4.2 (485–499), Theorem 4.3 and Corollaries 4.4–4.5 (505–588); S16 Corollaries 1.3–1.9, rank-two example (lines 151–485); S16 §5.6 e(r) (line 2070); WII (3.5.1)–(3.5.3) on pp.210–211; HN10 Theorem 3.1 and Corollary 3.5 headers. No flagged-unverified locator besides the three uncertified sources.

**Adversarial table.**

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Euler form, Conventions | P¹: (1,0),(1,1) | E=2 vs dim Hom−Ext¹=2−0; reverse E=0 vs 0−0 | pass | — |
| Adams on coefficients | (−1,−2), q=2 | P(1)=6; ψ₂X=1−1−4+4=0; ψ₂(q−1)⁻¹=1/3 vs fixed 6, 1 | pass | — |
| Adams and point counts | y²+y=x³ over 𝔽₄, 𝔽₆₄ | 9 points (𝔽₂ trace 0, α²=−2); 1+64+16=81 | pass | — |
| rRes/dRes | (1−z)⁻¹, (1−z)⁻² at 1 | 1, −1; 0, −1 (via z=1−h) | pass | — |
| D conventions | rank 1, g=2 | dims 4, 3; shift 4 twist −2 | pass | — |
| 0.1 | g=0,1; ψ₂ | R₀=ℚ[q^±]; flip fixes a+q/a, moves a; (q²−1)⁻¹ | pass | — |
| 0.2 | rank 1; torsion d>0; degree-2 point | P(1); #X(k) (O_x/m^d at rational x); splits over k̄ | pass | — |
| 0.3 | simple/double pole; regular | −1=−rRes; 0 vs −1; 0, 0 | pass | — |
| 1.1 | M; 0; L⊃L(−x)⊃… | regular module; 0↔0; infinite descending chain | pass | R08 |
| 1.2 | 0, L, L² | summands 0,1,2; End(L²)/rad=M₂(k) nonlocal | pass | — |
| 1.3 | N=k[t]/t², M=N², 𝔽₂ | dim M₂(rad)=4 vs misprint 2; quotient 16 elements | pass | — |
| 1.4 | n=0,1,2 over 𝔽₂; n=2 over 𝔽₃ | 1,1,4 (Lean decide 4); 9; 0·(0−1)=0 junk harmless | pass | R10 |
| 1.5 | 0; L/𝔽₃; L²/𝔽₂; k[t]/t²/𝔽₂ | ratios 1, 1/2, 4/6, 2/2; formula 1, 1/2, 2/3, 1 | pass | — |
| 1.6 | C₂ constant; units of 𝔽₂[t]/t² | H¹=2 classes, H²=0 (Springer, no connectedness); 2 units | pass | R09 |
| 1.7 | e=2 orbit, l=1,2 | 0 and 2 = ∑_{e|l}e c_e; class (2r,2d) | pass | — |
| 1.8 | (2,1), k[t]/t² | e∣gcd=1; End/rad=k, dim End=2 | pass | — |
| 1.9 | HN gaps ≤2g−2 | d≤rμ_min+(g−1)r(r−1) by summing gaps; g=2,r=2 bound 2 | pass (≥ also suffices) | — |
| 1.10 | P¹; twist; dual | 1, 0; A(1,±1)=A(1,0)=P(1) | pass | — |
| 2.1 | BGL₁(𝔽₃); Id fibre | 1/2; fibre point, mass 1 | pass | — |
| 2.2 | line bundle | only θ=0, mass 1/(q−1) | pass | — |
| 2.3 | one line species, q=2 | ∑q^{n(n−1)}T^n/#GL_n: 1,1,2/3; exp(T+T²/6): 1,1,2/3; Heine gives ∏_{j≥1}(1−Tq^{−j})⁻¹ | pass | — |
| 2.4 | Jordan block of size 2; θ=0 | α₁=0, α₂=1, ∑iα_i=2; α₁=[F] | pass | — |
| 2.5 | lines in 𝔽₂² | 3 flags; zero step forces equality | pass | — |
| 2.6 | size-2 block | ker θ=im θ, so H₁=0, H₂=H | pass | — |
| 2.7 | α=(0,[O]) | d=g−1, d″=0; direct extension-groupoid mass q^g/(q(q−1))=q^{g−1}/(q−1) | pass | — |
| 3.1 | P¹ (1,0),(1,1) | E=2 vs 0; Δ′ with Ext¹=0: v^E/#Hom | pass | — |
| 3.2 | O,O on P¹/𝔽₂ | product 3v; 3v/6=v/2 = Δ′ side v/2 | pass | — |
| 3.3 | (r,d−l),(0,l) | E=rl so coefficient v^{−rl}; r=2,l=1: v^{−2} | pass | — |
| 3.4 | O⊂O², P¹/𝔽₂ | 3/6=1/2 = q^{−1/2}·v/2 | pass | — |
| 4.1 | from 3.3 | ∑1_{(r,d)}z^d=E^vec(z)E₀(v^{−r}z) | pass | — |
| 4.2 | r=1,2, q=2 | q^{−1/2}z/w; z/(2w), z/w | pass | — |
| 4.3 | s=t=1, g=0; r=0 | prefactor q^{−1/2}; Δ′1_{(0,l)} coefficient #Ext¹/#Hom=q^0=1 | pass | — |
| 4.4 | r=1; r=2,g=1 | C=V₁⁻¹V₁=1; C=V₁⁻²V₂ | pass | — |
| 4.5 | O(1)⊕O(−1) | E((1,−1),(1,1))=3; series coefficient q^{−3/2} cancels v³ | pass | — |
| 4.6 | generators | 1_{(0,1)} spherical, not a bundle | pass | — |
| 4.7 | P¹ class (2,0) | types (O,O),(O(1),O(−1)) one class each; O(m)⊕O(−m) infinitely many | pass | — |
| 4.8 | P¹, x=1^vec_{1,0} | (x·x‖x·x)=9q/6=3q/2∈K₀; v-exponent of paired products of equal class is even | pass | — |
| 4.9 | zero class; rank 1 | 1; P(1)/((q−1)(1−z)) after removing torsion factor | pass | — |
| 5.1 | s=1 | Y_(r)=V_r∑(zw)^d; ≥0 region gives |zw|≫1 | **fail** | R01 |
| 5.2 | s=1, q=2 | Aut(L⊕T)∋Hom(L,T) of size q^l, so Exp(Xzw/(q(q−1))); coefficient #X/2 | pass | — |
| 5.3 | (1,2) | shifts q^{−1}, q^{1/2} | pass | — |
| 5.4 | 1/(1−z) at 0, ∞ | ∑z^n, −∑_{n<0}z^n; both ×(1−z)=1 | pass | — |
| 5.5 | s=1 | stated region: −V₁∑_{d≤−1}(zw)^d vs Y^{≥0}=∑_{d≥0}V₁(zw)^d | **fail** | R01 |
| 5.6 | one block; two blocks | prefactor 1; a(r)+(g−1)n(n−1)/4=(g−1)∑_{i<j}r_ir_j/2=b(r); a(2)=−1/2 at g=2 | pass | — |
| 5.7 | e(r), x_l | equal to S16 line 2070 | pass | — |
| 5.8 | (2),(1,1),(2,1),(3),(2,2) | ζ(q⁻¹z); 1; ζ(q⁻²z); ζ(q⁻¹z)ζ(q⁻¹z²); ζ(q⁻¹z)ζ(q⁻²z), both sides | pass | — |
| 5.9 | λ=(1) | ζ*(q⁻¹)=P(1)q^{−g}/(1−q⁻¹)=q^{1−g}P(1)/(q−1); H=1/(1−z) | pass | — |
| 5.10 | λ=(1), z⁰ and z¹ | direct: P(1)/(q−1); P(1)/(q−1)+P(1)#X/(q−1)² (θ:L→k_x); formula equal | pass | — |
| 6.1 | T⁰, T¹ | 1; P(1)/((q−1)(1−z)) | pass | — |
| 6.2 | r=2, b=(2,3) | residues −5/2, 1/2; recovered 2, 3 | pass | — |
| 6.3 | rank 1 | (q−1)·P(1)/((q−1)(1−z)); −dRes=P(1) | pass | — |
| 6.4 | g=0; (a,q)=(−3,2),(0,2),(1,3) in g=1 | bracket 0; brackets 1,1,1, count P | pass | — |
| 6.5 | rank 1 | ∏(1−α_j) at 0 is 1 | pass | — |
| 6.6 | g=1,2,3, r≤4 (exact rational series, eventual coefficients) | (1,1,1,1), (1,2,6,22), (1,3,15,95); S16's sign gives negatives | pass | — |
| 7.1 | torsion k_x; elliptic (O,0)→(O,η) | self-Ext 1,2,1 vs 1,1,0; Id↦η, coefficient +1 | pass | — |
| 7.2 | k², W=ke₁ | lower-left 0 preserves, 1 does not | pass | — |
| 7.3 | rank 1; g=0, r≥2 | dim Pic×A^g=2g=2D; D=1−r²<0 and O(a₁) invariant: empty | pass | — |
| 7.4 | genus 2, deg L₁=−5, F=(L₁⊗M)⊕B | Ext¹=0, dim Hom=1+8=9=l₁, base points; L₂ of degree −24 generates | pass | — |
| 7.5 | line, genus g | Ext¹(L,L)* of dim g | pass | — |
| 7.6 | h=1 | μ=(xy,−xy), trace 0 | pass | — |
| 8.1 | g=2,r=2,d=1 | B=−3/2, d₁=5, l₁=9, d₂=24, l₂=47, gcd 1, C=423; μ_min(K)≥−16 for every source dimension | pass | R06 |
| 8.2 | δ formula; (2,3) | (c₂−c₁)(dr′−rd′) by expansion; δ(1,1)=−1, δ(1,2)=1 | pass | — |
| 8.3 | |λ(projector)| | 0<|l₂a₁−l₁a₂|≤l₁l₂<p; contribution q^{1−χ}=q^D | pass | — |
| 8.4 | 𝔽₃, V₁=k, V₂=k² | μ=(2,−I₂)=λ; stabilizer scalars, rank 4 | pass | R09 |
| 8.5 | r=2,d=1 | W=(1,1): −19; W=(1,0): +19 | pass | — |
| 8.6 | rank 1 | q^gP(1) points per fibre | pass | — |
| 8.7 | A¹×A^a | Q^{a+1}=Q·Q^a; |Y|=|Y₀|+(Q−1)|Y₁| (S16 line 2946) | pass | — |
| 8.8 | rank 1, g=2; g=0 | q²P(1); 1=1, 0=0 | pass | R08 |
| 8.9 | rank 1, g=1, q=2 | (−q^{1/2})^{−(2g−2)r²}=q^{(1−g)r²}; Ω⁺=qP(1) | pass | — |
| 8.10 | MS14 Cor 4.5 | Ω_K=qA; coprime #H=q^{(g−1)r²}Ω=q^DA | pass | — |
| 9.1 | rank 1, g=2 | H_c^n=H^{n−4}(Pic)(−2) (S16 prints shift D) | pass | — |
| 9.2 | rank 1, g=1 | (1+α₁)(1+α₂); diagonal t² coefficient 1 | pass | — |
| 9.3 | rank 1, g=1,2 | E×ℂ: 1,2,1 in degrees 2,3,4 → t²(1−t)²; t⁴(1−t)⁴; top 4, 8 | pass | R03 (route) |
| 9.4 | rank 1 | q^g∏(1−α⁻¹)=P(1) (S16's q^{2D} gives q^gP(1)) | pass | — |
| 10.1 | one box | −(1−q)(1−z)·∏(z−α)(1−q/α)/((z−1)(1−q))=∏(z−α)(1−q/α); z=1: P(1) | pass | R12 |
| 10.2 | one box | N_λ(α⁻¹)/N_λ(1) equals the Ω_g box factor | pass | — |
| 10.3 | 1/(1+z) | regular at 1, pole −1 | pass | — |
| 10.4 | (2+3z)/(1−z²) | eventual 2, 3; pole at −1 | pass | — |
| 10.5 | r=2, g=2 | origin 2 for d=0,1 | pass | — |
| 11.1 | rank 1 | flags forced by type; count P(1) | pass | R12 |
| 11.2 | two-step mark on P¹ | χ_par: 1−1=0 and 1−0=1 = flag Hom dims 0, 1; R_g claim | **overclaim** | R05 |
| 11.3 | ν>d/r | μ_min≤μ, count 0 | pass | — |
| 11.4 | rank 1, d=−1,0 | 0, P(1); dual at d=1,0: 0, P(1) | pass | — |
| 11.5 | scalar unit | c=2c forces c=0 in characteristic 0 | pass | — |
| 11.6 | coprime rank 1 | origin value 1 = one component | pass | — |
| Contracts | GS.0.13 r=1; WC.1; AST g=2; RG2 G_m/𝔽₃; HNS; HCC; QSeries; DWP; ED; CPC; SASF nodal cubic | P(1)/(q−1); 1/2, 1/6; (1,3,0), q²=q^{−χ} with χ=−2; z↦z², 1 on 𝔽₃^×; uv:1, u²v²:−1/2; t²: 1, 0; T²: 1 vs 1/2; A¹ trace q; 2 and 0; G_m: q−1 vs 1−q; Ext¹(k,k)=2 vs Hom 1 | pass | — |

**Duplication audit (by object).** Searched the pins, `roadmaps grep` (main and 330 indexed pull-request heads) and the board packages for: nilpotent matrix counts (none: not in Mathlib, Tau Ceti or any roadmap), finite groupoid mass (WeilConjectures WC.1, imported), bundle/torsion masses (GS.0.13, imported), Higgs HN and deformation complex (AST §§6.22c, 6.24, imported), good lines and bounded charts (ET §3.7, imported; its two-framing chart appears only inside its proof, and the README's §7.4 open is the corrected one, requiring both restricted maps surjective), King/quiver GIT (none: QuiverRepresentations, QuiverRepresentationsPartII and AlgebraicModuli §4.19 checked), modified Macdonald functions (none), plethystic calculus (HabiroCyclotomicCompletions §1.1, HabiroNahmSeries §5.1; SchemeKTheoryOperations §6.2 has integral special λ-rings, a different carrier from rational Adams-operation algebras, so not a duplication), hyperelliptic monodromy (ArithmeticStatisticsPartVIII §5.17 — R07), nonabelian Hodge (none — R03). No `Suggested.lean` name collides with a readable roadmap's declaration.

**Supplier-order audit.** Output of the dependency check:

```text
moved: CountingBundlesAndHallAlgebrasOfCurves moved in the merge order from #172 to #269, right after its last supplier ClassicalGroupsPartII (HabiroNahmSeries also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 27 roadmaps, 247 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line and supplier block was read. Citations resolved: on main, SchemeAndStackFoundations §§1.18–1.21, 2.6, 2.18, 2.20, 3.3, 3.6, 3.7, 4.1, 4.5, 4.14; AlgebraicVectorBundles L0A–L2B; QuiverRepresentations Layers 0–6 (see R11). At open heads: ET §§3.6–3.7; AST §§6.22c, 6.24; ReductiveGroupsPartII RG2.3.7; WeilConjectures “Finite groupoid mass”; HabiroNahmSeries §5.1; HabiroCyclotomicCompletions §1.1; QSeries §§2.4, 3.5; DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7, 7.12, 7.15, 8.8–8.11, 10.5; EtaleDualityAndPerverseSheaves §§0.4, 0.6, 0.7; ComplexComparisonPartII §§C6.3–C6.6; AlgebraicModuli §§1.3, 4.19; Lefschetz §5.11; CohomologicalPointCounting “The combined endpoint”; CompactSupport Layers 6–8; EllAdicRealization Layers 7–9; TraceFormula Layers 11–12; ArtinAlgebras Layer 0. On board heads (the three leads of the citation tool, read at their pull-request heads): GlobalShtukasAndFunctionFieldLanglands §§GS.0.1, GS.0.5, GS.0.6, GS.0.13; ClassicalGroupsPartII §§CG.0.4, CG.0.5, CG.2.4, CG.2.6, CG.3; FunctionFieldArithmetic §§0.2, 0.3, 5.1–5.4. All exist and state what is cited, except the prose points of R11.

**Declared named gaps (8).** Slugs, suppliers and `needs` are identical in plan.json and the README (checked mechanically). Precise and minimal: `coherent-ext-serre-duality` (SASF §3.3 states it only for locally free U), `degree-only-strong-generation`, `reductive-character-git`, `complete-adams-series`, `macdonald-admissibility`, `affine-bundle-compact-shift`. Not minimal: R06, R07.

**Library declarations opened at the pins.** Mathlib: `Matrix.card_GL_field` (LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:120), `IsArtinianRing.isNilpotent_jacobson_bot` (RingTheory/Artinian/Ring.lean:54), `IsArtinianRing.isSemisimpleRing_iff_jacobson` (RingTheory/Artinian/Module.lean:641), `Finite.isDomain_to_isField` (RingTheory/LittleWedderburn.lean:176), `YoungDiagram` and `YoungDiagram.transpose` (Combinatorics/Young/YoungDiagram.lean:66, 186), `CategoryTheory.Indecomposable` (CategoryTheory/Limits/Shapes/BinaryBiproducts.lean:1096), `GeometricallyConnected` (AlgebraicGeometry/Geometrically/Connected.lean:40), `SmoothOfRelativeDimension` (AlgebraicGeometry/Morphisms/Smooth.lean:127), `IsProper` (AlgebraicGeometry/Morphisms/Proper.lean:41). Tau Ceti: `TauCeti.exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end` (RingTheory/KrullSchmidt/DirectSum.lean:154), `TauCeti.isLocalRing_end_of_isIndecomposable` (RingTheory/KrullSchmidt/Indecomposable.lean:266, needs finite length), `YoungDiagram.armLength`/`legLength` (Combinatorics/Young/HookLength/Basic.lean:136, 140; total ℕ functions), `FiniteLocallyFreeSheaf.FixedRank` (AlgebraicGeometry/VectorBundle/FixedRank.lean:69), `Scheme.Modules.eulerCharBelow` (AlgebraicGeometry/Cohomology/EulerCharacteristic.lean:105; junk 0 on infinite-dimensional cohomology), `InvertibleSheaf.eulerDegree` (AlgebraicGeometry/LineBundle/Degree.lean:70), `Scheme.genus` (AlgebraicGeometry/Cohomology/Genus.lean:64). All cited line numbers in the README's Mathlib and Tau Ceti contracts are correct.

**Shape.** README headings in upstream order; every layer ends with Examples and Dependencies; every definition has its API and at least three Checks (29 definitions counted); every theorem has a locator. Ownership against open pull requests was checked for the 26 sibling roadmaps named in the brief and all indexed heads.

## Not verifiable

- M20 (Mellit 2020): paywalled, recorded as uncertified; §§10.1–10.5's citations of Theorem 1.1, Proposition 3.1, §4, Lemma 5.1 and Theorem 5.2 were not checked against the text. Only internal consistency (one-box term, z=1 value) was computed.
- FH58: uncertified (the open-archive endpoint served an access page); the count was confirmed by S16 line 644–645, by n≤2 computations and by `decide`.
- HES81: paywalled, uncertified; the BB–Hesselink statement of §8.7 was checked only against its use in S16 lines 2933–2943 and 3057–3067.
- ACK07 Lemma 5.5, BTL12 §§4.2–4.4 and the body of LIN15 Theorems 3.1/3.16 lie outside the seeded sample and were not read in depth.

## Source issues

- **Misprint** in S16 at Corollary 1.9, p.305: the source says the origin constant is the plain sum over μ_r of ξ^{−d} times the residues of A⁰dz/z; it should be the negative of that sum (rank one otherwise gives −1); affects a stated result.
- **Misprint** in S16 at Corollary 1.4(i), p.301: the source says the nilpotent-cone count carries q to the power 2(1+(g−1)r²); it should be q to the power 1+(g−1)r² (rank one then gives P(1)); affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), p.301: the source says the top cohomology of the cone and of the Higgs space sits in degree 1+(g−1)r²; it should be degree 2(1+(g−1)r²); affects a stated result.
- **Misprint** in S16 at equations (6.11)–(6.12), pp.351–352: the source says each stratum contributes compact cohomology shifted by its affine fibre rank; it should be shifted by twice that rank; affects the proof.
- **Misprint** in S16 at §4.2, p.316: the source says the bundle–torsion coefficient in the decomposition of 1_γ is q^{−l/2}; it should be q^{−rl/2}, the Euler form being rl; affects the proof.
- **Misprint** in S16 at Lemma 2.4, equation (2.1), p.309: the source says the diagonal radical block is n_i copies of rad End(M_i); it should be all n_i×n_i matrices over rad End(M_i); affects the proof.
- **Misprint** in S16 at Proposition 5.1, p.322: the source says X is indexed in reversed rank order and Y has variables z_r,…,z_1; it should be the index order and variables of the definitions just given; affects nothing.
- **Misprint** in S16 at Corollary 1.9 examples, p.306: the source says the rank-three value is A_{g,3,d}; it should be A_{g,3,d}(0), the origin value; affects nothing.
- **Error** in S16 at §6.4, p.339: the source says the open where both frame maps are isomorphisms forces strong generation by L₁; it should also require the L₁ part of the quotient map to be surjective (genus-two base-point example); affects the proof.
- **Error** in S16 at Lemma 6.5, p.345: the source says the moment map on the semistable quotient is submersive onto all of g*; it should be onto (Lie(G/G_m))*, since every value kills (Id,Id); affects the proof.
- **Gap** in S16 at proof of Lemma 6.1, p.339: the source says kernels of L₁⊗V↠F have finitely many HN types for arbitrary V, whose rank is unbounded; it should be a fixed source dimension, or the uniform bound μ_min≥−d−(r+1)d₁; affects the proof.
- **Gap** in S16 at Theorem 7.1, p.353: the source says parabolic counts lie in Q[T_g]^{W_g}, though its parallel proof gives K_g and p.300 calls even the unmarked case conjectural; it should be K_g; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d9d4c34", "job": "REV-PKG-CountingBundlesAndHallAlgebrasOfCurves", "model": "opus", "worker": "fable-rev24"} -->
