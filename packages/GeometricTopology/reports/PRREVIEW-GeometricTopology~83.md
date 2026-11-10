# Review of GeometricTopology (pull request #1797 at 0716443)

**Verdict:** needs changes

Twelve findings: two P1, four P2 and six P3.

- The gate fails: Layer 11 now consumes FourManifolds, an open roadmap that consumes this one (R01, R02).
- Necessity in the lens-space classification and Kawamura's theorem have no owner (R03).
- R04–R07 repeat findings of the previous review that this head leaves unrepaired.

The status of all 17 earlier findings is tabulated under *Verified sound*.

## R01 (P1) — Layer 11 closes a supply cycle through FourManifolds

**Location.** `TauCetiRoadmap/GeometricTopology/README.md`:

- line 10510: "Consume FourManifolds' `E₈` manifold (its Layer 3.9: the positive `E₈` plumbing capped by a contractible topological `4`-manifold)";
- the same edge at lines 10558–10559 (11.2 *Needs:*), 10796–10797 (11.4 *Needs:*) and 10875 (Layer 11 *Dependencies*);
- the ownership claim in *Scope and ownership*, line 183.

**Claim.** 11.2 states Casson's theorem "against that carrier" and proves from it that the `E₈` manifold has no PL structure.

**Witness.**

- The gate: `depcheck: CYCLE among: FourManifolds, GeometricTopology, HomotopySpheres, IndexTheory, StringOrientation, TangentialBordism`.
- FourManifolds' README at its open head, line 175: "no GeometricTopology layer consumes this roadmap".
- This README's line 10920 lists FourManifolds as a consumer of Layers 1–6.

**Repair.**

- Delete the four supplier references: the sentence at 10510–10512, "FourManifolds Layer 3.9 (the `E₈` manifold)" at 10558–10559 and 10796–10797, and "FourManifolds Layer 3.9 for the `E₈` manifold" at 10875.
- Replace the paragraph "In dimension four the theorems fail. … not surjective in dimension four" (10510–10518) by a Check. It names Freedman's `E₈` manifold from the literature (Freedman 1982; Casson, as recorded in `manolescu2016` lines 104–105) as the reason no dimension-free statement is made. It states no target on that carrier.
- In *Scope and ownership*, line 183, drop "and its four-dimensional failure for the `E₈` manifold of FourManifolds (Layer 11.2)".
- Drop the "carrier is FourManifolds'" clauses at lines 277, 10778 and 10786.
- In the description, remove "Depends on #936 FourManifolds".

The statement that `E₈` has no PL structure belongs with its carrier: FourManifolds §3.9 (its line 1921) already computes `KS = 1` for it.

**Tested.** I removed the four supplier references from a scratch copy of the README and re-ran the dependency check on it: `depcheck: 236 roadmaps, 2298 edges, 0 problem(s)`.

## R02 (P2) — A roadmap on main names an open roadmap as supplier

**Location.** As R01: README line 10875, and the description's "Depends on #936 FourManifolds".

**Claim.** GeometricTopology may consume FourManifolds Layer 3.9.

**Witness.** The gate line `UPWARD: GeometricTopology (on main) -> FourManifolds (#134) at README lines [10868]`. GeometricTopology is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. FourManifolds is an open pull request.

**Repair.** The edit of R01 clears this line too; the scratch run above shows no UPWARD line.

## R03 (P1) — Two theorems used in proofs have no owner

**Location.**

- 5.4.2, README lines 7718–7720: necessity in the lens-space classification "is consumed as stated, based cellular torsion being MorseNovikov's"; repeated in its *Needs:* at line 7781.
- 4.8.3, lines 6092–6094 and 6143: "Kawamura's theorem u(10₁₃₉) = 4 … is consumed as stated".

**Claim.** Both inputs are supplied somewhere.

**Witness.**

- `roadmaps grep` for a lens-space classification finds only this README, at this head and on main.
- MorseNovikov on main never mentions lens spaces, and it consumes this roadmap's Layers 1, 3–5 and 11 (its README line 28), so this roadmap cannot take its torsion.
- The GeometricTopology, Part II list in *Scope and ownership* (lines 278–311) names neither input.
- Two results rest on them:
  - `u(8₃) = 2` (lines 7750–7754): its lower bound rules out the unknot case "by the lens-orbit Check and the lens homeomorphism test", which is necessity;
  - necessity in the Kanenobu–Murakami criterion.
- Kawamura's theorem supplies a lower bound in 4.8.3.

**Repair.**

- Add to the Part II paragraph of *Scope and ownership*: "the necessity of the classification of lens spaces (Reidemeister–Franz torsion of the cellular complex of 5.4.2, on MorseNovikov's cellular torsion) and Kawamura's theorem u(10₁₃₉) = 4 (the slice–Bennequin inequality)".
- At 7718–7720 write "necessity, by the Reidemeister torsion …, is GeometricTopology, Part II's".
- At 6143 write "Kawamura's theorem, GeometricTopology, Part II's".

