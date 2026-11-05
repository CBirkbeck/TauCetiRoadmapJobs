<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2334#issuecomment-6666841037 -->
Review (claude) of 2fc9416

Verdict: needs_changes

1. **F01** (P1) §0.8 API bullet "Δ(W,V) contains V^{I₁}" is false

   **Location.** README §0.8, API, second bullet: "`Δ(W,V)` contains `V^{I₁}` when `W` generates `V`
   (VIGNERAS11, §5, Proposition 9)."

   **Claim.** For every finite-dimensional smooth `k[KZ]`-module `W` with central character and every
   `G`-equivariant surjection `q : c-Ind_{KZ}^G W → V`, the obstruction space `Δ(W,V) = q(I⁺(W)) ∩
   q(I⁻(W))` contains the `I₁`-invariants of `V`.

   **Witness.** The section's own first Check: for `q` the identity of `V = c-Ind_{KZ}^G W`, `W`
   generates `V` and `Δ = 0` (the two cells `P⁺KZ` and `wP⁺KZ` are disjoint, HU12 line 1039 and
   VIGNERAS11 line 808, Lemme 11), while `V^{I₁} ⊇ {[1, v] : v ∈ W^{I₁}} ≠ 0` because `W^{I₁} ≠ 0` for
   the pro-`p` group `I₁`. So `V^{I₁} ⊄ Δ(W,V)`: the bullet contradicts the Check (adversarial rule 10).
   The cited source has the same defect: VIGNERAS11 line 827, Proposition 9, asserts that
   `Δ_V(V₀)` contains `V₀^{I₁}` for every generating `V₀`, with a one-line proof (line 833) that
   `V₀^{I₁}` lies in `ω⟨B⁺V₀⟩`; the compact induction itself refutes it. The true statement is
   Hu's: for `π` an admissible nontrivial quotient of `c-Ind_{KZ}^G σ`, `π^{I₁} ⊆ I⁺(σ,π) ∩ I⁻(σ,π)`
   (HU12 line 1167, Corollaire 3.9, p. 19; used in Proposition 3.30(i), line 1742). Admissibility is
   what the compact induction lacks.

   **Repair.** Replace the bullet by: "For `σ` an irreducible `KZ`-weight and `V` a nonzero admissible
   quotient of `c-Ind_{KZ}^G σ`, `Δ(σ,V)` contains `V^{I₁}` (HU12, Corollaire 3.9, p. 19)." Add the
   negative-control Check: "Admissibility is needed: for `q` the identity of `c-Ind_{KZ}^G W`, `Δ = 0`
   while `V^{I₁} ⊇ [1, W^{I₁}] ≠ 0`." Tested on the refuting instance: `c-Ind_{KZ}^G σ` is not
   admissible (`V^{I₁}` is infinite-dimensional, README §0.1 last Check), so the repaired bullet does
   not apply to it. Also drop "VIGNERAS11, §5, Propositions 9–10" from the statement sentence's
   support for the containment; keep Proposition 9 for `IZ`- and `w`-stability and Proposition 10
   (line 835) for `Δ ≠ 0` when `V ≠ 0`, which are correct.

