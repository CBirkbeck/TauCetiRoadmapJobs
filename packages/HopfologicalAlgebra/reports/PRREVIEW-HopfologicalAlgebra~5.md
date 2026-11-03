# Review of HopfologicalAlgebra (pull request #222 at a67c565)

**Verdict:** accepted

This is a full review of the repaired head. Every finding of the previous review is repaired (checked below, passage by passage), the gate passes every check, the dependency check reports no problem, and the adversarial pass found nothing false. One P3 note on a sentence of the Scope section; it is the author's to take or leave.

## Repairs of the previous review's findings

- **R01 (P2, Verdier `K₀` sequence without thickness) — repaired.** `README.md:606–620` now states the sequence for "a thick subcategory: a triangulated object property (`CategoryTheory.ObjectProperty.IsTriangulated`) closed under direct summands, equivalently `S.triangEnvelope = S`", with the raw Verdier quotient, a proof route through the kernel of the quotient functor, and the locators Chebolu (3), p. 10 and Stacks 05RK. `README.md:808–810` applies it to `I` "thick (Laugwitz–Qi, Theorem 5.5)". The former witness (`T = Dᵇ(k-mod)`, `S` = even Euler characteristic) is now a negative-control Check at `README.md:639–643`, with the values `K₀(T/S) = 0` versus `K₀(T)/⟨[S]⟩ = ℤ/2ℤ` that I recomputed.
- **R02 (P3, Qi Lemma 2.3 cited for four statements) — repaired.** `README.md:324–326`: "(Khovanov, Proposition 2, for `P ⊗ M`; Qi, Lemma 2.3, for `M ⊗ P` and the two Hom spaces)". Matches `khovanov` lines 78–80 and `qi` lines 263–264.
- **R03 (P3, DGAInfinity Layer 7 consumed beyond its generality) — repaired.** `README.md:46–50` and `174–181` say DGAInfinity's sequence is for DG quotients and is not consumed; the triangulated form is a §6.1 target with its own route and locator. DGAInfinity Layer 7 on main (`TauCetiRoadmap/DGAInfinity/README.md:490–519`) is indeed stated for a small DG category and a full DG subcategory.
- **R04 (P3, Tau Ceti `K₀` attributed to GrothendieckEulerForms) — repaired.** `README.md:146–163` cites `TauCeti.ExactK0`, `TauCeti.TriangulatedK0` with `of_distTriang`, `of_shift`, `liftEquiv`, `TauCeti.TriangulatedK0.shiftZPow`, `TauCeti.LaurentK0` with `T_smul`, `TauCeti.ExactK0.instRing` and `TauCeti.ExactStructure.IsMonoidal`, each with its module; `README.md:183–187` keeps GrothendieckEulerForms Layer 6 for graded dimensions and the `q`-conventions only. All opened at the pin (table below). The module docstring (`Suggested.lean:29–37`) now names the missing carrier as the Frobenius exact structure on graded `H_p`- and `H_n`-modules.
- **R05 (P3, universe of `H-Mod`) — repaired.** `README.md:71–76` fixes `H-Mod = ModuleCat.{u} H` in the universe of `k`, the carrier of QuantumGroups Q8 item 5 (`TauCetiRoadmap/QuantumGroups/README.md:702–706` on main: "`ModuleCat.{u} H` for k:Type u and H:Type v"). `Suggested.lean:94` states `hMod_abelian_isFrobenius` on `ModuleCat.{u} H`; with `pp.universes` the elaborated type reads `ModuleCat.{u_1, u_2} H` with `k : Type u_1`.

## R01 (P3) — "no `K₀` of a Verdier quotient" overstates what the library lacks

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:57–58`, "The library has no `K₀` of a Verdier quotient and no ring structure on triangulated `K₀`; both are targets of §6.1."

**Claim:** the pinned library cannot form `K₀` of a Verdier quotient.

**Witness:** at the pin `TauCeti.TriangulatedK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean:139`) applies to any essentially small pretriangulated category, and Mathlib gives `Pretriangulated W.Localization` for `W` compatible with the triangulation (`Mathlib/CategoryTheory/Localization/Triangulated.lean:226`), `P.trW` being compatible for triangulated `P` (`Mathlib/CategoryTheory/Triangulated/Subcategory.lean:633`). What the library lacks, and §6.1 proves, is the localization sequence `K₀(S) → K₀(T) → K₀(T/S) → 0`; `README.md:162` already says this correctly ("None of these treats a Verdier quotient").

**Repair:** "The library has no localization sequence for the `K₀` of a Verdier quotient and no ring structure on triangulated `K₀`; both are targets of §6.1."

## Verified sound

**Gate and build.** The worker's gate at `a67c565` records every scanner, the dependency check and the targeted build passing. Independently, `lake env lean TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean` exited 0 with exactly ten `declaration uses sorry` warnings (lines 84, 93, 105, 112, 122, 148, 212, 224, 262, 311) and nothing else; the five `TauCeti.*` imports have object files in the worktree's packages directory (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`). `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`. No `set_option`, no `lemma`, no sorry'd data, no admitted `example`, no `#check` in the file.

