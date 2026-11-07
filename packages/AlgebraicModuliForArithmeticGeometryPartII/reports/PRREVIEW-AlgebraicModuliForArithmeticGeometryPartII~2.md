# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #1754 at bba32f3)

**Verdict:** needs changes

Eight findings: three P2 and five P3, two of the P3 being push-gate failures. The gate fails (`tex` 21, `statement-hygiene` 2), so this head cannot be accepted. The dependency check shows no UPWARD or CYCLE line. All 15 sorried theorems survive the one-tactic probe.

**The previous review's finding (r1 R01, §1.2 locator): repaired.** README line 276 now says: "The two remarks cited give only that Pic^τ is of finite type and that N¹(X/k) ⊗ ℝ is finite dimensional; integral finite generation of Num(X/k) … comes from the route below". The same gap is still present at §1.3 (R07).

## R01 (P2) — §1.7(i) and §3.3 re-plan targets that SchemeAndStackFoundations §4.15 and StableReduction Layer 2 own on main

Location: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md` line 11, "This roadmap owns, over arbitrary fields and over Noetherian bases, … the Nakai–Moishezon criterion, … and global generation and semiampleness of invertible sheaves". The same ownership is claimed at line 387 (§1.7(i)) and lines 716–718 (§3.3).

Claim: this roadmap is the owner of the Nakai–Moishezon criterion and of the global-generation API for invertible sheaves.

Witness: on main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` line 5861 (§4.15) states `spaceNakaiMoishezon` for proper algebraic spaces over the algebraically closed `k` of line 5852. `TauCetiRoadmap/StableReduction/README.md` line 438 extends the invertible-sheaf API with "global generation, and relative ampleness". This README's own line 75 consumes Layer 2's "generation".

Repair:
- At line 11, remove Nakai–Moishezon and global generation from the owned list.
- In the SchemeAndStackFoundations supplier paragraph (line 51), cite §4.15 `spaceNakaiMoishezon` (proper algebraic spaces over an algebraically closed field), and add it to §1.7's *Needs*.
- Restate §1.7(i) as the extension to an arbitrary field k. Its route: the criterion over k̄ from §4.15, plus invariance of ampleness under field extension (API line 402), plus (L^d·V)_k = Σ m_i (L^d·W_i) over the Galois-conjugate geometric components W_i of V, which all have equal intersection numbers.
- In §3.3, cite StableReduction Layer 2 for the facts of line 716 (O_X is globally generated; invariance under isomorphism, pullback and tensor powers). Cite it in §1.7(iv) for relative ampleness, which line 393 currently redefines. Keep here only semiampleness and the ℚ-Cartier statements.

Tested on P¹×P¹ over a field k, which is the instance at issue: O(1,1) has top intersection 2 and degree 1 on every line, both after extension to k̄ and over k. So the descended criterion gives ampleness, and O(1,0) (square 0) is correctly not ample. Both suppliers are already on main and already cited, so the repair adds no supplier edge.

## R02 (P2) — Kleiman's criterion, the ℚ-Cartier curve pairing and semiampleness now have two open owners

Location: README line 11 (Scope). Since this head it no longer names AbundanceStatement at all. The overlapping targets are §0.7 line 218 ("Curves contained in the support of D are included"), §1.7(iii) line 391, and §3.3 lines 712 and 720–722.

Claim: these objects have a single owner, this roadmap.

Witness: AbundanceStatement (another author's open roadmap pull request #545), `TauCetiRoadmap/AbundanceStatement/README.md` line 252 (curves in the support of D), line 313 (Kleiman's criterion), line 318 (Amp = interior of Nef, numerical invariance of ampleness) and line 352 (semiample implies nef). These are the same objects on algebraically closed characteristic-zero projective varieties.

Repair: settle one owner. This roadmap is in the merge order and its statements contain AbundanceStatement's as the algebraically closed characteristic-zero projective case. So keep ownership here and add one sentence to the Scope paragraph: "AbundanceStatement Layers 4A, 4C–4D and 5 state the algebraically closed characteristic-zero projective case of §§0.7, 1.5, 1.7(ii)–(iii) and 3.3; this roadmap owns the general statements." Also tell #545 the section numbers it can cite.

