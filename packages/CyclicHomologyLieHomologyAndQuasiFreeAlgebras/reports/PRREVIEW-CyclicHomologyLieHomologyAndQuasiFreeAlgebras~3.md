# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at 8269baf)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md` and `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/Suggested.lean`. Source ids are those of this review's fetches: `LQ84` is the GDZ scan of Loday–Quillen 1984, read as rendered page images and cited by printed page; `KL82` is the Numdam text of Kassel–Loday 1982; `CQ95a`, `CQ95b` are the AMS open-archive texts of Cuntz–Quillen 1995a/b; `Cor06` is arXiv:math/0111096v5; `Connes94` is Connes, *Noncommutative Geometry*, the PDF on the author's site; `Q96` is the GDZ scan of Quillen 1996 (PPN243919689_0472, LOG_0011), read through OCR; `Zbl <number>` is a zbMATH Open review.

## The previous review's findings at this head

| Previous finding (at 16bbb8e) | Status | Passage at this head |
|---|---|---|
| R01 4.1's Hochschild-dimension form statable and absent | repaired | `Suggested.lean` line 116: `isQuasiFree_iff_hasProjectiveDimensionLE_one`, with `attribute [local instance] instModuleTensorProductMop`; 4.1's third bullet names it; the docstring bullet is reduced to `Ω¹A` and `Ω¹A ⊗_A Ω¹A` |
| R02 separable ⇒ quasi-free false over a ring | repaired | 4.2: "separable algebras over a field are quasi-free"; Convention 1: "everything else in 4.1–4.2 takes `k` a field"; the Check "`ℤ/2` is separable over `ℤ` … and not quasi-free over `ℤ`" |
| R03 1.4 and 5.2 need flatness | repaired | 1.4: "For a flat `k`-module `V` … which is then `k`-flat"; 5.2: "flat as a `k`-module … with `R` and `S` flat over `k`"; Convention 1 says which complex each uses; the `T(ℤ/2)` Check |
| R04 two false Checks | repaired | 4.6 Check 2 now uses `k[x, y]/(xy) → k[x]` and ends "`k[x] = J⁺` itself never fails"; 3.1 Check 2 begins "Over `ℚ ⊆ k`" |
| R05 1.2 over a field | repaired | 1.2: "over a commutative ring `k`, `Ext^*_(kΛ)(k♮, k♮)` is the polynomial algebra `k[u]`" |
| R06 Morita invariance of `HH`, `HC` promised | repaired | Layer 5 Examples: "give equivalences of the categories of firm modules" |
| R07 work-only locators | partly | repaired in 1.1–1.3, 4.6, 5.2, 5.6 and for local units in 5.1; 3.1, 5.4, 5.5 and 5.1's definition still cite a work only (R02 below) |
| R08 5.4's ring over a field | repaired | "For a field `k` and the nonunital algebra `R = k⟨x, y, z₁, z₂, …⟩/I` (words of positive length)"; the bullet restating firmness is gone |
| R09 process references | repaired | "No other roadmap owns …"; "No roadmap consumes a target of …"; "(stated in Lean on Mathlib and Tau Ceti)", "(4.1–4.2 stated in Lean)" |

## R01 (P2) — 3.1 defines `L_D` on the Hochschild chains of `A`, which do not compute `HH_*(A)` when `A` is not `k`-flat

**Location.** `README.md` lines 540–543: "For a derivation `D` of a unital algebra `A` over a commutative ring `k`, define its action `L_D(a₀ ⊗ ⋯ ⊗ a_n) = …` on Hochschild chains, which … induces endomorphisms of `HH_*(A)`, `HC_*(A)` and `HP_*(A)`"; Convention 1, lines 115–124.

**Claim.** Convention 1 makes `HH`, `HC`, `HP` derived for a non-flat algebra and says the Hochschild complex itself "is what 1.4 and 5.2 use". 3.1 is listed over every commutative ring with no flatness, so for a non-flat `A` the formula acts on a complex whose homology is not the `HH_*(A)` of the statement. This is the defect of the previous R03, in the one target it did not reach.

**Witness.** `k = ℤ`, `A = 𝔽₂[x]`: `A ⊗_ℤ A = A ⊗_(𝔽₂) A`, so the chains `A^⊗(n+1)` have `H_n = HH_n(𝔽₂[x]/𝔽₂) = 0` for `n ≥ 2`, while the derived `HH₂(𝔽₂[x]/ℤ) ⊇ HH₂(𝔽₂/ℤ) ⊗ 𝔽₂[x] ≠ 0`.

