# Review of GromovWittenTheory (pull request #990 at eb530a1)

**Verdict:** needs changes

:robot: Independent AI review, incremental: 8 changed lines since 1224c65 (4 insertions, 4 deletions, all in README.md). Suggested.lean and metadata.toml are unchanged and nothing outside the folder changed. The gate passes on an independent rerun, the dependency check reports no problem, and `lake env lean` on Suggested.lean exits 0 with no output.

Two previous findings are repaired: the Stacks locator and "algebraic-atlas". The Tau Ceti pin finding is partly repaired. The README now reads Tau Ceti at commit 2fd255d, where every Čech and smooth-simplex name resolves, but the branch still pins a91d3aa.

Reading the whole Tau Ceti contract at 2fd255d turns up three further problems: one moved file path, two "the pin lacks" claims that are false at that commit, and §0.2 restating Tau Ceti's Novikov grading. The new parenthetical on Stacks Lemma 18.3 also overstates that lemma. All five findings are P3.

## R01 (P3) — The README reads Tau Ceti at 2fd255d, but the branch still pins a91d3aa

This is the previous R01, partly repaired.

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:67` (“### From Tau Ceti (commit 2fd255d)”). The phrase “the pin” at lines 73 (“The pin has pullback maps of fixed-family Čech complexes”), 74 (“are not at the pin”) and 129 (“that Tau Ceti has at the pin”). `lake-manifest.json:8`.

**Claim:** Naming the commit makes the Čech and smooth-simplex citations resolve. But the branch's `lake-manifest.json` is unchanged since its merge base `4b002f62` and still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. Three things read that revision: the gate's targeted build, `lake env lean`, and the pinned checkout this review is told to use.

At `a91d3aa` none of these directories exists:
- `TauCeti/Topology/Sheaves/Cech/`
- `TauCeti/Geometry/Manifold/SmoothSingular/`
- `TauCeti/AlgebraicGeometry/Curves/NodalGluing/`
- `TauCeti/RingTheory/NovikovSeries/`

So the README and Suggested.lean's docstring describe two different Tau Ceti revisions. Five of the contract's 13 names are absent at the branch pin. R02–R04 are what changes when the contract is read at the named commit.

**Witness:** `lake-manifest.json:8` has rev `a91d3aafa8cd…`. origin/main's `lake-manifest.json:10` has rev `2fd255d997f4…`, set by main's commit `a891cd19` (“bump the Tau Ceti pin to 2fd255d99”). `git diff 4b002f62 HEAD -- lake-manifest.json` is empty.

**Repair:** Rebase the branch onto origin/main (`eaf17b1`), so that the manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the revisions the heading names.
- No README line changes for this finding.
- The folder diff stays as it is, and nothing outside the folder changes.
- Rerun `lake env lean` on Suggested.lean after the rebase. It declares nothing, so only the toolchain changes.

If the branch cannot be rebased, do this instead:
- Name `a91d3aa` in the heading.
- At lines 73–74 and 129, say that the Čech and smooth-simplex declarations are in Tau Ceti after the pin.
- Cite DifferentialGeometry 8.4 for the simplex integral in the `*Needs:*` lines 163 and 198.

R02–R04 then do not apply.

## R02 (P3) — At the named commit, `SmoothAlmostComplexStructure` lives in `AlmostComplex/Basic.lean`

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:69`: “`SmoothAlmostComplexStructure` (TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean)”.

**Claim:** At `2fd255d` the file `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean` does not exist. A directory `AlmostComplex/` replaced it (`Basic`, `Prod`, `Pullback`, `Descent`, `Eigenbundle`, `CayleyPath`, `AddCircle`). The path was right at `a91d3aa`, where the structure is at `AlmostComplex.lean:67`. Naming `2fd255d` in the heading made it wrong.

**Witness:** Tau Ceti `2fd255d`, `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean`: `structure SmoothAlmostComplexStructure` at line 71, `neg` at 171, `const` at 208, `product` at 276. So the sentence about “named constant, negated and product constructors” still holds there.

**Repair:** Replace the path with `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean`. Every other path and name in lines 69–74 resolves at `2fd255d` (table below).