2. **F02** (P2) §2.2 proves the `F ≠ ℚ_p` Steinberg statement from a `ℚ_p`-only theorem

   **Location.** README §2.2, route: "the Steinberg and character statements follow from the sequence
   `0 → χ∘det → Ind_{B̄}^G(χ⊗χ) → St⊗χ∘det → 0` and Emerton's computation (EMERTON2, Theorem 4.2.12,
   cited in CDN23, Proposition 1.30(b))."

   **Claim.** For `F ≠ ℚ_p`, `Ord_B(St ⊗ χ∘det) ≅ χ ⊗ χ` and `R¹Ord_B(St ⊗ χ∘det) = 0`.

   **Witness.** EMERTON2 line 1253 opens "4. The case of GL₂(ℚ_p)", and Theorem 4.2.12 (line 1497)
   is stated for smooth characters `χ : ℚ_p^× → k^×`. CDN23 line 891 justifies 1.30(b) only by
   "[30, th. 4.2.12]". So the route's named input does not exist at the generality used (adversarial
   rule 8). The long exact sequence alone gives, with `R¹Ord_B(Ind) = 0` (HAUSEUX line 1350,
   Corollaire 4.2.4(ii), through the injection `R¹Ord → H¹Ord`, EMERTON2 line 1179), only
   `0 → Ord(χ∘det) → χ⊗χ → Ord(St⊗χ) → R¹Ord(χ∘det) → 0` and `R¹Ord(St⊗χ) ↪ R²Ord(χ∘det)`; neither
   `R¹Ord(χ∘det) = 0` nor the vanishing of the last term is supplied by a cited input.

   The statement is true; here is a route valid for every `F` (I checked each step):
   `Ind_{B̄}^G U` restricted to `N₀ = N(𝒪_F)` is `k·1 ⊕ C_c^∞(F) ⊗ U` by the Bruhat decomposition
   `B̄\G = ℙ¹(F) = F ⊔ {∞}`, and `C_c^∞(F)|_{N₀} ≅ ⊕_{F/𝒪_F} C^∞(N₀)` is a direct sum of injective
   smooth `N₀`-modules, so `H^i(N₀, Ind) = H^i(N₀, k) ⊗ U` for `i ≥ 1`, the map from `H^i(N₀, χ∘det)`
   being an isomorphism; the long exact sequence then gives `H^i(N₀, St ⊗ χ∘det) = 0` for all `i ≥ 1`,
   hence `H^iOrd_B(St ⊗ χ∘det) = 0` for `i ≥ 1` and `R¹Ord_B(St ⊗ χ∘det) = 0` by the injection
   `R¹Ord ↪ H¹Ord`. For `χ∘det`, `H¹(N₀, k) = Hom(𝒪_F/p, k)` and the Hecke operator of a strictly
   contracting `t` acts by precomposition with multiplication by `ϖ^{ef−1}·(unit)` on `𝒪_F/p = 𝒪_F/ϖ^e`,
   which is nilpotent exactly when `(e, f) ≠ (1, 1)`; so `R¹Ord_B(χ∘det) ↪ H¹Ord_B(χ∘det) = 0` for
   `F ≠ ℚ_p` (and is `ω⁻¹ ⊗ ω`-nonzero for `F = ℚ_p`, matching HAUSEUX 4.2.4(i) and EMERTON2
   4.2.12(3)), and `Ord_B(χ∘det) = 0` by the `q^m` computation already in the §2.1 Check. The sequence
   now gives `Ord_B(St ⊗ χ∘det) ≅ χ ⊗ χ`.

   **Repair.** Rewrite the §2.2 route to name these inputs: the `N₀`-decomposition of smooth induction
   (SmoothRepresentationsOfLocalGroups *smooth-induction*, *mackey-filtration*), injectivity of
   `C^∞(N₀)` among smooth `N₀`-modules (SR.0d.1), the vanishing `H^i(N₀, St ⊗ χ∘det) = 0` for `i ≥ 1`
   as a stated target of §2.2 with the Bruhat-cell proof above, the nilpotence of the Hecke action on
   `H¹(N₀, k)` for `F ≠ ℚ_p` as a Check with the `ϖ^{ef−1}` value, and EMERTON2 Remark 3.7.3 for
   `R¹ ↪ H¹`. Keep EMERTON2 Theorem 4.2.12 only as the `F = ℚ_p` consistency Check. Record the CDN gap
   under Source issues (done below). Tested on the instance that exposed it: `F = ℚ_{p²}`, `e = 1`,
   `f = 2`, the Hecke operator on `Hom(𝒪_F/p, k)` is precomposition with multiplication by `ϖ·u`,
   nilpotent of order two, so `H¹Ord_B(χ∘det) = 0` and `Ord_B(St ⊗ χ∘det) ≅ χ ⊗ χ`, as §2.2 and the
   Layer 2 Examples assert.