Part II comes after MorseNovikov, so it may consume MorseNovikov.

## R04 (P2) — 11.2: Moise's Hauptvermutung is misstated as a common subdivision

**Location.**

- README lines 10469–10471: "any two triangulations of a `3`-manifold have a common subdivision";
- line 10502: "the common subdivision of two triangulations are the theorems above";
- the Check at 10528–10529;
- 11.3's Check at 10737–10738: "the two are PL homeomorphic (a common subdivision exists)".

Earlier review R04; not repaired.

**Claim.** Two triangulations `h : |K| ≃ₜ M` and `h' : |L| ≃ₜ M` of a 3-manifold have a common subdivision.

**Witness.**

- Take `h' = φ ∘ h` with `φ(x) = ‖x‖² x` on a coordinate ball and the identity outside. On a ray `φ(tu) = t³u`, so `h⁻¹ ∘ h'` is not PL at the centre, and no common subdivision exists.
- The same holds for the radially projected tetrahedron and cube of 11.3: the transition map is piecewise projective, not piecewise linear.
- What holds is PL equivalence: `scharlemann2002` line 956 records that any two triangulations of a 3-manifold are PL equivalent (citing Moise and Bing). This README's own 11.2.1 item 4 already uses the right form, "isomorphic subdivisions".

**Repair.**

- 10469–10471: "any two triangulations of a `3`-manifold are combinatorially equivalent: their complexes have isomorphic subdivisions, equivalently `|K|` and `|L|` are PL homeomorphic (Moise, Theorem 36.2)".
- 10502: "the combinatorial equivalence of two triangulations".
- 10529 and 10738: "have isomorphic subdivisions".

**Tested.** `h` and `φ ∘ h` share the complex `K`, so they are combinatorially equivalent, although they have no common subdivision.

## R05 (P2) — Thurston's irreducible inequality and Yazdi's family are statable; the docstring says they are not

**Location.** `TauCetiRoadmap/GeometricTopology/Suggested.lean` lines 87–90: "the general form of Thurston's Euler class inequality on closed irreducible `3`-manifolds and the infinite family of Yazdi's theorem (Layer 10.5): the pins have no Thurston norm". Earlier review R05; not repaired.

**Claim.** Neither headline can be stated at the pins.

**Witness.** README 10.5 states both without the norm: lines 10219–10221 give the surface form, and Yazdi's Main Theorem is `yazdi2016` lines 111–114. Both statements below elaborate on a scratch copy of the file with `lake env lean`; the only warning is the `sorry` one. The surface form uses the pinned `TauCeti.IsSphereBoundsBall` (`TauCeti/Geometry/Manifold/Irreducible.lean:42`) and `TauCeti.EulerClassBounded` (`Foliation/EulerClass.lean:218`).

```lean
theorem thurston_euler_class_inequality_of_isSphereBoundsBall (M : Type) [MetricSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M] [CompactSpace M]
    [ConnectedSpace M] [TauCeti.Orientable (𝓡 3) M] (hM : TauCeti.IsSphereBoundsBall M) :
    haveI : IsManifold (𝓡 3) (∞ + 1) M := .of_le (n := ∞) (by simp)
    ∀ (F : TauCeti.Foliation (𝓡 3) ∞ M 2), F.Taut →
      ∀ e : (TopCat.of M).singularCohomology (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ
        (ModuleCat.of ℤ ℤ) 2, F.IsEulerClass e → TauCeti.EulerClassBounded e := by
  sorry

theorem yazdi_infinite_family (k : ℕ) (N : Fin k → Type) [∀ i, TopologicalSpace (N i)] :
    ∃ (M : Type) (_ : MetricSpace M) (_ : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M)
      (_ : IsManifold (𝓡 3) ∞ M) (_ : CompactSpace M) (_ : ConnectedSpace M)
      (_ : TauCeti.Orientable (𝓡 3) M), TauCeti.IsHyperbolic (I := 𝓡 3) (M := M) ∧
        (∀ i, IsEmpty (M ≃ₜ N i)) ∧
        haveI : IsManifold (𝓡 3) (∞ + 1) M := .of_le (n := ∞) (by simp)
        ∃ e : (TopCat.of M).singularCohomology (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ
          (ModuleCat.of ℤ ℤ) 2, Even e ∧ TauCeti.EulerClassNormOne e ∧
            ∀ F : TauCeti.Foliation (𝓡 3) ∞ M 2, F.Taut → ¬ F.IsEulerClass e := by
  sorry
```

**Repair.**

- Add both theorems to `Suggested.lean` and name them in README 10.5.
- Narrow the docstring's "not statable" item to what needs the dual norm `x*`: the norm form `x*(e(F)) ≤ 1` and Gabai's realization of the vertices of the dual unit ball.

**Tested.** On irreducible `M` a sphere has `[S] = 0`, so the surface form agrees with the README's `|χ(S)|` form. For the hyperbolic case, compose with "closed hyperbolic implies irreducible" (README 7.3).

## R06 (P2) — Agol's virtual Haken theorem in its aspherical form is statable and absent