## R03 (P3) — At the named commit, Tau Ceti has the compact nodal domain and the Novikov ring that README line 69 and the Suggested.lean docstring list as missing

**Location:**
- `TauCetiRoadmap/GromovWittenTheory/README.md:69`: “what the pin lacks is the compact nodal domain with its stable-domain and stable-map moduli”.
- `TauCetiRoadmap/GromovWittenTheory/Suggested.lean:31–32`: “The pinned Tau Ceti has no compact nodal domain, no moduli space of stable maps and no implicit atlas”.
- `Suggested.lean:38–41`: Theorem 3 needs `Nov(ℚ, H, N)`, and “the pinned Mathlib has `LaurentSeries` and `HahnSeries` …, not this completion”.

**Claim:** At `2fd255d` Tau Ceti has the compact nodal domain and the Novikov ring.
- **Nodal domain:** `FlagPairData`, `Marking` and the glued quotient `GluedCurve`. `GluedCurve` is Hausdorff for finitely many flag pairs and Hausdorff components, and compact for finitely many compact components. Analytic nodal isomorphisms are there too (`NodalGluing.Iso`, `Iso.ofHolomorphicLift`). ComplexCurveModuli (main, line 71) calls these “the nodal domain of ComplexCurveModuli D1 at the pin”. AnalyticStableMaps §1.1 (at its open head, lines 221 and 234) builds prestable maps on `GluedCurve.lift`.
- **Novikov ring:** `TauCeti.NovikovSeries R H N` is N1's `Nov(R, H, N)` with the same support condition.

Both claims are true at `a91d3aa` and false at the commit the README names, which is also main's pin and so the pin of the merged result. The docstring's conclusion still holds: no headline is statable at `2fd255d`, which has no stable-map moduli, no `M̄_(g,n)`, no implicit atlas and no Chern classes of bundles.

**Witness:** At Tau Ceti `2fd255d`, `TauCeti/AlgebraicGeometry/Curves/NodalGluing/Basic.lean`:
- line 149: `structure FlagPairData`;
- line 477: `abbrev GluedCurve`;
- line 692: `instance t2Space_gluedCurve`;
- line 45: compactness by instance inference from `[Finite ι]` and compact components.

`NodalGluing/HolomorphicLift.lean` has `Iso.ofHolomorphicLift`. `TauCeti/RingTheory/NovikovSeries/Basic.lean:92` has `structure NovikovSeries`, whose support condition is that `{h | a h ≠ 0 ∧ N h < C}` is finite.

