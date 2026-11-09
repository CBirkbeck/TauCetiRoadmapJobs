# Review of BordismFormalGroups (pull request #1807 at 62d686c)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since 64a16e1. At 64a16e1 and at 62d686c, `TauCetiRoadmap/BordismFormalGroups/README.md` and `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` are byte-identical: md5 `021a9f96…` and `20256d6c…` at both heads. The increment has one commit, 62d686c6, and it touches only `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean`. This brief declares that folder as the pull request's own. This roadmap does not cite RigidAnalyticGeometry, and RigidAnalyticGeometry does not cite this roadmap. The gate passes on the folder's own rules, and no finding remains.

## Previous findings

- none: the previous report (r39, at 64a16e1) listed no findings, so there is nothing to carry forward.

## Verified sound

**Scope of the increment.**
- `git diff --stat 64a16e1..HEAD -- TauCetiRoadmap/BordismFormalGroups` is empty. For each file, `md5sum` matches `git show 64a16e1:<file> | md5sum`.
- `git log 64a16e1..HEAD` shows one commit, 62d686c6. It touches 2 files: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` (+1036/−427 together with the Lean file) and `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean`.
- Over the whole pull request, `git diff --name-only origin/main...HEAD` lists 22 files. Filtering out the fourteen declared folders leaves nothing (grep exit 1). `lake-manifest.json` and `lean-toolchain` are unchanged against origin/main. The Tau Ceti pin is `2fd255d9`.
- Main is now 8cf6bb42; the previous review read it at 8d9e0a0. The commits in between are the ModularForms revision deebc702 and progress reports for OneParameterSemigroups, LocalFieldsRamification, PseudodifferentialOperators, CharacteristicClasses and NumberFieldArithmetic. The progress reports touch only `PROGRESS.md` and `STATUS.md`. This README names none of those six roadmaps (`grep` finds no match).

**The RigidAnalyticGeometry increment against this roadmap.**
- `grep -i "RigidAnalytic\|rigid"` on this README finds only line 1899, "rigidification/coherent-nerve". That is a simplicial-category notion and not a citation.
- `grep -i "Bordism\|formal group"` on RigidAnalyticGeometry's README and Suggested.lean finds nothing, at this head or at 64a16e1.
- I grepped the added and removed lines of the increment for this roadmap's objects: Steenrod, Thom, MO, MU, Lazard, Adams, bordism, cobordism, Todd, chromatic, Lubin, `FormalGroup`, GeneralizedCohomology and G2.11. There are no hits. No supply edge of this roadmap changes.

**Gate.** I re-ran it at 62d686c with `--base origin/main`:

```
gate BordismFormalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=20 source-material=0 FAIL
```

- The only non-zero rule is `outside-folder=20`. The ten files it prints are in AlgebraicCurves, AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry and GeneralizedCohomology. All of these are folders this brief declares as the pull request's own.
- The worker's gate, which allows those folders, records `outside-folder=0 … build=0 OK` (`gate.md`: "Every check passed").
- This line is not a finding.

**Dependency check** (`--movable`, against content main 8cf6bb42):

```
depcheck: 239 roadmaps, 2335 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` exits 0 in 3 s. Its single warning is `56:8 declaration uses 'sorry'`.
- The imports are `Mathlib`, `TauCeti.RingTheory.FormalGroup.Hom` and `TauCeti.RingTheory.FormalGroup.Height.Basic`. Both Tau Ceti modules have object files at the pin.

**`#check @name`, on a scratch copy.**
- The elaborated type of the headline is `∀ {k} [Field k] [IsSepClosed k] (p : ℕ) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`.
- It matches README lines 270–276 binder for binder: separably closed field of characteristic p, commutative one-dimensional F and G, and the infinite-height class included. No binder was lost.
- `signatures.md` lists entries `,` and `and`. These come from the tool parsing the module docstring as code; they are not declarations.

