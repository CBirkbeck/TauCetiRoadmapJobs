<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/979#issuecomment-6373830320 -->
Review (claude) of 92299a1

Verdict: needs changes

1. **F01** (P2) The rank-zero headline can be stated at the pins but is missing, and the docstring calls it unstatable

   **Location.** `packages/BorelRegulators/Suggested.lean` lines 22–23: "Layer 5: the primitive-period determinant, including rank zero, requires its actual cohomological comparison". `packages/BorelRegulators/README.md` line 3 ("includes the rank-zero case"), line 157 and §5.1 line 576 ("The determinant statement includes dₙ=0, with the actual empty comparison equal to 1").

   **Claim.** In rank zero, dₙ=0 holds exactly when F is totally real and n is even. Both determinant lines are then ℚ with the empty generator, and the comparison is 1. So the §5.1/§5.4 statement says only that `√Δ_F·ζ_F(n)·π^(−Nn)` is a positive rational. That needs nothing beyond Mathlib's `NumberField.dedekindZeta` at a convergent point, `NumberField.discr`, `NumberField.IsTotallyReal` and `Real.pi`. It is a deep result the roadmap is built to reach: the Summary names it, and Downstream consumers (line 773) has Polylogarithms §4.7 using it. The only Lean statement of it is in the consumer, `TauCetiRoadmap/Polylogarithms/Suggested.lean` line 241, which attributes it to this roadmap. The owner states nothing.

   **Witness.** borel1977 Remark 6.3, p.632, line 590: for totally real k and odd m, the comparison μ* is the identity, s_m=1, and Theorem 6.2 yields rationality of `|D|^(1/2)·ζ_k(m+1)·π^(−d(m+1))`. This is a zeta-only statement, and it can be stated at the pins.

   **Repair.** In `Suggested.lean`, after the Layer 3 section and before `end`, add:

   ```lean
   /-! ## Layer 5: Primitive determinant and the integral regulator lattice -/

   /-- Rank-zero case of the primitive-period theorem: over a totally real number field `F` and for
   even `n ≥ 2`, `√|disc F| · ζ_F(n) / π^(n·[F:ℚ])` is a positive rational number. Here the embedding
   space has dimension zero and the comparison determinant is the empty determinant `1`.
   See Borel 1977, Theorem 6.2 and Remark 6.3. -/
   theorem exists_pos_rat_dedekindZeta_of_isTotallyReal (F : Type u) [Field F] [NumberField F]
       [NumberField.IsTotallyReal F] (n : ℕ) (hn : 2 ≤ n) (hev : Even n) :
       ∃ q : ℚ, 0 < q ∧
         (Real.sqrt |(NumberField.discr F : ℝ)| : ℂ) * NumberField.dedekindZeta F n =
           (q : ℂ) * (Real.pi : ℂ) ^ (n * Module.finrank ℚ F) := by
     sorry
   ```

   Make these docstring edits:

   - Replace the Layer 5 bullet's opening with "Layer 5: the primitive-period determinant in positive rank requires its actual cohomological comparison". Keep the rest of the bullet.
   - After the closing paragraph's first sentence, add "The rank-zero primitive-period theorem is stated on Mathlib's Dedekind zeta function."

   In README §5.1, after "with the actual empty comparison equal to 1.", add: "Its rank-zero numerical form, the native acceptance statement `exists_pos_rat_dedekindZeta_of_isTotallyReal`, says that for totally real F and even n≥2 the number √Δ_F·ζ_F(n)·π^(−Nn) is a positive rational (borel1977, Remark 6.3, p.632, borel1977 line 590–594)."

   **Tested** on a scratch copy of the whole file elaborated with `lake env lean`. The only warnings are three `sorry` warnings, and `simp` makes no progress on the new goal.

   Instances:

   | Field and weight | Value | q |
   |---|---|---|
   | F=ℚ, n=2 | √1·ζ(2)=π²/6 | 1/6 |
   | F=ℚ, n=4 | ζ(4)=π⁴/90 | 1/90 |
   | F=ℚ(√5), n=2 | √5·ζ_F(2)=√5·(π²/6)·4π²/(25√5)=2π⁴/75 | 2/75 |

   The last value matches the package's own §5.1 adversarial value. The hypotheses exclude ℚ(i), where d₂=1, and odd n, where dₙ=r₁+r₂≥1. The new name collides with no declaration in a roadmap I could read: `roadmaps grep --lean-only` finds no such name.