3. **F03** (P3) six PadicLocalLanglandsForGL2Qp Lean names exist nowhere at its head

   **Location.** README, Scope and ownership ("the coefficient-linear Pontryagin duality
   `DualitySupport.torsionDual`: §0.3"), supplier contract "From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp"
   ("§0.3: `DualitySupport.torsionDual`"; "§2.7: `SerreWeight`, `compactInduction`, `heckeOperatorT`,
   `endEquivPolynomial`, `compactInduction_free` for `F = ℚ_p`").

   **Claim.** These are declarations of PadicLocalLanglandsForGL2Qp.

   **Witness.** `roadmaps show PadicLocalLanglandsForGL2Qp` (head 84416ad, 2616 README lines, 164 Lean
   lines): none of the six strings occurs in its README or `Suggested.lean`. §0.3 (README line 268)
   describes the torsion dual `Hom_O(M, L/O)` in prose; §2.7 (line 854) describes "the normalized Hecke
   operator, written `T`" in prose. The five Hecke-side names are declared, for every local field, by
   FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 (head 9856719, README lines 8244–8246), which
   itself attributes the `ℚ_p` case to PLL §2.7 by the same stale names. `roadmaps grep torsionDual`
   finds only consumers (SelmerIwasawaCohomology, CompletedCohomologyPartII), no owner.

   **Repair.** In the three places, cite PLL §0.3 as "the coefficient-linear torsion dual
   `Hom_𝒪(M, L/𝒪)` of §0.3" without a backticked name, and attribute `SerreWeight`,
   `compactInduction`, `heckeOperatorT`, `endEquivPolynomial`, `compactInduction_free` to
   FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 (which covers `F = ℚ_p`), keeping PLL §2.7 for
   the classification, admissibility, finite presentation and Galois descent only. Checked: after the
   change every backticked supplier name in the README resolves (FFG R07.5.15 lines 8244–8246).

4. **F04** (P3) `TauCeti.exists_isProjectiveCover_of_finiteDimensional` does not exist at the pin

   **Location.** README, Scope and ownership (last bullet), "From Tau Ceti" (second bullet), Layer 5
   header, §5.3, §5.5, §8.4 *Needs:*.

   **Claim.** Tau Ceti provides `TauCeti.exists_isProjectiveCover_of_finiteDimensional` in
   `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean`.

   **Witness.** At the pinned Tau Ceti, `Algebra/Module/ProjectiveCover/Existence.lean` declares
   `exists_isProjectiveCover_comp_subtype` (line 94), `exists_isProjectiveCover` (line 182,
   `[IsSemiprimaryRing R]`) and `exists_isProjectiveCover_of_finite` (line 195: `K` Artinian, `A` a
   ring finite over `K` with `IsScalarTower K A A`, every `A`-module `V` has a projective cover); no
   declaration contains `finiteDimensional`. The worker's `citations.md` had flagged this name.

   **Repair.** Replace the name everywhere by `TauCeti.exists_isProjectiveCover_of_finite`
   (`TauCeti/Algebra/Module/ProjectiveCover/Existence.lean`, line 195) and state its hypotheses in the
   contract: a finite-dimensional algebra over a field is finite over the Artinian ring `k`, and the
   theorem asks no finiteness of the module. Checked: `P_σ = Proj_Γ σ` for `k[GL₂(k_F)]` is an instance.

5. **F05** (P3) four supplier and source locators point beside the statement

   **Location and witnesses.**

   - README §0.5: "(SHOTTON20, Theorem 5.1 and Corollary 5.2; …)" for `G′ = GL₂(F)/ϖ^ℤ`. SHOTTON20
     line 483 sets `G′ = SL₂(D)` and Theorem 5.1 (line 502) is about that group; the `G′ = GL₂(F)/ϖ^ℤ`
     statement comes from Corollary 5.2 (line 506, locally `Z`-finite representations of `GL₂(D)`)
     with Lemma 2.8 (line 198), as CDN23 Remarque 1.4(ii) (line 471) says. Repair: cite "SHOTTON20,
     Theorem 4.5, Corollary 5.2 and Lemma 2.8; CDN23, Proposition 1.3 and Remarque 1.4(ii)", and
     move Theorem 5.1 to the `SL₂(ℚ_p)` example of Layer 0.
   - README §2.2 *Needs:* "PotentialAutomorphyInfrastructure §3.7 (derived version)" and Scope
     "…and their derived functors: PotentialAutomorphyInfrastructure §3.7". At head 0f3131e, §3.7
     (line 1270) is the underived `LocalOrdinaryParts`; the derived functor `RΓ(N, −)` and `ord` on
     the derived category are §3.12 "Derived ordinary comparison" (line 1322). Repair: cite §3.12 for
     the derived version in both places.
   - README "From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa", §F.1 bullet: "…and canonical
     dimension `gldim(R) − j_R(M)` with value `−∞` on the zero module". At head e311e48, F.1 (line
     436) defines `iwasawaGrade`; canonical dimension with `−∞` on zero is §0.11 (line 501). Repair:
     move the canonical-dimension clause to the §§0.10–0.11 bullet; §4.1's *Needs:* already lists
     §§0.10–0.11.
   - README §4.5 and the DeformationAndDerivedPatchingAlgebra contract: "§3.4: regular-sequence
     ideals, complete intersections, and the fact that complete intersections are Cohen–Macaulay".
     At head 1548fe7, §3.4 (line 627) defines regular-sequence ideals and complete intersections and
     states no Cohen–Macaulay property; DDPA's scope (line 13) assigns Cohen–Macaulay modules and rings
     to SchemeAndStackFoundations §0.17 (on main, README line 1138). Repair: cite DDPA §3.4 for the
     regular sequence and SchemeAndStackFoundations §0.17 for Cohen–Macaulayness; the Krull-dimension
     and regular-sequence facts of §4.5 are unaffected (BHHMS23 line 2812 proves the Cohen–Macaulay
     claim from the regular sequence `(e_j f_j)` directly).

Files reviewed: `packages/ModpRepresentationsOfGL2OverLocalFields/README.md`, `Suggested.lean`,
`metadata.toml`, `sources.toml`. Previous review: none. Five findings, two blocking (one P1, one
P2), three P3. Elaboration passes with the six `sorry` warnings only; the dependency check is clean;
no padding in `Suggested.lean`.

## Verified sound

**Principles.** No route-specific shortcut (every `F/ℚ_p` for Layers 0 and 2; unramified `F` for
Layers 3–9 is the sources' scope, stated in Conventions); no re-planned roadmap (the smooth category,
`GL₂(ℚ_p)` classification, ordinary-part Hecke action, Iwasawa-algebra homology and finite-dimensional
algebra structure are imported by section); no copied passage; no algorithm; no `set_option`,
`lemma`, sorry'd data, `#eval` or process residue in README or Lean (grepped). Imports: the single
`import Mathlib`; no Tau Ceti module is needed.

**Elaboration.** `lake env lean packages/ModpRepresentationsOfGL2OverLocalFields/Suggested.lean`
from the content checkout: exit 0, six warnings `declaration uses 'sorry'` (lines 99, 116, 128,
146, 161, 175), nothing else. The elaborated types of the 11 declarations (`signatures.md`) were
compared with the README statements of §§0.1, 0.3, 0.5, 1.3, 1.5, 1.6, 2.4: every hypothesis in the
README sentence is in the signature and conversely; no section binder is lost (the `def`s mention
every instance they use).

**Padding probe.** A scratch copy with each `sorry` replaced by `first | rfl | infer_instance |
simp` fails at all six theorems (errors at lines 109, 122, 140, 153, 169, 183 of the copy): none
closes in one tactic, none restates a definition, mirrors a Check or computes a value. The four
definitions and the abbreviation have real bodies on Mathlib carriers.

**Headline theorems.** From the Summary: coherence for `GL₂(F)/ϖ^ℤ` (stated:
`isFinitelyPresented_ker`); finite type ⇒ finite presentation, finite cosocle ⇒ finite length,
finite length ⇔ finite-dimensional smooth dual, all for `GL₂(ℚ_p)/p^ℤ` (stated: three theorems);
admissible finitely presented ⇒ finite length for every `F`, with the subobject property (stated:
two theorems); the finite-error ordinary counit and its Banach version, the `F ≠ ℚ_p`
constituent description, the Gelfand–Kirillov bound `dim ≤ f`, the Iwahori criterion, the lattice
reduction `R/pR ≅ Proj_{K/Z₁}σ/𝔪_{K₁}²` with commutative endomorphisms and relative projectivity
(named in the module docstring as not statable, with the missing carriers: `Ord_B`, smooth
parabolic induction, Gelfand–Kirillov dimension of the dual over an Iwasawa algebra, labelled Serre
weights, `W(ρ̄)`, `D₁(ρ̄)`, pseudocompact projective truncations). I agree these are not statable at
the pins without heavy definitions (a canonical dimension over `TauCeti.completedGroupAlgebra`
needs the Pontryagin dual as a compact module and the labelled weights need `GL₂(𝔽_q)`
representation theory absent from both libraries).

**Adversarial table** (sampled targets, headline theorems, and the targets of R01–R05).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `IsTorsionAdmissible` (§0.1) | `H` trivial, `V = L/𝒪`; `V = ⊕_ℕ k`; `V = 0`; `H = GL₂(ℚ_p)`, `V = c-Ind_{KZ}^G σ` | `(L/𝒪)[p^j]` length `j·e` finite; `(⊕k)^H[p] = ⊕k` infinite length; `0` admissible; `(c-Ind σ)^{I₁}` infinite-dimensional | agrees with the four Checks; `V^U[p^j]` vs CDN's `V^U[𝔪^j]`: `(p) = 𝔪^e` so the two families of submodules are cofinal | none |
| `IsFinitelyPresented` (§0.3) | `H = {1}`; `V = 0` (`W₁ = W₂ = 0`); `V = c-Ind_U^H W` (`0 → V → V → 0`); `H = ℚ_p`, `V = k[ℚ_p/ℤ_p]` | finite-length `A`-modules exactly; zero rep via `Rep.of` of `PUnit` with `IsFiniteLength`, `IsSmoothRep` (stabiliser `⊤`); `k[ℚ_p/ℤ_p]` f.p. but `k[ℚ_p]`-augmentation kernel not finitely generated | matches CDN line 441 and Shotton Definition 2.3 (finite rank `W` and finite length `W` agree for torsion `V`: tensor the presentation with `A/𝔪^n`) | none |
| `GL2ModScalar F ϖ` | `ϖ` uniformiser; `ϖ = 0`; `ϖ` a unit | normal closure of a central element is the cyclic group it generates; for `ϖ = 0` the defining set is empty, quotient `= G`; `Irreducible ϖ` excludes `0` and units | the `ℚ_p` theorems use `ϖ = p`; `isFinitelyPresented_ker` has `Irreducible ϖ` | none |
| `smoothDualSpan` (§1.6) | `V = k` trivial; `V = St`; `V = I(σ)` | span `= k`, dim 1; no nonzero smooth functional (KOHLHAASE17 Prop 3.9, line 660), span `0`; finitely supported functionals smooth, infinite-dimensional | the smooth functionals already form a subspace, so the span is harmless | none |
| `isFinitelyPresented_ker` (§0.5) | `G′ = GL₂(F)/ϖ^ℤ`, `f = T` on `c-Ind_{KZ}^G σ`; `F = ℚ_p`; `L` ramified | `ker T = 0` (freeness over `k[T]`), finitely presented; Shotton's `A` = complete local noetherian `W(𝔽)`-algebra (line 88) admits `𝒪_L`; `G₀ = {det ∈ 𝒪^×}` has index 2 in `G′` and `G₀ ∩ ϖ^ℤ = 1`, so Lemma 2.8 applies without Hypothesis Z | Shotton Cor 5.2 + CDN Rem 1.4(ii) prove the statement; locator slip only | R05 |
| `isFinitelyPresented_of_finite` (§1.3) | `V = I(σ)`; `V` irreducible supersingular; `F ≠ ℚ_p` | `I(σ)` f.p. by `0 → I(σ) → I(σ) → 0`; irreducibles f.p. by PLL §2.7; for `F ≠ ℚ_p` a supersingular is of finite type and not f.p., excluded by `ℚ_[p]` in the signature | matches CDN line 731 (Proposition 1.20) | none |
| `isFiniteLength_of_bounded_semisimple_quotients` (§1.5) | `N = 0`; `V = π ⊕ π`; `V = I(σ)`; `X = ⊤` | `N = 0` forces `V = 0` (a nonzero finitely generated module has a simple quotient); `π ⊕ π` has semisimple quotient of length 2, so `N ≥ 2`; `I(σ)/(P(T))` over infinitely many irreducible `P` gives unbounded semisimple quotients; `X = ⊤` contributes length `0 ≤ N` | bounded length of semisimple quotients ⇔ `V/rad V` semisimple of finite length, for finitely generated `V` (intersection of finitely many maximal submodules); CDN line 737 states "cosocle admissible (equivalently finite length)" | none |
| `isFiniteLength_iff_finite_smoothDualSpan` (§1.6) | `V = k`; `V = St`; `V = I(σ)`; `V = ⊕_ℕ St` | (length 1, dual dim 1); (length 1, dual 0); (infinite, infinite); (`⊕St` infinite length, dual 0, excluded by `Module.Finite`) | both directions agree with CDN line 787 (Théorème 1.24); the reverse direction's `p < 5` input is the declared gap | none |
| `isFiniteLength_of_admissible_of_finitelyPresented` (§2.4) | `V = c-Ind_{KZ}^G σ`; supersingular `F ≠ ℚ_p`; `V = St`; `V = χ∘det` | not torsion-admissible, excluded; admissible, not f.p., excluded; `St` admissible and f.p. as the subrepresentation of `I(1)/(T−1)` with finitely generated complement, length 1; character: `Δ = k`, kernel generated by one element | CDN line 823, Théorème 1.26(i), for `𝒞 = Rep^adm G ∩ Rep^pf G` over `𝒪_L`, group `G = GL₂(F)` as in the Lean | none |
| `isFinitelyPresented_subrepresentation_of_admissible` (§2.4) | `W = 0`; `W = V`; `W = St ⊂ I(1)/(T−1)` | `0` f.p. (`W₁ = W₂ = 0`); `V` itself; `St` f.p. | CDN Théorème 1.26(ii) via Vignéras 5.5(i) (line 828) | none |
| §0.8 `Δ(W,V)` | `q = id`; `W = k`, `q` augmentation; `V` admissible quotient of `c-Ind σ` | `Δ = 0` while `V^{I₁} ≠ 0`; `Δ = k`; `V^{I₁} ⊆ Δ` by HU12 Cor 3.9 | API bullet 2 false | **R01** |
| §2.1 `Ord_B` | `V = χ∘det`; `V = Ind_B^G(χ₁⊗χ₂)`; `V = 0` | `[N₀ : tN₀t⁻¹] = q^m ≡ 0`, so `Ord = 0`; `w`-conjugation gives `Ord_B = χ₂⊗χ₁`; `0` | definitions agree with EMERTON1 lines 686–781 (for `M = T` abelian, `Hom_{A[T⁺]}(A[T], −)` is Emerton's `Hom_{A[Z_M^+]}(A[Z_M], −)` by (3.1.8)); adjunction is Theorem 4.4.6 (line 1759) with the opposite Borel | none |
| §2.2 `R¹Ord_B` | `F = ℚ_p`, `V = 1`; `F = ℚ_{p²}`, `V = χ∘det`; `V = St ⊗ χ∘det`, any `F` | Hecke on `Hom(𝒪_F/p, k)` is precomposition by `ϖ^{ef−1}u`: `ef − 1 = 0` (ℚ_p, invertible, `R¹Ord(1) = ω⁻¹⊗ω`), `ef − 1 = 1` (ℚ_{p²}, nilpotent, `R¹Ord = 0`); `H^i(N₀, St⊗χ) = 0` for `i ≥ 1` from `Ind|_{N₀} = k ⊕ ⊕ C^∞(N₀)` | statements true; cited route valid only for `ℚ_p` | **R02** |
| §2.3 finite obstruction | `V = c-Ind σ` (Δ = 0, infinite length); `V = χ∘det`, `W = k` | first excluded by properness/admissibility; `Δ = k`, kernel cyclic | HU12 Thm 4.3 (line 1825, no admissibility), Prop 4.4 (line 1900), Lemme 4.5 (line 1926, general `W`, `π` finite type with central character), Cor 3.31 (line 1759, admissible) | none |
| §2.5 counit | `V = Ind_{B̄}^G(χ₁⊗χ₂)`; `V = χ∘det`; `V = St⊗χ∘det` | counit iso; cokernel `V` one-dimensional; kernel `χ∘det` | CDN Lemmes 1.31–1.32, Prop 1.33 (lines 894–916) | none |
| §2.6 Banach approximation | `Π = Ind(χ)`, `Θ` induced lattice; `Π = L`, `Θ = 𝒪` | `σ = χ`, iso; `σ = 0` (`Ord(1) = 0`), cokernel `𝒪` | CDN Corollaire 1.34 (line 917): `σ` finite over `𝒪_L`, kernel and cokernel finite over `𝒪_L` | none |
| §3.2 `t_λ` | `f = 1`, `p = 17`, `λ = (5,0)`, `ω = −1, 1`; `f = 2`, `ω = (1,0)` | `(0,−11) → Sym^{11}⊗det^5` (`−11 ≡ 5 mod 16`); `(−1,−10) → Sym^9⊗det^6`; `((6,0),(−1,−10))` with the branch read at `i+1` | equation (14) (BHHMS23 line 705) and `Λ_W^μ = {0 ≤ ⟨μ+ω, α^∨⟩ < p−1}` (line 684) | none |
| §4.5 `C_J(k)` | `J = ∅`; `|J| = 1`; `i ≠ j` | `k`, dim 0; `k[X,Y]/(XY)` dim 1 (minimal primes `(X)`, `(Y)`); `X_iY_j ≠ 0` | Theorem 5.3.4(ii) (line 2792): generators `e_jf_j`, `h_j` of degree 2 and trivial `H`-weight (`α_jα_j^{−1} = 1`) | none |
| §5.1 Iwahori extensions | `p = 5`, `f = 1`; `p = 17`, `f = 1`; orientation | `α` of order 4, `α² = α^{−2}`, so `χα²` has multiplicity 2 in `W_{χ,3}` (equation (44), line 2842: `α_iα_j` and `α_i^{−1}α_j^{−1}` both occur); `gr¹` weights `α^{±1} ≠ 1`; `e_i` of weight `α_i` (line 2788), `K₁`-trivial iff `χ′ = χα_i` (Lemma 6.1.1(ii), line 2906) | the `p > 5` qualification of the README is correct and the printed "at most one" (line 2855) fails at `p = 5`, `f = 1` | none (Source issue) |
| §6.6 `W` | `f = 1`; opposite neighbour `F(t_λ(−ε_jη_j))` | length `2 + 2 = 4`; multiplicity `δ_{F(λ),τ} = 0` so absent | Theorem 6.3.11 (line 3434): `λ` 7-deep, (i)–(v) as restated | none |
| §6.7 `V_σ` | `f = 1`; `Σ⌊a_i/2⌋ ≤ 1` | `V_σ = W`, length 4, constituents `a ∈ {0,1,2,3}`; `V^{K₁} = ⊕ D_{0,σ}^{m_σ}` | Corollaries 6.3.13 (8-deep, line 3505) and 6.3.15 (line 3610) | none |
| §7.2 vanishing on `soc W` | `W = χ` (Loewy length 1); `p = 7`, `r = 3`; `p ≤ 5` | adjunction `χ → Ind χ` nonzero; `2 < 3 < 4`; empty range | Proposition 6.4.1 (line 3621) hypotheses match | none |
| §7.3 connectedness | `f = 1`, `p = 17`: `{1, α²}`, `{1, α, α²}` | `soc W_{1,3} = {α², α^{−2}, 1, 1}`; middle `α` absent/present; pairs `(α²,1)` via `α`, `(α,1)` imposes nothing since `1 ∉ soc W_{α,3} = {α³, α^{−1}, α, α}` | Lemma 6.4.3 (line 3673) is for 6-generic `ρ̄`; README restricts to tame, consistent with its §3.5 and with Theorem 6.4.7 (line 3816, tame) | none |
| §8.3 `ψ_λ` | `p = 11`, `r = 3`; `r = 0`; `r = p − 2` | eigenvalues `−2r = 5`, `4`, `2(r+2) = 10`; `−2r = 0`; `2p = 0` | lines 4012–4034: `ψ(e⊗v) = −2r e⊗v`, `ψ(d(v)) = 4 d(v)`, `ψ(w) = 2(r+2) w` with `w = e⊗f²v + (r−1)h⊗fv − r(r−1)f⊗v` | none |
| §9.2 cyclic Hom | `τ = σ`; left vs right structure | `End(T_σ)` cyclic on `id`; precomposition `ϕ_τ ∘ h` is the source's module structure (line 4271) | Lemma 7.4.2 under `5 < r_i < p − 7` (line 4256) | none |
| §9.3 relative projectivity | `Q = T_σ`; `Q = σ` | projectivity among `A₁`-modules; `Hom(σ,σ) = k = Hom(T_σ, σ)` | Proposition 7.4.3, Remark 7.4.4 (lines 4273–4278) | none |
| §9.1 `dim End` | `f = 1` | `[R/pR : σ] = 2 + (2 + 0 + 0) = 4 = 2^1·2` | line 4251–4254 | none |
| §4.6 `W_{χ,n}` dimensions | `f = 1`, `f` general | `gr² = 2f + f(f+1) + f(f−1) = 2f² + 2f`; `dim W_{χ,3} = 1 + 4f + 2f²`, `= 7` at `f = 1` | equation (44) | none |

**Sources.** Sampled locators verified at the text: `0.8` (HU12 §3.1.1 line 1025, p. 17; §3.3 line
1719, p. 30; VIGNERAS11 Propositions 9–10, lines 827–836), `2.1` (EMERTON1 Definitions 3.1.3,
3.1.9, lines 686, 780; Lemma 3.1.7 line 753; Theorem 4.4.6 line 1759; Lemma 2.3.4 line 361;
Proposition 4.3.4 line 1607; CDN23 §1.5.2 lines 865–879), `2.3` (HU12 lines 1825, 1900, 1926, 1734,
1759; VIGNERAS11 Proposition 8 line 783), `2.5` (CDN23 lines 894–916), `2.6` (CDN23 line 917),
`3.2` (BHHMS23 lines 702–708, 768, 786), `4.5` (line 2792), `5.1` (lines 2900–2913, 2842–2856),
`6.6` (line 3434), `6.7` (lines 3505, 3610), `7.2` (line 3621), `7.3` (lines 3668, 3673), `8.3`
(lines 3998, 4052), `9.2` (line 4259), `9.3` (lines 4273, 4277). Headlines: CDN23 lines 463–474,
731, 737, 787, 823–834; SHOTTON20 lines 88, 112, 469, 502, 506. Unsampled locators checked for
existence and page: HW22 Lemma 2.10 p. 12, Theorem 2.23 and Corollaries 2.25–2.26 p. 17, Theorem
2.30 and Corollary 2.31 p. 20; LMS22 Proposition 3.3 pp. 7–8 and LMS22-CORR item (2); HU10 Lemma
2.13 pp. 14–15 (hypothesis `f ≥ 2`, as the §6.1 route says); BP12 Lemmas 3.4–3.5 p. 21, Lemma 3.8
p. 23, Corollary 3.12 p. 26, Corollary 5.6 p. 37, Proposition 13.1 p. 75, Corollary 13.2 p. 76;
DEG Lemma 4.2.1 (line 2193) under the paper's standing `p ≥ 5` (line 21); KOHLHAASE17 Proposition
3.9 (line 660); HAUSEUX Corollaire 4.2.4 (line 1342). All 16 cited works are in `sources.toml`;
SERRE-LRFG is settled as uncertified. The author flagged no locator as unverified.

**Duplication and ownership.** `IsTorsionAdmissible`, `IsFinitelyPresented`, `GL2ModScalar`,
`smoothDualSpan` occur in no other roadmap (`roadmaps grep`). Smoothness and the smooth
contragredient are SR's (*is-smooth*, *smooth-dual*), and the README says its two local copies exist
only so that the statements elaborate; acceptable, since SR is still a pull request and nothing can
be imported from it. Gelfand–Kirillov dimension: HilbertModularVarietiesAndShimuraCurvesPartII
(#1745) §5.1 consumes this roadmap's definition, it does not own one; "augmented Iwasawa",
"crossing algebra" and the Diamond boxes occur nowhere else. Mathlib at the pin: `Representation`,
`Representation.stabilizer` (`RepresentationTheory/Stabilizer.lean:27`), `Representation.ind` and
`IndV` (`Induced.lean:77, 59`, `k[H] ⊗_{k[G]} A`, which is compact induction for open `G`),
`IntertwiningMap` and `ker` (`Intertwining.lean:36, 138`), `Subrepresentation.toRepresentation`
(`Subrepresentation.lean:54`), `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean:45`)
with the `ℚ_[p]` instance (`Padics/LocalField.lean:24`), `𝒪[K]`, `𝓀[K]`
(`Topology/Algebra/Valued/ValuativeRel.lean:88, 94`),
`MvPolynomial.ringKrullDim_of_isNoetherianRing_of_finite` (`KrullDimension/Polynomial.lean:119`),
`RingTheory.Sequence.IsRegular` (`Regular/RegularSequence.lean:146`), `OrthogonalIdempotents`
(`Idempotents.lean:52`). Tau Ceti: `TauCeti.completedGroupAlgebra`
(`CompletedGroupAlgebra/Basic.lean:145`) and
`completedGroupAlgebra.IsCompactModule.completedGroupAlgebraModule` (`Module.lean:344`) exist.

**Suppliers and order.** Depcheck output:

```
depcheck: 230 roadmaps, 2271 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every cited supplier section resolves at the supplier's head or
on main: SR.0.1–0.4, SR.0d.1, SR.2.1 and the named targets (head 4178a1e, lines 618–2012); PLL
§§0.1, 0.3, 2.1–2.3, 2.7, 2.9, 5.1, 5.3 (head 84416ad); FFG R07.5.15 (head 9856719, line 8196);
PAI §3.7 (head 0f3131e, line 1270); NEI §§0.3, 0.5, 0.7, 0.8, 0.10, 0.11, 0.13, F.1 (head e311e48);
CCII §5.8 (line 1400) and F.1 (line 184) (head 1788162); DDPA §3.4 (head 1548fe7, line 627);
ClassFieldTheory Layer 7 (main, line 1312, `geometricArtinMap` at line 1365);
RepresentationTheory/QuiverRepresentations Layer 3 (main, line 270). The two declared gaps are in
`plan.json` and in the README's supplier contracts with the same slugs; each `needs` sentence is a
single precise statement with its hypotheses; neither is already provided (PLL §2.7 has no Ext
finiteness; FFG R07.5.15 has the classification but not Barthel–Livné's finite-codimension
statement). No unowned prerequisite: every *Needs:* item is a layer here, a resolved supplier
section or a pinned declaration (apart from R03–R05's naming slips).

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, Layers 0–9 each with `### Examples` and `### Dependencies`, Downstream consumers, Worked
examples, References. Every definition has an API list and at least three Checks (checked for the
13 definitions of §§0.1, 0.2, 0.3, 0.8, 2.1, 3.1, 3.2, 3.4, 3.5, 4.1, 4.5, 4.6, 6.4); every theorem
has its hypotheses in the sentence and a locator; Unicode mathematics, no LaTeX delimiters, no
numbering tables, no process words. The Conventions pin every normalisation with a witness
(`δ_P` absent, `ω_{f′}` via the geometric Artin map with the `f′ = 1` cyclotomic witness, the
`β(e ⊗ f) = h` sign, the `δ_{i+1}` branch rule, `Ord_B` with `Ind_{B̄}^G`).

## Not verifiable

- SERRE-LRFG (Part III, Chapters 14–15), cited in §5.4: uncertified, paywalled; cited by locator.
- VIGNERAS11 published numbering (Propositions 5.5–5.8 in ALM 19): only the arXiv text is cached;
  the README's version note records the discrepancy.
- The Emerton–Paškūnas appendix proving `R•Ord = H•Ord` for `GL₂(F)` (EMERTON2 line 1176): not
  cached; not needed for R02's route, which uses only the injection of Remark 3.7.3.
- BHHMS23 Corollary 7.3.4's proof subscripts (README §8.6 remark): not rechecked.

## Source issues

- **Error** in VIGNERAS11 at §5, Proposition 9, printed page 22: the source says the intersection
  `Δ_V(V₀)` of the two cell spans contains the `I₁`-invariants of any generating `V₀`; it should
  assume `V` admissible (Hu, Corollaire 3.9), since for `V = c-Ind_{KZ}^G V₀` the intersection is
  zero; affects a stated result.
- **Gap** in CDN23 at Proposition 1.30(b), printed page 21: the source says the Steinberg
  statement for `F ≠ ℚ_p` follows from Emerton's Theorem 4.2.12; it should give an argument for
  `F ≠ ℚ_p`, that theorem being stated for `GL₂(ℚ_p)` only (the `N₀`-cohomology of `St` vanishes
  in positive degrees for every `F`); affects the proof.
- **Misprint** in HU12 at proof of Proposition 4.4, printed page 36: the source says the
  intersection `I⁺(W₂,π) ∩ I⁺(W₂,π)` is finite-dimensional; it should be `I⁺(W₂,π) ∩ I⁻(W₂,π)`;
  affects nothing.
- **Error** in BHHMS23 at the remark after equation (44), printed page 55: the source says every
  nontrivial character occurs at most once in `F[[I₁/Z₁]]/𝔪³` under the standing `p > 3`; it should
  exclude `p = 5`, `f = 1`, where `α² = α^{−2}` occurs twice; affects a stated result (Lemma
  6.1.1(i) at `p = 5`), not the main theorems, whose genericity forces `p ≥ 7`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2fc9416e2d5d12ecee6aa9549b94398b52949b47", "job": "REV-PKG-ModpRepresentationsOfGL2OverLocalFields", "model": "fable", "worker": "chris-x19"} -->
