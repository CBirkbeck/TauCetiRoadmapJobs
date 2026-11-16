<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17370#issuecomment-6904940750 -->
Red team round 2 pass a (claude) of 84dde11

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the cocharacter limit raises the centralizer dimension; the sketch says it lowers it

   **Location.** `packages/SurfaceGroupCharacterVarieties/README.md:1806-1809` (§6.4, proof sketch):
   "a cocharacter limit into the closed orbit would lower the dimension of the centralizer, while its
   adjoint image is `GL(𝔤)`-conjugate to that of `Z` …, which preserves the dimension of the fixed
   space; a contradiction."

   **Claim.** Passing from a tuple with non-closed orbit to its cocharacter limit in the closed orbit
   lowers the dimension of the centralizer.

   **Witness.** `G = SL₂`, tuple `(diag(2, 1/2), [[1,1],[0,1]])`: centralizer `{±1}`, dimension `0`;
   its limit `(diag(2, 1/2), 1)` has centralizer `T`, dimension `1`. The orbit dimension drops
   (`3 → 2`), the centralizer dimension rises. BateMartinRohrle2005 line 873 has the same direction.

   **Repair.** Replace the quoted passage by: "a cocharacter limit `(z'₁, …, z'_m)` in the closed
   orbit has an orbit of smaller dimension, hence a centralizer of larger dimension, and so, every
   subgroup being separable, a larger fixed space on `𝔤`; but `𝔤` being a semisimple `Z`-module, the
   `GL(𝔤)`-orbit of `(Ad z₁, …, Ad z_m)` is closed by the `GL(𝔤)` case of the same criterion and
   contains `(Ad z'₁, …, Ad z'_m)`, so the two adjoint images are `GL(𝔤)`-conjugate and their fixed
   spaces have the same dimension; a contradiction". Tested on the witness: centralizer `0 → 1`,
   fixed space on `𝔰𝔩₂` `0 → 𝔱`; there `𝔰𝔩₂` is not a semisimple module for the Borel subgroup, so no
   contradiction arises, as it should not (the Borel subgroup is not `SL₂`-completely reducible).

One new finding, S01 (P3): a reversed inequality in a proof sketch. All five round-1 findings are
repaired at this head and no repair introduced an error. No statement of `Suggested.lean` and no
README target was found false, unowned or overclaimed.

## Round-1 findings at this head

| Finding | Status | Witness at 84dde11 |
|---|---|---|
| 1a/F01 (P2), invariant subalgebra exists at the pin | repaired | `packages/SurfaceGroupCharacterVarieties/README.md:411-414`: "no representation algebra of a finitely generated group with its conjugation coaction; the invariant subalgebra … is `TauCeti.ComoduleAlgebra.coinvariants`". §7.2 (`README.md:2010-2017`) defines `Hom//G` by `coinvariants` and cites `finiteType_coinvariants`; `Suggested.lean:56-61` names only the representation algebra as missing. Checked at the pin: `Algebra/Bialgebra/ComoduleAlgebra.lean` 136 (`coinvariants`), 171 (`range_le_coinvariants_iff`); `Algebra/Bialgebra/ComoduleAlgebra/LinearlyReductive.lean` 148 (`finiteType_coinvariants`, hypothesis `IsLinearlyReductive.{u,v,u} k H`, `[CommSemiring H]`, `[CommRing A]`, no smoothness); `linearlyReductiveCommHopfAlgProperty` unfolds to that hypothesis (`Algebra/AlgebraicGroup/LinearlyReductive.lean` 61-63). |
| 1a/F02 (P3), `Fuch` one component here, two in the source | repaired | `README.md:2187-2194`: "form a subset `Fuch⁺` … one of the two connected components that make up BCGGO2024's `Fuch(PSL₂ℝ)`"; `README.md:2233` "The locus `Fuch⁺` of §7.4". BCGGO2024 lines 2714–2718 read again: two components, either orientation. |
| 1b/F01 (P2), universal Hausdorff quotient never asserted Hausdorff | repaired | `Suggested.lean:343`: `T2Space (CharacterVariety Γ (⊤ : …)) ∧ ∃ q …`; the elaborated type carries the conjunct; docstring line 334-335 and `README.md:2033-2035` say "is Hausdorff and the closed-orbit map is continuous …". |
| 1b/F02 (P3), Layer 5 definitions wider in Lean | repaired | `README.md:1532-1535`: "The four definitions of this paragraph use no finiteness of `V` and are made, in `Suggested.lean` too, for every real inner product space; every theorem … takes `V` finite-dimensional". Elaborated types: four definitions without `[FiniteDimensional ℝ V]`, five theorems with it. |
| 1b/F03 (P3), convention witness value | repaired | `README.md:292-294`: "of squared norm `2 + t⁴`; as `t → 0` it tends to the identity, of squared norm `tr(1) = 2` … while as `t → ∞` the squared norm grows without bound". Recomputed: `[[1, t²],[0,1]]`, `1 + t⁴ + 1`. |