2. **F02** (P3) `exists_divisionAlgebra_split_at_infinity` is narrower than its source

   **Location.** `Suggested.lean` line 55: `(F : Type u) [Field F] [NumberField F] (a : ℕ) (ha : 2 ≤ a)`. README §3.2 line 328: "For every number field F and natural a≥2, construct a central division F-algebra D".

   **Claim.** The hypothesis `2 ≤ a` is not needed: the statement also holds at a=1. The source states it for every n≥1. At a=0 no division ring has finrank 0, so `1 ≤ a` is the right bound.

   **Witness.** borel1977 Lemma 2.2, p.617 (page image of the cached legal PDF) assumes n≥1; the extraction at line 177 misreads it as ">1". At a=1, D=F works: finrank 1=1², ℝ⊗_F F≅ℝ≅M₁(ℝ), likewise over ℂ.

   **Repair.**

   - Lean: replace `(ha : 2 ≤ a)` with `(ha : 1 ≤ a)`.
   - README §3.2: write "natural a≥1".
   - §3.4 and §3.6 keep a≥2, where non-compactness of H∞ needs it.

   Tested: the scratch copy elaborates with this change. Not a defect, just a note: the complex-embedding conjunct holds for every finite-dimensional central algebra by `TauCeti.Algebra.isSplittingField_of_isSepClosed`, as found by `exact?`. It mirrors the README's "every infinite place" and may stay.

3. **F03** (P3) §1.3's opening statement leaves out n≥2

   **Location.** README §1.3 line 207: "define ζ_F*(1−n) to be the coefficient of (s−(1−n))^dₙ in its analytic germ at 1−n. Prove that the germ has order exactly dₙ".

   **Claim.** §1.1 defines dₙ for every n≥1, but the order claim is false at n=1. Only the Conventions sentence on "main higher-weight hypotheses" and the second interface bullet carry n≥2.

   **Witness.** F=ℚ, n=1: d₁=r₁+r₂=1 by §1.1, but ζ(0)=−1/2≠0, so the order at 0 is 0. The section's own fourth Check makes the same point.

   **Repair.** Begin the paragraph with "For every n≥2, using LFunctions Layer 3's continued Dedekind function, define …". Tested at F=ℚ: n=1 is now excluded, while n=2, 3, 4 give orders 0, 1, 0 = d₂, d₃, d₄.

4. **F04** (P3) Deligne–Goncharov §1.6 starts on p.7, not p.6

   **Location.**

   - README References line 789: "Published §1.6, pp.6–9, equations (1.6.1)–(1.6.10)".
   - `sources.toml`, entry `deligne_goncharov2005`: locator "Published §1.6, pp.6–9", and the version_note "pp.6–9".

   **Claim.** The page range begins one page early. README §2.3 cites the same section correctly as pp.7–9.

   **Witness.** deligne_goncharov2005 line 276 is the running head of printed p.7, and §1.6 begins at line 282, below it. Line 227 opens p.6, which holds §1.5.

   **Repair.** In both places write "pp.7–9". This is the author's entry, so the fix worker corrects it.

Four findings: one P2 and three P3. The mathematics holds up. Every computed Check I recomputed agrees with its theorem, with the other Layers and with the sources. All fifteen sampled locators verify. `Suggested.lean` elaborates with `sorry` as the only warning, and both of its statements are true and are not padding.

The blocking finding is about the headline list. The rank-zero clause is a headline: the Summary names it, and Polylogarithms consumes it. It can be stated on native carriers at the pins, but `Suggested.lean` leaves it out, and its docstring says it cannot be stated.

There is also an operator matter outside the package, covered in its own section below. The merge-order slot of BorelRegulators (line 224) was produced by a false-positive dependency edge. It contradicts the ownership moves recorded when the design was accepted. There is no real mutual dependency with ArithmeticKTheoryPartII.

## Merge order and the reported mutual dependency (operator action, outside the package)

