# GATE-QuantumEnvelopingAlgebras~2: answers to human review

Review answered: CBirkbeck, 2026-11-03T08:23:06Z (AI review of `47df477`, findings F01–F07 = H01–H07).
Repairs are in commit `349aa668` on the pull-request branch (not pushed).

## H01 (CBirkbeck) — applied

Old: the odd branch assumed `ℓ` odd and coprime to every `dᵢ`, the even branch was separate, and `README.md` said there was "no Frobenius claim" for `B₂`/`G₂` at `ℓ = 2`. New (`TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md` Layer 5, lines 723–879):

- **5.1** gives order data for every root of unity: `L = ord(ζ²)`, `ℓᵢ = L/gcd(L, dᵢ)` (McGerty2006 line 335; Lentner2014 line 192), and Lusztig's modified datum `(X*, Y*)` with `aᵢⱼ* = ℓⱼaᵢⱼ/ℓᵢ` and `dᵢ* = ℓᵢ²dᵢ`.
- **5.2** is the odd nondivisible unital map (GrosKaneda2013 lines 57–84).
- **5.3** is the modified-algebra map for every order that is nondivisible (McGerty2006 Theorem 2.6, line 208, either parity) or satisfies Lusztig's conditions (McGerty2006 lines 332–339).
- **5.4** gives the half-algebra Frobenius sequences at every order (Lentner2014 Theorem 6.1, line 1116). It proves that, for the normalized symmetrizer, the only orders outside 5.3 are `B_n`, `C_n`, `F₄` at `𝓁 = 4` and `G₂` at `𝓁 = 3, 6`, and names the kernel and quotient types there.

The requested regression is the first Check of 5.1, computed: for `G₂` at `L = 3`, `ℓ = (3, 1)`, `A* = [[2,−1],[−3,2]]`, `d* = (9,3)` and `d₁*a₁₂* = −9 = d₂*a₂₁*`. That order is neither nondivisible nor Lusztig (`ℓ₂ = 1 < 2`), so it falls in 5.4. A correction to the old text: `G₂` at `L = 2` *is* covered, by McGerty's nondivisible theorem (McGerty2006 line 343). The only small even order left to 5.4 is `B₂` at `L = 2`, with `ℓ = (2,1)` and dual `A*`.

## H02 (CBirkbeck) — applied

`Suggested.lean` now states three new headlines:

- `exists_braidOperator` (line 397): an `AlgEquiv` with the generator values `braidImage`, for every symmetrizable datum.
- `braid_relation` (line 409): `braidWord T i j mᵢⱼ = braidWord T j i mᵢⱼ` whenever `aᵢⱼaⱼᵢ ≤ 3`.
- `quantumLucas` (line 141): for signed `m` at every `ζ` with `ζ²` primitive of order `l`, with McGerty's sign `ζ^(l(r₁m₀−m₁r₀)+(m₁+1)r₁l²)` (McGerty2006 Lemma 2.7, line 215).

These are built on the new definitions `gaussian`, `signedGaussian`, `specialize`, `CartanDatum.reflect` and `CartanDatum.braidLength`. The module docstring now lists every headline by layer and names the missing carrier for each one not stated.

The suggested `Ring.choose` right-hand side alone would be wrong at even order: `[3 choose 2]_i = −1`, while the sign-free formula gives `+1`.

Numerical evidence (Python, `q = 1.37`):

- **A₂, on V⊗V:** the braid images satisfy every defining relation, and the two length-3 words agree on all generators (error 2·10⁻¹⁵).
- **B₂, on V₅:** the relations are preserved and the length-4 braid relation holds (error 4·10⁻¹⁶).
- **B₂, on V₅⊗V₅:** the relations are preserved. The braid relation was not run on this module.
- **Negative control:** replacing `qᵢ^(−r)` by `qᵢ^r` in `Tᵢ(Eⱼ)` breaks the relations (error 4.2).
- **quantumLucas:** holds for all `m ∈ [−20,20]`, `r ≤ 14` and every primitive `N`-th root with `N ≤ 24`; the only mismatches were floating-point noise on values of about 10⁸.

## H03 (CBirkbeck) — applied differently

"The course" is gone. Locators were added where a legal text supports the claim:

| Claim | Locator |
| --- | --- |
| Presentation | Lentner2014 Definition 3.2 (line 387); McGerty2006 line 106 |
| Hopf structure | Lentner2014 Theorem 3.3 (line 430) |
| Braid operators | Lentner2014 Definition 3.4 (line 462) |
| Generic PBW | Lentner2014 Theorem 3.5 (line 474) |
| Restricted integral form | Lentner2014 Definition 3.6 (line 515) |
| Integral PBW with the `ε ∈ {0,1}` toral basis | Lentner2014 Theorem 3.8 (line 549) |
| `v = 1` target | McGerty2006 lines 278–281 |
| Lucas | McGerty2006 Lemma 2.7 |
| Odd-order Frobenius | GrosKaneda2013 lines 57–84 |

Lusztig1993 is cited by chapter only, and it is settled as uncertified.

