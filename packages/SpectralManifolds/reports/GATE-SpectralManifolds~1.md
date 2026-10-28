# GATE-SpectralManifolds~1: answers to human review

Head after repairs: `5c086d2` (one commit on top of `c87f958`). Files changed: `TauCetiRoadmap/SpectralManifolds/README.md` and `TauCetiRoadmap/SpectralManifolds/Suggested.lean`.

Numbering:
- H01–H05 are the points of the first roed-math review, which reviewed `97ea1f5`.
- H06–H09 are the four statements in kim-em's author response.
- H10–H12 are the points of the second roed-math review, which reviewed `c87f958`: H10 is the parity model in the README, H11 is its `Suggested.lean` part, and H12 is the supplier links.

## H01 (roed-math) — applied

At `c87f958`, README SM2 item 3 (line 69) already sets `f=eᵀ` when entering the commutative column model. I rechecked it: `(ve)ᵀ=eᵀvᵀ`, and a Hermitian `e` gives `eᵀ=ē`. For the Bott projection `½[[1+z,x−iy],[x+iy,1−z]]` this means `eᵀ=ē≠e`, so `f=eᵀ` is the correct object. In addition, `ProjectivePresentation` in `Suggested.lean` is now stated in the column model `f𝒜^N`, and its docstring says that `f=eᵀ` over the SM2 row module.

## H02 (roed-math) — applied

SM3 (line 85) states `R_B∘R_C=R_(CB)` and `End_𝒜(𝒜^N e)≃(eM_N(𝒜)e)ᵒᵖ`, and transports this to `fM_N(𝒜)f` by `B↦Bᵀ`. I checked the two identities the transport needs: `(CB)ᵀ=BᵀCᵀ` keeps the order of composition, and `(B*)ᵀ=(Bᵀ)*` keeps adjoints.

## H03 (roed-math) — applied

SM2 item 2 (line 68) defines the strongly regular package as ordinary N5 regularity plus endomorphism regularity. The implication from endomorphism regularity to ordinary regularity is stated only in the commutative order-one branch, where multiplication by `a` and `[D,a]` are 𝒜-linear.

## H04 (roed-math) — applied

The SM10 volume table agrees with all four of the reviewer's entries. Line 228 now also gives the general form `κ=(−1)^floor(pq/2)` for inputs of any spectral parity (see H10).

I checked that the general form reduces to the table in all four parity cases:
- **even/even:** `w=γ₁⊗γ₂`, and floor(pq/2) is even.
- **even/odd:** `w=Id`, and floor(pq/2) ≡ p/2 mod 2.
- **odd/even:** symmetric to even/odd.
- **odd/odd:** `w=iσ₃`, and `i^(1−pq)=(−1)^((pq−1)/2)`.

Spot values: 2+1 gives −Id and 1+3 gives −γ.

## H05 (roed-math) — applied

`Suggested.lean`'s own `HermitianProjection` structure is deleted. `ProjectivePresentation` now has three fields:
- `projection : Matrix (Fin N) (Fin N) A`;
- `isStarProjection : IsStarProjection projection`;
- `realization : E ≃ₗ[A] LinearMap.range projection.mulVecLin`.

The SM2 sentence on line 69 now names `ProjectivePresentation` where it used to say "the prototype".

## H06 (kim-em) — answered

Item 1 of the response (`f=eᵀ` and the opposite corner) is in the README at `c87f958`; see H01 and H02.

## H07 (kim-em) — answered

Item 2 of the response (strong regularity is N5 regularity plus endomorphism regularity) is in the README; see H03.

## H08 (kim-em) — answered

Item 3 of the response (the SM10 phase table) is in the README and is now generalised; see H04 and H10.

## H09 (kim-em) — answered

Item 4 said the prototype was left byte-identical. That was not enough. The prototype:
- kept `HermitianProjection` (H05);
- kept free KO signs (H11);
- imported another roadmap's module and three `Mathlib.*` submodules, which the gate refuses.

`Suggested.lean` now has the single import `import Mathlib` and the namespace `TauCetiRoadmap.SpectralManifolds`. Instead of the NoncommutativeGeometry prototype's `SpectralTriple`, it takes `D` and `C : ∀ a, BoundedCommutator D (π a)` explicitly.

## H10 (roed-math) — applied

Spectral parity (whether γ is present), KO-dimension n and metric dimension p are now separate data, and the orientation operator χ=π_D(c) is a fourth object.