**No real mutual dependency.** The package README never names ArithmeticKTheoryPartII. I recomputed the dependency graph with the gate's own parser on the package README. BorelRegulators has nine parsed suppliers, and the last of them is ArithmeticKTheory, at `merge-order/ORDER.txt` line 113. The only edge between the two roadmaps runs one way: from `packages/ArithmeticKTheoryPartII/design/README.md` line 49 and its request R17 at line 1657 to "BorelRegulators:R.3", an atlas label this package does not have.

**Where the false edge came from.** BorelRegulators was inserted at line 224, directly after ArithmeticKTheoryPartII (line 223), in board commit "Merge order: insert BorelRegulators after its last supplier". The parser read an exclusion sentence as a supplier edge. Run on the accepted design README, it reports the edge BorelRegulators→ArithmeticKTheoryPartII from line 13 alone. That is the exact false-positive line: `packages/BorelRegulators/design/README.md` line 13, "ArithmeticKTheoryPartII §R17's symplectic stable cohomology and finite-type KSp comparison are outside this number-field SL regulator contract and are not supplied here." The package README dropped that sentence.

**Which side owns the shared statement.** There is no shared statement. R17 asks for the stable symplectic cohomology `H*(Sp∞(ℤ);ℚ_p)`, which is borel1974 §11.4, line 1249. This package does not state it and its scope excludes it. ArithmeticLocallySymmetricSpaces and ArithmeticKTheory do not state it either; I found no symplectic stable cohomology in either. The natural home is ArithmeticKTheoryPartII itself, as an extension of ArithmeticKTheory §3.4's stable SL comparison. ArithmeticKTheoryPartII should repoint R17 there; this package needs no change.

**What the slot at line 224 breaks.** The accepted design recorded moves of three objects down to this roadmap. Its review, `reports/REV-DESIGN-BorelRegulators~2.md`, did so with the candidate placed right after ArithmeticKTheory:

- PeriodsAndSpecialValues PS.3.2a: the number-field Borel regulator, its real isomorphism, the factor two and the Adams weight.
- ColemanIntegration §L3.Fc.1: the complex regulator lattice theorem.
- HeightsRationalPointsAndObstructions §3.6: period equals index over number fields.

At line 224 all three are earlier: PeriodsAndSpecialValues at 200, ColemanIntegration at 155, Heights at 157. Each still plans its object at its head:

- PeriodsAndSpecialValues README line 743, at board head 9f14c68.
- `TauCetiRoadmap/ColemanIntegration/README.md` line 2648.
- `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md` line 1466.

Under the "earlier roadmap owns" rule, those moves would reverse. Two other relations also break at line 224:

- gap:classical-tamagawa-proof would ask for what EndoscopicTransferAndUnitaryTraceComparison §6.2 already plans: Tamagawa number one for simply connected groups, at its README line 1957. That roadmap sits at line 166, earlier than 224.
- The board design ZagierConjecturePolylogarithms (line 116) and ArithmeticKTheoryPartII (line 223) cite this roadmap from above it.

**Action.** Move the BorelRegulators line of `merge-order/ORDER.txt` to directly after ArithmeticKTheory (line 113), its true last supplier. That is where the design-stage check placed it, and every supplier edge parsed from the package README stays downward there. Every consumer would then come after it:

| Consumer | Line |
|---|---|
| ZagierConjecturePolylogarithms | 116 |
| ColemanIntegration | 155 |
| HeightsRationalPointsAndObstructions | 157 |
| PeriodsAndSpecialValues | 200 |
| HabiroRings (named in the job context; it does not cite this roadmap at its head) | 217 |
| ArithmeticKTheoryPartII | 223 |
| Polylogarithms | 225 |
| HabiroNahmSeries | 227 |

EndoscopicTransferAndUnitaryTraceComparison (line 166) would be later, which keeps gap:classical-tamagawa-proof minimal. The acceptance of this package's ownership claims assumes this move. I did not edit the order file.

**Follow-ups on other roadmaps, after the move:**

- PeriodsAndSpecialValues PS.3.2a, ColemanIntegration §L3.Fc.1 and Heights §3.6 import from this roadmap.
- Polylogarithms repoints "BorelRegulators Layers 3–5" and "§7.1" (its README lines 14, 99, 704) to §§2.3, 5.1, 5.3–5.4.
- ZagierConjecturePolylogarithms replaces the atlas labels R.4, R.5 and R.7 with §§2.3, 5.4 and 6.2.