**Supplier direction.** The dependency check with `--movable` printed exactly

```text
depcheck: 204 roadmaps, 1654 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line; HopfologicalAlgebra is line 291 of the merge order. Its four roadmap suppliers are on main (`929496d4`) and say what the contracts consume: QuantumGroups Q8 item 5 (`README.md:701–745`, `FiniteHopfModuleCat k H` on `ModuleCat.{u} H`, monoidal through the coproduct, right duals through `S`, left duals given bijectivity); StablePeriodicCurved Layers 0–1 (its line 38 names this roadmap as the owner of the hopfological quotient); DGAInfinity Layers 0, 1, 5 (`README.md:431–466`: derived categories of DG modules, perfect objects) and 7 (`README.md:490–519`: DG quotients, Drinfeld's comparison, `H⁰` of the quotient is the Verdier quotient, the `K₀` sequence for a DG quotient); GrothendieckEulerForms Layer 6 (`README.md:437–480`: `[M{n}] = qⁿ[M]`, graded dimension with finite-dimensional pieces and finite Laurent support) and its exclusion of Verdier quotients and hopfological algebra (`README.md:34–36`).

**Ownership against open work.** `roadmaps grep` (index of 2026-11-03, 440 open pull requests) for smash product, module algebra, left integral, cointegral, hopfological, Taft, Nichols, Larson, Sweedler, slash homology, and the Verdier `K₀` localization sequence finds no other roadmap building these objects: McKaySkewGroup (#223, later in the order) has the skew group algebra of a group action, which §3's Examples name as the `H = k[G]` instance; QuantumEnvelopingAlgebras (#1125) names Nichols algebras only in its exclusions; NoncommutativeAndEquivariantIwasawa's localization sequence is the relative `K₀(Λ, Λ_S)` of a ring localization, a different object. This roadmap is the owner of the triangulated-category localization sequence of §6.1 (Chebolu attributes it to Grothendieck, SGA 5) since DGAInfinity states only the DG-quotient form and GrothendieckEulerForms excludes Verdier quotients.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`):

| Declaration | File and line at the pin | What it gives, and does not |
|---|---|---|
| `TauCeti.TriangulatedK0`, `.of_distTriang`, `.of_shift`, `.liftEquiv` | `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean:139, 154, 200, 296` | `K₀` of an essentially small pretriangulated category, triangle relation, `[X⟦n⟧] = (−1)ⁿ[X]`, universal property |
| `TauCeti.TriangulatedK0.shiftZPow` | `TauCeti/CategoryTheory/GrothendieckGroup/Graded.lean:567` | `ℤ →+ AddAut (TriangulatedK0 C)` generated by a triangulated autoequivalence `e` with `e.functor.CommShift ℤ`, as the contract says |
| `TauCeti.LaurentK0`, `.T_smul` | `TauCeti/CategoryTheory/GrothendieckGroup/Laurent/Basic.lean:103, 176` | graded exact `K₀` as a `ℤ[q,q⁻¹]`-module, `Tⁿ • [M] = [M{n}]` |
| `TauCeti.ExactK0`, `.instRing`, `of_mul_of` | `GrothendieckGroup/Exact.lean:163`, `GrothendieckGroup/Monoidal/Exact.lean:148, 116` | ring on exact `K₀` with `[X]·[Y] = [X ⊗ Y]` under `TauCeti.ExactStructure.IsMonoidal` (`CategoryTheory/Exact/Monoidal.lean:49`) |
| `TauCeti.ExactStructure`, `.IsConflationExact` | `CategoryTheory/Exact/ExactStructure.lean:241`, `Exact/Functor.lean:74` | exact structures, conflation-exact functors |
| `TauCeti.ExactStructure.IsFrobenius.stableIsTriangulated` | `CategoryTheory/Exact/Stable/Triangulated.lean:205` | Happel's triangulation |
| `ObjectProperty.IsTriangulated` | `Mathlib/CategoryTheory/Triangulated/Subcategory.lean:177` | zero, shifts, extensions; no retract closure, so §6.1's extra thickness hypothesis is needed |
| `ObjectProperty.trW` and its localization | `Subcategory.lean:458, 543, 633`; `Localization/Triangulated.lean:226` | multiplicative, compatible with the triangulation for triangulated `P`; the localization is pretriangulated |
| `ObjectProperty.triangEnvelope` | `Mathlib/CategoryTheory/Triangulated/Generators.lean:132, 152` | smallest triangulated property closed under retracts containing `P`, so "`S.triangEnvelope = S`" is thickness |