**Repair.** State 3.1 "for a unital algebra `A` that is flat as a module over a commutative ring `k`", write "3.1 (for a `k`-flat algebra)" and "which is what 1.4, 3.1 and 5.2 use" in Convention 1, "a derivation of a flat algebra" in the Summary, and add the witness as a Check. On a flat `A` the two complexes agree, and `𝔽₂[x]` over `ℤ` is excluded. The checks of 3.1 (`ℚ[x]`, `𝔽_p[x]` over `𝔽_p`) are flat and unaffected. The alternative, defining `L_D` on the derived `HH` through the algebra map `A → A[ε]/(ε²)`, `a ↦ a + εD(a)`, needs its own statement and locator.

## R02 (P3) — three targets still cite a work without a theorem, section or page

**Location.** 3.1, line 544: "(Goodwillie 1985, Part II)" for both `L_D = 0` on `HP` and `S ∘ L_D = 0` on `HC`. 5.4, lines 890, 897, 900, 909: "(Quillen's notions; Marín 1998)", "(González-Férez–Marín 2007)" three times. 5.5, line 925: "(Marín 1998.)" for three theorems. 5.1, line 822: "(Wodzicki 1989)" for the definition.

**Claim.** The previous R07 is repaired for 1.1–1.3, 4.6, 5.2 and 5.6 and not for these: each proved claim needs its theorem number or page in the cited paper.

**Witness.** 5.6 at this head shows the form: "Quillen 1996, Theorem (2), p. 197", which `Q96` lines 53–60 confirm. The three papers here are behind a publisher's paywall and I could not supply the numbers (see Not verifiable).

**Repair.** Give, from the texts, the numbers of Goodwillie's two statements in 3.1 (one locator each), of the xst criterion and of the non-abelian example in González-Férez–Marín 2007, of Marín's three theorems in 5.5, and the section of Wodzicki 1989 that defines H-unitality.

## R03 (P3) — the module docstring gives the wrong missing carrier for 4.5

**Location.** `Suggested.lean` lines 29–33: "… and 4.4–4.6 (the X-complex theorem, the Fedosov product, excision in periodic cyclic homology): cyclic, negative cyclic and periodic cyclic homology of an algebra".

**Claim.** 4.5 (the Fedosov product on `Ω^evA`, the universal property of `RA`, `(IA)ⁿ = ⊕_(m≥n) Ω^(2m)A`, `RA` quasi-free) mentions no cyclic homology. What it lacks at the pins is the differential graded algebra `ΩA` of normalised forms of a unital algebra.

**Witness.** README 4.5, lines 759–766, and its *Needs:* line "4.1, 4.3; Mathlib `FreeAlgebra`". Tau Ceti's `TauCeti.UniversalForms` (`TauCeti/NoncommutativeGeometry/UniversalDifferential/Complex.lean:45`) is `Unitization k A ⊗[k] TensorPower k n A`, the forced-unitisation model, as 4.3 says.

**Repair.** Take 4.5 out of that bullet and add: "4.3 and 4.5 (noncommutative forms, the Fedosov product and the universal extension `RA`): the differential graded algebra `ΩA = ⊕ A ⊗ Ā^⊗n` of normalised forms of a unital algebra; Tau Ceti's `TauCeti.UniversalForms` is the forced-unitisation model."

## Verified sound