## Verified sound

**Principles.**

- The roadmap is general: every number field, every finite prime, both parities, ramified places and finite S. No route-specific shortcut, re-planned roadmap or upward supplier citation.
- No copied passage, algorithm, sorry'd data or `set_option`.
- README: no LaTeX delimiters, no process words, no machine paths. I grepped for so far, current, removed, packet, round, optional, deferred and `#n`.

**Lean.** `lake env lean packages/BorelRegulators/Suggested.lean`, run from the content checkout at the pins (Mathlib 6b7abb3, Tau Ceti a91d3aa), exits 0 after 7 s. The output is exactly two `declaration uses sorry` warnings, at lines 45 and 54. The TauCeti objects for `TauCeti.Algebra.BrauerGroup.Group` and `TauCeti.Algebra.CentralSimple.Index` were present.

**Binder audit.** I put `#check @` of both declarations in one scratch file. The elaborated types match the README:

- `period_eq_index : ∀ F [Field F] [NumberField F] (A : CSA F), orderOf (mk A) = index F ↑A.toAlgCat`
- the existential with `finrank = a^2` and both splitting clauses.

There is no `def` or `instance`, so no binder can be lost.

**Padding probe.** On scratch copies, with no sorried copy in scope:

- `simp` makes no progress and `rfl` fails for `period_eq_index`.
- `simp` leaves goals for the existence theorem.
- `exact?` closes neither.

So both statements are deep, and neither is padding.

**Imports and form.**

- `import Mathlib` plus two used TauCeti modules, both present at the pin. `IsSplittingField` arrives through `Index`.
- Module docstring in the required form; namespace `TauCetiRoadmap.BorelRegulators`; a section header matching README Layer 3; `theorem` throughout.
- The README's two own backticked names are both declared.

**Pinned declarations opened, file:line at the pin.** Every README citation resolved at the stated line:

- Mathlib:
  - `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` (InfinitePlace/Basic.lean:474)
  - `NumberField.discr` and `discr_ne_zero` (Discriminant/Defs.lean:36, 41)
  - `Ideal.nonempty_primesOver` (GoingUp.lean:355)
  - `Submodule.mkQ`, `mkQ_surjective` (Quotient/Defs.lean:227, 236)
  - `CSA` and `BrauerGroup` (BrauerGroup/Defs.lean:40, 99)
  - `exteriorPower.map`, `map_id`, `map_comp` (ExteriorPower/Basic.lean:260, 293, 298) and `finrank_eq` (Basis.lean:173)
  - `ZLattice.covolume`, `covolume_pos`, `covolume_eq_det`, `covolume_div_covolume_eq_relIndex` (Covolume.lean:72, 98, 125, 148)
  - `IsZLattice` (ZLattice/Basic.lean:433)
  - `NumberField.dedekindZeta` (DedekindZeta.lean:49; an L-series, no continuation) and `tendsto_sub_one_mul_dedekindZeta_nhdsGT` (:77)
  - `Matrix.det_fin_zero` (Determinant/Basic.lean:798)
  - `riemannZeta_two` and `riemannZeta_four` (HurwitzZetaValues.lean:226, 232)
- Tau Ceti:
  - `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` (NumberField/DedekindZeta.lean:158; continuation to Re s>1−1/N only)
  - `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` (Division.lean:69)
  - `mk`, `mk_matrix`, `instCommGroup` (Group.lean:139, 159, 174)
  - `TauCeti.Algebra.index` (Index.lean:99) and its laws at :112, :171, :180, :255
  - `deg` and `deg_sq` (Degree.lean:163, 239)
  - `IsSplittingField` (Splitting.lean:120)
  - `brauerCohomologyEquiv` (Comparison.lean:267)
  - `TauCeti.Hodge.tate` (Tate/Basic.lean:91)

**Headline theorems** (13 rows: 2 stated in Lean, 1 statable but missing (R01), 10 not statable at the pins):