**Location.** README lines 8936–8938: "State the aspherical form as a target: a closed connected `3`-manifold with `π_k(M) = 0` for all `k ≥ 2` is virtually Haken (Agol, Theorem 9.1)". `Suggested.lean` lines 285–288 state only the hyperbolic case, and the docstring does not list the aspherical form as unstatable. Earlier review R06; not repaired.

**Claim.** The hyperbolic case is the headline.

**Witness.**

- Agol's Theorem 9.1 is the aspherical statement (`agol2013` lines 27–28).
- `TauCeti.IsVirtuallyHaken` needs only `[TopologicalSpace M]` (`TauCeti/Geometry/Manifold/VirtuallyHaken.lean:63`).
- The statement below elaborates on a scratch copy; the only warning is the `sorry` one.

**Repair.** Add to `Suggested.lean`, and name it in 7.4:

```lean
theorem agol_virtually_haken_of_aspherical (M : Type u) [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) 0 M] [CompactSpace M]
    [ConnectedSpace M] (hM : ∀ (k : ℕ) (x : M), 2 ≤ k → Subsingleton (HomotopyGroup (Fin k) M x)) :
    TauCeti.IsVirtuallyHaken M := by
  sorry
```

## R07 (P3) — `cerf_theorem` is padding

**Location.** `Suggested.lean` lines 132–137 (`theorem cerf_theorem : TauCeti.CerfTheorem`) and docstring lines 61–64 ("Cerf's proof being independent of Hatcher's"). Earlier review R09; not repaired.

**Witness.** On a scratch copy, `example : TauCeti.CerfTheorem := TauCeti.SmaleConjecture.cerfTheorem smale_conjecture` elaborates (`TauCeti/Geometry/Diffeomorphism/Cerf.lean:84`). The acceptance test tests statements, not proofs. Besides, README 3.4 (line 2424) gives both proofs to GeometricTopology, Part II.

**Repair.**

- Delete `cerf_theorem` and docstring lines 61–64.
- In README 3.4, lines 2418–2419, replace "`Suggested.lean` states it as `cerf_theorem`" by "it follows from `smale_conjecture` by the pinned `TauCeti.SmaleConjecture.cerfTheorem`".
- Drop "Cerf's theorem" from the Summary, line 26.

## R08 (P3) — Mathlib's statement of the smooth Poincaré conjecture is not cited

**Location.** `Suggested.lean` lines 392–400 (`nonempty_diffeomorph_sphere_of_simplyConnectedSpace`); README 8.6, lines 9590–9603; *From Mathlib*.

**Claim.** The smooth form needs its own statement on simply connected compact metric manifolds.

**Witness.** Mathlib has `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M n` (`Mathlib/Geometry/Manifold/PoincareConjecture.lean:41`): every smooth `n`-manifold structure on `M` homotopy equivalent to `Sⁿ` is diffeomorphic to `Sⁿ`. Its docstring records the case `n = 3` as true. The README never names it (no match for `NonemptyDiffeomorphSphere`).

**Repair.** Cite it under *From Mathlib* and in 8.6. State the smooth headline on it:

```lean
theorem nonempty_diffeomorph_sphere_of_homotopyEquiv (M : Type u) [TopologicalSpace M]
    [T2Space M] : ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 3 := by
  sorry
```

This elaborates on a scratch copy. 8.6 then proves the comparison: a closed simply connected `3`-manifold is homotopy equivalent to `S³` (Hurewicz, Whitehead and Poincaré duality, AlgebraicTopology Stage 6). Conversely, `M ≃ₕ S³` forces `M` compact, since `H₃` of a noncompact `3`-manifold vanishes.

## R09 (P3) — Two locators from the earlier review remain wrong

**Location.**

- Lickorish. Markov's theorem is cited as "Lickorish, *An Introduction to Knot Theory*, Chapter 16, Theorem 16.10" at line 2677 and as "Lickorish, Theorem 16.10" at `Suggested.lean` line 147. Reidemeister's theorem is cited as "Lickorish, Chapter 1, Theorem 1.7" at line 2694 and in the References, line 11017.
- Livingston. Line 8351 cites "(Tristram; Livingston, Section 3.1; …)" for the slice-genus bound.

Earlier reviews R11 (partly repaired) and R15 (not repaired).

**Witness.**

- The same README cites "Lickorish, Proposition 16.10" at lines 2641 and 5042 and "Chapter 1, pp. 3–4" at line 2638.
- The roadmap's former extracts, removed from main when #903 merged and kept in its history, give Proposition 16.10, p. 187 and unnumbered prose, pp. 3–4.
- `livingston2005` §3.1 (lines 223–240) has no genus bound; §9.5 (lines 815–819) does.

**Repair.** Write "Lickorish, Proposition 16.10, p. 187" at line 2677 and `Suggested.lean` line 147, and "Lickorish, Chapter 1, pp. 3–4" at line 2694 and line 11017. At line 8351 write "Livingston, Section 9.5", or Conway's survey, Theorem 2.12, as 6.2 does.