**Pinned declarations opened this round** (Tau Ceti `2fd255d9`, `#check` and file:line):
- `TauCeti.FormalGroupIso.height_eq : (e : FormalGroupIso F G) (p : ℕ) → F.height p = G.height p`, over any field.
- `FormalGroup.height : FormalGroup K → ℕ → ℕ∞`.
- `FormalGroup.height_𝔾ₐ : 𝔾ₐ.height p = ⊤` (needs `[CharP K p]`) and `FormalGroup.height_𝔾ₘ : 𝔾ₘ.height p = 1` (needs `[Fact p.Prime] [CharP K p]`).
- From the Lazard-ring and logarithm paragraphs of the seeded sample, each at the module the README names:
  - `existsUnique_eq_smul_lazardCocycle` (`SymmetricCocycle/Classification.lean:420`, hypothesis `2 ≤ n`);
  - `lazardGcd_prime_pow` and `lazardGcd_eq_one_of_not_isPrimePow` (`SymmetricCocycle/Basic.lean:206,197`);
  - `LazardRing.generator` and `generator_mem_grading` (`LazardRing/Indecomposable.lean:190,195`) and `cotangentBasis` (`:398`);
  - `LazardRing.mvPolynomialEquiv : MvPolynomial ℕ+ ℤ ≃ₐ[ℤ] LazardRing` (`LazardRing/Polynomial.lean:112`);
  - `algebraicIndependent_generator` (`LazardRing/Independence.lean:264`);
  - `coordinateChangeLift` (`CoordinateChange/Lazard.lean:77`);
  - `coproduct_coassoc` and `conjugation_comp_rightUnit` (`CoordinateChange/HopfAlgebroid.lean:260,316`);
  - `subst_invariantDifferential_mul_pderiv` and `coeff_log` (`Logarithm/Basic.lean:236,338`). `coeff_log` states `(n:ℚ)⁻¹ • coeff (n−1) P`, the README's p_(n−1)/n;
  - `subst_toPowerSeries_eq_add_iff` and `eq_logIso` (`Logarithm/Basic.lean:404,601`);
  - `coeffOneEquiv : FormalGroupHom F G ≃ R` and `log_smul` (`Logarithm/Naturality.lean:117,149`);
  - `universalStrictCoordinate` (`PowerSeries/Coordinate/Universal.lean`).
- No theorem in the pinned `RingTheory/FormalGroup` tree proves that a one-dimensional law over a field is commutative. The only `IsComm` results are instances for the Lazard and exponent-two universal laws, base change, rescaling and coordinate change, plus `isComm_formalGroup` for square-zero cocycles. So the `[F.IsComm] [G.IsComm]` binders are needed at the pin. Ravenel's laws are commutative by definition, and the proof route via Cartier's theorem uses them.

**Padding probe, on a scratch copy.**
- `simp` fails with "made no progress".
- `rfl` fails: `Nonempty (FormalGroupIso F G)` is not definitionally equal to `F.height p = G.height p`.
- `exact ⟨fun ⟨e⟩ => e.height_eq p, fun h => by exact?⟩`: `exact?` closes the converse only by suggesting `(nonempty_formalGroupIso_iff_height_eq p F G).mpr h`, the probe theorem itself. No library lemma closes it.
- The headline is not padding.

**Headline theorems.** They are unchanged.
- Stated: Lazard's height classification.
- Named in the module docstring as not statable at the pins, each with its missing carrier:
  - Lubin–Tate: no deformations or universal deformation ring;
  - Quillen `L ≅ MU_*` and Thom `π_*MO`: no spectra;
  - Conner–Floyd and graded Eilenberg–MacLane for MO;
  - Landweber: no `MU_*MU`-comodules;
  - Devinatz–Hopkins–Smith and Hopkins–Smith: no stable homotopy category or `K(n)`;
  - Hopkins–Ravenel smashing, the fracture square and K(n)-local completion;
  - Greenlees–Sadofsky/Kuhn Tate vanishing;
  - torus Euler cancellation.

**Seeded sample.** All seven targets are in untouched text, at README lines 120, 162, 202, 251, 346, 487 and 2126. The locator checks of earlier reports stand. The README flags no locator as unverified. This round I re-checked, as fresh evidence, the four that r39 did not re-check:
- **Lazard ring, cocycle lemma and Hopf algebroid** (lines 120–160). Every Tau Ceti name above is at the module the README names. `generator` lives in `Indecomposable`, which is what the parenthetical at line 131 attaches it to.
- **Invariant differential, logarithm and exponential** (lines 162–201).
  - The pinned names are as above.
  - The README attributes existence to Ravenel, Theorem A2.1.6, and the uniqueness of the strict logarithm to the proof of Lemma A2.1.9. This is unchanged since r14, which checked it.
- **Steenrod algebras and mod-p Adams towers** (lines 346–372).
  - Hatcher Theorem 4L.12 is at hatcher-at line 21777 ("Sq^i satisfy properties (1)–(7)"), Theorem 4L.13 at line 21864 (the Adem relations) and Theorem 4L.16 at line 22197 (P^i properties and Adem relations).
  - The unnumbered theorem is at hatcher-at lines 21565–21567, under the printed page header "500" at line 21564. It says H*(K(ℤ_p,n);ℤ_p) is free commutative on the admissible monomials of excess less than n, and its proof is deferred to [SSAT] (line 21561).
  - That matches "the unnumbered theorem on page 500, which defers its proof".