No legal text in the manifest states the module-level isomorphism `V_A(λ) ⊗_(v↦1) ℤ ≃ V_ℤ(λ)`. The paywalled Lusztig 1988 paper (DOI 10.1016/0001-8708(88)90056-4) was tried through the sources service and came back uncertified, so no locator is guessed. Instead, 4.2 (line 674) now gives a complete integral route: `V₁(λ)` is free, so it embeds in `ℚ ⊗ V₁(λ) ≅ L(λ)` (LieHighestWeight Layers 3–5), and the image of `U₁^-·v` is `U_ℤ^-·v^cl` by 3.3. The proof says explicitly that it does not use character equality. The reviewer's `2ω` witness is a Check there: the lattice basis `x², 2xy, y²` has index 2 in the monomial lattice, and Φ has determinant 1 in the divided-power bases.

## H04 (CBirkbeck) — applied

The README is rewritten in the house shape:

- title, Summary, Scope and ownership, Conventions;
- Exact supplier contracts for Mathlib, Tau Ceti, KacMoody, RootSystems, LieHighestWeight, ReductiveGroups, QuantumGroups and SchubertGeometry;
- How to read the build;
- Layers 0–8, keeping the labels QEA0–QEA8 that consumers cite, each with `### k.n` subsections, *Needs:* lines, API bullets, at least three computed Checks, Examples and Dependencies;
- Downstream consumers.

The requested controls are included:

- the empty-root datum with `Y = ℤ`;
- `A₁` simply connected versus adjoint;
- `B₂` with `d = (1,2)` (giving `−2 = −2`) versus `d = (1,1)` (giving `−2 ≠ −1`);
- `qInt 1 1 = 0/0 = 0` (the field convention) versus the Laurent value `1` (0.2).

## H05 (CBirkbeck) — applied differently

`QuantumPlaneLatticeTargets.lean` is outside the files this job may edit, so it is unchanged and the README no longer mentions it. Its statements were not moved into `Suggested.lean`, for two reasons:

- They are worked rank-one matrix computations, which are examples, not headlines.
- `gaussian_first_root` is a special case of the new general headline `quantumLucas`.

The general statements live in README Layer 8.2. Deleting the companion file is left to the worker; the gate reports `stray-files=0` with it present.

## H06 (CBirkbeck) — applied

The Tau Ceti supplier contract (README line 114) now cites `kostantForm`, `instBialgebraKostantForm`, `instHopfAlgebraKostantForm`, `kostantFormComul_dividedPower`, `kostantFormComul_ringChoose`, `kostantFormBaseChange` and the weight-basis API. All were checked at the pin: `Form.lean:124`, `HopfAlgebra.lean:176` and `:303`, `Comultiplication.lean:232` and `:252`, `BaseChange.lean:68`, `Weight/Basis.lean:94–214`. The contract notes that `kostantForm` asserts nothing about its input families; ReductiveGroups §9A.1 supplies them, with `y ↦ H_y` on a basis of `Y` so that the empty-root torus is covered.

The docstring's explanation was wrong and is replaced. It now names the actual missing carriers:

- the rational pinned reductive Lie algebra of `(X, Y)` with its Chevalley families (ReductiveGroups §9A);
- the integral form `U_A` (the pins have no `ℤ[v,v⁻¹]`-algebra structure on `RatFunc ℚ`).

## H07 (CBirkbeck) — applied

The commit-pinned `blob/f536cbd…` link is replaced by the repository-relative `../ReductiveGroups/README.md#9a-the-full-reductive-integral-enveloping-form`, citing "ReductiveGroups, Layer 9 §9A". The heading was checked on main at ReductiveGroups README line 1109. The gate now reports `blob=0`.

## Interface note

The quantum Lucas theorem and the signed Laurent Gaussians moved from QEA6 to Layer 0 §0.3, because Layer 5 consumes them and a forward reference would be a gap. HabiroNahmSeries (open PR, README line 127) cites "§QEA6" for the signed Gaussian; that citation should become "Layer 0 §0.3 (QEA0)". The section label QEA6 still exists, so the resolver does not flag it.

## Ownership

Searched with `roadmaps grep`, by object:

- Drinfeld–Jimbo presentation, braid automorphisms, quantum Lucas, Gaussian binomials, quantum Frobenius at small orders.
- The only hits are KacMoody (this roadmap's supplier, whose Part II consumes it), QuantumGroups (the rank-one supplier) and HabiroNahmSeries (a consumer).
- No other owner exists for the full-`Y` algebra, the braid action, the signed Lucas theorem or the half-algebra sequences.
- The new Lean names do not collide with any fully qualified name in a readable roadmap. The companion file's `gaussian` is in a different namespace.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| `quantumLucas` | `ζ` of order `N ≤ 24`; `m ∈ [−20,20]`; `r ≤ 14` | LHS = RHS in all cases | holds; at even order the sign is needed: `[3 choose 2]_i = −1` vs sign-free `+1` |
| `quantumLucas` regression | `ζ³ = 1`; `[−3 choose 3]` | `−1 = binom(−1,1)` | Check added |
| `quantumLucas` degenerate cases | `ζ = −1` (`l = 1`); `[5 choose 1]` at a 5th root | `−2 = (−1)³·2`; `0` | Checks added; field characteristic analysed (holds via `Φ_N(ζ)=0`) |
| `signedGaussian` | `m = −1, −2` | `(−1)^r`; `−(v+v⁻¹) = [−2]` | agrees with the product formula (numeric, `m ∈ [−6,7]`) |
| q-Vandermonde (0.3 API) | `m, m′ ∈ [−5,5]`, `r ≤ 5` | 0 failures | kept |
| `qInt` junk value | `q = 1` | `0/0 = 0` vs Laurent value `1` | Check added; theorems keep `hfac` |
| `exists_braidOperator` on `A₂`, `B₂` | V⊗V; V₅; V₅⊗V₅ | relation errors ≤ 6·10⁻¹⁵ | holds |
| `exists_braidOperator` negative control | `qᵢ^(+r)` | error 4.2 | Check added |
| `braid_relation` | `A₂` (m = 3); `B₂` (m = 4) | errors 2·10⁻¹⁵; 4·10⁻¹⁶ | holds; `G₂` (m = 6) not computed (Lusztig1993 Ch. 39) |
| `Tᵢ(K_μ)` | `B₂` | `T₁(K₂) = K₂K₁²`; `T₂(K₁) = K₁K₂` | Check; swapping `aᵢⱼ`/`aⱼᵢ` gives `K₂K₁` |
| `T₁(E₂)` in `A₂` | expanded | `q⁻¹E₂E₁ − E₁E₂`; on V it acts as `−e₁₃` | sign fixed in my draft Check; the straightening relation with `−(α₁,α₂)=1` verified |
| Root order in `B₂` (`1212`) | computed | `α₁, 2α₁+α₂, α₁+α₂, α₂` | order corrected in draft |
| 5.1 order data, `G₂` | `L = 3`; `L = 2` | `ℓ=(3,1)`, `A*=[[2,−1],[−3,2]]`, `d*=(9,3)`; `ℓ=(2,2)`, Lusztig condition fails (2 < 4) | consistent with McGerty2006 line 343 |
| 5.1 order data, other types | `B₂` at `L = 2`; `A₁` with `d₁ = 2` at `L = 2` | `ℓ=(2,1)`, dual `A*`; `ζ₁* = −1` | Checks |
| 5.4 classification of orders outside 5.3 | `B/C/F`, `G₂`, all `L` | fails only at `L = 2` (`d∈{1,2}`) and `L = 3` (`G₂`) | the stated list matches Lentner's table; `G₂` at `𝓁 = 4` reassigned to 5.3 |
| 5.1 API on `X*` | adjoint `A₁` | index of `X*` in `X` need not be `∏ℓᵢ` | my draft's claim replaced by the kernel description |
| 5.2 API on the kernel | `L = p` prime | `ζ − ζ⁻¹` is not a unit in `ℤ[ζ]` | unsupported kernel claim removed |
| 4.2 route | `A₁`, `2ω` | lattice `x², 2xy, y²` (index 2 vs monomials); Φ has det 1 | rank-only route replaced by embedding plus generation |
| Antipode | `S²(Eᵢ)`; `S⁻¹`; wrong `S(E) = −EK⁻¹` | `qᵢ⁻²Eᵢ`; `S(−EᵢKᵢ⁻¹) = Eᵢ`; `(1−qᵢ²)Kᵢ⁻¹Eᵢ ≠ 0` | Checks |
| Bosonization `Δ_(B₋)(Fᵢ)` | rank one | `Fᵢ⊗Kᵢ⁻¹ + 1⊗Fᵢ`; wrong order gives `Fᵢ⊗1 + Kᵢ⁻¹⊗Fᵢ` | draft Check corrected |
| Pairing `p(E², F²)` | rank one | `(1+vᵢ⁻²)cᵢ²` from `r₋(F²)` | holds |
| Contraction / Steinberg | `A₁`, `L = 3` | `(L(ω)⊗L(ω))^(3) ≠ 0`; `dim L_ζ(4ω) = 4 < 5` | Checks |

The context check on `#check @name` was done for all 47 declarations: they were appended to `Suggested.lean`, the module was built once, and the lines were removed. All new declarations carry `hq`/`hfac` explicitly. `quantumLucas` carries `0 < l` and `IsPrimitiveRoot (ζ²) l`. `braid_relation` carries `i ≠ j` and `aᵢⱼaⱼᵢ ≤ 3`. No binder was lost. The five helpers flagged in `signatures.md` (`dividedPower`, `genE`, `genF`, `genK`, `counitGenerator`) mention no lattice and need none of the flagged instances.

## Build and gate

- `lake build TauCetiRoadmap.QuantumEnvelopingAlgebras.Suggested`: `Build completed successfully (8976 jobs).` with `sorry` warnings only.
- Gate: `gate QuantumEnvelopingAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 204 roadmaps, 1651 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Resolver: it lists `GrosKaneda2013 §1.3` and `McGerty2006 §2` as "no roadmap". Both are bibliography keys, not roadmap citations, so these are false leads.