**Gate and build.** My run of the gate at this head with the candidate merge order prints `OK` with every counter 0. The dependency check prints `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`: no UPWARD or CYCLE line. `lake env lean` on `Suggested.lean` gives five warnings, `declaration uses 'sorry'`, at lines 77, 103, 116, 127, 132, and nothing else. No file outside the folder changes. The pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`) equal main's.

**Signatures.** The elaborated types of all 7 declarations were compared with the README: `glAction` over `CommRing k`; 2.2 with `[Field K] [CharZero K]`; `IsQuasiFree` with `R S` in the universe of `A`; the nilpotent lift with `π`, surjectivity, `n` and the list hypothesis explicit; the dimension form over `[Field K]` with `ModuleCat.of (A ⊗[K] Aᵐᵒᵖ) A`; `isQuasiFree_freeAlgebra` over `CommRing k`; the non-example over `[Field K]`. No binder is lost and each equals its README statement.

**Padding probe.** Each of the five theorems was tried, on scratch copies, with `simp [IsQuasiFree, glAction]`, `rfl`/`infer_instance`, `exact?` and `aesop`: 20 attempts, none closes.

**Library declarations opened at the pins.** Tau Ceti: `permTensorAction` and `permTensorActionAlgHom` (`RepresentationTheory/Symmetric/TensorAction/Basic.lean:142`, `:161`), `permTensorActionAlgHom_injective_iff` (`Faithful.lean:167`, `[Nontrivial R]`, `d ≤ n`), `mem_range_permTensorActionAlgHom_iff_forall_commute` (`SchurWeyl.lean:137`), `cyclicCohomology` (`RingTheory/CyclicCohomology/Cohomology.lean:273`), `periodicCyclicCohomology` (`PeriodicCohomology.lean:119`), `relativeCyclicCohomology` (`Relative.lean:284`), `cyclicQuotient` (`Algebra/Algebra/CyclicQuotient.lean:151`), `UniversalForms`, `UniversalOneForms`. `TensorAction/GeneralLinear.lean` has the commutant theorem for the group `GL` (`tensorPowerRep`), not for the Lie algebra action, so 2.2's headline is not a duplicate; `Algebra/Lie/ExteriorPower.lean` has the derivation action on exterior powers only; `Algebra/Lie/Cohomology/` is degrees at most two of cochains. Mathlib: `instModuleTensorProductMop` (`Algebra/Azumaya/Defs.lean:39`, an `abbrev` for `TensorProduct.Algebra.module`, with `a ⊗ b` acting by `x ↦ a x b`), `CategoryTheory.HasProjectiveDimensionLE` (`CategoryTheory/Abelian/Projective/Dimension.lean:53`), `LieModule.Cohomology.twoCochain` (`Algebra/Lie/Cochain.lean`), `Representation.Coinvariants` (`RepresentationTheory/Coinvariants.lean:57`), `LieAlgebra.SpecialLinear.sl` (`Algebra/Lie/Classical.lean:92`). Eleven greps by object (quasi-free, Chevalley–Eilenberg, firm, Morita context, H-unital, cyclic category, X-complex, Fedosov, Hochschild homology, cyclic homology, separable): no declaration of this roadmap's objects in either library; Tau Ceti's firm modules are those of almost mathematics (`RingTheory/Almost/Firm.lean`), which the Scope names.

**Cross-roadmap citations resolved (12).** RefinedTraceMethods §1.1 (`Λ`, the paracyclic `Λ_∞`), §1.2, §1.4 (the three totalisations, SBI, Connes' complex for `ℚ ⊆ k`, `HC_n(k[x]) = HC_n(k)`), §1.6 (flat algebras, "an algebra that is not `k`-flat is first replaced by a `k`-flat DG resolution"), §4.9 ("`HP(−⊗ℚ/ℚ)` is truncating"), §4.18 (nil-invariance of truncating invariants; "the obstruction to excision in `K⊗ℚ` equals that in `HC⊗ℚ` (shifted by one)"; the Milnor square `k[x, y]/(xy) → k[x] × k[y]`); KTheoryFiniteLocalFields §4.0 (`cyclicHomologyModel`, derived Hochschild chains); AlgebraicKTheory §3.4; GeneralAlgebraicKTheory §8.3 and §8.10 ("degree-one absolute excision is equivalent to `I = I²`"); SmoothRepresentationsOfLocalGroups SR.1.3, which consumes nothing here (its open head defers general firm modules to this roadmap); TopologicalKTheory T3.2. All four suppliers precede this roadmap in the merge order. A search of main and the open heads for quasi-free algebras, H-unitality, the Loday–Quillen–Tsygan theorem, the Chevalley–Eilenberg chain complex, the X-complex, Morita contexts, `K₀′`, firm modules, the Fedosov product and Goodwillie's derivation theorem found no second owner ("quasi-free" elsewhere is the quasi-free state of operator algebras). No open pull request changes this roadmap or drops an id it cites.

**Sample locators verified against the text.**

- 2.1: `LQ84` p. 583 (the differential with `(−1)^(i+j)`, `H_n(𝔤) = Tor^(U(𝔤))_n(k, k)`, characteristic zero throughout §6).
- 2.5: `LQ84` p. 587 (the Remark: no hypothesis on the characteristic); `KL82` lines 181–204 (Théorème 1.7, pp. 123–124; Proposition 1.8 and Corollaire 1.9, p. 124, `5 ≤ n ≤ ∞`, `A` a free `k`-module, `HC₂` in their indexing).
- 2.6: `LQ84` p. 587, Theorem 6.9, with the README's ranges and exact sequence.
- 1.4: `LQ84` p. 583, Proposition 5.4 and its characteristic-zero form.
- 1.1–1.3: `Connes94` lines 10805–10822 (Theorems 10, 11 a, 11 b, and the sentence after Theorem 11 on `S` as the Yoneda product with `σ`).
- 3.2: `Cor06` line 94 (Goodwillie II.5.1; Cuntz–Quillen 1997, 3.5).
- 4.1: `CQ95a` lines 694–711 (Proposition 3.3 and the definition, p. 267), lines 1019–1021 (p. 275).
- 4.2: `CQ95a` lines 712–715 (free and separable, p. 267), 935–955 (dimension `n`; Proposition 5.3 (1), (2), (4), (5), p. 273), 1034 (Proposition 6.1 (1), p. 275).
- 4.3: `CQ95b` lines 620–640 (§3, p. 388, `b(ω da) = (−1)^|ω| [ω, a]`), 816–832 (§4).
- 4.4: `CQ95b` line 34 ((2), p. 373), 1256 (Theorem 6.2), 1765–1803 (Proposition 9.2, Theorem 9.3, Corollary 9.4, pp. 416–417).
- 4.5: `CQ95a` lines 195–223 (the universal property, `RA` free on a basis, Proposition 1.2, p. 255).
- 4.6: `Cor06` lines 52–53 ((3), p. 2, from Cuntz–Quillen's excision theorem).
- 5.2, 5.3: `Cor06` lines 47–48 (Corollary 0.2, p. 2), 116–123 (Wodzicki (3), (4); Suslin–Wodzicki Theorem A, p. 3).
- 5.6: `Q96` lines 47–60 (the definition, Theorem (2) and the excision corollary, p. 197), 74–82 (the surjection onto `K₀`, `K⁰(X, Y)`, p. 198), 463 (Proposition 6.3: an isomorphism for C*-algebras).
- 5.4, 5.5: `Zbl 1137.16010` and `Zbl 0928.16007`, as in the previous round (statements, not numbers).

**Adversarial table** (values computed on each side):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 | `Ext⁰`; ground ring ℤ | `Hom(k♮, k♮) = k`; `ℤ[σ]`, `|σ| = 2` in `Connes94` | holds over any `k` | — |
| 1.4 | `V = k` over `𝔽₂`, `m = 2`; `V = ℤ/2` over ℤ | `H_n(ℤ/2, 𝔽₂) = 𝔽₂` for all `n`; `T(V) = ℤ[x]/(2x)`, derived `HH_(2j) ⊇ HH_(2j)(𝔽₂/ℤ) = 𝔽₂` against `0` for the complex | holds for flat `V`; non-flat excluded | — |
| 2.1 | unsigned formula on `(h, e, f)`; `d(e ∧ f ∧ h)`; `d(x ∧ y)` | `−2[[f, h], e] = 4h ≠ 0`; `0 − 2e∧f + 2e∧f = 0`; `−[x, y]` | holds | — |
| 2.2 headline | `p = 0`; `r = 0`; `r = p = 2` on `e₂ ⊗ e₂`; `K = 𝔽₂`, `r = 1`, `p = 2` | `End = K = range`; zero space; `[gA E₁₂, gA E₂₁] = −2 e₂⊗e₂ = gA(E₁₁ − E₂₂)`; `gA x = 2x = 0`, space `K`, range `K` (outside the hypotheses, no counterexample there) | holds | — |
| 2.5 | `A = k`; `𝔽_p[x]`; `M₂(k)` | `HC₁ = 0`; `d(xᵖ) = 0`, `[x^(p−1)dx] ≠ 0`; `tr[E₁₂, E₂₁] = 0` in `A/[A, A]` | holds, equals Corollaire 1.9 | — |
| 2.6 | `A = k`, `n = 2`, `i = 0, 1, 2` | `k ≅ k`; `H₁(𝔤𝔩₁) = k → H₁(𝔤𝔩₂) = k`; `H₂(𝔤𝔩₁) = 0`, `Ω¹_k = 0`, `H₂(𝔤𝔩₂(k)) = 0` | holds | — |
| 3.1 | `ℚ[x]`, `𝔽_p[x]/𝔽_p` with `x d/dx`; `𝔽₂[x]` over ℤ | weight `m` acts by `m`, homology in degree `≥ 1` only for `p ∣ m`; chains have `H₂ = 0`, derived `HH₂ ≠ 0` | holds for flat `A`; undefined for non-flat `A` | R01 |
| 4.1 `IsQuasiFree`, nilpotent lift | `n = 0, 1`; `A = 0` | `[].prod = 1` forces `R = 0`; `π` injective; `S = 0` forces `R = 0`, lift exists | holds | — |
| 4.1 dimension form | `A = 0, K, K[x], K[ε], K[x, y]` | projective dimension `−∞, 0, 1, ∞, 2`; quasi-free: yes, yes, yes, no (`(t + ct²)² = t² ≠ 0`), no | both sides agree | — |
| 4.2 | `FreeAlgebra k Empty`; `ℤ/2` over ℤ; `M₂(K)` | `π 1 = 1`; `g(1 + 1) = 2 ≠ 0` in `ℤ/4`; dimension 0 | holds; separable only over a field | — |
| 4.3 | `♮d ∘ b`; `κ` on `Ω¹`; commutative `R` | `♮(z dy + y dz)` symmetric; `κ(a₀ da₁) = da₁ a₀`; `Ω¹R_♮ = I/I²`, `b = 0` | holds | — |
| 4.4 | `k[x]`; `k[x, y]` | `H_*(X) = (k, 0)`; `H₁(X) ∋ [x dy] ≠ 0` against `HP₁ = 0` | quasi-freeness needed, as stated | — |
| 4.5 | `a ∘ 1`; `A = k`; `(da db) ∘ (dc de)` | `a − da d1 = a`; `RA = k`; `da db dc de ∈ (IA)²` | holds, equals Proposition 1.2 | — |
| 4.6 and Check 2 | `J = A`; `C = k[x, y]/(xy)`, `J = (x)` | identity; bidegree `(1, 1)` of `Ω¹_C` is `k·x dy` and `d(xy) = 0`, so `[x dy] ≠ 0`; `HC₁(k[y]) = 0`; `HC₁(k[x], xk[x]) = 0` | holds; excision in `HC` fails as the Check says | — |
| 5.1 | left local units; `xk[x]` | `b′(e ⊗ z) = z − e ⊗ b′z = z` for a cycle `z`; `A² = x²k[x]` | holds | — |
| 5.2 | `S` flat; `pℤ ⊂ ℤ`; `k ⊕ A` | `Tor₁(S, V) = 0` gives purity; `pℤ ⊗ ℤ/p → ℤ/p` is `0`; flat | holds | — |
| 5.3 | `εℚ[ε]`; `Cor06` (8) | `A/A² ≠ 0`; excisive ⟺ bar homology of `A ⊗ ℚ` vanishes | holds | — |
| 5.4 | `2ℤ`: `M = ℚ ⊃ ℤ`; Prüfer group with `t = 2` | `AM = M`, `Aℤ = 2ℤ ≠ ℤ` (not xst); unitary, `A ⊗_A M → M` is multiplication by 2, not injective | the criterion agrees on both sides | — |
| 5.5 | `εℤ[ε]`, `φ = ψ = 0` | `a₁a₂ = 0 ∈ im φ`; firm modules are `0` | holds | — |
| 5.6 | `A = R`; `Ã = ℤ × R` | Euler characteristic onto `K₀(R)`; the `ℤ`-part contractible, the `R`-part arbitrary: the same group | holds | — |

## Not verifiable

- Goodwillie 1985 (3.1's two statements and their numbers), Marín 1998, González-Férez–Marín 2007: the sources service records all three as resolving only to a publisher's paywall; a title search found no open copy. 5.4 and 5.5 were checked against the zbMATH reviews only.
- Wodzicki 1989 (the definition of H-unitality over `k`, Corollary 4.5 for local units, the purity hypothesis of (3)) and Suslin–Wodzicki 1992 (C*-algebras are H-unital): no legal copy; what `Cor06` records was checked. The form of 5.2 restricted to `k`-flat `A`, `R`, `S` was checked only by the remark that, for flat `A`, acyclicity of `B_*(A)` gives that of `B_*(A) ⊗_k V` for every `V`.
- Cuntz–Quillen 1997 and 1993, Connes 1983, Tsygan 1983, Milnor–Moore 1965, Cartan–Eilenberg, Quillen 1989, Dunwoody 1979, Loday's *Cyclic Homology* (§6.2, Chapter 7): no legal copy was read.

## Source issues

- none