Tested on #545's own acceptance instances (its README lines 407–411, P¹_k and Spec k):
- On P¹ over ℂ, §1.7(iii) with H = O(1) gives O(m) ample iff m > 0: O(m) ⊗ O(1)^{−1} = O(m−1) is nef iff m ≥ 1, and conversely nefness of O(m′m − n) with n ≥ 1 forces m > 0. So Amp is the positive ray, as #545 computes.
- For Spec k, N¹ = 0 and every sheaf is ample, which is this README's Check at line 416.

So the general statement covers #545's case.

## R03 (P2) — Two headline clauses the docstring calls not statable are statable at the pins

Location: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean` line 29, "The ampleness assertion for complete-DVR lifts lacks relative ampleness." Also lines 24–25: "the relative ampleness criterion and the real ample cone lack relative ampleness and the real space of curve classes."

Claim: §5.3's clause "if L is ample, every such 𝓛 is ample over R" (README line 1050) and the relative criterion §1.7(iv) (line 393) cannot be stated at the pins.

Witness: over the affine base Spec R, ampleness over R is ampleness on 𝒳, i.e. Tau Ceti `LineBundleClass.IsAmple` (`LineBundle/Ample.lean` line 71), which the file already imports. Relative ampleness is `IsAmple` on f⁻¹(V) for affine V. Both statements below elaborate in a scratch copy with only `sorry` warnings.

Repair: add the following to Layer 5. It covers §5.3's clause, since a lift of an ample L restricts to an ample sheaf, and it is §5.4's "relatively ample over S iff its restriction to X is ample" (true for proper 𝒳 over any DVR, by openness of ampleness at the closed point):

```lean
theorem isAmple_iff_isAmple_specialFibre
    (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (X : Scheme.{u}) (x : X ⟶ Spec (CommRingCat.of R)) [IsProper x]
    (a : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    a.IsAmple ↔ (TauCeti.AlgebraicGeometry.LineBundleClass.pullback
      (pullback.fst x (Spec.map (CommRingCat.ofHom (IsLocalRing.residue R)))) a).IsAmple := by
  sorry
```

Add the following to Layer 1. The f-nef test over all points is equivalent to the closed-point test by §1.5:

```lean
def IsRelAmple {X S : Scheme.{u}} (f : X ⟶ S) (a : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    Prop :=
  ∀ V : S.Opens, IsAffineOpen V →
    (TauCeti.AlgebraicGeometry.LineBundleClass.pullback (f ⁻¹ᵁ V).ι a).IsAmple

def IsRelNef {X S : Scheme.{u}} (f : X ⟶ S) [IsProper f]
    (a : TauCeti.AlgebraicGeometry.LineBundleClass X) : Prop :=
  ∀ s : S,
    haveI : IsProper (f.fiberToSpecResidueField s) :=
      inferInstanceAs (IsProper (pullback.snd _ _))
    IsNef (S.residueField s) (f.fiber s) (f.fiberToSpecResidueField s)
      (TauCeti.AlgebraicGeometry.LineBundleClass.pullback (f.fiberι s) a)

theorem isRelAmple_iff_exists_isRelNef_pow_mul_inv_pow {X S : Scheme.{u}} (f : X ⟶ S)
    [IsProper f] [IsNoetherian S] (h : TauCeti.AlgebraicGeometry.LineBundleClass X)
    (hh : IsRelAmple f h) (a : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    IsRelAmple f a ↔ ∃ m n : ℕ, 0 < m ∧ 0 < n ∧ IsRelNef f (a ^ m * (h ^ n)⁻¹) := by
  sorry
```

Name them in README §§1.7(iv), 5.3 and 5.4. Delete the docstring sentence of line 29 and the relative-criterion half of lines 24–25; keep "the real ample cone lacks the real space of curve classes".

Tested on the instances that refute the docstring:
- The first projection f : P¹×P¹ → P¹ with h = O(0,1). Here O(a,b)^m ⊗ h^{−n} = O(ma, mb − n) is f-nef iff mb ≥ n, which is possible with m, n ≥ 1 iff b > 0. That is line 419's "f-ample iff b > 0".
- P¹_R. O(1) is ample on both 𝒳 and the special fibre, and O is ample on neither.

## R04 (P3) — Gate failure, `statement-hygiene`: `letI` in a theorem signature

Location: Suggested.lean lines 78–79, `letI : C.Over (Spec (CommRingCat.of k)) := ⟨i ≫ x⟩` and `letI : (C.fromSpecStalk (genericPoint C)).normalization.Over …`, in the statement of `eulerDegree_pullback_fromNormalization`.

Claim: the statement is in the required form.

Witness: the push gate reports two P3 hits, at lines 78 and 79, under the rule "no `letI`/`haveI` in a signature".

Repair: delete the theorem as R06 asks; that removes both hits. If it is kept, take `[C.Over (Spec (CommRingCat.of k))]` and the normalization's structure as instance binders with the equations `C ↘ _ = i ≫ x` as hypotheses, and state it with `LineBundleClass.intersectionNumber`. Tested: the two flagged lines lie inside this declaration, and no other declaration has a `letI` in its type.

## R05 (P3) — Gate failure, `tex`: 21 TeX fragments outside code spans

Location: README lines 168 (`C^ν`, `deg_{κ(s)}`), 170 (`O_{C^ν}`), 181 (`O_{P²}(1)`, `O_{P¹}(3)`), 221, 344 (`deg_{κ(s)}`), 387 (`L^{dim V}`), 391 (`L^{⊗m} ⊗ H^{⊗−n}`), 400 (`L^{⊗m}`) and 407 (seven fragments, e.g. `L^{⊗m}`, `H^{⊗n}`, `c₁(π*L)^n`).

Claim: the README follows the Unicode/code-span house style.

Witness: the gate reports `tex=21` at exactly these lines, under the rule "no TeX-only syntax (`_{`, `^{`, …) outside code spans".

Repair: put each fragment in backticks, as the README already does elsewhere. Tested: line 703 writes `L^{⊗m}` inside backticks and is not flagged.

## R06 (P3) — Three new theorems are API lemmas, not headlines

Location: Suggested.lean lines 69–84 (`eulerDegree_pullback_fromNormalization`), 86–93 (`cartierDivisor_toWeilDivisorHom_injective`) and 237–248 (`IsSemiample`, `isNef_of_isSemiample`). README line 91 lists them as headlines.

Claim: these are headline theorems of the roadmap.

Witness:
- The normalization identity is the field-degree-1 case of §0.1's finite-pullback bullet (line 105).
- Injectivity of the Cartier-to-Weil map is textbook commutative algebra (Stacks 031T).
- "Semiample implies nef" is the one-paragraph bullet of line 712.
- None of the three is among the end theorems in the Summary (line 3).

Repair: delete the three theorems and `IsSemiample`, which only `isNef_of_isSemiample` uses. Delete the imports that only they need: `TauCeti.AlgebraicGeometry.Scheme.Normal`, `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Cartier.Inverse` and `TauCeti.AlgebraicGeometry.LineBundle.GlobalGeneration`. Turn their backticked names into prose at README lines 91, 168, 219, 705 and 712; the README keeps all three statements as API bullets. Tested: `IsNef`, `IsAmple` and `numericallyTrivialClasses` still serve the two Kleiman headlines, and the R04 hits disappear with the first theorem.

## R07 (P3) — §1.3 cites a remark that gives finite dimension only; page slip at §2.3

Location: README line 291, "prove that Num(X/S) is free abelian of finite rank … (BMP23, Remark 2.22, p. 19; BMP23 line 825)". The same citation is in the Suggested.lean docstring at line 128. Also line 472, "KLE05, Remark 2.11, p. 21; KLE05 line 980".

Claim: the remark locates integral freeness, and Remark 2.11 is on p. 21.

Witness: BMP23 lines 829–830 define N¹(X/S) = (Pic/Pic^τ) ⊗ ℝ and assert only that this real space is finite dimensional, which is the gap repaired at §1.2. KLE05 line 980 lies before the page-21 marker at line 1005, so it is on p. 20.

Repair: add to §1.3, and to the Lean docstring, the §1.2 clause: "Remark 2.22 gives finite dimensionality of N¹(X/S); integral freeness comes from the route below through §1.2". At line 472, write "Remark 2.11, pp. 20–21". Tested: §1.3's route (an injection into ⊕_j Num(X_{s_j}) of free groups of finite rank) yields integral freeness, and line 276 shows the same wording at §1.2.

## R08 (P3) — Five new references are missing from the manifest; two have open or pinned replacements

Location: README line 170 ("EIS95, Corollary 13.13"), line 211 ("LAZ04, §1.1.C and §1.3.B … MAT86, Theorem 11.5"), line 395 ("KLE66, Theorem III.1 … Theorem IV.1; LAZ04, Theorem 1.2.23 …") and line 705 ("HAR77, Chapter II, §5 … LAZ04, Example 1.4.5").

Claim: every cited work is recorded with its locator.

Witness: the package `sources.toml` has 14 entries, SCH23 through PS12, and none of KLE66, LAZ04, HAR77, MAT86 or EIS95. None of the five is in the sources cache, so no locator can be verified legally.

Repair: record the five works as `uncertified` with their locators. Where an open or pinned source exists, cite it as well:
- **MAT86, Theorem 11.5:** cite STACKS Algebra Lemma 10.157.6 (031T), Algebra line 20199, from the already-cached chapter. Cite SchemeAndStackFoundations §4.13 `serre_normality_S₂` (main) as the owner of the S₂ input, and add it to §0.7's *Needs*. At the pins no declaration states the height-one intersection.
- **EIS95, Corollary 13.13:** cite Tau Ceti `TauCeti.Ring.IsUniversallyJapanese.of_field` with `TauCeti.Ring.IsUniversallyJapanese.isJapanese` (`TauCeti/RingTheory/UniversallyJapanese.lean`, lines 126 and 77), and STACKS Proposition 10.162.16 (0335), Algebra line 21186. These supply exactly the Japanese hypothesis of `isFinite_fromNormalization_of_isJapanese`.

Tested: 031T(2) states R = ⋂_{height p = 1} R_p for a Noetherian normal domain, the step used at line 223. Part (1) of 0335 makes fields Nagata, hence finite-type domains over κ(s) Japanese, the step used at line 170.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate at bba32f3 reports `set_option=0 … tex=21 … statement-hygiene=2 … depcheck=0 … build=0 FAIL`. The two failures are R04 and R05.
- Dependency check re-run from the worktree: `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml only.
- `lake env lean` on Suggested.lean gives 15 `declaration uses 'sorry'` warnings, at lines 73, 89, 118, 129, 151, 160, 195, 220, 244, 255, 288, 326, 343, 363 and 385, and nothing else.

**Signatures.** I put `#check @name` for all 25 declarations in one scratch file and elaborated it once. Every binder the README states is in the declaration's own type: `IsProper`, `IsNoetherian`, `IsNormalScheme`, `IsIntegral`, `IsClosedImmersion`, `Smooth`, `IsAlgClosure`, `IsPurelyInseparable`, `IsAdicComplete` and `Flat`. No section variable exists to be lost. The README's generality equals the Lean's for the seven new declarations:
- `IsNef` is §1.5's f-nefness for Spec k.
- The Kleiman headline holds for proper X over any field with an ample h.
- The injectivity theorem holds for normal Noetherian integral X.

**One-tactic probe.** A scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | (intros; simp_all) | trivial` fails at all 15 theorems. Nothing closes in one tactic; R06 concerns placement, not triviality.

**Seeded sample (15 targets; locators read at their lines).**

| Target | Lines read | Result |
|---|---|---|
| 0.4 | BMP23 825–829 (proper f over Noetherian S, degree 0 on every curve of every fibre, closed points suffice); SCH23 167–172 | supported. EIS95 is not verifiable (R08) |
| 0.5 | BMP23 828; STACKS Algebra 13506–13508 (00PH) | supported |
| 0.6 | KLE05 2742–2753 (Remark 6.14: surjective Chow cover, H = (γ*)⁻¹Pic^τ equals Pic^τ); STACKS Varieties 4790–4794 (0BET projection formula) | supported |
| 1.1 | BMP23 829; HW23 96 | supported |
| 1.3 | BMP23 825–832 | finite dimension only (R07) |
| 2.1 | KLE05 1630–1632 (Corollary 4.18.3, p. 34), 1578–1579 (Proposition 4.17, locally of finite type, p. 33); SCH23 183–184 | supported. Separatedness holds because every group scheme over a field is separated |
| 2.3 | SCH23 313–331 (Lemma 1.4); KLE05 980–1026 | supported; page slip (R07) |
| 2.4 | SCH23 221–226; KLE05 1019–1021 (2.11.4) | supported |
| 2.6 | SCH23 174–184 | supported |
| 2.12 | WIT22 1513, 1528–1529 (proof of Proposition 5.3 invokes Keel 2.16, p. 34); KEE99 677–686 (Lemma 2.16, printed p. 270) | supported |
| 3.1 | SCH23 260–261 | supported |
| 3.6 | SCH23 289–311 | supported. The affine-hull argument uses only flat base change and a universal homeomorphism, so it holds for infinite purely inseparable K/k |
| 5.4 | HW23 1513–1517, 1526–1528 (p. 33) | supported |
| 5.6 | BMP23 1177–1178 (Proposition 2.51, second assertion, p. 27), 4788–4790 (Proposition 9.16(a), p. 106) | supported as counterparts, as the README says |
| 5.7 | CT20 630–702 (Lemma 2.17, (1)–(4), pp. 16–18; curve argument 686–702); BMP23 1229–1230; WIT22 1813–1817 | supported |

**Adversarial table (values computed on each side).**

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `NumericallyTrivial` | P¹_k with O(m); P¹_ℂ over ℝ with O(1); X = ∅ | deg = m; deg_ℝ = 4 − 2 = 2; vacuous | trivial iff m = 0; not trivial; trivial | none |
| `RelNumericallyTrivial` | first projection P¹×P¹ → P¹; f = id_S | fibre degree b; no curves | iff b = 0; always | none |
| `eulerDegree_pullback_fromNormalization` | nodal cubic, O(1); cuspidal cubic; P¹_ℂ as ℝ-curve | χ(O_C(1)) − χ(O_C) = 3 − 0 and χ(O(3)) − χ(O_{P¹}) = 4 − 1; 3 = 3; ν = id, 2 = 2 | true | R04, R06 |
| `cartierDivisor_toWeilDivisorHom_injective` | quadric cone; cusp Spec k[t²,t³] as negative control | cone: injective by 031T. Cusp: ord(1+t) = len O/(t²+t³) − len O/(t²) = 2 − 2 = 0, yet 1+t ∉ O | normality is needed and present | R06 |
| `numericalClassGroup_free_finite` | ∅, P⁰, P¹, E×E | ranks 0, 0, 1, 2 + rank End E ∈ {3, 4, 6} | holds | none |
| `relNumericalClassGroup_free_finite` | id_S; P¹×P¹ → P¹; S = Spec ∏_ℕ k | 0; ℤ; bounded sequences, not finitely generated | the Noetherian hypothesis is needed and present | R07 |
| `IsNef` | P¹ with O(m); Bl_p P² with O(E); X finite | m ≥ 0; E·E = −1; vacuous | matches §1.5 | none |
| `isAmple_iff_exists_isNef_pow_mul_inv_pow` | P¹×P¹ with h = O(1,1); Bl_p P² with h = 3H − E; ∅ | O(2,1)·h⁻¹ = O(1,0) nef ⇒ ample. O(1,0)^m h⁻ⁿ = O(m−n, −n) is never nef, and O(1,0) is not ample. 2(2H−E) − (3H−E) = H − E nef, and (2H−E)·E = 1, (2H−E)·(H−E) = 1. For H: E-coefficient +n gives (·E) = −n < 0, never nef, and H·E = 0 | both directions agree | none |
| `isAmple_mul_of_mem_numericallyTrivialClasses` | E with a = O(p), b = O(q−p); Enriques H with b = ω | O(q) of degree 1 is ample; H ⊗ ω has the intersection numbers of H | holds | none |
| `IsSemiample`, `isNef_of_isSemiample` | P¹ with O(−1); O_X; E with O(p−q) | no section of O(−m), m ≥ 1; m = 1 witnesses; no power globally generated, degree 0 nef | m = 0 excluded as stated | R06 |
| `HasTrivialNumericalGaloisAction` | P¹_ℂ/ℝ; pointless conic | conjugation swaps (1,0), (0,1); g*O(1) ≅ O(1) | fails; holds | none |
| `constantNumericalClasses_iff_positivePowerDescent` | P¹; P¹_ℂ/ℝ; conic; d = 0 | d = 1; diagonal image misses (d,0); image 2ℤ, d = 2; right side vacuous | agree; 0 < d needed | none |
| `numericallyTrivial_torsion_of_algebraic_finiteField` | y²+y = x³/𝔽₂; y² = x³−x/𝔽₃; E/ℚ̄ | 2 + 1 = 3; 3 + 1 = 4; infinite order | holds; the algebraicity hypothesis is needed | none |
| `IsContraction` | id; P¹×P¹ → P¹; 𝔸¹ → Spec k[t²,t³]; P¹_ℂ → Spec ℝ | f_*O = O; O; k[t] ≠ k[t²,t³]; ℂ ≠ ℝ | last two excluded | none |
| `contraction_descends_purelyInseparable` | K = k; perfect closure; ℂ/ℝ control | identity squares; Γ(U′,O) = Γ(U,O) ⊗ K; one component of P¹_ℂ ⊔ P¹_ℂ does not descend | holds | none |
| `IsProjectiveOver` | Spec K, n = 0; 𝔸¹; Spec ℂ over ℝ | Proj K[T₀] = Spec K; not proper; closed point V(T₀²+T₁²) of P¹_ℝ | each law excludes its wrong model | none |
| `contraction_descends_of_constantNumericalClasses` | X = Spec K′, K′/k separable quadratic; P¹_ℂ/ℝ | Num = 0 constant, descends; hypothesis fails | matches SCH23 262–264 | none |
| `componentGraph` | P¹ ⊔ P¹; V(xy); ∅ | 2 vertices, 0 edges; 1 edge; empty | matches | none |
| `constantNumericalClasses_iff_componentGraphDescent` | P¹ ⊔ P¹ with the swap; P¹_ℝ ⊔ Spec ℂ | closure equation fails for the swap; outside purity (3 vertices over 2) | purity is needed | none |
| `fibreComponentGraph_descends_of_constantNumericalClasses` | blow-up of a k-point on a smooth fibre | [[−1,1],[1,−1]]: value −1 on (1,0), 0 on (1,1) | edge kept | none |
| `residueField_eq_of_reducible_geometricFibre` | 𝔽_q base | purely inseparable residue extension is trivial | κ(a) = k | none |
| `lineBundle_lifts_completeDVR_of_h2_zero` | P¹_R with O(d), d = −1, 0, 1 | restriction degree d | lifts exist | R03 |
| §0.6 | Bl_p P² → P² with O(1); normalization of nodal cubic | g*O(1)·E = 0 but g*O(1)·ℓ̃ = 1; 3 = 3 | both sides nonzero | none |
| §0.5 | Bl_x P¹_R with O(E) | generic degree 0; E·E = −1 | closed fibre detects | none |
| §1.1 | P¹×P¹ → P¹; over k; elliptic E | ℤ (b); ℤ² with [[0,1],[1,0]]; Pic = E(k̄)×ℤ, Num = ℤ | matches | none |
| §1.3 | P¹ ⊔ P¹ with O(1) ⊔ O(−1) | χ = (n+p+1)+(n−p+1) = 2n + 2 = χ(O(n) ⊔ O(n)); degrees (1, −1) | Euler test fails, curve degrees separate | R07 |
| §2.1 | Spec k[ε]/ε²; nodal rational curve | Pic(A[ε]/ε²) = 0 for local A; Pic⁰ = G_m with h¹(O) = 1 | matches | none |
| §2.3 | ℂ/ℝ; ℝ×ℝ; k[ε]/ε² | Br(ℂ) = 0; (ℤ/2)²; Br(k) | matches | R07 |
| §2.4 | pointless real conic | Pic = 2ℤ ⊂ ℤ, cokernel ℤ/2 = Br(ℝ), n = 2 | matches | none |
| §2.6 | P¹_ℂ/ℝ; P¹_ℝ ⊔ Spec ℂ; Spec K | ℤ² with swap; ℤ constant; 0 | matches | none |
| §5.4 | P^n_R; Spec R | both cones the ray of a line; both 0 | matches | R03 |
| §5.6 | P¹×P¹ → P¹ with O(a,0), O(0,1); E with O(p−q) | m = 1, M = O(a); fibre degree 1, hypothesis fails; no power pulled back | matches | none |
| §5.7 | Bl_p S → S with O(−E); identity | (−E)·E = 1 ≥ 0, generic fibre trivial, pullbacks have E-degree 0; M = L | (4) fails as required | none |
| §0.7 Checks | hyperplane H ⊃ ℓ; div(x/y); quadric cone | 1; 1 − 1 = 0; 2ℓ = V(x) ∩ Q, (ℓ·ℓ′) = (H·ℓ′)/2 = 1/2 | correct in every characteristic (k[s²,st,t²] is normal with local class group ℤ/2) | none |
| §1.7(i) | P¹×P¹ with O(1,1), O(1,0) | 2 > 0 and 1 on lines ⇒ ample; square 0 ⇒ not ample | true; owner is SSF §4.15 over k̄ | R01 |
| §1.7(iv) | P¹×P¹ → P¹, h = O(0,1) | O(ma, mb − n) f-nef iff mb ≥ n, possible iff b > 0 | matches line 419; statable | R03 |
| §3.3 Checks | P² sections x, y vs x, y, z; P¹ with O(m) | common zero [0:0:1] vs none; globally generated iff m ≥ 0 | matches | R01 |
| §5.3 ampleness | P¹_R with O(1) and O | ample on 𝒳 iff on the special fibre (both, neither) | statable via `IsAmple` | R03 |

**Library declarations opened at the pins (27).**
- Mathlib:
  - `SheafOfModules.GeneratingSections` (`Algebra/Category/ModuleCat/Sheaf/Generators.lean` 44)
  - `LinearMap.continuous_of_finiteDimensional` (`Topology/Algebra/Module/FiniteDimension.lean` 287)
  - `Scheme.Hom.normalization`, `fromNormalization` (`AlgebraicGeometry/Normalization.lean` 122, 169; QuasiCompact and QuasiSeparated hypotheses)
- Tau Ceti:
  - `LineBundleClass.intersectionNumber` (`IntersectionNumber/Basic.lean` 111: Euler degree of the pullback; additivity proved only on regular proper integral curves) and `intersectionNumber_one` (126)
  - `LineBundleClass.IsAmple` (`LineBundle/Ample.lean` 71: quasi-compact, affine nonvanishing loci of positive powers, as Stacks 01PS) and `IsAmple.of_pow` (96)
  - `InvertibleSheaf.IsGloballyGenerated` (`LineBundle/GlobalGeneration.lean` 139), with `isGloballyGenerated_iff_of_iso` (157), `isGloballyGenerated_iff_forall_isClosed` (167, needs `JacobsonSpace`) and `isGloballyGenerated_iff_nonempty_generatingSections` (238). No pullback or tensor lemmas exist at the pin
  - `Scheme.CartierDivisor` (`CartierDivisor/Basic.lean` 127), `toInvertibleSheaf` (`Sheaf.lean` 430), `sections` (`Sheaf.lean` 81), `toLineBundleClass_add` (`Picard.lean` 44), `toLineBundleClass_principalCartierDivisor` and `toLineBundleClass_surjective` (`Representation.lean` 279, 290; `IsIntegral`)
  - `toWeilDivisorHom` (`WeilDivisor/Scheme/Cartier/Inverse.lean` 234; `IsIntegral`, `IsLocallyNoetherian`). Injectivity exists at the pin only through `equivCartierDivisor` (341) for coheight ≤ 1 with DVR stalks, so the new injectivity theorem is not a duplicate
  - `CodimensionOnePoint` (`Scheme/CodimensionOnePoint.lean` 42: coheight 1), `SchemeWeilDivisor` (`WeilDivisor/Scheme/Basic.lean` 45), `IsNormalScheme` (`Scheme/Normal.lean` 84)
  - `isFinite_fromNormalization_of_isJapanese` (`Normalization/Finite.lean` 120), `isRegular_normalization_fromSpecStalk_genericPoint` (`Normalization/Regular.lean` 112), `IsUniversallyJapanese.of_field` (`RingTheory/UniversallyJapanese.lean` 126)
  - `ChowGroup` (`Chow/Basic.lean` 295). It has no c₁ ∩, which supports the docstring's Nakai/Kleiman-nonnegativity sentence.
- Neither pin has `IsNef`, `IsSemiample`, Nakai–Moishezon, Kleiman's criterion, relative ampleness or a height-one intersection theorem.

**Cross-roadmap citations re-resolved this round (the new and changed ones).**
- SchemeAndStackFoundations on main: §§4.12 (line 5613), 4.13 (5643; `serre_normality_criterion`, `resolution_of_curves`), 4.15 (5725; `spaceNakaiMoishezon` 5861), 5.2 (6653), 5.3 (6701, `Chow.c1`), 5.9 (7129) and 5.10 (7175).
- StableReduction Layer 2 on main: lines 430–466, including global generation (438), the curve ampleness criterion (448) and openness of fibrewise ampleness (452).
- AbundanceStatement at #545: lines 252, 300, 313, 318, 330 and 352.
- Citations unchanged since 83188b5 were resolved by the previous review, and the overlaps tool reports no id dropped by any open pull request.

**Ownership against open work.** `roadmaps grep` over 466 open heads and main finds:
- Kleiman/Nakai: AbundanceStatement (R02), SchemeAndStackFoundations (main §4.15 and open revisions #1276 and #1656, same text; R01), and HeightsRationalPointsAndObstructions (arithmetic Nakai, a different object).
- No other declaration of the new Lean names.

**Declared gaps.** The six slugs in `design/plan.json` match the six `What <Supplier> must provide (gap:…)` paragraphs (README lines 53, 55, 61, 63, 65, 67), with the same suppliers and sections. They are unchanged since the previous review, and none is supplied by the new sections or the pins.

**Principles and form.**
- No `set_option` and no sorry'd data. One module docstring and `theorem` only.
- The imports are `import Mathlib` plus seven `TauCeti.*` modules, each with a built object file.
- No pull-request numbers or process words in the folder.
- The new prose of §§0.7, 1.7 and 3.3 is the author's own wording.

## Not verifiable

- KLE66 (Annals of Mathematics 84, 1966), Theorems III.1 and IV.1: paywalled, not in the manifest or the sources cache.
- LAZ04 (Springer, 2004), §§1.1.C, 1.3.B, Theorem 1.2.23, Remark 1.2.29, Theorem 1.4.9, Corollary 1.4.10, Theorems 1.4.23 and 1.4.29, Remark 1.4.24, Examples 1.4.5 and 1.5.2: commercial textbook, not in the manifest or the cache.
- HAR77, Chapter II, §5 (definition before Theorem 5.17) and Theorem 7.1; MAT86, Theorem 11.5; EIS95, Corollary 13.13: commercial textbooks, not in the manifest or the cache. Open or pinned replacements for the last two are given in R08.
- I looked only in the package `sources.toml` and the worker's sources cache. This review edits no manifest, so nothing was fetched.

## Source issues

- **Misprint** in SCH23 at proof of Theorem 1.3, printed p. 7: the source writes the preimage of the affine open V′ as f′⁻¹(V); it should be f′⁻¹(V′), since V is only defined afterwards as an affine hull; affects nothing.
- **Misprint** in SCH23 at proof of Theorem 1.3, printed p. 7: the source names the continuous map of the contraction pair (f′, ϕ′) as f; it should be f′; affects nothing.
- **Misprint** in SCH23 at Lemma 1.1, printed p. 5: the source allows the uniform exponent d ≥ 0; it should be d ≥ 1, since d = 0 makes the condition vacuous; affects a stated result.
- **Misprint** in SCH23 at §2, printed p. 8: the source says let C ⊂ X be a curve; it should be C ⊂ S, the surface just introduced; affects nothing.
- **Misprint** in CT20 at Lemma 2.17, printed p. 17: the source puts the descended ℚ-Cartier divisor M on Y; it should be on S, the target of f; affects nothing.