The other declarations the README names (`IsGroupLikeElem`, `Coalgebra.Repr`, `WithConv.linearEquiv`, `Module.Dual.eval`, `HopfObj`, `Polynomial.cyclotomic_prime`, `TauCeti.Comodule`, `TauCeti.ConvolutionDual.instHopfAlgebra`, `LinearMap.IsFrobeniusFunctional.nakayamaAut` and `apply_mul_nakayamaAut`, `TauCeti.ExactStructure.IsFrobenius`, `FGModuleCat.abelian_isFrobenius`, `TauCeti.Bialgebra.comul_pow_of_primitive`, `TauCeti.GradedModuleCat.shiftFunctor`) were opened at the same pin in the previous round and are unchanged. No graded Frobenius exact structure exists at the pin (the only `IsFrobenius` instances are `FGModuleCat.abelian_isFrobenius`, ungraded, and the curved duplex), so the docstring's account of what Layers 7 and 8 lack is right.

**Signatures.** All 26 declarations were printed with `#check @name` in one scratch file importing the built module and elaborated once (exit 0). Each carries the binders its README statement needs: `[FiniteDimensional k H]` on the six Layer 1 theorems and the finite-dual equivalence, `[FiniteDimensional k M]` and `[Fact p.Prime]` on the slash theorem, `Λ ≠ 0`, `phi ≠ 0`, `hα` where stated; `hMod_abelian_isFrobenius` is about `ModuleCat.{u_1, u_2} H` with `k : Type u_1`. Nothing changed as a result.

**Padding.** Each of the ten sorried theorems was retried on a scratch copy with `first | rfl | infer_instance | (simp; done) | (simp_all; done) | exact?`; all ten failed (`exact?` could not close the goal at lines 86, 95, 108, 114, 131, 150, 213, 229, 270, 317). The 16 definitions are those the headlines need; none restates a Check.

**Headline inventory.** Stated: Frobenius, Nakayama and symmetric criteria (`hMod_abelian_isFrobenius`, `isFrobeniusFunctional_of_isRightCointegral`, `antipode_bijective`, `nakayamaAut_symm_eq_winding`, `symmetric_iff_unimodular_and_antipodeSquare_inner`), `A # H` existence and universal property, the module/comodule-algebra equivalence, slash-homology detection. Named in the docstring as not statable, correctly: the tensor-triangulated `H-StMod` and the ring `K₀(H-stmod)` (no coproduct-monoidal module category at the pins), `C(A,H)`/`D(A,H)` (no diagonal `A # H`-module `M ⊗ H`), the Layer 7–8 Grothendieck rings (no graded Frobenius exact structure), the braided Hopf equivalence and bosonization. The §6.1 localization sequence is a supporting lemma, not a headline; its carriers do exist at the pin, so the author may state it if wanted, but its absence is not a defect.