New text added by the repairs, recomputed: §4.1 coaction Check (`diag(λ⁻¹,1)·X·diag(λ,1)` has
entries `λ⁻¹x₁₂`, `λx₂₁`); §7.2 Check (`x ↦ x ⊗ t`, `xⁿ ↦ xⁿ ⊗ tⁿ`, coinvariants `k`; orbits `{0}`,
`k̄^×` on `k̄`-points). Both correct.

## Verified sound

Counts: 25 named declarations and 1 anonymous instance of `Suggested.lean` read (all 373 lines);
README read in full (2281 lines, 32 numbered targets, 33 Checks blocks, 169 Check and API bullets);
42 source locators re-verified at their lines (LandesmanLitt2024 2, BCGGO2024 4, Sikora2012 9,
BohmLafuente2021 17, BateMartinRohrle2005 10), none wrong; 70 Checks and convention witnesses
recomputed (values below); 31 pinned declarations opened at the pins; 42 sibling sections resolved
at main or at the open heads.

**Dependency check** (the brief's `gate --depcheck` command, on this head):

    depcheck: 237 roadmaps, 2241 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Elaborated signatures.** No Lean was run in this pass (read-only). The worker's `#check @name`
listing for this head was compared, declaration by declaration, with the README statements:
binders, instance arguments and universes agree. The four "dropped `[FiniteDimensional ℝ V]`"
leads are the four Layer 5 definitions, now matching README §5.4 (1b/F02).

### Suggested.lean, declaration by declaration

| Declaration (context) | Instances tried | Values on each side | Result |
|---|---|---|---|
| `innerAut_range_normal`, `Out` (`Γ` group) | `Q₈`; `ℤ`; `ℤ²` | `24/4 = 6`; `ℤ/2`; `GL₂(ℤ)`. Pins: only `ContinuousAut.normal_range_conj` and `TauCeti.ContinuousOut` (topological groups) | needed to state headlines; no pinned duplicate |
| `exists_outAction_iff_commute` | `Γ = H = F₂`, `ρ = id`; `H` abelian; `Γ = 1`; `Γ = F₂`, `H = S₃` | left: `a([conj γ]) = a(1) = id` forces `ρ(γ⁻¹δγ) = ρ(δ)`; `conj a · id = conj a⁻¹ ≠ id`; right false at `(a, b)`. Abelian: both true. `(φψ)·ρ = ρψ⁻¹φ⁻¹ = φ·(ψ·ρ)`, so the lift is a homomorphism | true both ways |
| `existsUnique_homeomorph_extension` (`X` compact `T2`, `P` finite) | `P = ∅`; `S²`, `{N, S}` end swap; `S¹`, two points; `p` isolated | `e = h`; rotation by `π`; hypothesis false (`U ∖ {p}` disconnected) and the one-arc reversal has no extension; `U = {p}` gives `∅`, not `IsConnected`, hypothesis false | true; uniqueness by density |
| `existsUnique_ambientIsotopy_extension` | `P = ∅`; constant isotopy; general | `Φ' = Φ`; constant; `⋂ cl F(I × (U ∖ {p}))` is compact connected in `I × P`, meets each slice, so is `I × {p}` (`t = 0`); extended total map a continuous bijection of the compact Hausdorff `I × X` | true; `AmbientIsotopy` at the pin has fields `isHomeomorph_total'`, `map_zero_left'` |
| `exists_outerAction` (`X` path-connected) | `f = id`, `δ = σ`; `S¹` conjugation and rotation; `T²` shear; composition | `[σγσ̄] = conj[σ]⁻¹`, class `1`; `−1`, `+1`; `[[1,0],[1,1]]`; `(fg)_{δ ⬝ fε} = f_δ g_ε` | true; homomorphism for `f * g = f ∘ g` |
| `pointwiseTopology`, `conjOrbit` | `Γ = F₂`; `ℤ/2 → SO(2)` | product topology of `G²`; `{±1}` discrete. No `TopologicalSpace (_ →* _)` instance at the pins | real bodies |
| `symmetricPart`, `IsRealReductiveLinearGroup`, `minimalVectors`, `linearOrbit` | `GL(V)`; `SO(V)`; unitriangular `N`; irrational line in `T²`; `V = 0` | `Sym(V)`, `M = {0}`; `0`, `M = V`; `K exp 𝔭 = 1 ≠ N`; polar but not closed; trivial | wrong model "𝔭 = 𝔤" excluded by `N`; matches BohmLafuente2021 lines 52–62 |
| `minimalVectors_eq_normMinimizers` | `(λx, λ⁻¹y)`; `ℝ_{>0}` on `ℝ`; compact `G` | `{|x| = |y|}` both sides; `{0}`; `V` | true (`d'(0) = 2⟨Av,v⟩`, `d'' ≥ 0`, line 417–418) |
| `isClosed_linearOrbit_iff`, `linearOrbit_inter_minimalVectors` | `(1,1)`, `(1,0)`, `0` for `(λx, λ⁻¹y)` | hyperbola closed, meets `M` in `{(1,1)} = K w`; half-axis not closed, misses `M`; `{0}` | true |
| `exists_tendsto_closed_linearOrbit` | `(ℝ_{>0})²` on `ℝ²`, `v = (1,1)` | `diag(−1,−1) ↦ 0`, closed; `diag(−1,0) ↦ (0,1)`, orbit not closed, not a witness | true; `atTop` is `t → +∞` as in line 82 |
| `existsUnique_closed_linearOrbit` | same; a closed orbit | `{0}`; `O = Gv` | true |
| `adjointRepresentation`, `IsReductiveRep` | `𝔾_m`; `SL₂` unipotent; `diag(2,3)` | trivial; nontrivial unipotent; `1, 1, 2/3, 3/2` | real bodies on `Derivation.adRepresentation` (pin: a `B`-linear representation of `WithConv (A →ₐ[R] CounitAlgebra R A B)`) |
| `isReductiveRep_tfae` (`H` real reductive finite type, `G` open, `Γ` f.g.) | `ℤ → SL₂(ℝ)`: rotation, unipotent, `diag(2,1/2)`; torus; `G^ℝ` proper open | all true; all false; all true; orbits are points; `G^ℝ` of finite index, its orbits open and closed in a closed `𝐆(ℝ)`-orbit | true; converse (b) ⇒ (c) recomputed: `R_u(Z⁰)` fixes a nonzero vector in each simple summand, so lies in `ker Ad = Z(G)` |
| `reductiveConjSetoid`, `CharacterVariety`, topology instance | `Γ = 1`; `ℤ → SO(2)`; `F_∞ → ℝ^×` | point; circle; `(ℝ^×)^ℕ` | real bodies |
| `characterVariety_t2_locallyCompact_secondCountable` | `ℤ → SL₂(ℝ)`; `F_∞`, `ℝ^×` | semisimple classes; not locally compact, excluded by `Group.FG` | true |
| `characterVariety_universalHausdorffQuotient` | `ℤ → SL₂(ℂ)`; `Z = ℂ`, `F = tr` | `𝒳 ≅ ℂ` Hausdorff; `q(unipotent) = q(1)`; `F' = tr` | true; `q` surjective, so `∃!` holds |
| `exists_outAction_characterVariety` (any `k`, `A`, `G`, `Γ`) | `𝔾_a`, `Γ = ℤ`; inner `φ` | `x ↦ −x`; `ρ ∘ conj γ⁻¹ = conj(ργ)⁻¹ ∘ ρ`, `ργ ∈ G` | true for every topology on `k` |

Padding probe: no declaration follows by one tactic or one pinned lemma, restates a definition or
mirrors a Check. The two proved bodies (the normality instance, the setoid) are needed to state
headlines. Headlines listed from the README Summary: non-descent (§1.3), extension over punctures
(§2.2), `Ψ_x` (§3.3), `H₂` description (§3.4), based non-descent (§3.5), real Kempf–Ness (§5.4),
six characterizations (§6.7), topology of `𝒳` and minimal-vector model (§7.1), complex comparison
and universal Hausdorff quotient (§7.2), outer and mapping class action (§7.4). Each is stated or
named in the module docstring with its missing carrier; the pins were searched again for a genus or
orientation of a topological surface, a Zariski closure of a set of points as a subgroup,
`G`-complete reducibility, a representation algebra and a character variety: none.

### README targets (values recomputed in this pass)

| Target | Instances and values | Result |
|---|---|---|
| Conventions | `(φψ)⁻¹ = [[1,−1],[−1,2]]`, `(ψφ)⁻¹ = [[2,−1],[−1,1]]`; `conj[u][γ] = [ū γ u]`; `(1,1)`-inversion of the relator | correct |
| §1.1 | `e φ e⁻¹ = conj(g φ(g)⁻¹) ∘ φ = φ ∘ conj(φ⁻¹(g) g⁻¹)`; `diag(1,−1)`-conjugate of `[[1,1],[0,1]]` is `[[1,−1],[0,1]]` | correct |
| §§1.2–1.3 | `Rep(ℤ, S₃)` 3 of 6; `Rep(ℤ/2, GL₂(ℂ))` 3; `Out(ℤ)` swaps the generators of `ℤ/3` | correct |
| §2.1 | `Mod^±(ℝ) = 2`; `S² ⊔ S²`: `8`, index `4`; path component claim by the exponential law both ways | correct |
| §2.2 sketch | open set `h(Σ ∖ (P ∪ U))` disjoint from `h(U ∖ {p})`; directed compact family with intersection `{q}` lies in any neighbourhood of `q` | correct |
| §2.4 | `aba⁻¹b⁻¹`: `d₂ = 0`; `aabb`: `ℤ ⊕ ℤ/2`; `nonorientable 5 0`: `ℤ⁴ ⊕ ℤ/2`; `aa⁻¹`: `H₁ = 0` | correct |
| §2.5 | conjugation by `diag(1,−1)` on `SL₂(ℤ)` inner would force a centralizing element of determinant `−1` | correct |
| §§3.1–3.2 | change of path, composition, inverse, identity laws recomputed; `f_δ = conj[η ⬝ δ̄]` from `f_η = 1` | correct |
| §3.4 | `z ↦ e^{2πi/g} z̄`: angle `2π(j+t)/4g ↦ 2π((3−j)+(1−t))/4g`; `(4i, 4i+2) ↦ (4j+3, 4j+1)`, `j ≡ −i`; `det` on `Λ²ℤ²` | correct |
| §3.5 | Burnside `(36 + 12 + 18)/6 = 11`; `(1 2)(2 3)(1 2) = (1 3)`; `M(ker ρ) = {b ≡ a}`, `ρ ∘ M⁻¹ = b − a`; `(0,3)` example fixes `p₁p₂` | correct |
| §§4.1–4.3 | `(t−1)²` over `𝔽₂`; `ℝ[t]/(2t)`; coaction entries; `G^{2g+n−1}` | correct |
| §5.2 | `J ḡ J⁻¹ = [[d̄, −b̄],[−c̄, ā]]`, fixed points `[[a, −b̄],[b, ā]]`; `F ∩ iF = 0`; `α = inv` for the two `𝔾_m` forms | correct |
| §5.3 | `u r_θ u⁻¹ = [[c+s, −2s],[s, c−s]]`, column lengths `1 + s(2c+s)`, `1 + 2s(2s−c)`; exponential-polynomial argument | correct |
| §5.4 | separating function `0`, `1`, limit `1/2`; weights `(1/2, 1/2)`; `diag(a,b)` limits | correct |
| §6.2 | `W_ℝ ⊗ ℂ ≅ W ⊕ W̄`; nilpotent ideal `rad(B) ⊗ k'` | correct |
| §6.3 | `O₂`: `ker Ad = SO₂ ≠ {±1}` | correct |
| §6.4 | directed family of identity components, normality of `C`, infinite-order point; complete-reducibility sketch | S01 |
| §6.6 | `τ(u) = u⁻¹`, `τZ = −Ad(u)Z`, so `exp(τZ/2) u exp(Z/2) = u`; `⟨iYw, w⟩ = 0` for real skew `Y` | correct |
| §§7.1–7.3 | `f(k'_n v_n) = f(k_n⁻¹ w_n)` tends to `0` and `1`; `𝔽₂[x+y, xy]|_{x=y} = 𝔽₂[x²]`; closed-embedding argument for `Γ' ↠ Γ` | correct |
| §7.5 | `(2,2,3) ↦ (2,2,1)`, `(2,3,4)`, `(2,1,2)`, commutator trace `3` each; `tr(A²B) = xz − y` | correct |

### Suppliers

Resolved at main or at the open heads, with the hypotheses the README restates:
TeichmullerGeometry §§0.0b, 0.0d, 0.0e, 0.0f, 0.0h, 4.2, 4.3, 4.4, 4.5, 5.4 (`dehn_nielsen_baer`:
compact connected, empty boundary, orientable, genus at least one, class of `f` fixing `x₀` to the
class of `mapOfEq f`), 5.4a, 6.1, and its 14 cited names; MordellLawrenceVenkatesh §§5.1, 5.4,
5.5, 5.6, 5.9 (`[p] ↦ [f ∘ p]`, monodromy by `(f⁻¹)_*`), 5.15, 5.17, 5.19 (`γ ↦ α * γ * α⁻¹`, "on
the torus `Push` is trivial"), 5.22; MappingClassGroupsAndCanonicalRepresentations §§0.1–0.3, 1.4,
2.1; NonabelianLevelStructures §§5.1, 5.2 (right action, anti-homomorphism, the three moves);
ArithmeticGaloisRepresentations §1.7 and the two named paragraphs of §1.11;
LanglandsParameterStacks §2.2; RealSemisimpleLieGroups §2.5 (an open pull request of another
author adding a new folder, an allowed supplier); LieGroups Layer 9 with `kakDecomposition`;
ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1; ReductiveGroupsPartII RG2.0.1, RG2.0a.2;
ComplexComparisonPartII C-1.1; FreeGroupsAndLimitGroups §§6.1–6.2; GeometricTopology Layer 1.7.2;
SymplecticGeometry/HamiltonianReduction R5. The four names the citation tool lists as found
nowhere are TeichmullerGeometry §0.0f's and occur there. No roadmap of the never-cite list is
named. The three declared gaps have the same slugs in `design/plan.json` and the README, each with
one statement and its hypotheses.

**Ownership.** Searched by object (character variety, representation scheme, Kempf–Ness, minimal
vectors, outer automorphism group, extension over punctures) on main, at the open heads through
the roadmap search tool, and at the pins: no second owner. The other roadmaps naming character
varieties name them as consumers or in references only. No declaration of `Suggested.lean` has the
fully qualified name of a declaration of a readable roadmap. The package is not a second copy:
main has no `SurfaceGroupCharacterVarieties` folder.

**Policy.** The pull request changes only `packages/SurfaceGroupCharacterVarieties/`. No `lemma`
keyword, `set_option`, `#eval`, `#check`, pull-request number or process narrative in the README or
the Lean file; one `import Mathlib` and four `TauCeti.*` modules; every target has a locator; every
definition has at least three Checks.

Source independence: 16 passages compared with 5 sources, none shared beyond statements the mathematics forces (BohmLafuente2021 lines 81–82 and 445–447); largest share BCGGO2024 and Sikora2012, 13 each of 73 source citations; contents compared with Sikora2012 (§§1–14) and BCGGO2024 (§§1–9): independent, since only Layers 4, 6, 7 touch Sikora2012 §§5, 3 and 7, 11, not in its order, and only §§5.2, 6.1, 7.1 touch BCGGO2024 §§2.3, 8.1.

## Not verifiable

- Richardson1988 Theorem 3.6 and Goldman1984 §1 (uncertified), RichardsonSlodowy1990 §§4, 7, 9,
  FarbMargalit2012 chapter and section locators, Knapp2002 Ch. VI §§1–2 (waived): cited by locator;
  the texts were not read.
- Elaboration: no Lean was run; the elaborated types are the worker's listing for this head.
- Ownership against open pull requests was checked through the roadmap search tool's index of
  2026-11-16 and the checkouts the brief lists, not beyond them.

## Source issues

- **Misprint** in BCGGO2024 at §2.3, printed page 10 (lines 471–472): the source says the real form `SO(p,q)` has two components whenever `p` or `q` is nonzero; it should be whenever both are nonzero, `SO(n)` being connected; affects nothing.
- **Misprint** in Sikora2012 at §11, printed page 18 (line 836): the source refers to Proposition 30 for closed orbits and complete reducibility; it should be Theorem 30 (line 572); affects nothing.
- **Misprint** in BohmLafuente2021 at the proof of Lemma 6.3, printed page 12 (line 520): the source calls the group `T = exp(𝔱)` a maximal abelian subalgebra; it should say `𝔱 ⊂ 𝔭` is a maximal abelian subalgebra and `T = exp(𝔱)`; affects nothing.
- **Gap** in BohmLafuente2021 at the proof of Lemma 6.5, printed page 13 (line 569): the source takes a vector of minimal norm in the orbit closure minus the orbit, an empty set when the orbit is closed; it should take one of minimal norm in the whole closure; affects the proof.

## For the human reviewers

- **Not tested.** Five of ten sources (Richardson1988, RichardsonSlodowy1990, FarbMargalit2012, Knapp2002, Goldman1984; 19 of 73 source citations) are cited by locator without text; wording and arrangement were not compared with them (`packages/SurfaceGroupCharacterVarieties/sources.toml`).
- **Licence.** `packages/SurfaceGroupCharacterVarieties/Suggested.lean:78-91` restates `OuterAut` of TeichmullerGeometry's open roadmap as `Out`, with the same one-line normality argument; no outside formalisation was found to match any declaration.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "84dde1105f52c0ed98bfd8f2f0d53d7f3777b210", "job": "RT-SurfaceGroupCharacterVarieties~2a", "model": "fable", "worker": "chris-x80"} -->