- **The smoothing-and-triangulation comparison** (line 2126). It cites GeometricTopology's section "The smoothing-and-triangulation comparison", item 1 "Smooth implies PL", which is on main at `TauCetiRoadmap/GeometricTopology/README.md:930` and `:938`. GeometricTopology is a roadmap on main, so it is an admissible supplier, and the item states the smooth-to-PL structure (Whitehead).
- **Height and Lazard's classification.** I re-read Ravenel, Theorem A2.2.12 at ravenel-green line 20790. Its hypotheses are a separably closed field K of characteristic p>0, and its conclusion is that a law of height n is isomorphic to F_n. Line 20795 handles n=∞ (G=F_∞). This is what README lines 270–276 and the Lean docstring state.

**Cross-roadmap citations resolved.**
- GeneralizedCohomology G2.11 is cited at README lines 30, 1897, 1914, 1925, 1935, 1939, 1959, 1964, 2297, 2335 and 2378.
  - It is item 11 of §G2 ("Enriched, quasicategorical and monoidal foundations") at `TauCetiRoadmap/GeneralizedCohomology/README.md:669`, at this pull request's own head.
  - Main has no G2.11 (`grep -c` gives 0) because this pull request adds it, as its description says ("the generic simplicial and quasicategorical foundations of BordismFormalGroups F6.5 into GeneralizedCohomology").
- GeometricTopology's "Smooth implies PL" is on main (above).
- `roadmaps resolve` at this head reports "Cross-roadmap citations found nowhere: None" and "Lean names found nowhere: None".

**Overlap leads (`overlaps.md`), each checked.**
- #1808 and #1854 both change this README. Their copies, from `roadmaps show --pr`, differ from this head by 422 and 411 diff lines respectively. That is the same older text as in r39, so neither has changed.
- This pull request's merge-order paragraph states the order: no open pull request merges before it, and the stacked ModularCurves/SchemeAndStackFoundations move follows.
- G2.11 is listed as "only an open revision defines" for #1808 and #1854. It is in fact defined at this pull request's own head, so it is not a dependency on those revisions.
- No id this roadmap cites is dropped by an open pull request, and this pull request drops no id of this roadmap.

**Ownership and duplication.**
- `roadmaps grep --fixed --lean-only nonempty_formalGroupIso_iff_height_eq` finds the name only in this folder's copies at #1807, #1808 and #1854.
- The shape search `FormalGroupIso F G\) ↔` gives the same three hits.
- No other roadmap, on main or open, declares it. Main's copy of this folder does not have it either.

