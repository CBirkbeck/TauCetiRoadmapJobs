# GATE-FactorRigidity~1: answers to the review of `00c5ce8`

All points come from one review comment (CBirkbeck, 2026-10-28, findings F01–F08 and the "Verified sound" section). The repairs are in commit `c45bc70e` on the pull-request branch, which has not been pushed.

## H01 (CBirkbeck) — applied

F01: `TauCetiRoadmap/FactorRigidity/Suggested.lean` was rewritten as the acceptance test. It now states three headline theorems with `sorry`:
- `relativePropertyT_inl_slTwo`: relative property (T) for `(ℤ²⋊SL₂(ℤ), ℤ²)`.
- `relativePropertyT_inl_of_not_isAmenableDiscrete`: the same for `(ℤ²⋊G, ℤ²)` with `G ≤ SL₂(ℤ)` nonamenable.
- `hasHaagerupProperty_freeGroup`: the Haagerup property for `FreeGroup ι` with `ι` countable, which covers `F_n` for `2 ≤ n ≤ ∞`.

Five definitions with real bodies support them: `HasAlmostInvariantVectors`, `RelativePropertyT`, `slTwoAction`, `IsAmenableDiscrete` and `IsPositiveDefinite`, plus `HasHaagerupProperty`. The module docstring says that `F(L(ℤ²⋊F_n)) = {1}`, Bernoulli strong rigidity and solidity/primeness of `L(F_n)` cannot be stated at the pins, and names the missing carriers: group von Neumann algebra, crossed product, amplification, spatial tensor product. These declarations were deleted: `CommutingActions`, `WeaklyContained`, `traceTwoNorm`, `RelativePropertyT` (the old operator-algebra version), `cp_traceTwoNorm_le`, `MatrixIntertwiner`, `HasSpectralGap` and the five proved lemmas.

The repair differs from the suggested one in a single respect. Unitarity is stated as norm preservation, `∀ g v, ‖ρ g v‖ = ‖v‖`, instead of through `IsUnitary`. The two Tau Ceti pins disagree on its namespace:
- The branch's `lake-manifest.json` pins Tau Ceti `a91d3aa`, which has `TauCeti.ContRepresentation.IsUnitary`.
- The brief's pin, `358314d`, has `ContRepresentation.IsUnitary`.

Norm preservation is equivalent to `IsUnitary` through `isUnitary_iff_norm_map`, which both pins have, so the file elaborates against either pin.

## H02 (CBirkbeck) — applied

F01 also says that `cp_traceTwoNorm_le` is not a headline and is stated more generally than the README, and that the old `RelativePropertyT` holds vacuously for `τ = 0`. Both declarations were deleted. Layer 3.3 of the README keeps the operator-algebraic relative property (T) as prose, for faithful normal tracial states and normal CP maps (Anantharaman–Popa, Definition 14.2.1, p. 242). Layer 4.2 keeps the subunital Schwarz contraction as an API bullet. The new group-level `RelativePropertyT` has no trace parameter, so the `τ = 0` degeneracy cannot occur.

## H03 (CBirkbeck) — applied

F02: the README's descent lemma (Layer 8.3) now carries Popa's hypotheses:
- an orthonormal basis `{1}∪{b_n}` of `Ã` over `A` satisfying condition (4.2.1), `lim_(g→∞) sup_(y∈A,‖y‖≤1) ‖E_A(b_i* y σ_g(b_j))‖₂ = 0`;
- a properly outer, mixing action of `Γ` on `Ã` that leaves `A` invariant;
- the condition that no corner of `P` embeds into `Ã`.

This follows popa-strong-rigidity-i lines 1078–1084 (Lemma 4.5) and line 1040 (condition (4.2.1)). The route now cites Proposition 3.3 (lines 1087–1093).