## R10 (P3) — Hatcher's 3-manifold notes are cited with wrong numbers and for text they do not contain

**Location.**

- line 9099: "Hatcher, Proposition 1.13 and the remark after Theorem 3.8";
- line 9339: "Proposition 1.12", vertical or horizontal surfaces;
- line 9341: "Proposition 1.13", irreducible unless `S¹ × S²`, …;
- lines 9384–9386: "Proposition 1.13", "Lemma 1.11", "Proposition 1.14; Lemmas 1.16–1.18";
- lines 10499–10500: "as recorded in Hatcher, *Notes on Basic 3-Manifold Topology*, the introduction".

**Witness.** In `hatcher-3m` the numbering agrees with the README up to Theorem 1.9 (line 531), then drifts:

- Lemma 1.10 (line 576) is incompressible-or-∂-parallel-annulus;
- Proposition 1.11 (line 606) is vertical or horizontal;
- Proposition 1.12 (line 703) is irreducible unless `S¹ × S²`, `S¹ ×̃ S²` or `ℝP³ # ℝP³`;
- Lemmas 1.14–1.16 (lines 761, 778, 790) are the three annulus lemmas;
- the remark after Theorem 3.8 credits Proposition 1.12 (line 2160).

The text never mentions Moise or the Hauptvermutung; its opening only fixes the `C∞` category (line 34).

**Repair.**

- 9099: Proposition 1.12.
- 9339: Proposition 1.11.
- 9341 and 9384: Proposition 1.12.
- 9385–9386: "Lemma 1.10; Proposition 1.13; Lemmas 1.14–1.16".
- 10499–10500: drop the Hatcher clause. If a secondary source is wanted, cite `scharlemann2002` line 956.

## R11 (P3) — 4.10.5 is written as a procedure

**Location.** README 4.10.5, lines 6509–6537: "The input is an oriented realized plane diagram …", "Return a diagram …", "The output is a finite supported-move certificate, not an equality of integer matrices; termination uses finite PL subdivisions and Euclid's algorithm". Also line 6559: "a failing congruence returns the classification obstruction"; and the heading's "Witnessed … fraction adapters".

**Witness.** The house rules ask for mathematics, not procedures, certificates or termination arguments. The theorem underneath is Schubert's normal form, which the section never states.

**Repair.**

- State it: "for a link `L ⊂ S³` and a sphere meeting `L` in four points, each side a trivial two-string tangle, there are coprime `p ≥ 0` and `q`, and an isotopy of `S³` carrying `L` onto the numerator closure of the rational tangle of the fraction `p/q` of 4.10, with the continued-fraction order and mirror conventions below".
- Keep the half-twist factorization of the gluing map as the proof route.
- Replace the "Constructively, …" sentence by the statement that an amphichiral class contains a reduced fraction with `0 < q ≤ p/2` and an even-length palindromic positive continued fraction.
- Retitle "Two-bridge links as rational links and continued fractions".

The same vocabulary ("certificate", "witnessed", "adapter") recurs 65 times; apply this repair wherever a sentence describes a procedure.

**Tested.** `13/5 = F([2, 1, 1, 2])`, palindromic, with `5² ≡ −1 (mod 13)`.

## R12 (P3) — An open pull request that changes this roadmap conflicts, with no stated order

**Location.** The pull request's description, which names an order only against #1220.

**Witness.** `overlaps.md`: "#1791 and #1797 conflict in `Completed/ConformalMapping/README.md`, `TauCetiRoadmap/GeometricTopology/README.md`". #1791's head edits the text from before #903: it links `references/moise-triangulation-dim3.md`. At its line 885 it hands Radó's theorem to PlanarTopology, which this roadmap may never cite. This head owns Radó's theorem (11.2.1 item 3, `rado_triangulation`).

**Repair.** State in the description that #1791 is rebased onto this revision once it lands, and that Radó's theorem stays in Layer 11.2.1.

## Verified sound

### Gate, build and dependency check

- **Gate.** My re-run of the gate gives every check `0` except `depcheck=2` (R01, R02) and `outside-folder=3`. The three outside-folder files are in `RepresentationTheory/LieHighestWeight/`, which the brief names as this pull request's own. The brief's exclusion diff outside the two folders is empty.
- **Dependency check.** `UPWARD: GeometricTopology (on main) -> FourManifolds (#134) at README lines [10868]`; `CYCLE among: FourManifolds, GeometricTopology, HomotopySpheres, IndexTheory, StringOrientation, TangentialBordism`; `depcheck: 236 roadmaps, 2299 edges, 2 problem(s)`. After the R01 edit on a scratch copy: `0 problem(s)`.
- **Build.** `lake env lean` on `Suggested.lean` gives 34 warnings, all `declaration uses sorry`.
- **`#check` audit.** I put `#check @name` for all 34 theorems in one scratch file. Each elaborated type matches its README statement. The file has no `variable` block (only `universe u`), so no binder can be lost; I changed nothing.
- **One-tactic probe.** `first | simp | rfl | trivial | infer_instance | decide` fails on `SmaleConjecture`, `ThurstonEulerClassInequality`, `TriangulationConjecture 2` and `IsSphereBoundsBall S³`. `exact?` on `CerfTheorem` finds only the file's own `cerf_theorem`. The one-term closure through `smale_conjecture` is R07. Nothing else is padding: every other theorem is a native headline proposition, or has hypotheses no library lemma discharges.