| Headline | Status at the pins |
|---|---|
| §3.1 period equals index | Stated |
| §3.2 division algebras of every degree split at infinity | Stated |
| §1.3 leading coefficient | Not statable. Mathlib's `dedekindZeta` is the L-series; TauCeti continues it only to Re s>1−1/N; no other continuation found in TauCeti/NumberTheory |
| §§2.1–2.3 Borel regulator and real isomorphism | Not statable. No higher K-theory in Mathlib or Tau Ceti; grep for KTheory and plusConstruction is empty |
| §5.3 lattice | Not statable, same reason |
| §5.4 zeta covolume | Not statable, same reason |
| §6.2 factor two | Not statable, same reason |
| §6.3 Adams weight | Not statable, same reason |
| §3.6 arithmetic volume | Not statable. No reduced-norm group SL₁(D) or gauge-form measure; TauCeti has a reduced norm for quaternions only |
| §§4.3–4.6 primitive periods | Not statable. No compact-dual or invariant-form comparison |
| §5.2 lattice conversion | Not statable. Needs the suspended character |
| §5.1 positive rank | Not statable |
| §5.1 rank zero | Statable, missing: R01 |

The docstring names every unstatable headline, except for the rank-zero misstatement in R01.

**Sources: the seeded sample, read at the locators.** All fifteen verify. Borel 1977 was read from page images of the cached legal Numdam PDF, because its text extraction drops formulas.

| Target | What I read | Result |
|---|---|---|
| 1.1 | burgos2002 Proposition 9.22, Corollary 9.23, p.85, lines 3670–3709: s(ch_p) iso with integral structure (∏Z(p−1))^F and involution | verified |
| 1.2 | burgos2002 Definition 10.8, p.94, lines 4091–4106: embedding assembly | verified |
| 2.1 | burgos2002 Definition 9.24, p.86, lines 3733–3753: suspension, U_n restriction, α, Id, inverse van Est | verified |
| 2.2 | burgos2002 Definition 9.19 p.84, Proposition 9.21 p.85: factorization through K(ℂ) | verified |
| 2.3 | burgos2002 Corollary 9.8, p.78, line 3140; deligne_goncharov2005 (1.6.3)–(1.6.10), lines 320–428 | verified |
| 3.4 | borel1977 line 227 (p.619): τ(H)=1 citing Weil Theorem 3.3.1 (weil1961 waived) | verified |
| 3.6 | borel1977 §2.3 and Proposition 2.4, pp.618–619: m∞(Γ)∼∏_{1≤j<n}ζ_k(j+1); strong approximation; τ(H)=m∞·m(U) | verified |
| 4.1 | borel1977 §1.3, p.616 (decomposables: products of lower degrees); §6.1, p.631 (L′_m, L_m) | verified |
| 4.2 | borel1977 §3.4(4), p.622: j_Γ=i^m·μ̃; α, β and §3.5 filtrations; §5.2, pp.626–627 | verified |
| 4.4 | borel1977 Theorem 5.5 proof, pp.628–630: n>4d(m+1)² odd; η_j; ∫ over Z_j ∼ i^{r₂(j²+2j)}∏ζ_k(s+1) | verified; two source slips recorded below |
| 4.6 | borel1977 §5.2, pp.626–627 (P=P₁⊕P₂); Theorem 6.2 proof (4), p.632 | verified |
| 5.2 | burgos2002 Lemma 9.18, Remark 9.20, p.84, lines 3546–3614: indices 1 (8k+1), 2 (8k+5); (9.4)/(9.5) | verified |
| 5.5 | borel1977 §6.4, pp.632–633: regulator normalization | verified as cited (normalization only) |
| 6.2 | burgos2002 Theorem 10.9, pp.95–97, lines 4139–4242: Bo_p=2Be_p | verified |
| 6.3 | deligne_goncharov2005 p.9, lines 429–440: ψ^a acts by a^j | verified |

Outside the sample, for the Lean statements:

- poonen2017 Theorem 1.5.36(iv), p.26, lines 1396–1446, and Definitions 1.5.15–1.5.16, p.21, lines 1213–1229: verified.
- borel1977 Lemma 2.2: verified (see R02).