**Repair** (after R01's rebase):
- README line 69: “what the pin lacks is the stable-domain and stable-map moduli; the compact nodal domain is Tau Ceti's `GluedCurve` of `FlagPairData` (TauCeti/AlgebraicGeometry/Curves/NodalGluing/Basic.lean), consumed through ComplexCurveModuli D1 and AnalyticStableMaps §1.1”.
- Suggested.lean:31–32: “The pinned Tau Ceti has the nodal gluing quotient `GluedCurve` but no moduli space of stable maps and no implicit atlas”.
- Suggested.lean:38–41: “Theorem 3 also needs the Novikov ring, which the pinned Tau Ceti has as `TauCeti.NovikovSeries`; what it lacks is the Gromov–Witten classes of the first item”.

These are docstring changes only; no declaration changes.

## R04 (P3) — §0.2 restates Tau Ceti's Novikov grading and the criterion for the embedding to be onto

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:167` (§0.2): “For an integer `D` let `Λ_ω^D` be the elements supported in `{A : 2c₁(A) = D}` … Prove that `Λ_ω^D · Λ_ω^E ⊆ Λ_ω^(D+E)`”. Line 169: “the embedding is onto exactly when `ω = 0` on `H₂(X; ℤ)`”. The contract “From Tau Ceti (commit 2fd255d)” names no Novikov declaration.

**Claim:** At the named commit these are all Tau Ceti declarations:
- `Λ_ω` is `TauCeti.NovikovSeries ℚ H₂(X; ℤ) ω`.
- `Λ_ω^D` is `NovikovSeries.gradeBy ℚ ω (2c₁) D`.
- `Λ_ω^D · Λ_ω^E ⊆ Λ_ω^(D+E)` is the instance `gradeBy.gradedMonoid`, for the additive `2c₁ : H₂ →+ ℤ`.
- The independence of the pieces is `iSupIndep_gradeBy`.
- “Onto iff `ω = 0`” is `ofFinsupp_surjective_iff`.

What exists at the pin is cited, not restated.

**Witness:** Tau Ceti `2fd255d`:
- `TauCeti/RingTheory/NovikovSeries/Grading.lean`: line 92 `gradeBy`, line 115 `iSupIndep_gradeBy`, line 153 `eq_single_of_mem_gradeBy`, line 165 `gradeBy.gradedMonoid` (taking `f : H →+ ι`).
- `TauCeti/RingTheory/NovikovSeries/Basic.lean:697`: `ofFinsupp_surjective_iff : Surjective ofFinsupp ↔ N = 0`, for nontrivial `R`.

**Repair:**
- Add a Tau Ceti contract bullet naming `TauCeti.NovikovSeries` and `ofFinsupp_surjective_iff` (TauCeti/RingTheory/NovikovSeries/Basic.lean), and `gradeBy`, `iSupIndep_gradeBy` and `gradeBy.gradedMonoid` (Grading.lean).
- In §0.2, define `Λ_ω^D` as `gradeBy ℚ ω (2c₁) D`, and cite the graded-monoid inclusion and API bullet 1 instead of proving them.
- Keep as targets what Tau Ceti lacks:
  - `V ⊗̂ Λ_ω`, and its isomorphism with `V ⊗ Λ_ω` for finite-dimensional `V`;
  - the Cauchy product;
  - the perfect pairing;
  - the convergent homogeneous decomposition;
  - the internal-direct-sum criterion `c₁ = 0`.

The Checks stay as they are and agree with the library: for `S²`, `gradeBy` is `⊥` when `4 ∤ D` and consists of monomials when `4 | D`; for K3, `gradeBy 0 = ⊤`.

## R05 (P3) — The new parenthetical on Stacks Lemma 18.3 says the kernel vanishes for every reduced `X`

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:778`: “(Lemma 18.3, Tag 0CE3, proves the inequality `h¹(X) ≥ h¹(Y)` through a four-term sequence whose kernel term vanishes for reduced `X`)”.

**Claim:** Lemma 18.3 assumes only that `f : Y → X` is finite and is a closed immersion over a dense open. Under that hypothesis, `X` being reduced does not force the kernel `𝒢 = ker(𝒪_X → f_*𝒪_Y)` to vanish. It vanishes when `X` is reduced and `f` is an isomorphism over a dense open, which is the setting of Lemma 18.4.

**Witness:** stacks-curves lines 1677–1682 give 18.3's hypothesis and the four-term sequence. Counterexample: take `X = L₁ ∪ L₂`, two `ℙ¹` meeting at one point (reduced, proper, of dimension 1), `Y = L₁`, `f` the inclusion and `U = X`. Then `𝒢` is the ideal sheaf of `L₁`, which is nonzero along `L₂`.

**Repair:** Write “whose kernel term vanishes when `X` is reduced and `f` is an isomorphism over a dense open”, or delete the parenthetical. §3.2 (line 328) needs no change.

## Previous findings

- R01 — partly repaired: line 67 now reads “### From Tau Ceti (commit 2fd255d)”, where the cited Čech and smooth-simplex names exist; `lake-manifest.json:8` still pins `a91d3aa` (R01 above), and reading at `2fd255d` exposes R02–R04.
- R02 — repaired: line 328 reads “those of the proof of Stacks Project, Lemma 18.4, Tag 0CE4, which holds for reduced `X`”; line 778 cites Lemma 18.4 likewise (its new aside on Lemma 18.3 is R05).
- R03 — repaired: line 225 reads “Pardon, Definition 9.3.1, p. 100, for the implicit atlas of Theorem 9.2.10”.

## Verified sound

**Gate and build.** Independent rerun of the full gate at `eb530a1b6720a6a2e5b8776a1ea02fb0a4179571`: every check 0, `OK`, exit 0. The dependency check with `--movable` against the board's merge order and main content gave:

```text
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. GromovWittenTheory is at merge-order line 301, after ImplicitAtlases (216) and AnalyticStableMaps (217).

`git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds README.md, Suggested.lean and metadata.toml. `lake env lean` on Suggested.lean exits 0 with no output (28 s).

Suggested.lean is byte-identical to the previous head. It is `import Mathlib`, one module docstring and the namespace, with no declaration. So the `#check` signature comparison and the one-tactic padding probe have no subjects. It has no sorry'd data and no `set_option`.

**Headline theorems** (Suggested.lean docstring items 1–4, README summary):
1. The Kontsevich–Manin properties of `I_(g,n,A)`.
2. `I_(1,1,0)(1) = χ(X)·1`.
3. The unital CohFT and the associativity of the quantum product.
4. The string, dilaton and divisor equations and genus-zero TRR.

None is statable at `a91d3aa` or at `2fd255d`. Neither revision has a stable-map moduli space, `M̄_(g,n)`, an implicit atlas or Chern classes of vector bundles. At `2fd255d` the only “chern” declarations are `PeriodGroup.chern`, a homomorphism on a Floer period group, and cyclic-cohomology Chern chains. Mathlib `1b1ccf4b` has no Novikov ring.

**Sources at the changed locators** (cache texts fetched through the sources service into a scratch manifest; no manifest of the package was edited):
- stacks-curves lines 1691–1704: Lemma 18.4, Tag 0CE4, printed p. 39. For reduced `X`, `𝒪_X → f_*𝒪_X′` is injective, giving the three-term sequence and its long exact cohomology sequence. Line 328's attribution is exact.
- stacks-curves lines 1940–1941: Lemma 19.7, Tag 0C4D, item (6): a node is reduced, with δ-invariant 1 and two geometric branches.
- pardon2016 lines 4344–4366 (arXiv v6, p. 100): Theorem 9.2.10 (`A_GW` is an implicit atlas), Definition 9.3.1 (for `2g + n > 2`, the pushforward of the virtual class to `H_•(M̄_(g,n) × X^n; ℚ)`, with the orientation sheaf trivialized by Proposition 9.2.6), and Lemma 9.3.2. Line 225 is exact.

**Tau Ceti contract (lines 67–74) resolved at the named commit `2fd255d` (main's pin) and at the branch pin `a91d3aa`.**

| Name (file) | At `2fd255d` | At `a91d3aa` |
|---|---|---|
| `SmoothTwoForm.IsSymplectic`, `SmoothTwoForm.Tames` (Symplectic/Manifold/TwoForm.lean) | lines 115, 174, namespace `TauCeti.SmoothTwoForm` (line 70) | present |
| `SmoothAlmostComplexStructure` (Symplectic/Manifold/AlmostComplex.lean) | moved to `AlmostComplex/Basic.lean:71` (R02) | `AlmostComplex.lean:67` |
| `stdComplexLineEnergyDensity`, `stdComplexLineEnergy`, `Tames.stdComplexLineEnergyDensity_pos` (Energy.lean) | lines 118, 402, 170 | present |
| `IsPseudoholomorphic` (JHolomorphic.lean) | line 101 | present |
| `singularCohomologyFunctor` (AlgebraicTopology/Cohomology/Basic.lean), cup product (Cup.lean) | line 164; Cup.lean present | present |
| `TauCeti.Topology.cechCohomology` (Topology/Sheaves/Cech/Colimit.lean) | line 70 (`abbrev`) | absent (R01) |
| `TopCat.Hom.cechComplexPullback` (Cech/Pullback.lean); “no pullback on the colimit and no cup product” | line 53 in `namespace TopCat.Hom` (line 43); no pullback or cup in `Colimit`, `Cofinal`, `LocallyZero`, `Basic` | absent (R01) |
| `TauCeti.SmoothSimplex`, `TauCeti.smoothSingularSubcomplex` (Manifold/SmoothSingular/Basic.lean) | lines 121, 77 | absent (R01) |
| `TauCeti.SmoothSimplex.integral` (SmoothSingular/Integral.lean); linear and natural | line 86; `integral_add` 159; `integral_smoothSingularSubcomplexMap_app` 177 | absent (R01) |
| “smoothing theorem, Stokes for chains and the de Rham theorem are not at the pin” | no `deRhamHom`, `deRhamEquiv`, `chainIntegral`, `smoothToSingular` | holds |
| Mathlib `AddMonoidAlgebra` (Mathlib/Algebra/MonoidAlgebra/Defs.lean) | line 64 at Mathlib `1b1ccf4b` | line 64 at Mathlib `6b7abb3c` |

**Overlaps and ownership.** `scratch/overlaps.md` lists no other pull request changing this roadmap and no id that only an open revision defines.

Its one lead, DifferentialGeometry Layer 8 dropped by #886, is unchanged since the previous review. The #886 head (`a565de62`) gives de Rham ownership to DeRhamCohomologyAndDuality. That roadmap's head (#1768 at `1b57dbe0`, README lines 78 and 176) says DifferentialGeometry 8.3–8.5 states and owns those results, and it sits at merge-order line 389, after this roadmap. This roadmap cites DifferentialGeometry as it is on main, as the brief requires for revision pull requests, and at #886's head no other owner exists that it could cite. As in the previous review, this is #886's ownership gap and is recorded here, not raised against this roadmap.

Tau Ceti `2fd255d`'s algebraic curves library was compared with §3.2:
- `Node/BranchSequence.lean` is the normalization sequence of a split node over a commutative ring.
- `StableMaps/` is the category of algebraic prestable maps over a base scheme.
- `DualGraph/` covers dual graphs and their stabilization.

These are scheme-theoretic objects. §3.2 builds the analytic sequence on nodal Riemann surfaces from a scalar operator family and says it assumes no GAGA, so §3.2 does not duplicate them. The Novikov objects are R04.

**Adversarial computations on the changed statements.** Coefficients are ℚ.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §3.2 normalization sequence, Stacks Lemma 18.4 (line 328) | nodal cubic; two `ℙ¹` meeting once; two `ℙ¹` meeting twice; elliptic curve with a rational tail; double line `k[x,ε]/(ε²)` | Long exact sequence `1 − |V| + |E| − h¹ + Σg_v = 0` gives `h¹ = 1, 0, 1, 1`; the formula `Σg_v + |E| − |V| + 1` gives `1, 0, 1, 1`. For the double line the kernel of `𝒪 → ν_*𝒪` is `(ε) ≠ 0`. | Correct. “Reduced” is needed, and nodes are reduced (19.7 (6)). |
| Line 778 aside on Lemma 18.3 | `X = L₁ ∪ L₂`, `Y = L₁`; nodal cubic with its normalization | First case: kernel is the ideal sheaf of `L₁`, `≠ 0`, with `X` reduced. Second case (birational): kernel `0`. | False as stated: R05. |
| §1.2 Pardon Theorem 9.2.10 / Definition 9.3.1 (line 225) | `(g, n) = (0,3), (1,1), (1,0), (0,2)` | Pardon's `2g + n > 2`: true, true, false, false. README `2g − 2 + n`: `1, 1, 0, 0`, so true, true, false, false. | Same stable range; locator exact. |
| Tau Ceti heading “commit 2fd255d”: 13 names, 10 paths | both revisions | `2fd255d`: 13/13 names, 9/10 paths. `a91d3aa`: 8/13 names, 6/10 paths. | R01, R02. |
| README line 69 and Suggested.lean:31–32, “no compact nodal domain” | `ι = Fin 2`, both components `OnePoint ℂ`, one flag pair | `2fd255d`: `GluedCurve` exists, is T2 (`t2Space_gluedCurve`) and is compact (quotient of a finite sigma of compact spaces). `a91d3aa`: no `NodalGluing`. | R03. |
| Suggested.lean:38–41, Novikov ring missing | `H = ℤ`, `N = id` | `NovikovSeries ℚ ℤ N` exists at `2fd255d` and not at `a91d3aa`. Mathlib has none at either pin. | R03. |
| §0.2 grading against `gradeBy` | `S²` with `f = 4·`; `ℂP²` with `f = 6·`; K3 with `f = 0` | `S²`: `D = 6` gives `⊥` (`gradeBy_eq_bot`), `D = 8` gives `{a q²}` (`eq_single_of_mem_gradeBy`). `ℂP²`: `deg q^(2ℓ) = 12 = 6 + 6` (graded monoid). K3: `gradeBy 0 = ⊤`. `ofFinsupp` is onto iff `ω = 0`; on `S²`, `Σ q^k` is not finitely supported. | README agrees with Tau Ceti; cite it (R04). |

**Carried forward from the previous report** (r5 at `1224c65`, for statements the diff leaves untouched, with the values computed there):
- **§2.2:**
  - new Check: `d = 2`, `t = 2`, `r = 0`, `c · 1/2 = 1/2` gives `c = 1`; unweighted reading `c = 1/2`;
  - one Čech group: `Ȟ²(S²) = ℚ`;
  - orientation coefficients: `Φ = (1/2)∫`; `(0,3)` gives `1`;
  - diagonal cup: `Δ^*(a ⊠ a) = 0` on `S¹`; generator of `H⁴` on `S² × S²`.
- **ImplicitAtlases §6.5 Künneth:** `S¹ × S¹` gives `ℚ²`; Warsaw circle gives `Ȟ¹ = ℚ`; `∅` gives `0`.
- **§8.2:** `N = 6`, `ψ = (1/6)c₁(L^6)`; `∫^wt ψ₁ = 1/24`.
- **§0.1 / §0.3:** degree-`d` line on `ℂP²` gives area `d`.
- **TopologicalSheafCohomology §1.3 dropped:** `∫^wt 1 ⌣ [pt]^∨ = 1/2`; `π_*1 = 0`, `π_*[pt] = 1`.
- **DifferentialGeometry contract:** not native at either revision.

The r5 report also carries the rows of r3 and r4:
- **Conventions:** `2=2`, `0=0`, `4=4`.
- **0.1:** areas `1, −1, 0`.
- **0.2:** `a + b√2 < 3` is finite; witnesses for the internal-grading criterion.
- **0.3:** `4` classes.
- **1.1:** `2g−2+n = 1, 1, 0, 0`.
- **1.2:** dimensions `0`, `10`.
- **2.1:** `1/2` vs `1`.
- **2.2:** `s = d = 10` gives `1`; `r = −4` gives `0`.
- **2.3:** `z, z²` classes `1, 2`.
- **3.1:** character `−1`.
- **3.2:** ranks `1, 0, 2`; `h¹` formula on four curves.
- **3.3:** `r = 0`.
- **3.4:** `−1/24`; `λ² = 0`.
- **4.1:** torsion `0`.
- **4.2:** `+1`.
- **4.3:** `s − 2m`.
- **5.1:** `π_*ev^*H = 1`.
- **5.2:** `8 ≠ 10` gives `0`.
- **5.3:** `A = 0` gives `0`.
- **5.4:** `1, 0, 1`.
- **6.1:** `−1`.
- **6.2:** `1 = 1·1 + 0`.
- **6.3:** `2 = 2`.
- **6.4:** `ξ_*1 = 2τ_D`.
- **6.5:** `12 = 12` gives `1`.
- **6.6:** collision stratum `3 > 2`.
- **7.1:** unit only at `A = 0`.
- **7.2:** `H⋆H² = q`, `H²⋆H² = qH`.
- **8.1:** anchors `1` vs `3`.
- **8.2:** Kock (5.1.7.3) `1 = 2·0 − 2 + 3`.
- **8.3:** `1, 1, 1/24`.
- **8.4:** KM Lemma 1.5.3 in genus one, `1/24 = 1·1/24`.
- **8.5:** correction `[D₁]` gives `1`.
- **8.6:** `⟨τ₁(pt) pt 1⟩ = 1`.

None of these statements changed in the diff.

## Not verifiable

- The construction targets have no primary source stating them, and the README says so at each: §1.2 (chart-level lift), §2.1 (weighted adjoint), §3.2 (scalar Hodge family), §6.5 (capped trace), and the analytic-carrier versions of §§8.2, 8.4–8.6. Their algebraic analogues were verified at their locators in earlier rounds, and the Stacks and Pardon passages again here. The sampled instances are consistency tests, not proofs.
- Ownership was not checked against open pull requests whose files the brief does not supply. The diff introduces no new object.
- The folder has no `sources.toml`, and this review edits no manifest. No cited text was paywalled or unreadable, so `needs-references.toml` was not needed.

## Source issues

- none