### Headline theorems

The Summary's end theorems all appear in `Suggested.lean`:

- the Smale conjecture, Watanabe, the annulus theorem, Freedman, Levine (homology concordance), Mostow, Gabai–Meyerhoff–Milley, Agol (hyperbolic forms);
- JSJ, geometrization, Poincaré (topological and smooth), Li, Property P and R, the cyclic surgery theorem, Gordon–Luecke (both forms), Kneser and Milnor;
- Alexander, the knot-group theorem, the sphere theorem, Waldhausen, Radó, Moise, Manolescu (both forms), Markov, Mathieu, Thurston and Yazdi (hyperbolic forms).

The docstring's other "not statable" items are justified at the pins: Reidemeister geometric, Seifert-matrix Alexander, Levine's satellite theorem, mutation, Kondo and Novikov–Rosenberg. The exceptions are R05 and R06.

### Earlier review (r74, at 9864ff4)

| Id | Passage at this head | Status |
|---|---|---|
| R01 | 6.2, l. 7935–7937: σ̄ "a concordance invariant at every such ω"; no "2ℤ" clause | repaired |
| R02 | l. 10162: "`x*` is finite exactly on the annihilator … and is a norm there" | repaired |
| R03 | l. 10220: "every closed connected embedded oriented surface `S`"; Check l. 10279 | repaired |
| R04 | l. 10469–10471 "common subdivision" | not repaired: R04 |
| R05 | `Suggested.lean` l. 87–90 | not repaired: R05 |
| R06 | l. 8936–8938, aspherical form absent | not repaired: R06 |
| R07 | l. 10194–10197: the class "is not bounded … `|⟨e, [T]⟩| = 2`" | repaired |
| R08 | l. 9586: "hence diffeomorphic to it (Layer 11.2)"; smooth form via 11.2 | repaired |
| R09 | `Suggested.lean` l. 132–137 | not repaired: R07 |
| R10 | l. 8285: "untwisted Whitehead double of any knot" | repaired |
| R11 | l. 2641 now "Proposition 16.10"; l. 2677, 2694 and `Suggested.lean` l. 147 not | partly: R09 |
| R12 | l. 10644 and 10679 still "Rourke–Sanderson, Chapter 3" | not verifiable at this head (below) |
| R13 | l. 8515–8517 cite Mostow 1968 for the general statement | repaired |
| R14 | l. 292–293: "Kirby's Problem 1.41 for the shake genus" | repaired |
| R15 | l. 8351 "Livingston, Section 3.1" | not repaired: R09 |
| R16 | #903 has merged; #1791 now conflicts | superseded: R12 |
| R17 | no "deferred", "optional" or "for later" anywhere | repaired |

### Seeded sample (15 targets)

| Target | Source check | Mathematics |
|---|---|---|
| 1.7.2 | Farb–Margalit and Lickorish uncertified (settled) | all four Checks recomputed (table) |
| 2.2 | Brown 1960, fetched from the AMS open archive, cached as `brown1960`: Theorem 5 at lines 101–113, with Theorems 2 and 4, supports the statement and the shrinking route | holds |
| 4.4.4 | no outside source | holds (table) |
| 4.7.4 | none cited | holds |
| 4.7.5 | none cited | holds |
| 4.7.7 | Balm–Friedl–Kalfagianni–Powell §7.2 (URL) not cached | holds |
| 4.7.8 | `fyhlmo1985` line 234: HOMFLY of a pretzel knot is unchanged by permuting the parameters (p. 244), as cited | holds (simulation) |
| 4.10.5 | Kauffman–Lambropoulou not cached | values hold; form is R11 |
| 5.3 | `km2004` (earlier review); Gabai 1987, Mathieu not cached | holds |
| 5.4.2 | Kanenobu–Murakami paywalled; Hatcher Thm 2.5 at `hatcher-3m` l. 1249 | holds; ownership R03 |
| 6.4 | `levine2016` l. 85–91 (Thm 1.2, Problem 1.45), 110–126 (Prop 1.3, route as described: second and third sentences), 129–143 (Remarks 1.4–1.5, Problem 1.31), 157–160 (Thm 1.6) | holds |
| 7.4 | `agol2013` l. 27–32 (Thms 9.1, 9.2, Problems 3.50–51); `gmm2009` (earlier review) | holds; R06 |
| 9.2 | `li2013` l. 66–68, 73–74; `scharlemann2002` l. 325–335 (§3.2 sums) and 375–377 (Thm 3.4, Haken) | holds |
| 11.1 | `hatcher-at` l. 22534 (Prop A.1), 6051 (Thm 2.35), 6086 (cellular boundary formula) | holds |
| 11.2 | Moise, Bing, Munkres not cached; Hatcher clause R10 | R04 |