**Adversarial table.** The folder is unchanged, so no changed statement needs a row. Rows marked "this round" were recomputed at 62d686c. The others are carried from r39, which recomputed or carried them.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_formalGroupIso_iff_height_eq` (Lean 56–58; README 270–276), this round | 𝔾ₐ vs 𝔾ₘ over 𝔽̄_p; F=G; 𝔾ₘ vs a ℤ_p^×-twisted form over 𝔽_p (not sep. closed); forward direction at the pin | `height_𝔾ₐ`=⊤ and `height_𝔾ₘ`=1 (`#check` at pin), with no iso: LHS false, RHS false. F=G: both true. The twist over 𝔽_p has height 1=1 (RHS true) but no 𝔽_p-iso (LHS false), so `IsSepClosed` is needed, and it is in the signature. `FormalGroupIso.height_eq` gives → over any field | true, not padding | none |
| Serre–Cartan computation (README 359–362; Hatcher p. 500), this round | p=2, n=1 and n=2; wrong model "all admissible monomials" | n=1: only the empty monomial has excess <1, so H* = 𝔽₂[ι₁] = H*(RP^∞) ✓. n=2: excess-1 monomials Sq^(2^k)⋯Sq²Sq¹ give generators in degrees 2,3,5,9,… = 2^k+1 ✓. Without the excess bound, Sq²ι₂=ι₂² would be a free generator, contradicting the polynomial relation | true | none |
| Lazard cocycle d_n (README 136–141), this round | n=4 (prime power), n=6 (not), n=2 | n=4: (X+Y)⁴−X⁴−Y⁴ has coefficients 4,6,4, gcd 2=p ✓ (`lazardGcd_prime_pow`). n=6: 6,15,20,15,6, gcd 1 ✓ (`lazardGcd_eq_one_of_not_isPrimePow`). n=2: coefficient 2, gcd 2 ✓ | true | none |
| Invariant differential Checks (README 193–196), this round | 𝔾ₘ, F=X+Y+XY; wrong model P=1+T | F_X=1+Y. P(F)=1/((1+X)(1+Y)), and the product is 1/(1+X)=P(X) ✓. Wrong model: (1+F)(1+Y)=(1+X)(1+Y)² ≠ 1+X | true | none |
| Unoriented coefficients Checks (README 517–522) (r39) | degrees 1–5; wrong model A_* = 𝔽₂[ξ_k, ξ_k²] | π₁=π₃=0, π₂=𝔽₂x₂. π₄ has rank 2 (x₄, x₂²). Degree 5: H_*(MO) dimension 7, A_* dimension 2, P dimension 1; Σ dim A_i·dim P_(5−i) = 7 | true | none |
| Owners sentence, lines 31–33: TopologicalKTheory β=[O(−1)]−1 (r39 from r37) | wrong model β′=[O(1)]−1 | [O(1)]=1−β, so β′=−β≠β | true | none |
| F2 K-theory law, lines 329–333 (r39 from r37) | a=[L⁻¹], b=[M⁻¹]; restriction to CP¹ | x_K(L⊗M)=x+y+uxy; u⁻¹β=+1 (β′ gives −1); a₁₁=u of degree 2 | true | none |
| Steenrod/Adams target, lines 346–427 (r39 from r37) | RP^∞ class; Milnor degrees at p=2,3; d₂ bidegree; M(ℤ/2^∞) | Sq¹a=a², Sq²a=0; \|ξ₂\|=3 at p=2; \|ξ₁\|=4, \|τ₁\|=5 at p=3; d₂:(1,2)↦(3,3); derived π₁=ℤ₂ | true | none |
| James construction, lines 1002–1019 (r39 from r37) | Y=S², Y=S⁰; wrong model J₂/J₁=S²×S² | J₂/J₁=S⁴; H₂(J₂S²)=ℤ vs rank 2; J(S⁰)=ℕ vs ℤ | true | none |
| Lemma A2.2.7 general form; universal strict coordinate; obstruction in degree p^k (README 80–87, 139–146, 288–299) (r39 from r27) | f=X^p, X^(p²) over 𝔽_p; height 2 over 𝔽₂; 𝔾ₐ vs 𝔾ₘ over 𝔽₂ | h=1, h=2 with g=id; degree-2 part 2XY=0; control coefficient XY≠0 | true | none |
| Height, exponent-two, Lazard grading, log/exp, Frobenius-twist and n-series Checks (README 64–79, 122–132, 150–245, 251–269) (r39 from r14) | r14 instances | r14 values | true | none |
| Toda brackets, Kudo–Borel, Milnor, MU/MO Hurewicz, π₀MO, Serre–Cartan basis, K(n)-local Tate, smooth implies PL (r39 from r9) | r9 instances | r9 values | true | none |

**Policy.**
- The scanners report `prnum=0 round-labels=0 private-paths=0 latex=0 tex=0 set_option=0 sorry-data=0 stray-files=0`.
- `PROGRESS.md`, `STATUS.md` and `metadata.toml` in the folder are unchanged since 64a16e1 and are accepted by `stray-files`.

**Remarks on untouched text** (not findings; no change requested in this incremental round):
- As r32, r37 and r39 noted, the README keeps its layout from main: the title has no "Roadmap:" prefix, the opening section is "Carriers, conventions and owners", and there are no per-layer `### Examples` and `### Dependencies` headings.
- Lines 2141, 2150, 2200 and 2255 backtick `torusFiniteCellMappingEulerComparison` and `momentNormalMU_eulerPrecomposition_injective`. `Suggested.lean` does not declare either name, and the same sentences are on main (README lines 2595, 2604, 2654, 2709). The gate's `readme-ids-missing` does not flag them.

## Not verifiable

- Bousfield (1979) Theorem 6.6, Thom (1954) Chapitre IV, Quillen (1971), Devinatz–Hopkins–Smith (1988), James (1955), Toda (1962), Johnson–Wilson (1975), Würgler (1976), Greenlees–Sadofsky and Symonds. They are recorded as uncertified, cited by locator, and untouched in this increment.
- Whether TangentialBordism and StringOrientation, at their open heads, consume F2 and F3–F5 as the consumer sentences say. That is for their own reviews; the sentences make no supplier claim of this roadmap.

## Source issues

- none