- **SM1 (line 45).** The old sentence "the parity used for a p-dimensional strongly oriented package is p mod2" is replaced. A real structure of KO-dimension n now lives on an even triple exactly when n is even (Cacic2012, Definition 2.5, line 392). Strongly oriented packages have spectral parity p mod 2, so their real refinements have n≡p mod 2. Weakly oriented packages keep p independent of both. The display line now ends "the last only for even n, where the triple carries γ".
- **SM2 (lines 75, 77).** `π_D(c)=γ` is required for even p and `π_D(c)=1` for odd p. The weak package carries its own grading γ with `γχ=(−1)^pχγ`.
- **SM7 (line 174).** New target: a weakly oriented real package of any KO-dimension n gives a real Clifford module of KO-dimension n with D J-compatible (Cacic2012, Proposition 2.16, line 517).
- **SM10 (lines 207–228).** Branches are by spectral parity, which for real triples equals KO parity (Cacic2012, Theorem 2.18, line 552). There is a general shuffle value w, with `w*=(−1)^(pq)w`, divided by i exactly when p and q are both odd.
- **SM11 (line 240).** Hodge–de Rham now has exterior-parity γ, `χ=Γ` and KO-dimension 0 for every p (Cacic2012, Example 2.9, line 446). Products with finite triples realise every KO-dimension (Cacic2012, Proposition 2.24, line 631).

## H11 (roed-math) — applied

Old: `RealStructure (D) (ε ε' : ℤ)` with free signs, plus `HasRealGrading … (ε'' : ℤ)` accepting any integer. New:
- `RealStructure (D) (n : Fin 8)` reads its signs from `epsilon n` and `epsilonPrime n`.
- `EvenRealStructure (D) (k : Fin 4)` extends `RealStructure D (evenKO k)` with a `Grading D` and the sign `epsilonDoublePrime k`.
- `HasRealGrading` is deleted.

A grading and ε″ therefore occur only in even KO-dimension. README SM1 (line 59) now names these declarations under the sign table. The three sign rows agree with the conventional columns of Cacic2012 table (2.2), lines 375–378.

## H12 (roed-math) — applied differently

Every supplier row (lines 24–35) now names the roadmap in full together with the exact sections consumed, by number and title. I checked each section heading at the open heads this job has:
- VonNeumannAlgebras V0, V2 (including V2.AbelianRepresentationMultiplicity), V4 and V6, against the new-roadmap pull request that carries V6;
- HilbertModules H1–H3 and H5;
- SmoothBundlesConnections B2–B3;
- PseudodifferentialOperators P1.0 and P5–P7;
- FourManifolds F4;
- OperatorKTheory K3–K6;
- IndexTheory I2–I7;
- CompactQuantumMetricSpaces Q3.

TopologicalKTheory T1 ("Continuous finite-rank bundles as a category") is on main.

Commit-pinned blob links were not added. The repository's rule is to cite by roadmap name and section, never by pull-request number or commit. The gate also refuses `blob/<sha>` links and PR numbers: at `c87f958` it failed on the existing CQM blob link (`blob=1`) and on five PR references (`prnum=5`). Those were replaced by name citations. The relative links resolve once the suppliers merge, which the merge order requires before this roadmap.

## Build

`lake build TauCetiRoadmap.SpectralManifolds.Suggested`: `Build completed successfully (8976 jobs).` It gives 5 `declaration uses 'sorry'` warnings, at lines 95, 101, 140, 146 and 151: `BoundedCommutator.value_unique`, `Grading.domain_iff`, `commutator_leibniz`, `oppositeApply_smul` and `oppositeApply_mul`.

## Gate

`gate SpectralManifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only failure left is `depcheck: NOT IN ORDER: SpectralManifolds (insert it after its last supplier)`, which is the design-stage placement. At `c87f958` the gate also failed on blob=1, tex=2, prnum=5, imports=1, mathlib-subimports=3 and no-import-mathlib=1; all of these are now fixed. The two tex hits were `e^{isa}` and `e^{itD}`, which are now `e^(isa)` and `e^(itD)` in code spans.

Depcheck (`--movable`):

```
NOT IN ORDER: SpectralManifolds (insert it after its last supplier)
depcheck: 148 roadmaps, 1009 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The merge-order file was not edited.

## Signature check

I appended `#check @…` lines for all 23 declarations to the module, elaborated it once with the build command above, and then removed them. The binder findings:
- `value_unique` carries `Dense D.domain`.
- `commutator_leibniz` carries `IsSelfAdjoint D`, which supplies the dense domain.
- `BoundedCommutator` and `RealStructure` drop the unused `CompleteSpace H`, which is harmless.
- `SecondCountableTopology H` went away with the removed NoncommutativeGeometry core; no statement here needs it.
- No other binder was lost.