Three Checks were added:
- the trivial-action enlargement `A⊗̄D` with `x = 1⊗d`, which is the reviewer's counterexample;
- the coordinate computation showing that (4.2.1) holds for the Bernoulli basis element `1⊗z`;
- the case `P = A`, which shows the no-corner hypothesis is needed.

Layer 8.3 also states that the diffuse-base Bernoulli enlargement satisfies (4.2.1) (Lemma 4.3, lines 1048–1057).

## H04 (CBirkbeck) — applied

F03, imports: lines 5–14 were replaced by the single line `import Mathlib`. The Tau Ceti import was dropped because the file no longer uses `IsUnitary` (see H01). The gate now reports `imports=0 mathlib-subimports=0 no-import-mathlib=0`.

## H05 (CBirkbeck) — applied

F03, pull-request number: the line "AmenableGroups, PR #821" was removed. AmenableGroups is on main, and it is now cited by name and layer:
- in Scope and ownership, as AmenableGroups Layers 1–5;
- in the supplier table, which names `Mean`, `Amenable`, the Layer 3 free-group obstruction and the Layer 5 Følner criteria;
- at every use, for example Layer 3.2.

The gate reports `prnum=0`.

## H06 (CBirkbeck) — applied

F04: every item is covered by the rewrite.
- The namespace is now `TauCetiRoadmap.FactorRigidity`.
- No docstring carries a process label: there are no R-numbers and no "suggested forms" or "prototype" wording.
- The padding lemmas are gone. These were `joint_tmul`, `weaklyContained_refl`, `map_right_corner`, `map_left_corner` and `size_pos`.
- `HasSpectralGap` was deleted, so its dropped `[CompleteSpace H]` no longer matters. Spectral gap stays a README target in Layer 3.4.
- No declaration uses section variables; every binder is in its own signature.
- Every Lean name now appears in the README, and the gate reports `readme-ids-missing=0`.

I elaborated `#check @…` for all nine declarations by appending the checks temporarily and running one targeted build. The elaborated types match the README statements:
- `RelativePropertyT : {Γ : Type v} → [Group Γ] → Subgroup Γ → Prop`, with the Hilbert-space universe as a separate parameter;
- `relativePropertyT_inl_of_not_isAmenableDiscrete : ∀ G, ¬IsAmenableDiscrete ↥G → RelativePropertyT SemidirectProduct.inl.range`;
- `hasHaagerupProperty_freeGroup : ∀ (ι : Type u_1) [Countable ι], HasHaagerupProperty (FreeGroup ι)`.

No binder was missing, so nothing needed changing after the check.

## H07 (CBirkbeck) — applied

F05: the README was recast in house shape with these sections:
- `# Roadmap: …` with a `**Summary.**` paragraph, Scope and ownership, Conventions, Exact supplier contracts, How to read the build;
- `## Layer 1` through `## Layer 10`, keeping the R-numbers, with `### k.n` subsections, a `*Needs:*` line per target, and `### Examples` and `### Dependencies` in every layer;
- Downstream consumers and References.

Every definition has an API bullet list and at least three `**Checks.**`. These include the `ℂ⊕ℂ` example, the vacuum state on `B(L²(L(F₂)))`, `R⊗̄R`, and the Sanov subgroup with the index computation `6·2 = 12`. Locators now sit at each claim, and I checked the page numbers against anantharaman-popa-ii1. For example, Theorem 17.1.1 is on p. 281 (line 12260), Theorem 18.3.2 on p. 297 (line 12947), and Lemma 19.1.5 on p. 306 (line 13336). The lines "The definitive specification is this README / Suggested.lean prototypes …", "corrected", "retain" and the R-labels were removed.

One factual point in the finding is wrong: `ORDER.txt` lists HilbertModules at line 240 and does not list FactorRigidity at all. So the HilbertModules edge is not an upward citation; the depcheck places FactorRigidity after its last supplier.

## H08 (CBirkbeck) — applied

