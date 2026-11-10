# Review of EtaleCohomologyFoundations (pull request #1891 at ae30823)

**Verdict:** needs changes

This is an incremental re-review of the 122 lines changed since `6217eb9`. Five of the six previous findings are repaired in the folder. The sixth, a description-only finding, is not repaired and is carried as R01. The repair of the arithmetic exact sequence added one proof-sketch clause that is false for imperfect fields (R02, P3). The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with only `sorry` warnings.

## R01 (P2) — The pull request description still says no consumer is affected, while three roadmaps own the point count

Carried from the previous report's R02; not repaired.

**Location.**
- Pull request description, merge-order paragraph: "roadmaps citing EtaleCohomologyFoundations labels are unaffected, since no label changes".
- `README.md` line 13: "the count of points over the degree-`r` extension of a finite field from which a zeta series is formed is Scheme.Hom.pointCount of §F.10.1". The definition is at lines 1375–1378.

**Claim.** This revision introduces Scheme.Hom.pointCount and makes this roadmap its owner. Two open roadmaps each define the same count. The description tells reviewers the consumers are unaffected. The repair report answered the finding as outside the files it may edit, without the marker `not actionable in this package`. The finding is about the description, which the worker edits, so it remains open.

**Witness.** Re-read at the heads today:
- WeilConjectures (#1208, `029d8c2`): `Suggested.lean` line 54 defines `extensionPointCount`. `README.md` line 114 cites `VanishingCycles.numberOfRationalPoints`, which this head retires (mapping table, `README.md` line 39).
- DeligneWeightsAndPurity (#929, `5930b27`): `Suggested.lean` line 64 defines `finiteFieldPointCount`, and its zeta series uses it.

**Repair.** No README change. In the description, replace the quoted sentence with: "No label changes. Two consumers change with it:
- WeilConjectures replaces `extensionPointCount p X r` with Scheme.Hom.pointCount of §F.10.1. It also replaces its citation of `VanishingCycles.numberOfRationalPoints` with Tau Ceti's `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints`.
- DeligneWeightsAndPurity replaces `finiteFieldPointCount f E` with Tau Ceti's `Scheme.Hom.numberOfRationalPoints` and forms its zeta series from Scheme.Hom.pointCount."

Tested: for `X = Spec 𝔽_{q²}` over `𝔽_q`, all three definitions give `0` at `r = 1` and `2` at `r = 2`. The replacement changes no value.

## R02 (P3) — The new descent clause equates `X_k̄` with a limit over finite separable extensions

**Location.** `README.md` lines 621–624: "Descend finite étale covers of `X_{k̄}` … to `X_{k'}` for finite separable `k'/k`, which is where quasi-separatedness enters (descent along the limit `X_{k̄} = lim X_{k'}` of qcqs schemes, Stacks, Lemma 58.14.1, tag 0BTV)". The *Needs:* line is at 631–633.

**Claim.** The limit over finite separable `k'/k` is `X_{k^sep}`. It equals `X_{k̄}` only when `k` is perfect. Both cited sources reduce to perfect `k` before taking this limit, and the sketch omits that step:
- Stacks 0BTX reduces through 0BTW (`stacks-0BMY` lines 1777–1778, 1795–1797).
- SGA 1 IX 6.1 reduces through IX 4.11 (`sga1` lines 7749–7762).

**Witness.** Take `k = 𝔽_p(t)` and `X = Spec k`. Then `lim_{k' sep} X_{k'} = Spec k^sep`. Since `t^{1/p} ∉ k^sep`, `k^sep ≠ k̄`, so `X_{k̄} ≠ lim X_{k'}`.

**Repair.**
- Replace the parenthesis with: "(descent along the limit `X_{k^sep} = lim X_{k'}` of qcqs schemes, Stacks, Lemma 58.14.1, tag 0BTV), then from `X_{k^sep}` to `X_{k̄}` along the universal homeomorphism `X_{k̄} → X_{k^sep}`, which induces an equivalence of finite étale covers (§F.0.4; Stacks, Proposition 58.8.4, tag 0BQN; Stacks reaches the same point through the perfection of `k`, Lemma 58.14.2, tag 0BTW)".
- Add "§F.0.4 (topological invariance)" to the *Needs:* line 631.

Tested on the witness: the repaired limit is `Spec k^sep`. `Spec k̄ → Spec k^sep` is a universal homeomorphism, and both have trivial `π₁`.

## Previous findings

- R01 — repaired: `Suggested.lean` line 125 reads `[CompactSpace X] [QuasiSeparatedSpace X]`; README lines 602–604 say "quasi-compact quasi-separated", cite 0BTX first and add the doubled-wedge Check (lines 649–666). The added sketch clause is this report's R02.
- R02 — not repaired: the description still reads "roadmaps citing EtaleCohomologyFoundations labels are unaffected, since no label changes"; carried as R01.
- R03 — repaired: line 1912–1913 "`(MonoidalCategory.tensorLeft T).IsEquivalence`; no predicate for it is defined here". The roadmap no longer owns an invertibility predicate.
- R04 — repaired: lines 242–251 name the five Mathlib closure classes and state "no class bundling them is defined here"; the Mathlib row (line 64) lists them.
- R05 — repaired: lines 892–896 state the 0EYU stalk condition with the quasi-compact-section equivalent; the witness is now a Check (lines 908–910).
- R06 — repaired: the Tau Ceti row (line 65) lists `TauCeti.Compactification.precomp`; the DerivedModuleAlgebra row (line 68) lists §1.E.0 `DerivedDeRham.IsPerfect` and `PerfectComplex.IsPerfect`.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.** My run on `ae30823` with `--base origin/main` printed `set_option=0 … build=0 … depcheck=0 … outside-folder=0 source-material=0 OK`, exit 0. This matches the worker's run. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` exits 0. Its only output is `declaration uses sorry`, at lines 76, 123, 141, 156, 169 and 183.
- **Signatures.** I appended `#check @name` for all eight declarations to a scratch copy and elaborated it once.
  - The only change from the previous report is that `arithmeticExactSequence` now has `[CompactSpace ↥X] [QuasiSeparatedSpace ↥X]`, matching README lines 603–604.
  - Mathlib's `quasiSeparatedSpace_iff_quasiSeparated` identifies `QuasiSeparatedSpace ↥X` with the scheme being quasi-separated. No binder was lost.
- **Padding probe.** The changed theorem `arithmeticExactSequence` fails `first | simp | rfl | infer_instance | trivial | decide`, so it is not padding. The other five sorried theorems are unchanged and passed this probe in the previous report.
- **Probes of the repairs at the pin.**
  - `example [P.IsSerreClass] : P.ContainsZero ∧ P.IsClosedUnderIsomorphisms ∧ P.IsClosedUnderKernels ∧ P.IsClosedUnderCokernels ∧ P.IsClosedUnderExtensions` closes by `inferInstance` five times. This confirms README line 247 ("provides all five").
  - `(MonoidalCategory.tensorLeft T).IsEquivalence : Prop` elaborates.
  - `TauCeti.Compactification.quasiCompact : Compactification f → QuasiCompact f` and `TauCeti.Compactification.identity : [IsProper f] → Compactification f` elaborate.

### Changed passages and their sources

- **§F.0.A2 locators.**
  - 0BTX is Lemma 58.14.3 (`stacks-0BMY` lines 1768–1772): qcqs `X` with `X_k̄` connected.
  - 0BTV is Lemma 58.14.1 (lines 1753–1758): qcqs inverse system with affine transitions.
  - SGA 1 IX 6.1 (`sga1` lines 7736–7746, p. 195) assumes only that `X₀` is quasi-compact and geometrically connected. It leaves the limit isomorphism to the reader (lines 7764–7769, continued on p. 196). The README's description of SGA 1 is accurate.
- **§F.0.A2 negative Check (lines 649–666), recomputed.**
  - `Spec A = {𝔪} ⊔ ⨆ₙ D(tₙ)`, where `tₙ` is `t` in slot `n` and `D(tₙ) ≅ Spec 𝔽_{pⁿ}[t^{±1}]`; `tₙtₘ = 0` for `n ≠ m`.
  - Idempotents of `A ⊗_k k'` are constants in `{0, 1}`, since each slot lies in the reduced ring `(𝔽_{pⁿ} ⊗ k')[t]`.
  - The Mayer–Vietoris embedding `H⁰(W_k̄, ℤ/2)/constants ↪ H¹(X_k̄, ℤ/2)` holds.
  - `φᵐe − e` vanishes on index 1 and not on index `m + 1`.
  - The Check is correct as written.
- **§0.8 compactifiable restriction (line 953).**
  - Tau Ceti's carrier requires `QuasiCompact C.j` (`Compactification/Basic.lean` line 75). `quasiCompact` (line 171) makes every compactifiable map quasi-compact.
  - `precomp` (`SourceIso.lean` line 51) takes `[IsOpenImmersion e] [QuasiCompact e]`, matching the row's gloss "restriction along a quasi-compact open immersion of sources".
  - On the wedge, `j⁻¹(U₂) = W`, so the chart inclusion has no compactification. This is as the README says.
- **§F.1 (lines 826–836).**
  - 06UQ is Lemma 13.17.1 (`stacks-06UQ` lines 3062–3064): for a weak Serre `B`, `D_B(A)` is a strictly full saturated triangulated subcategory, including the bounded versions.
  - Mathlib at the pin has no lemma tying the closure classes to `ObjectProperty.IsTriangulated` (I searched `Algebra/Homology` and `CategoryTheory/Triangulated`). The target is not a duplicate.
- **§F.2.2 (lines 891–910).**
  - 0EYU (`stacks-0F1P` lines 8188–8200) has the same square, the same identity `f⁻¹Rᵠg_*F = Rᵠh_*e⁻¹F` and the stalk condition now quoted.
  - The `D⁺` clause rests on SGA 4 XVI, as cited; Stacks states only the sheaf form (59.89.3 = 0F09 is the limit corollary, line 8526).
- **§F.5 (lines 1908–1931).** No invertible-object predicate exists at either pin: I searched Mathlib `CategoryTheory/Monoidal` and Tau Ceti `CategoryTheory`. The only other definition, `MonoidalCategory.IsInvertible` in the EnhancedDerivedSheaves revision (#1630, `Suggested.lean` line 178), wraps the same `tensorLeft` equivalence. This roadmap now owns nothing there.
- **Supplier rows.** DerivedModuleAlgebra on main (`f8836c4`) has §1.E.0 at `README.md` line 2049, with `PerfectComplex.IsPerfect` as an alias at line 2054. This roadmap consumes it at §F.10.3, lines 2104–2105 and 2150.
- **Dropped names.** `roadmaps grep 'IsWeakSerreClass|MonoidalCategory\.IsInvertible'` finds no citation of this roadmap's former names on main or at any open head. Its only hits are #1630's own definition.
- **Seeded sample, where it falls in the change.**
  - "Smooth base change in the rotated square" and "The abstract Verdier layer and dualizing complexes": checked above.
  - "Perfect-complex traces and coherent additivity": the DerivedModuleAlgebra §1.E.0 row resolves.
  - "Finite-open Mayer–Vietoris and equivariant localization" (§0.7, line 743, unchanged): the line-953 restriction now correctly asks for a quasi-compact inclusion before `Rf_!` is applied to it.
  - "Names carried by the libraries" (line 15): it contains neither dropped name.
  - The remaining sampled targets are untouched; the previous report verified them.

### Adversarial table

Rows for changed statements (computed this round):

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `arithmeticExactSequence` (F.0.A2, repaired) | `Spec k`; `Spec 𝔽_{p²}/𝔽_p`; the doubled wedge; `k = 𝔽_p(t)`, `X = Spec k` | `Spec k`: `1 → 1 → Γ_k ≅ Γ_k → 1`. `Spec 𝔽_{p²}`: `X_k̄` has 2 points, so it is excluded by `ConnectedSpace`. Wedge: `U₁ ∩ U₂ = W` is not quasi-compact, so `QuasiSeparatedSpace X` fails and the wedge is excluded. `𝔽_p(t)`: `π₁(X_k̄) = 1`, `π₁(X) = Γ_k`, so the sequence is exact. The sketch's limit gives `Spec k^sep ≠ Spec k̄`. | statement true; sketch clause false for imperfect `k` | R02 |
| Quasi-separatedness Check (F.0.A2) | `A`; indices `n = 1, 2, 3`; Frobenius powers `m = 1, 2` | `D(tₙ) = Spec 𝔽_{pⁿ}[t^{±1}]`, and the only idempotents of `A ⊗ k'` are `0, 1`. `e = (1 \| 1,0 \| 1,0,0 \| …)` is not constant. `φe − e = (0 \| 1,1 \| 1,1,0 \| …)` and `φ²e − e = (0 \| 0,0 \| 1,0,1 \| …)` are both nonconstant. | true | none |
| Weak Serre class as five Mathlib classes (F.0.1) | `ℓ` on `ℤ/ℓ²`; `P` = finite free `ℤ/ℓ²`-modules; `P.IsSerreClass` | Kernel and cokernel are `ℤ/ℓ`, constructible. Free modules: contain `0`, extensions split, but `coker ℓ = ℤ/ℓ` is not free, so the cokernel class fails, as it should. All five classes follow from `IsSerreClass` by `inferInstance`. | true | none |
| `cohomologyProperty` triangulated (F.1, 06UQ) | cone of `ℓ : ℤ/ℓ² → ℤ/ℓ²`; `P` free as above | Cone: `H⁻¹ = H⁰ = ℤ/ℓ`, in `P` = constructible. With `P` = free, two vertices are in the property and the cone is not, so the kernel and cokernel classes are needed. | true | none |
| Smooth base change (F.2.2) | `S = T = ⨆ Spec ℚ`, `F = ℤ/n` on copy `n`; `S = T = Spec 𝔽_p`, `F = ℤ/p` | Stalks `ℤ/n` are invertible over `ℚ`, so `F` is included. A quasi-compact `U` meets copies `n₁ … n_r`, and `lcm(nᵢ)` kills its sections, so both forms agree. The global section has unbounded order. For `ℤ/p` in characteristic `p`, `p` is not invertible, so it is excluded. | true | none |
| Compactifiable restriction (0.8) | wedge `X`, `id_X`, chart `j : U₁ → X`; quasi-separated `X` with quasi-compact `U` | `id_X` is proper, so `Compactification.identity` applies. `j⁻¹(U₂) = W` is not quasi-compact, so `j` is not quasi-compact, and `Compactification.quasiCompact` rules out any compactification. For quasi-separated `X`, `U ∩ V` is quasi-compact for every affine `V`, so `precomp` applies. | true | none |
| Invertible objects (F.5) | `Λ(1)` with `n` invertible, `X ≠ ∅`; `Λ ⊕ Λ`; `X = ∅`; `n = 1` | `Λ(1) ⊗ Λ(−1) ≅ Λ`, so `tensorLeft Λ(1)` is an equivalence. `(Λ⊕Λ) ⊗ K = K ⊕ K`, and `Λ ≅ K ⊕ K` at a stalk would give `ℤ/n ≅ N ⊕ N`, impossible for `n > 1` (`N ⊕ N` is not cyclic unless `N = 0`). For `X = ∅` or `n = 1` the category is zero and `Λ ⊕ Λ` is invertible, so both hypotheses of the Check are needed. | true | none |
| Supplier rows (R06) | `precomp`; DerivedModuleAlgebra §1.E.0 | `SourceIso.lean` line 51 at `2fd255d`. DerivedModuleAlgebra on main, lines 2049–2054. | resolved | none |

Rows carried from the previous report (r9, at `6217eb9`; these statements are untouched):

| Statement | Values (r9) | Result |
| --- | --- | --- |
| `nagataCompactification` (G.2) | `𝔸¹ ⊂ ℙ¹` works; the doubled origin is not separated; `⨆_ℕ Spec k` is not quasi-compact; same hypotheses as 0F41 | true |
| `etaleCohomologicalDimension` (F.3.0) | `ℙ¹_k̄`: `H² = ℤ/ℓ(−1)`, `H³ = 0`; `∅`: `2·⊥ < 0`; `Spec 𝔽_q`: excluded; `ℤ/p` in characteristic `p`: excluded by `hF` | true |
| `affineArtinVanishing` (F.3) | `𝔸¹`, `ℤ/p`: `H¹ ≠ 0` at `q = 1`, `H² = 0`; `ℙ¹` is not affine; `Spec ℝ` is excluded | true |
| `finite_H_constantSheaf` (F.3) | `𝔾_m`: `H⁰ = H¹ = ℤ/ℓ`; `𝔸¹`, `ℤ/p`: excluded; `M = 0` | true |
| `subsingleton_ellAdicCohomology` (F.4.4) | `ℙ¹`: `H² = ℤ_ℓ` (not covered), `H³ = 0`; `∅`: subsingleton | true |
| `EtaleFundamentalGroup`, `.map` (F.0.2) | `Gal(K^sep/K)` by `galContinuousMulEquivAutFiber`; `𝔽_{p²}/𝔽_p` has image of index 2 | true |
| Carrier and universes; ℓ-invertibility (Conventions) | `EllAdicCohomology` is `Type (u+1)`; `∅` needs nonemptiness for the `CharP` form; `2` is not a unit on `Spec ℤ` | true |
| Locally constant sheaves and stratifications (F.0.1) | the origin skyscraper is constructible; an infinite sum is not; `{𝔪}` in `Spec k[x₁, x₂, …]` is not | true |
| Decomposition and inertia groups (F.0.A1) | `zⁿ`: `|I| = n`; purely inseparable `f = 2` gives `|I| = 2 ≠ e = 1` | true |
| Finite-coefficient cohomology (F.1) | cone of `ℓ`; separably closed point; `⊕ₙ ℤ/ℓ` | true |
| Tame character (F.3a) | `t₃|_{I'} = e·t'₃`; characteristic 0: `Ẑ(1)`; `𝔽̄_p[t]^h`: `t_ℓ(P) = 0` | true |
| Stable lattices, saturation, basis-free representations (F.4.0) | `GL_0`; `⟨ℓ⟩`; `Λ₂^∨`; `a = ℓ⁻¹` | true |
| Pro-étale coefficient rings; rationalization (F.4.3, F.4.5) | `s(n) = ℓⁿζ` is not a section; `N(1+√ℓ) = 1−ℓ` | true |
| Frobenius comparison (F.10.2b) | `μ_5` over `𝔽_2`: `ζ³` vs `ζ²`; `H²_c(𝔸¹)` has trace `q` | true |
| Curve duality (0.11); six-operation structure (F.5) | `Λ(1)[2]`; rank `2g`; `(R²f_*Λ)_s = Λ(−1)` | true |
| Scheme.Hom.pointCount (F.10.1) | `0` and `2` under all three definitions | true; three owners (R01) |

### Library declarations opened at the pins

- **Mathlib** (`1b1ccf4b`):
  - `CategoryTheory/Abelian/SerreClass/Basic.lean` lines 45–51 (`IsSerreClass` extends `ContainsZero`, subobjects, quotients and extensions).
  - `ObjectProperty/Kernels.lean` lines 76 and 123, `Extensions.lean` line 42, `ContainsZero.lean` line 38, `ClosedUnderIsomorphisms.lean` line 30.
  - `MonoidalCategory.tensorLeft` and `Functor.IsEquivalence`, by `#check`.
  - `quasiSeparatedSpace_iff_quasiSeparated`.
- **Tau Ceti** (`2fd255d9`):
  - `AlgebraicGeometry/Compactification/Basic.lean` lines 73–77 and 171.
  - `Compactification/SourceIso.lean` lines 45–56.
  - `Compactification.identity`, by `#check`.

### Cross-roadmap citations and ownership

- **Citations tool.** It reports none missing among cross-roadmap citations. The twelve Lean-name leads are this file's four `VanishingCycles.*` theorems and supplier names that the previous report resolved; the change touches none of them.
- **Overlaps tool.** No other open pull request changes this roadmap, and there is no dropped id in either direction.
- **Ownership by object for the changed passages.**
  - Weak Serre classes: Mathlib only.
  - Invertible objects: #1630 only, a revision this roadmap no longer duplicates.
  - The point counts: #1208 and #929 (R01).

## Not verifiable

- SGA 4 (Exposé XVI for the `D⁺` form of smooth base change; X and XIV for the dimension bounds) and SGA 4½ are uncertified in the manifest and were not read. The sheaf form of smooth base change was checked against Stacks 0EYU.
- The previous report's uncertified items (Huber 1996, Fujiwara 2002, Ribet 1976) are untouched by the change.

## Source issues

- **Error** in sga1 at Exposé IX, Théorème 6.1, p. 195: the source says the sequence `1 → π₁(X̄₀) → π₁(X) → π₁(S) → 1` is exact whenever `X₀` is quasi-compact and geometrically connected; it should also assume `X₀` quasi-separated, as the limit isomorphism left to the reader requires; affects a stated result.