The two undocumented one-tactic lemmas `epsilon_square` and `epsilonPrime_square` were removed as padding.

## Adversarial pass (statements added or changed)

| statement | instances | computed values | result | change |
| --- | --- | --- | --- | --- |
| weak package `γχ=(−1)^pχγ` | χ=Σa₀[D,a₁]…[D,a_p]; Hodge–de Rham p=1 | γ commutes with a₀ and anticommutes with each [D,a_i], giving (−1)^p. For p=1, Γ=−ic(dt) and c(dt) is odd in exterior degree, so γΓ=−Γγ | holds | SM2 and SM11 |
| Hodge–de Rham KO 0 | conjugation K on real forms | K²=1, KD=DK (d+d* is real), Kγ=γK; column 0 is (+,+,+) | holds | SM1, SM11 |
| SM7 real Clifford target | real f with JfJ⁻¹=f* (Cacic2012 Definition 2.14(1), line 506) | J[D,f]J⁻¹=ε′Df−fε′D=ε′[D,f]; [D₀,f]=[D,f] because Mf=fM | holds | SM7 |
| κ=(−1)^floor(pq/2) | the four parity cases; (p,q)=(2,1),(1,3),(1,1),(2,2) | Γ=i^(−pq)w and V=w or w/i, so κ=(−1)^(pq/2) or (−1)^((pq−1)/2). Values: −1, −1, +1, +1 | holds; agrees with the reviewer's table | SM10 |
| `w*=(−1)^(pq)w` | p=q=1, first factor even | (χ₁γ₁)*=γ₁χ₁=−χ₁γ₁, so w is skew and division by i is needed | holds | SM10 |
| `epsilon`/`epsilonPrime`/`epsilonDoublePrime` | n=0..7 and k=0..3, against Cacic2012 lines 375–378 (n+ columns) | ε: + + − − − − + +; ε′: + − + + + − + +; ε″: + − + − | holds | Lean, SM1 line 59 |
| alternative sign `(εε″,−ε′,ε″)` | even n, where ε′=+1 | Cacic2012 line 372 gives (εε″,−1,ε″) | holds | none |
| DJ=ε′JD vs JD=ε′DJ | ε′=±1 | the two forms are equivalent, since ε′²=1 | holds | none |
| γ↦−γ keeps ε″ | Jγ=ε″γJ | J(−γ)=ε″(−γ)J | holds | SM1 |
| `evenKO` | k=0..3 | 0, 2, 4, 6, all <8 | holds | Lean |
| `Grading.domain_iff` | Gξ∈Dom ⇒ ξ=G(Gξ)∈Dom, using G²=1 and invariance | both directions | holds | none |
| `commutator_leibniz` | ξ∈Dom D | D(πaπbξ)−πaπbDξ=[D,πa]πbξ+πa[D,πb]ξ with πbξ∈Dom; dense domain from self-adjointness | holds | none |
| `oppositeApply_smul` | z=i | J⁻¹(iξ)=−iJ⁻¹ξ, then J(−i·)=iJ(·) | holds | none |
| `oppositeApply_mul` | general a, b | Jπ(b*)π(a*)J⁻¹=(Jπ(b*)J⁻¹)(Jπ(a*)J⁻¹) | holds | none |
| `ProjectivePresentation` | f=1, f=0, Bott f | range is A^N, 0, and a line bundle respectively; for the Bott projection eᵀ=ē≠e | holds | Lean |

## Ownership, suppliers, sources

- **Ownership.** A search of main and the open heads for "KO-dimension", "real spectral triple" and "real Clifford module" found no other owner of real commutative triples. The new SM7 target therefore stays here. No notion was moved down.
- **Sources.** Cacic2012 (arXiv:1209.4832v2) was fetched through the sources service. Its locators were read at lines 372–378, 392, 446, 506, 517, 552 and 631.
- **Manifest and missing texts.** The roadmap has no `sources.toml`, and this job may edit only the README and `Suggested.lean`, so the fetch is not recorded in a manifest. No text is missing.

## Outside the reviews

These are defects that remain and were not repaired, to keep the scope to the reviews:
- The README does not follow the house shape (layers, Checks, `Dependencies` sections).
- Of `Suggested.lean`'s declarations, only `ProjectivePresentation` and the five real-structure names are cited in the README.
- `Suggested.lean` is an interface file rather than a file of headline theorems. Its docstring names SM6–SM10 as not statable at the pins, with the missing carriers.