F06: "Theorem 4.2 Steps 1–5" now reads "Steps 1–5 of the proof of Theorem 4.1". "the regular-rigid reduction of Theorem 4.2" now reads "the reduction of Step 7 of the proof of Theorem 4.1 (with Lemma 3.5)". This is in Layer 8.4 and in References.

The evidence: popa-strong-rigidity-i line 928 states Theorem 4.1, lines 942–1029 contain its Steps 1–7, and line 1035 is Definition 4.2. The old wording followed a slip in the source itself, whose proof of 4.4(i) (line 1105) writes "the first 5 Steps of the proof of 4.2".

## H09 (CBirkbeck) — applied

F07: the supplier table and Scope and ownership now name the supplier as "VonNeumannAlgebras (the roadmap of that name with the modular-theory and injectivity layers V0–V13)". It is cited section by section: V2, V3, V4, V5–V6, V7, V8 including `V8.BernoulliArbitraryDiscrete`, V11, V12, V13a–V13b.

I checked the citations at the head of that roadmap:
- V11's trace-preserving expectations onto every subalgebra are at its line 2056.
- Lusin–Novikov is at line 769.
- `V8.BernoulliArbitraryDiscrete` is at line 1306.
- The V13b minimal-norm criterion is at line 2559.

The operator-foundations VonNeumannAlgebras proposal has only V0–V4, so it would not satisfy these citations.

## H10 (CBirkbeck) — applied

F08: Layer 8.3 now uses VonNeumannAlgebras `V8.BernoulliArbitraryDiscrete` for finite atomic bases: cylinder density, ergodicity, mixing, proper outerness and the II₁ crossed product. It owns only what that target lacks: the general standard base, the tail algebras, clustering, and the diffuse-base sub-s-malleable enlargement with (4.2.1). Layer 3.4's Bernoulli cylinder decomposition also starts from that target.

## H11 (CBirkbeck) — disputed

The "Verified sound" section says that none of the supplier roadmaps cites FactorRigidity. That is not the case, though no cycle results:
- VonNeumannAlgebras README lines 772, 2249 and 2261 refer to "FactorRigidity R6" and "R7" as owning the p.m.p. specialization and cost.
- OperatorKTheory README line 780 refers to "FactorRigidity R4" as owning proper length and Haagerup kernels.

Both are ownership pointers, not supplier citations. The layer numbers 4, 6 and 7 are unchanged, so those pointers still land on Layers 4.1, 6.2 and 7.1. The new Downstream consumers section records both.

## Build and gate

- `lake build TauCetiRoadmap.FactorRigidity.Suggested`: `Build completed successfully (8976 jobs)`. There are three `declaration uses 'sorry'` warnings, at lines 83, 91 and 114, which are the three headline theorems. There are no other warnings.
- Gate: `gate FactorRigidity: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`, with `depcheck: NOT IN ORDER: FactorRigidity (insert it after its last supplier)`.
- Depcheck (`--movable`), full output:

  ```
  NOT IN ORDER: FactorRigidity (insert it after its last supplier)
  depcheck: 162 roadmaps, 1153 edges, 1 problem(s)
  ```

  There is no UPWARD or CYCLE line. The only problem is the not-in-order note: FactorRigidity is not listed in `ORDER.txt`, which the brief says is not a defect for a roadmap at the design stage. It is the gate's only failing rule.

## Ownership, moves, sources