**Adversarial pass.** Every row has computed values.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Tate coordinates | ℚ(i) weights 2, 3; real weight 2 | (t,−t); (t,t); 0; (2πi)²=−4π², divided coordinate 1 | holds | none |
| Conventions: phase i^q | q=1,2,3,5; ℚ weight 3 | i·(−1)=−i=i³; i⁵=i; E=2, phase −1∈ℚˣ | holds | none |
| Conventions: gauges | ω↦2ω over ℚ; complex place; ℚ(i), h=3 | 2·½=1; \|2\|²=4; 4^(−3/2)·2³=1 | holds | none |
| 1.1 Vₙ, Cₙ, dₙ | ℚ, n=2,3; ℚ(i); real quadratic; totally real even weight | dims 0,1; 1,1; 0,2; Cₙ={0}, empty covolume 1 | holds | none |
| 1.2 R, T | ℚ(i)/ℚ, n=2,3; real quadratic; identity extension | T(t,−t)=0; T(R t)=2t; T(a,b)=a+b; T(t)=t | holds | none |
| 1.3 leading coefficient | ℚ, n=1,2,3,4 | −1/12÷1/6=−½; ζ′(−2)=−ζ(3)/(4π²); 1/120÷1/90=¾; n=1: d₁=1 but order 0 | holds for n≥2 | R03 |
| 2.1 Boₙ | weights 2, 3; zero class; c₃ | −4π²; −8π³i; zero class gives 0≠(2πi)^n; c₃ differs from ch₃ by 2!=2 | holds (value is a gap) | none |
| 2.2 r_Bo | torsion class; doubled inverse | m·r(x)=0 forces r(x)=0; 2t≠t | holds | none |
| 2.3 real iso | ℚ; ℚ(i); real quadratic, n=3; quadratic transfer | ranks (0,0),(1,1); (1,1); (2,2); tr∘res=2 | holds | none |
| 3.1 period=index | zero class; ½+½; ⅓,−⅓; index 8 | lcm 1, dim 1; 2, dim 4; 3, dim 9; Wang dyadic obstruction | holds | none |
| `period_eq_index` | A=F; ℍ over ℚ; M₂(F) | 1=1; 2=2; trivial class 1=1 (index presentation-independent) | holds | none |
| 3.2 and its Lean statement | a=0,1,2,3 over ℚ; F=ℚ(i) | a=0 impossible; a=1 with D=F; (−1,3) with symbols −1,−1,+1 at 2, 3, ∞; invariants ⅓,−⅓; complex clause automatic | holds | R02 |
| 3.3 Borel gauge | ω↦2ω; h=0; ω=0; ℚ(i), h=3 | 2·½=1; point mass 1; zero measure excluded; (1/8)·8=1 | holds | none |
| 3.4 τ(SL₁(D)) | (−1,3) over ℚ; degree 3; norm-one torus | product of symbols 1; h=3, 8; torus character lattice ℤ, excluded | holds | none |
| 3.5 local masses | SL₂(𝔽₂); SL₃(𝔽₂); 2ω_std at 2; q=1 | 6/8=¾; 168/256=21/32=(¾)(⅞); ⅜, correction ½; 0, excluded | holds (Borel's formula for Card SL_n(F_v)) | none |
| 3.6 volume | index-3 level; M₂(ℚ); ℚ(√5), a=2 | (m_f/3)·3vol=1; SL₂(ℤ)\SL₂(ℝ) noncompact; factor 5^(3/2) | holds | none |
| 4.1 Q(A) | Λ(x₃,x₅); Λ(x₃); k; k[u₂] | Q⁸=0 while H⁸ has dim 1; Q⁶=0; generator 1; Q⁴=0 | holds | none |
| 4.2 jℝ=i^q μ | q=0,1,2,3,5 | 1; i·(−1)=i³; i⁵=i, i³=−i | holds | none |
| 4.3 compact period | ℚ, n=2,3; ℚ(i), n=2 | π²; π³; 4^(−3/2)=⅛ with π⁴ (Proposition 5.4) | holds | none |
| 4.4 cycles | ℚ, j=1,2; N=2, j=1; a=17 | dim 3, factor 2; dim 8, factor 9; dim 6, factor 4; diag(L_g,I₁₃), det Nrd²; 17 not a multiple of 4 | holds | none |
| 4.5 arithmetic period | j=0,1,2; ℚ, n=2 | ratios ζ_F(2), ζ_F(3); d=0, N=1 | holds | none |
| 4.6 fibre line | ℚ, n=2,3; ℚ(i); unipotent change | (0,1,1); (1,1,0); (1,2,1); det 1, against 2 for a rescaled fibre | holds | none |
| 5.1 determinant | ℚ, n=2,3; ℚ(i); real quadratic, n=2 | E=(n−1)r₁ or −nr₁: 0, 2, 0, −4; ratio 6; 2ζ_F(2)/π⁴ | holds | R01 |
| 5.2 conversion | ℚ, n=2,3,5; imaginary quadratic | covolumes 1; 4π; 2π (image 2ℤ in π₉); 2π | holds | none |
| 5.3 lattice | ℚ, n=2; tℤ against 2tℤ; ℤ+√2ℤ; tℚ | 1; \|t\|, 2\|t\|; not discrete; dense | holds | none |
| 5.4 covolume | ℚ, n=2,3; ℚ(i); column operations | −12 and 6; exponent −2; 2ζ_F(2)/π³; det multiplied by −1 and 2 | holds (Theorem 9.12 with (9.4)/(9.5)) | none |
| 5.5 S-integers and orders | S=∅; 2∈S; ℤ→ℤ[½] in K₁; indices 2, 3 | ratio 1; rank dₙ; unit ranks 0, 1; 3/2 | holds | none |
| 6.1 point quotient | n=0,1,2,3; ℚ | P₁(1)=0, P₁(i)=i; P₂(1)=1, P₂(i)=0; junk P₀(1)=1; fixed quotients 0 and ℝ | holds | none |
| 6.2 Bo=2Be | ℚ, n=2,3; real quadratic, n=3; r_Be=0 | 1; 2; 4; 0≠t | holds | none |
| 6.3 Adams | ℚ, n=3, a=2; real quadratic; ℚ, n=2; a=1 | 8; 64; 1; 1 | holds | none |
| R01 statement | ℚ, n=2,4; ℚ(√5), n=2 | 1/6; 1/90; 2/75 | holds | added |

**Duplication audit by object.** Searched the pins, main, the open heads with `roadmaps grep`, and the board packages.

- Period equals index: no Lean statement anywhere else. Heights §3.6 uses it inline (see the operator section). ClassFieldTheory Layers 5 and 10 own the invariants; SemisimpleAlgebras Layer 6 and Tau Ceti own only the index and splitting fields.
- Division algebras of every degree split at infinity: no other owner.
- Leading coefficient at 1−n: LFunctions Layer 3 covers s=0 only.
- Stable comparison: imported from ArithmeticKTheory §3.4, as required.
- Tate lattice: differs from `TauCeti.Hodge.tate`, as the README says.
- Weight-one regulator: left to Mathlib.
- Lattice, regulator and τ=1 overlaps with earlier roadmaps: see the operator section.

**Supplier-order audit.** The required command printed, verbatim:

```text
depcheck: 27 roadmaps, 241 edges, 0 problem(s)
```

Parsed suppliers and their merge-order lines:

| Supplier | Line |
|---|---|
| StableHomotopyKTheory | 3 |
| GeneralAlgebraicKTheory | 4 |
| IntegralIwasawaTheory | 31 |
| AdelicAlgebraicGroups | 37 |
| SchemeKTheoryOperations | 40 |
| ArithmeticGaloisDuality | 52 |
| ArithmeticLocallySymmetricSpaces | 78 |
| AutomorphicFormsOnReductiveGroups | 79 |
| ArithmeticKTheory | 113 |

The other suppliers are:

- on main: ClassFieldTheory, DifferentialGeometry, AlgebraicTopology, SemisimpleAlgebras;
- other authors' new-roadmap pull requests: LFunctions, CharacteristicClasses, TopologicalKTheory;
- at the target stage: MotivicEtaleKTheory, which exists as a board target.

Every cited section resolved at its current head or on main:

- GeneralAlgebraicKTheory §§2.5, 3.2, 3.12, 7.7, 7.8
- StableHomotopyKTheory §§2.3–2.5, 3.37, 4.14
- ArithmeticKTheory §§3.2–3.4
- ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–0.9, ALS.5b.1
- AutomorphicFormsOnReductiveGroups §§1.1–1.3
- AdelicAlgebraicGroups §§1.4, 2.2–2.5, 3.4, 4.2
- ArithmeticGaloisDuality R02.4.5b, R02.4.6
- LFunctions Layer 3 (continuation, functional equation, germs)
- IntegralIwasawaTheory §6.0
- CharacteristicClasses C5a.2–C5a.5 and C6 item 3 (ch(u)=−v, ordered suspension)
- TopologicalKTheory T4 and T7 item 1 (c(a)=2u², c(b)=u⁴)
- DifferentialGeometry Layers 5, 6, 8
- SchemeKTheoryOperations §6.8
- AlgebraicTopology Stage 5 item 5
- ClassFieldTheory Layers 5 and 10
- consumers: Polylogarithms §§2.3, 3.7, 3.8, 4.4, 4.7; HabiroNahmSeries §1.5

**Gaps.** Twelve, each with the same slug and identical `needs` in `design/plan.json` and in the README's supplier subsections. gap:splitting-degree-index was added at the package stage, which is allowed. None is unowned, vague or compound. Minimality, gap by gap:

- **splitting-degree-index:** no index∣[L:K] for an arbitrary splitting field in Tau Ceti `Algebra/CentralSimple`, Mathlib `Algebra/BrauerGroup` or SemisimpleAlgebras Layer 6.
- **cyclic-local-degrees:** ArithmeticGaloisDuality R02.4.5b gives only the kernel and obstruction.
- **inner-type-a-structure:** AdelicAlgebraicGroups §4.2 covers only the quaternion D¹; §3.4 gives semisimplicity and compactness.
- **adelic-rational-masses:** AdelicAlgebraicGroups §2.4 has smooth models only.
- **order-finite-generation:** ArithmeticKTheory §3.2 covers Dedekind domains only.
- **classical-tamagawa-proof:** minimal provided the order is fixed (see the operator section).

**Shape.**

- Upstream headings appear in order. All 26 subsections carry prose API bullets, a locator, a *Needs:* line and at least three Checks (counts 3–5).
- Every Layer ends with Examples and Dependencies, and no Check claims a Lean counterpart.
- Conventions use their own positional terms: "left K-cosets" for K\G and "right SO-cosets" for gSO. The formulas make them unambiguous.

**Ownership against open pull requests.** Checked against the sibling checkouts listed in the brief and the board packages. I also checked ColemanIntegration, HeightsRationalPointsAndObstructions, EndoscopicTransferAndUnitaryTraceComparison, PeriodsAndSpecialValues, ZagierConjecturePolylogarithms and MotivicEtaleKTheory.

## Not verifiable

- weil1961 (Theorem 3.3.1): settled as waived in the manifest; cited only by locator through borel1977 line 227.
- beilinson1985 (§§1–2): settled as uncertified (paywalled); historical citation only.
- MotivicEtaleKTheory "universal-realization layer": the roadmap is at the target stage and has no README, so the section cannot be resolved. It is a declared gap contract, so this is not a finding.
- PeriodsAndSpecialValues: its README is not in this board checkout. I read it at its board head 9f14c68 with one read of the contents API.

## Source issues

- **Misprint** in borel1977 at Theorem 5.5 proof, p.629: the source says the compact submanifold Z_j of Y_n has dimension j²+2j; it should be d(j²+2j), the degree of the form η_j integrated over it; affects nothing.
- **Error** in borel1977 at Theorem 5.5 proof, p.630: the source says the restriction of β(η_j) to the diagonal H′ is (j+1) times the transported block form; it should be (j+1)^j times it, one factor per primitive wedge factor; affects nothing.
- **Misprint** in borel1977 at Theorem 5.5 statement, p.628: the source says the line is named L_m(Γ_n;ℚ), but identity (1) writes L_m(Y_n;ℚ); it should be L_m(Y_n;ℚ) throughout, since §6.1 uses L_m(Γ_n;ℚ) for another line; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "92299a1", "job": "REV-PKG-BorelRegulators", "model": "opus", "worker": "fable-rev32"} -->