**Sources at their locators** (cached texts; line numbers of the sources cache). `chebolu` (arXiv v2): sequence (3) at lines 459–469, printed p. 10, for a thick subcategory `A` of a triangulated `C`, citing Grothendieck SGA 5 p. 355 Proposition 3.1, with the remark that the first map need not be injective. `stacks`: Lemma 6.9, Tag 05RK, lines 1264–1272: the kernel of the quotient functor is the strictly full subcategory of objects `Z` with `Z ⊕ Z'` isomorphic to an object of `B`. `qi` (arXiv v2): Lemma 2.3, 263–271; Definition 2.4, 348–355; Definition 2.5 and Lemma 2.6, 361–374; Proposition 2.7, 382; Example 2.8, 388–401; Definition 3.1 and Proposition 3.2, 419–424; Theorem 3.5, 463; Definition 4.1 and Theorem 4.2, 562–571; Definition 5.1, 780–784; Lemma 5.2, 807–812; Lemma 5.4, 882–884; Corollary 5.5, 917–920; Definition 6.1, 1132–1134; Definition 6.3, 1183–1197; Corollaries 6.5, 6.7, 6.8, 6.9, 6.10 and Theorem 6.6, 1250–1333; Definition 7.1, 1602; Proposition 7.6, 1633–1635; Corollary 7.15, 1818–1823; §9.1 and Definition 9.1, 2226–2234; the pairing into `Dᶠ(k,H)`, 2239–2242; Definitions 9.3–9.4 and "smooth basic", 2254–2272; Lemma 9.6, 2282–2283; Proposition 9.8, 2317–2318; Corollary 9.9, 2325–2327; Proposition 9.10, 2341–2346. `khovanov` (arXiv v2): integrals and Larson–Sweedler, 55–59; Proposition 1, 63–68; Proposition 2, 78–83; Proposition 3, 187–218; Lemma 1, 219–222; Corollary 1, 416–417; Proposition 5, 769–771; Proposition 7, 1083–1084. `khovanov-qi` (arXiv v3): slash cohomology, 549–554 and decomposition (20), 588–593, p. 14. `laugwitz-qi` (arXiv v4): Proposition 3.1, 513; Proposition 3.3, 600–601; factorization data and Definition 3.5, 628–635; Lemmas 3.6–3.7, 636–649; integral, 699–712; Lemmas 3.11–3.12, 720–730, 760; Definition 4.4 with (4.5) and Definition 4.5, 926–948; Definition 4.12, 1055–1056; Proposition 4.16, 1070–1072; Theorem 5.5 and Definition 5.6, 1139–1145; Lemma 5.8, 1184–1188; Lemma 5.14 and Theorem 5.15 with its proof, 1326–1367. `qi-sussan-2017` (arXiv v2): Theorem 5.5, 805–810, and the unit claim, 800–801. `erdmann-solberg-wang` (arXiv v1): integrals and `dim ∫ = 1`, 139–156; Theorem 2.2, 169–178. `fischman-montgomery-schneider` (AMS open archive): Lemma 1.5, 286–330, with `f_A(t a₁) = ε(a₁)` at 302–307 and the stable-convention identity `f_A(t₁ η(a)) = f_A(a t₁)` at 312–314. Each supports the README statement at the stated generality, with the source errata listed below.