- **Ownership.** I ran `roadmaps grep` over main and the 388 open heads for property (T) and Kazhdan, the Haagerup property, positive-definite functions, intertwining, cost and fundamental groups. No other roadmap plans these objects. `IsAmenableDiscrete` is a local definition needed only to state Burger's theorem; the README defers amenability theory to AmenableGroups and says that `IsAmenableDiscrete G` is AmenableGroups' `Amenable G` under the discrete topology. No declaration in `Suggested.lean` shares a fully qualified name with a readable roadmap.
- **Moves.** No notion was moved down and no later roadmap is cited.
- **Sources read.**
  - anantharaman-popa-ii1 (author page) and popa-strong-rigidity-i (arXiv math/0305306) were fetched through the sources service.
  - Popa, Strong rigidity II, and Gaboriau were not re-read; their locators are unchanged from the reviewed head.
  - The roadmap folder has no `sources.toml`, and this job may edit only `README.md` and `Suggested.lean`, so no manifest entry was written.
  - No text was missing, and no `needs-references.toml` was written.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `RelativePropertyT Λ` (Lean, Def 14.1.1) | `Λ = ⊥`; finite `Γ`, `Λ = ⊤`; `Γ = Λ = ℤ` | `⊥`: an almost-invariant unit vector is `{1}`-invariant, so it holds. Finite `Γ`: averaging an `ε < 1` invariant unit vector gives `‖η − ξ‖ < 1`, so `η ≠ 0` and it holds. `ℤ`: `ℓ²(ℤ)` has Følner vectors `|I_n|^(-1/2)1_(I_n)` and no invariant vector, so it fails. | matches the literature | Checks added (Layer 3.1) |