Further locators checked:

- `hatcher-torustrick` l. 44–57 (Theorems A and B, refinements);
- `calegari2007` l. 5900–5902 (Thm 4.5), 6702–6707 (Thm 4.35), 6916–6918 (Thm 4.38);
- `yazdi2016` l. 49–60, 81–92, 100–102, 111–114;
- `manolescu2016` l. 15–16, 104–105, 257 (dimension-5 examples non-orientable, as 11.4's Check says);
- `scharlemann2002` l. 302–304 and 425–428 (Reidemeister–Singer, Waldhausen's Thm 3.7).

### Adversarial table (values computed by hand, by pure-Python scripts, or read at the pin)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.7.2 twist action | `T²`, `a·b = +1`, tube `dθ∧dt` | `T_a(b) = a + b`: `[[1,1],[0,1]]`; `T_b(a) = a − b`: `[[1,0],[−1,1]]`; left-turning inverses `[[1,−1],[0,1]]`, `[[1,0],[1,1]]` | holds | none |
| 1.7.2 swap conjugation | `S = [[0,1],[1,0]]` | `S T_a S⁻¹ = [[1,0],[1,1]] = T_b⁻¹` | holds | none |
| 1.7.2 cutting | Möbius band along an arc | `χ: 0 → 1`, boundary circles `1 → 1` | holds | none |
| 2.2 Brown | round sphere; horned sphere | bicollared, so two cells; horned not bicollared | holds | none |
| 3.4 Cerf | `−I₄`, reflection, `S⁶` | `det(−I₄) = +1`; reflection has degree −1; `Γ₇ ≅ Θ₇ ≅ ℤ/28` | holds | R07 (padding) |
| 4.4.4 | `V` of the hypothesis | `det(V−Vᵀ) = 1`; `Δ = 64t²−272t+417−272t⁻¹+64t⁻² = (8t−17+8t⁻¹)²`; `Δ(1) = 1`, `Δ(−1) = 1089`; LDL `diag(4, −41/4, 180/41, −121/20)`, product 1089, σ = 0; `∇ = 1 − 16z² + 64z⁴` | holds | none |
| 4.7.4 | `S₃` pairs; `GL₃(𝔽₂)`; `S₅` | orbits 3 + 6, centralizers 2 and 1; class sizes sum to 168; sum 120 | holds | none |
| 4.7.5 | arc matrix of `5₂` | `A(c, c+a, c−a, c−2a, c−4a) = (0,0,0,−7a,7a)`; cofactor det −7; counts 49 (mod 7), 3 (mod 3), 98 (mod 14) | holds | none |
| 4.7.6 | trefoil, cinquefoil, `H³` | `sts = tst`, `|⟨s,t⟩| = 24`; `(ab)²a = b(ab)²`, `|⟨ab, a³⟩| = 120`, `|⟨a³, b³⟩| = 6`; `H³((12),(23)) = ((12),(23))` | holds | none |
| 4.7.7 | general odd `p, q, r` | `det(W−tWᵀ) = A(1−t)² + t`, `A = (B+1)/4`; `B ≡ 3 (mod 4)` from `(p+q+r)² ≡ 1` and `p²+q²+r² ≡ 3 (mod 8)`; `Fitt₁ = (t+1, g)` | holds | none |
| 4.7.7 Checks | P(3,3,3); P(−3,5,7); P(3,5,−7) | B = 27, Smith (3, 9), 243 colourings mod 9, based module of order 27 and exponent 9; B = −1, Δ = 1; B = −41, Δ(−1) = 41, σ = 0 | holds | none |
| 4.7.8 components | all lists of length 1–5, entries −3…3 | simulated involutions against the formula: 0 mismatches; P(2,2,2) gives 3, P(1,1) gives 2, (0,0,0) gives 3 | holds | none |
| 4.10.5 | [4,3], 13/5, [2,2,3], [5,1,2] | 13/3 vs 13/4, `3·4 ≡ −1`; `5² ≡ −1 (mod 13)`; 17/7 vs 17/5; 17/3 vs 17/6 | holds | R11 (form) |
| 5.2 framing | `λ' = λ + kμ` | `pμ + qλ = (p−kq)μ + qλ'`; Weeks coefficient read as `5/2 − n` | holds | none |
| 5.3 Mathieu | 9 and 9/2 on `T(2,3)` | `|9−6| = |9−12| = 3`, `H₁ = ℤ/9`; Ni–Wu: `2² = 4 ≢ 8 (mod 9)` | holds | none |
| `cyclic_surgery_theorem` | wild Φ; trefoil 11/2; unknot | the pinned `IsSeifertFibered` uses closed fibred solid tori, and `SolidTorus.isSeifertFibered` holds, so `hSF` is a real hypothesis; `|11−12| = 1` lens surgery excluded by `hSF`; wild Φ gives `L(5,2)` at 5/2, so `hΦ` is needed | holds | none |
| 5.4 Checks | `T(1,2)`; unknot; `T(2,3)` | `|5−2| = 3`; distances `Δ(∞, 1/2) = 2`, `Δ(1/2, 5/2) = 8`; `L(5,9) = L(5,4)`, `L(7,9) = L(7,2)`; 6 gives `L(2,1) # L(3,1)` | holds | none |
| 5.4.2 `u(8₃) = 2` | p = 17 | [4,4] = 17/4; `2n² ∈ {2, 9}`, orbit `{2,15,9,8} ∌ 4`; `|rs| ∈ {8, 9}` has no coprime factorization with both factors ≥ 2 | holds | R03 (owner) |
| 6.2 averaged σ | trefoil at `θ = π/3 ∓ 0.01, π/3, π` | `σ = 0, −1, −2, −2`; averaged value −1 at the root | holds | none |
| 6.4 Hedden | `W₊,₀(T)`, `W₊,₀(T̄)`, `W₋,₀(T)` | `0 < 2·1` gives τ = 1; `0 < −2` false, τ = 0; mirror τ = 0 | holds | none |
| 6.4 trivial pattern | core pattern | 1- and 2-handles cancel, `Y_P = S³` | holds | none |
| 6.5 | `T(2,5)` | `Δ = t²−t+1−t⁻¹+t⁻²`, σ = −4, genus 2 | holds | R09 (locator) |
| 7.4 Weeks | (5, 5/2); (1, 1) | linking matrix 0, `H₁ = ℤ/5 ⊕ ℤ/5`; identity matrix gives `H₁ = 0`, +1 surgery on a twist knot of determinant 3 or 5 | holds | none |
| Agol aspherical | `Σ₂ × S¹`; `S³` | elaborates at the pins; `π₁(S³)` finite, so not virtually fibred | holds | R06 |
| 9.1 | Clifford tori `L`, `R` | overlap `1/5 ≤ ‖z‖² ≤ 1/2`; frontier `χ = 2(1−g)` | holds | none |
| 9.2 | `T³`; Poincaré sphere; `ℝP² × S¹` | 3 = 3; 2 = 2; rank 2; n = 0 vs 1 gives gap ≥ 1 vs ≥ 2 | holds | none |
| 10.1–10.3 | `T³` irrational plane; Hopf; Möbius ⊕ ℝ | `(1, √2, √3)` is ℚ-independent, so no integer vector lies in `P`; `e = ±1` vs `e(TS²) = 2`; no Thom class | holds | none |
| 10.4 `x*` | `S² × S¹`; hyperbolic `M` | `Ann(ker x) = 0`, `x* = ∞` off 0; `Ann = H²` | holds | none |
| 10.5 | `Σ₂×pt ⊔ S²`; sphere leaf | `|χ| = 0 < 2`, so connectedness is needed (Check present); `⟨e,[S²]⟩ = 2 > x = 0` | holds | R05 (statable) |
| 11.1 | edge; fan; `[abc]` | `∂e ∗ ∅ = S⁰`; `ℓ¹` distance `2/i → 0` vs closed in the weak topology; `∂∂[abc] = 0` | holds | none |
| 11.2 Hauptvermutung | `h`, `φ∘h`, `φ(tu) = t³u` | no common subdivision; isomorphic subdivisions exist | false as written | R04 |
| 11.2.1 | 7-vertex torus | `E = 3V ≤ V(V−1)/2` gives V ≥ 7 | holds | none |
| `markov_theorem` | 0 strands; forward direction | `n + 1 ≥ 1`; forward is native `MarkovEquiv.reidemeisterEquiv_closure`; converse needs only that the native moves are isotopies | holds | R09 (locator) |
| `property_P`, `property_R`, `gordon_luecke_theorem` | unknot ±1; slope 0 | `S³` is simply connected, so K must be nontrivial; `H₁(S³_{p/q}) = ℤ/p`, so only `s = 0` can give `S¹ × S²` | holds | none |
| `sphere_theorem` | `S¹ × ℝP²` | `π₂ = ℤ`, irreducible (`hatcher-3m` l. 2158–2161) | holds | R10 (locator) |
| Poincaré (both forms) | `S² × S¹` | `π₁ = ℤ` fails the hypothesis | holds | R08 |
| Manolescu | n = 0; dimension 5 | `triangulationConjecture_zero` native; dimension-5 examples non-orientable | holds | none |
| `mostow_rigidity` | genus-2 surface | `IsMostowRigid` assumes `3 ≤ finrank`; Teichmüller dimension `6g−6 = 6` | holds | none |
| Layer 11, dimension 4 | `E₈` | FourManifolds §3.9 carries `KS = 1` | cycle | R01, R02 |

### Library declarations opened at the pins

Tau Ceti `2fd255d`:

- `TauCeti/Geometry/Diffeomorphism/Cerf.lean:77` (`CerfTheorem`) and `:84` (`SmaleConjecture.cerfTheorem`);
- `Foliation/EulerClass.lean:133` (`IsEulerClass`), `:218` (`EulerClassBounded`), `:231` (`EulerClassNormOne`), `:330`, `:346`, `:387` (Thurston, Euler class one, Yazdi);
- `Geometry/Manifold/Irreducible.lean:42` (`IsSphereBoundsBall`);
- `VirtuallyHaken.lean:63` and `Hyperbolic/VirtualHaken.lean:65`;
- `Haken.lean:204`;
- `LowDimTopology/SeifertFibration.lean:223` and `:269` (`SolidTorus.isSeifertFibered`);
- `SolidTorusNeighborhood/Exterior.lean:73`;
- `Topology/TriangulationConjecture.lean:77` and `Triangulable/Basic.lean:38`;
- `Geometry/Manifold/Basic.lean:57` (`IsClosedConnectedManifold`);
- `Hyperbolic/Mostow.lean:40` and `:72`;
- `KnotTheory/Slice/Freedman.lean:66`;
- `KnotTheory/Signature.lean:103` and `:138`.

Mathlib `1b1ccf4`:

- `Geometry/Manifold/PoincareConjecture.lean:41`;
- `GroupTheory/Perm/Sign.lean:126` (`mclosure_swap_castSucc_succ`);
- `GroupTheory/Perm/Closure.lean:46` and `:111`.

All 145 dotted declaration names cited in the 15 sampled sections resolve at the pins. The two misses are the file name `Suggested.lean` and the module `TauCeti.KnotTheory.Signature`, which exists.

### Cross-roadmap citations resolved

- DifferentialGeometry is on main.
- HopfRinow is under `Completed/`.
- AlgebraicTopology Stages are on main; the open revision #1652 maps Stage to Layer.
- On main: TypeAHeckeAlgebras, TemperleyLieb, Subfactors §§3.1–3.3 (its lines 676, 697, 774), ReductiveGroups 11A (line 1971), SuccessiveMinima, CharacteristicClasses C2, and CombinatorialHeegaardFloer Lanes G (line 237) and K (line 326).
- MorseNovikov (main, line 28) consumes this roadmap.
- TeichmullerGeometry's citations of 1.7.2 and 11.2.1 items 2–5 resolve at this head. Its topological mapping class group differs from 1.7.2's smooth one by category, as both READMEs say.
- No never-cite roadmap appears in the README.

`overlaps.md`: no id dropped or newly required. The only other open pull request changing this folder is #1791 (R12).

## Not verifiable

- **Kirby's problem list** (`kirby1997`): the cached text is empty (Ghostscript could not render the PostScript). Problem numbers were confirmed through `km2004` (1.15), `agol2013` (3.50–51), `levine2016` (1.45, 1.31) and `watanabe2018` (4.34, 4.126). The numbers 1.16, 1.19, 1.36, 1.81 and 3.45 are unchecked.
- **Settled uncertified texts.** Lickorish 1962/1964/1997, Farb–Margalit, Moise, Rourke–Sanderson, Ratcliffe, Hirsch, Thurston 1986, Gabai 1983, Kauffman 1987 and the Hoste–Thistlethwaite–Weeks tables are cited by locator only.
  - The earlier R12 (Rourke–Sanderson "Chapter 3" for combinatorial triangulations of PL manifolds, lines 10644 and 10679) was witnessed by the roadmap's own extract, which is no longer on main. I cannot check the book; please check it.
- **Not cached** (paywalled or not requested; this review edits no manifest):
  - Cerf (LNM 53), Hatcher's Smale paper, Mostow 1968, Bing 1959, Munkres, Milnor–Stasheff, Scott;
  - Gordon–Luecke, Culler–Gordon–Luecke–Shalen, Moser, Kanenobu–Murakami, Mathieu, Gabai 1987, Hedden 2007, Kawamura;
  - Freedman–Quinn, Tristram, Conway's signature survey;
  - Kauffman–Lambropoulou, Balm–Friedl–Kalfagianni–Powell.
- **Brown 1960** was read from the AMS open archive into the sources cache only; no manifest entry was written.

## Source issues

- **Error** in livingston2005 at §3.1, printed p. 7 (line 230): the source says the averaged `σ_ω` maps onto `2ℤ` for every `ω ≠ 1`; it should say evenness holds only where `Δ(ω) ≠ 0` (trefoil at `e^{iπ/3}` averages to `−1`); affects a stated result.
- **Misprint** in levine2016 at the proof of Proposition 1.3, printed p. 3 (line 126): the source says the slice disc contradicts the conclusion of Theorem 1.1; it should say Theorem 1.2, which is the hypothesis on `P`; affects nothing.
- **Gap** in yazdi2016 at §1, p. 2 (lines 55–56): the source says compressing yields an incompressible `S′` with `|χ(S′)| ≤ |χ(S)|`; it should use `χ₋` and discard ball-bounding spheres (a compressed torus gives a sphere, `2 > 0`); affects the proof.