**Adversarial table.** `H₄` is Sweedler's algebra (`g, x`; `x*` the functional dual to `x`), `T_N` the Taft algebra.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Conventions: `H ≠ 0` | `H = 0` | `ε(1) = ε(0) = 0 ≠ 1` | sound |
| §1.1 integrals of `H₄` | `Λ = (1+g)x`, `Λ' = x(1+g)` | `gΛ = gx + x = Λ`, `xΛ = xgx = −gx² = 0`; `Λg = xg + gxg = −gx − x = −Λ`; `Λ'g = xg − gxg = −gx + x = Λ'` | left and right lines distinct, `α(g) = −1` |
| §1.1 cointegral `x*` | `h = 1, g, x, gx` | `Σ φ(h₁)h₂ = 0, 0, 1, φ(gx)g + φ(1)gx = 0`; `φ(h)1 = 0, 0, 1, 0`; `ε` at `h = g`: `g ≠ 1` | right cointegral; `ε` fails |
| §1.1 `k[C₂]`, char 2 | `Λ = 1 + g` | `ε(Λ) = 2 = 0`; `gΛ = Λ` | sound |
| §1.2 Gram matrix of `x*` on `H₄` | basis `1, g, x, gx` | rows `(0,0,1,0), (0,0,0,1), (1,0,0,0), (0,−1,0,0)`, `det = ±1` | nondegenerate |
| §1.2 `S` on `H₄` | `S(x) = −gx` | `S(gx) = S(x)S(g) = −gxg = x`, so `S⁻¹(x) = gx ≠ S(x)`; `S²(x) = −x` | order 4 |
| §1.3 `ν_H` on `H₄`, `φ = x*` | `α(g) = −1`, `α(x) = 0` | `ν_H(g) = −g`, `ν_H(x) = α(g)S²(x) = x`; `φ(g·gx) = 1 = φ(ν_H(gx)g) = φ(−gxg) = φ(x)` | Hopf convention holds |
| §1.3 orientation against FMS | FMS line 312–314 | `f_A(t₁ η(a)) = f_A(a t₁)`: `φ(xη(a)) = φ(ax)`, the stable convention; `η⁻¹(a) = S²(a ↼ α'⁻¹)` with `α' = α⁻¹` gives `Σ α(a₁)S²(a₂) = ν_H` | `ν_H = ν_S⁻¹` |
| §1.3 Taft `N = 3` | `Λ_l = (1+K+K²)d²`, `dK = q⁻¹Kd` | `Λ_l K = q⁻²Λ_l`, `α(K) = q⁻² = q`; `S²(d) = K⁻¹dK = q⁻¹d`; `ν_H(K) = qK`, `ν_H(d) = q·q⁻¹d = d`; `ν_S(K) = q⁻¹K` | separates the orientations |
| §1.3 companion formula | `H₄`: `Σ φ(x₂)x₁ = φ(x)g` | `a⁻¹ = g`, `a = g`; `g S⁻²(x) g = g(−x)g = x = ν_H(x)` | agrees |
| §1.4 `T_N` not unimodular | `N ≥ 2` | `d^{N−1}K = q^{1−N}Kd^{N−1}`, `α(K) = q^{1−N} = q ≠ 1` | sound |
| §2.1 Hom action | `H₄`, `M = H₄`, `N = k`, `f = (gx)*` | Qi: `(x·f)(1) = f(S⁻¹(x)) + ε(x)f(S⁻¹(g)) = f(gx) = 1`; right-dual form: `ε(x)f(1) + f(S(x)) = −f(gx) = −1` | conventions pinned |
| §2.1 projectivity sources | the four modules | Qi 2.3 (line 263): `M⊗N`, `Hom(M,N)`, `Hom(N,M)`, `N` projective; Khovanov 2 (line 78): `H⊗M` free, `P⊗M` | citation now exact |
| §2.2 suspension | `k[d]/(d³)`, char 3 | `Λ = d²`, `H/kΛ = H/(d²)` of dim 2; `Ωk = (d) ≅ H/(d²)`, `Ω²k = (d²) ≅ k`, so `T²k ≅ k`, `Tk ≇ k` | sound |
| §3.1 injectivity | `A = 0`; `A ≠ 0`; `H ≠ 0` | `a ⊗ 1 = 0 ⟺ a = 0`; `1 ⊗ h = 0 ⟺ h = 0` when `1 ≠ 0` in `A`; `0 # H = 0` | sound |
| §3.1 `C₂` on `k[x]` | `g·x = −x` | `(1#g)(x#1) = (g·x)#g = −x#g`; plain tensor `x ⊗ g` | sound |
| §3.3 antipode-inserted formula | evaluation at `h` | `S(h)·(ab) = Σ (S(h₂)·a)(S(h₁)·b)` versus `Σ (S(h₁)·a)(S(h₂)·b)` | differ unless cocommutative |
| §4.1 null ideal | `H = A = k` | `Λ = 1`, `id = Λ·id`, `C(k,k) = 0`; with `Λ = 0` only `f = 0` is null | `Λ ≠ 0` needed |
| §4.2 non-conflation | `A = k[t]/(t²)`, `H = k` | `0 → (t) → A → k → 0` exact, not split (`A` local) | sound |
| §5.2 cofibrant vs (P) | `H = k`, `A = k[t]/(t²)`, `M = k` | `C(A,k) = 0` so `M` has (P); cofibrant ⟺ `A`-projective; `k` is not | separated |
| §5.3 Noetherian normal form | `H₄`, `h = x` | `(gx·a)#1 + (xg·a)#1 + a#x = a#x` since `xg = −gx`; `B = ⊕(1#hᵢ)A`, `BI ∩ A = I` | both directions |
| §5.3 Artinian not implied | `A = ℂ[t]`, `H = H₄`, trivial action | `Hom_D(A,A) = ℂ[t]/Λ·ℂ[t] = ℂ[t]` (as `Λ·f = ε(Λ)f = 0`), infinite-dimensional; `Hom_D(A,M) = M^H/Λ·M` finite for finite-length `M` | `A ∉ Dᶠ(A,H)` |
| §6.1 localization, `S = T` and `S = 0` | | `T/T = 0`, `K₀(T)/⟨[T]⟩ = 0`; `T/0 ≃ T`, `K₀(0) = 0` | sound |
| §6.1 non-thick witness | `T = Dᵇ(k)`, `S = {χ even}` | `k ⊕ k ∈ S`, `k ∉ S`; `X` retract of `X ⊕ X`, `T/S = 0`, `K₀(T/S) = 0`; `K₀(T)/⟨[S]⟩ = ℤ/2ℤ` | sequence fails, Check correct |
| §6.1 non-injective first map | `T = Dᵇ(fg ab)`, `S` = finite homology | `K₀(T) = ℤ` by rank (`[ℤ/p] = [ℤ] − [ℤ] = 0`); `K₀(S) = K₀(finite ab)` free on `[ℤ/p]` by the homology Euler characteristic; `T/S ≃ Dᵇ(fg ab/finite) ≃ Dᵇ(ℚ-vs)`, `K₀ = ℤ`; `ℤ → ℤ` rank-preserving iso, kernel `0` = image | exact at `K₀(T)`, `K₀(T/S)`; first map zero |
| §6.1 route: thick kernel | Stacks 05RK | `Ker Q = {Z : Z ⊕ Z' ≅ object of S}`; `S` thick so `Ker Q = S`; `Q(f)` iso ⟺ `Q(cone f) ≅ 0` ⟺ `cone f ∈ S` | `[X] mod ⟨S⟩` constant on `T/S`-isomorphism classes |
| §6.1 `K₀` of `k[d]/(d²)`, graded | `0 → k{1} → H → k → 0` | `[H] = (1+q)[k] = 0`, `K₀ = ℤ[q,q⁻¹]/(1+q)` | sound |
| §6.1 finite-target pairing | `k = 𝔽₂`, `A = k(t)`, `P = M = A` | `RHom = A`, `d = 0`, stable invariants `A`, infinite-dimensional | not in `Dᶠ(k,H)` |
| §6.1 `A = k × k`, `H = k[d]/(d²)` | formula vs direct | `K₀(H-stmod) = ℤ/2` (`2[k] = [H] = 0`, `dim mod 2` detects `[k]`); `K₀(A) ⊗ ℤ/2 = (ℤ/2)²`; `D(A,H) = H-StMod²` | agree |
| §7.1 obstruction | `char k ≠ 2` | `Δ(d²) = 2 d⊗d ≠ 0`; super: `d⊗d − d⊗d = 0`; `H₄`: `(dg+gd)⊗d = 0` | sound |
| §7.2 characteristic forced | `p` prime | coefficient of `d ⊗ d^{p−1}` in `Δ(d^p)` is `p`, a basis vector of `H ⊗ H` | record forces `char k = p` |
| `slashHomology_subsingleton_iff_projective` | `p = 3`: `k`, `k[d]/(d²)`, `H₃` | `(H^{/0}, H^{/1}) = (k, 0), (kd, k), (0, 0)`; `k[d]/(d²)` has dim 2, not free over `H₃` | both directions; junk `p − j − 1 ≥ 1` for `j ≤ p − 2` |
| §7.2 `k[d]/(d⁴)`, char 2 | `(d⊗1+1⊗d)⁴` | `= d⁴⊗1 + 1⊗d⁴`; `1+q+q²+q³ = (1+q)(1+q²) = Φ₂Φ₄ ≠ Φ₄` | sound |
| §7.3 Nichols/Taft | `N = 1`; `q = 1`, char 0; `N = 4` | `k`; `k[d]`; `Φ₂Φ₄` | sound |
| §8.1 orders | `n = 4`: `m = 2`, `N = 8`, `n₁ = 2` | `ξ₁ = q²` order 4, `q⁴` order 2 = `p₁`; dim `N·m = 16`; `n = 6`: `N = m = 6`, dims 6 and 36 | sound |
| §8.2 `n = 30` | `(n_k) = (15,10,6)` | `v₁ = Φ₂Φ₆Φ₁₀Φ₃₀`, `v₂ = Φ₃Φ₆Φ₁₅Φ₃₀`, `v₃ = Φ₅Φ₁₀Φ₁₅Φ₃₀` (degrees 15, 20, 24); gcd of `w₁, w₂, w₃` is `Φ₆Φ₁₀Φ₁₅Φ₃₀²`, degree `2+4+8+16 = 30` | rank 30 ≠ 8 |
| §8.2 `n = 6`, `n = 12` | `(w₁, w₂)` | `n = 6`: `(Φ₂Φ₆, Φ₃Φ₆) = Φ₆·(Φ₂, Φ₃)`, `(1+ν+ν²) − ν(1+ν) = 1`; `n = 12`: `x = Φ₃Φ₆ = 1+ν²+ν⁴`, `y = Φ₄ = 1+ν²`, `x − ν²y = 1` | `(w) = (Φ_n)` for `t = 2` |
| §8.2 `n = 4`, `t = 1` | `I₁` projectives | `v₁ = 1 + ν² = Φ₄`; the `t ≥ 2` formula with `w₁ = 1` gives `0` | sound, scoped |
| §8.2 `t ≥ 3` | `Φ_n ∣ v_l` for all `l` | `Φ_n^{t−1} ∣ w_k`; `ℤ[ν,ν⁻¹]/(w) ↠ ℤ[ν,ν⁻¹]/(Φ_n²)` with `Φ_n(ν) ≠ 0` | not cyclotomic |
| Lean `IsRightCointegral`, `SmashCompatible`, `LeftModuleAlgebra.act_mul` | any `Repr` | each sum factors through `comul h`, independent of the representation | well-defined |
| Lean `hMod_abelian_isFrobenius` universe | `pp.universes` | `ModuleCat.{u_1, u_2} H`, `k : Type u_1` | matches Conventions |
| Lean `SmashProduct` | pure tensors | `pure_equiv`, `mul_pure` and bilinearity determine the product; `includeA`, `includeH` fixed by `pure` | determined |