| Wrong model: a `Γ`-invariant conclusion | `(ℤ²⋊SL₂(ℤ), ℤ²)` | It would mean property (T) of `ℤ²⋊SL₂(ℤ)`, which surjects onto infinite Haagerup `SL₂(ℤ)`, so it fails | the chosen definition is the right one | Check added |
| `slTwoAction` direction | `g = [[1,1],[0,1]]` | Column convention: `(0,1) ↦ (1,1)`, `(1,0) ↦ (1,0)`. Row convention: `(0,1) ↦ (0,1)`, `(1,0) ↦ (1,1)`. | the Lean `toLin'` is the column convention | witness Check added |
| `IsAmenableDiscrete` | trivial group; `ℤ`; `F₂` | trivial: `m f = f(1)` works, so it holds. `ℤ`: a Banach limit works, so it holds. `F₂`: paradoxical, so it fails (AmenableGroups Layer 3). | correct | Checks added |
| `relativePropertyT_inl_of_not_isAmenableDiscrete` | `G = ⊤`; `G` unipotent `{[[1,n],[0,1]]}` | `⊤`: nonamenable because it contains Sanov's `F₂`, giving the first theorem. Unipotent: `ℤ²⋊ℤ` is amenable, and its regular representation restricted to `ℤ²` is a multiple of `ℓ²(ℤ²)`, with no invariant vector, so relative (T) fails. The hypothesis is needed. | true (AP Ex 14.2.8, line 10796) | negative-control Check added |
| `IsPositiveDefinite` | `n = 0`; `n = 1`; `⟨ξ,π(g)ξ⟩` | `n = 0`: the sum is `0 ≥ 0`. `n = 1`: `|c|²φ(1) ≥ 0`, which forces `φ(1)` real and `≥ 0`. `Σ conj(cᵢ)cⱼ⟨π(gᵢ)ξ,π(gⱼ)ξ⟩ = ‖Σ cⱼπ(gⱼ)ξ‖² ≥ 0` | the convention is consistent with the conjugate-linear first slot | convention stated in Conventions |
| `HasHaagerupProperty` | finite `G`; `ℤ`; `F_∞` unweighted; `SL₃(ℤ)` | finite: cofinite `= ⊥`, so `φ = 1` works. `ℤ`: `e^(−t|n|)` is PD and `c₀`, with value `e^(−t) → 1`. `F_∞`: `{|g| ≤ 1}` is infinite, so the unweighted length is not proper, while the weighted length is. `SL₃(ℤ)`: has (T), so the property fails. | matches AP Def 16.1.1 net form | Checks added |
| `hasHaagerupProperty_freeGroup` with `[Countable ι]` | `ι = ∅`, `Fin 1`, `ℕ` | trivial group: holds. `ℤ`: holds. `F_∞`: weighted tree length is CND and proper, so it holds. Uncountable `ι` is excluded: it is not claimed by the source. | true | README states every countable rank |
| Descent lemma (Layer 8.3) | trivial-action `A⊗̄D`, `P = L(Γ)`; `P = A`; Bernoulli `b = 1⊗z_h` | First case: `x = 1⊗d ∈ P'`, `x ∉ M`, and `E_A(b*yσ_g(b))` is independent of `g`, so the old statement was false. `P = A`: `Ax = xA`, `x ∉ M`, so the no-corner hypothesis is needed. Bernoulli: `E_A(z̄_h y z_(gh)) = 0` for `gh ≠ h`, so (4.2.1) holds. | statement now true with Lemma 4.5's hypotheses | fixed and Checks added |
| Quantitative intertwining criterion (Layer 5.2) | diffuse `P ⊆ fMf`, `τ(f) < 1/2`, `Q = ℂ`; `ε = 1` with `L⟨a⟩, L⟨b⟩` | Absolute bound `≤ τ(f)^(1/2) < 2^(−1/2)` but `P ⊀ ℂ`. Scaled bound for `u` with `τ(u) = 0`: `‖u − E_Q u‖₂ = τ(f)^(1/2)`, so `ε ≥ 1` is needed. `ε = 1`: the bound `‖x − E_Q x‖₂ ≤ 1` holds but `P ⊀ Q`. | the scaled criterion with `ε < 1` is correct, since `‖E_Q u‖₂² ≥ (1−ε²)τ(f) > 0` | Checks replaced |
| Weak containment (Layer 1.3) | `ℂ⊕ℂ`, `z = e⊗fᵒᵖ`; `M = ℂ`; `M₂(ℂ)` multiplicities | `‖z‖_min = 1`, `π_coarse(z) ≠ 0`, `π_id(z) = 0`. `M = ℂ`: `H≺K ⇔ K ≠ 0 ∨ H = 0`. `M₂(ℂ)`: `2·(ℂ²⊗ℂ²) ≺ ℂ²⊗ℂ²` without embedding. | correct | a wrong first-draft Check was fixed before commit |
| Cost (Layer 7.1) | rotation-orbit relation with classes of size `n`; `C(R) = 2`, `t = 1/2` | `1 − 1/n` both by the formula and by the `n−1` translations of measure `1/n`. `C(R^t) = 1 + (2−1)/(1/2) = 3`, against `4` from the wrong formula `C/t`. | consistent with AP Thm 18.2.3 (line 12909) | Checks added |
| Sanov subgroup (Layer 7.3) | ping-pong; index | `A^k(x,y) = (x+2ky, y)`; `|x| < |y|`, `k ≠ 0` gives `|x+2ky| > |y|`; index `[SL₂(ℤ):Γ(2)]·[Γ(2):F₂] = 6·2 = 12` | correct | Checks added |
| Strong rigidity (Layer 9.1) | `θ = id`; character `χ(a) = −1` on `F₂` | `id`: `u = 1`, `χ = 1`, `δ = Δ = id`. `θ^χ`: an inner `u ∈ L∞(Y)` would be an eigenfunction `u∘h = χ(h)u` of a weakly mixing action, which is impossible, so `χ` cannot be absorbed. | the decomposition needs `χ` | Checks added |
| Primeness and solidity (Layer 10) | `R⊗̄R`; `M₂⊗L(F₂)`; `L(F₂)⊗̄L(F₂)`; `L(⟨a⟩) ⊆ L(F₂)` | `R ≅ R⊗̄R`, so not prime. `M₂` is not diffuse, so the example is allowed. `L(F₂)⊗1` has diffuse commutant and is nonamenable, so not solid. `L(⟨a⟩)` has diffuse commutant `L(⟨a⟩)` and is amenable, which is consistent with solidity. | correct | Checks added |