**Citations resolved on main this round:** QuantumGroups Q8 item 5; StablePeriodicCurved Layers 0 and 1 and its line 38; DGAInfinity Layers 0, 1, 5 and 7; GrothendieckEulerForms Layer 6 and its exclusions. The `roadmaps resolve` lead (`TruncatedPrimitive.moduleDifferential`) is this roadmap's own declaration at `Suggested.lean:292`, not a missing name.

## Not verifiable

- **Larson–Sweedler (1969)**, Amer. J. Math.: paywalled; cited through Erdmann–Solberg–Wang and Khovanov, both read at the lines above.
- **Grothendieck, SGA 5, p. 355, Proposition 3.1**: Springer LNM, paywalled; cited through Chebolu (3), read at `chebolu` lines 464–466.
- **Montgomery, CBMS 82** and **Radford (1985)**, J. Algebra: not read; cited as background. **Majid (q-alg/9512028)** and **Kapranov (q-alg/9611005)**: on arXiv, cited without locators as background; not read.
- Ownership against open pull requests was checked with `roadmaps grep` over the index of 2026-11-03; pull requests opened after that index were not searched.

## Source issues

- **Misprint** in qi at Example 2.8, printed p. 10: the source says the smash product carries a right `H`-module algebra structure through the coaction `ΔB`; it should say right `H`-comodule algebra, as in its Definition 2.4; affects nothing.
- **Error** in qi at Corollary 6.5 and Corollary 6.8, printed pp. 31–33: the source says every module with property (P), a notion defined up to isomorphism in `C(A,H)`, is cofibrant; it should say every module satisfying (P1)–(P3) on the nose, since `A/(t)` over `k[t]/(t²)` with `H = k` has property (P) and is not cofibrant; affects a stated result.
- **Error** in qi at §9.1, printed p. 57: the source says the derived Hom pairing lands in `Dᶠ(k,H)` for every Noetherian `A`; it should land in `H-StMod`, or in `Dᶠ(k,H)` when the finite-length modules are finite-dimensional over `k` (`A = k(t)` over `𝔽₂` refutes it); affects a stated result.
- **Error** in laugwitz-qi at Theorem 5.15 and its proof, printed pp. 27–28: the source says `K₀(O_n) ≅ ℤ[ν,ν⁻¹]/(Φ_n)` for every `n ≥ 2`, passing from the ideal `(w₁,…,w_t)` to the gcd of its generators; it should be `ℤ[ν,ν⁻¹]/(w₁,…,w_t)`, cyclotomic only when `n` has at most two prime factors (`n = 30` has rank 30); affects a stated result.
- **Error** in qi-sussan-2017 at §5.2, paragraph before Theorem 5.5, printed p. 16: the source says `[n]` is a unit in `O_p` whenever `p ∤ n − 1`; it should require `p ∤ n`, since `[p] = 0`; affects nothing in Theorem 5.5.
