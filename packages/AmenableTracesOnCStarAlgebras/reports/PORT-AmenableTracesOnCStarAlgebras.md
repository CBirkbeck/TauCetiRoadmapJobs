# PORT-AmenableTracesOnCStarAlgebras

## Result

- **Branch:** `roadmap/amenable-traces-on-c-star-algebras`, created from `42813dd`.
- **Head commit:** `da19de9bf1b75fd09aa9afd792c93c6aea45b7a8`, with the message
  "AmenableTracesOnCStarAlgebras: roadmap (README, Suggested.lean, metadata)".
- **Files:** only `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/README.md` (2353 lines),
  `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/Suggested.lean` (554 lines) and
  `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/metadata.toml` (`topic = "math.OA"`, the same form
  as `TauCetiRoadmap/CStarClassification/metadata.toml`). Nothing outside the folder changed.
- **Build:** `lake build TauCetiRoadmap.AmenableTracesOnCStarAlgebras.Suggested` exits 0 and ends
  with `Build completed successfully (18368 jobs).` It gives 23 warnings, all of them
  `declaration uses 'sorry'` (one for each theorem). There are no other warnings and no errors.
- **Gate:** `gate AmenableTracesOnCStarAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0
  sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check:** I ran it on the committed README; its complete output is

      depcheck: 212 roadmaps, 1918 edges, 0 problem(s)

  It reports no UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This pull request adds a roadmap for the trace-level finite-dimensional approximation theory of
C*-algebras. It covers tracial states of arbitrary C*-algebras, unital or not and separable or
not, together with their GNS data (vector trace, right representation, tensor functional) and
the normalized matrix trace and 2-norm. On these it defines the amenable, quasidiagonal and
uniform amenable traces and works through the main theorems:

- the Connes–Kirchberg theorem in its hypertrace, minimal-tensor-norm and completely positive
  extension forms, with Connes's Følner condition;
- the characterization of uniform amenable traces by injectivity of `π_τ(A)''`;
- the nuclear and exact cases;
- the face property and permanence under restriction, quotients, ideals and unitization;
- the commutative, AF and reduced-group examples, including amenability of `Γ` read off from
  the traces of `C*_r(Γ)`;
- the passage between quasidiagonal traces and quasidiagonal algebras, with Rosenberg's theorem;
- the necessity half of Schafhauser's AF-embedding theorem.

These traces are the hypotheses of the AF-embedding and quasidiagonality theorems of
classification theory, so the roadmap supplies the notions those theorems are stated with. It
consumes the completely positive, tensor, nuclearity, exactness and quasidiagonality layers of
CStarAlgebras and the state, standard-form and injectivity layers of VonNeumannAlgebras, and it
plans none of that material again. Tau Ceti's `0`-KMS state space is its tracial state space.

**Boundaries.** CStarAlgebras owns completely positive maps, C*-tensor products, nuclearity,
exactness and quasidiagonal algebras. VonNeumannAlgebras owns injectivity, Powers–Størmer and
the hypertraces of finite von Neumann algebras on `B(L²M)`. CStarClassification owns AF and UHF
algebras. OperatorAlgebraDynamics owns `ℂ ⋊_r Γ` and the canonical trace of the reduced free
group algebras. FactorRigidity owns relative amenability. This roadmap owns tracial states as
positive functionals on C*-algebras, the three approximation classes of traces and their
theorems. The C*-algebraic hypertraces of Layer 4 live on `B(H)` for an arbitrary faithful
representation, and §4.5–§4.6 compare them with V13b's.

**Lean.** `Suggested.lean` states 23 headline theorems against the pinned Mathlib and Tau Ceti,
on a tracial-state predicate that is Tau Ceti's `0`-KMS condition for the trivial action. Two
headlines are declared not statable at the pins, because their carriers are missing:

- the bimodule form of Connes–Kirchberg needs the right GNS representation;
- permanence under `⊗min` needs a minimal C*-tensor product.

## Roadmaps this one depends on that are still pull requests

None. Every supplier the README cites is on main:

- CStarAlgebras (C2.1, C2.8, C4.1, C4.2, C5.1, C5.2, C5.4, C6.1, C6.2, C6.5, C7.1, C8.1–C8.4,
  C9.1, C9.7);
- VonNeumannAlgebras (V0–V6, V8, V8.RegularL2, V13a, V13b.SpatialNorm, V13b);
- CStarClassification (CL2 §2.1, CL3 §3.4–§3.5);
- OperatorAlgebraDynamics (D2, D2.FreeGroups);
- FactorRigidity (§2.2), cited for a remark only;
- BanachSpaceTheory (B1).

I checked each section on main and its content matches the contract. FactorRigidity stands
after this roadmap in `merge-order/ORDER.txt`, but it is on main, so the dependency check
accepts the edge.

The open revision of VonNeumannAlgebras drops none of the ids cited here
(`scratch/overlaps.md`, and the README's hypertrace and V-section citations checked against main).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already has the required form, so it is ported
byte-for-byte:

- **Headlines:** one module docstring, and 23 headline theorems, each with `sorry`.
- **Definitions:** each one is needed by a headline and has a real body on native carriers.
- **Instances:** four, with real proofs, needed for von Neumann algebras and generated
  C*-algebras to elaborate as `StarOrderedRing` C*-algebras.
- **Forbidden content:** none. There is no sorry'd data, padding, `set_option`, `lemma`,
  `#check` or `example`.
- **Imports:** `import Mathlib` and three `TauCeti.*` modules, each used.

I compared the headlines against the README's Summary:

- **Stated:** every end theorem the Summary lists.
- **Declared not statable:** the bimodule form of Connes–Kirchberg and `⊗min` permanence.
  - I confirmed that the pin has no minimal C*-tensor product: Mathlib's only `minTensorProduct`
    is for pointed cones.
  - I confirmed that it has no right GNS representation.
- **Missing:** I found no headline that is statable but absent.

**Binder check.** I appended `#check @TauCetiRoadmap.AmenableTracesOnCStarAlgebras.<name>` for
all 46 declarations to a temporary copy of the file, elaborated it once with the build command,
and then restored the file.

- Every elaborated type matches its README statement.
- Four declarations drop a section binder: `IsFaithfulTrace`, `IsHypertrace` and `IsFoelnerTrace`
  lose `[StarOrderedRing A]`, and `IsAF` loses both order instances. None of their bodies uses
  these binders, and every theorem carries its own binders.
- Nothing needed changing.

The same temporary block also `#check`ed the 57 Mathlib names the README cites (and 7 Tau Ceti
names), and all of them resolved at the pins. I located the other Tau Ceti names in the files
the README gives (all 44 cited library paths exist at the pins). Mathlib's GNS file lists the
cyclic vector only as a TODO, which confirms the README's statement that Mathlib has no
cyclic-vector theorem.

## Supplier replacements and duplication removals

**Supplier replacements: none needed.** The README already consumes the pinned declarations
rather than restating them:

- Tau Ceti's `0`-KMS state space, GNS vector, `VonNeumannAlgebra.adjoin`, density theorem,
  `traceRadical`, Frobenius inner product, trace duality, `TauCeti.Amenable` with `of_lpTop` and
  `not_amenable_freeGroup`, `CovariantRepresentation.regular`, and the character-space measure;
- Mathlib's `CompletelyPositiveMap`, `CStarMatrix`, GNS, `Unitization` order and approximate
  units.

**Restated notions.** The Lean restates six notions of earlier roadmaps on native carriers:

- `IsNuclearMap` restates CStarAlgebras C6.1;
- `IsQuasidiagonalSet` and `IsQuasidiagonal` restate C8.1;
- `IsInjective` and `IsNormalState` restate VonNeumannAlgebras V13a and V4;
- `IsAF` restates CStarClassification §2.1;
- `generatedCStarAlgebra` restates OperatorAlgebraDynamics D2.FreeGroups.

`Suggested.lean` cannot import another roadmap, and the headlines need these notions to be
statable. The README presents each one as a restatement of its owner, not as a target of this
roadmap. Each one has a distinct fully qualified name in `TauCetiRoadmap.AmenableTracesOnCStarAlgebras`.

**Duplication sweep.** I searched by object on main and in the open roadmap pull requests
(`roadmaps grep`), and read the closest roadmaps (CStarAlgebras, VonNeumannAlgebras,
CStarClassification, OperatorAlgebraDynamics, FactorRigidity, AmenableGroups). The search terms
were:

- "amenable trace", "quasidiagonal trace", "uniform amenable trace", "Connes–Kirchberg",
  "Schafhauser";
- "hypertrace", "tracial state", "Rosenberg", "Følner", "weakly nuclear", "Lance".

What the sweep found:

- **Tracial states:** used elsewhere only as hypotheses. OperatorKTheory, TemperleyLiebOperatorAlgebras,
  NoncommutativeIntegration, OperatorAlgebraDynamics, FreeProbability and TypeAHeckeAlgebras use
  them that way. VonNeumannAlgebras V5 has its tracial states on von Neumann algebras.
- **Hypertraces:** only VonNeumannAlgebras V13b, on main and at its open revision. These are the
  von Neumann hypertraces on `B(L²M)`, which the README distinguishes from its own (§4.5–§4.6).
- **Rosenberg:** only a one-line remark in CStarClassification §5.6's Checks.
- **The other terms:** no other occurrence on main or in any open pull request.

So nothing is removed and "Scope and ownership" stays as in the package. One trim was made:
§1.7 listed VonNeumannAlgebras V13b.SpatialNorm under *Needs:*, but V13b.SpatialNorm only uses
the same separation argument for vector states. The *Needs:* line and Layer 1's Dependencies no
longer list it, and the text keeps it as a comparison.

## Fixes from the reviewer's read of the README

1. **§7.2: API and Checks for `IsAF`.** `IsAF` had neither an API list nor any Check that tests
   the definition itself.
   - Added an API list: agreement with CStarClassification §2.1, the unitization criterion,
     separability (used by §8.5), existence of a tracial state, and the trace theorem.
   - Added two Checks. `C[0,1]` is not AF, since its only finite-dimensional star subalgebras are
     `0` and `ℂ1`, yet its traces satisfy the conclusion through §7.1. The zero algebra is AF and
     `T(0) = ∅`.
2. **§8.1: API and Checks for `IsQuasidiagonalSet` and `IsQuasidiagonal`.** Neither had an API
   list or a Check that tests the definitions.
   - Added an API list: agreement with CStarAlgebras C8.1, the universe being immaterial for
     separable `A` by C8.3, and the theorem.
   - Added three Checks:
     - a diagonal operator is quasidiagonal, with `P_n` commuting exactly;
     - for the unilateral shift, `(SP_n − P_nS)e_{n−1} = e_n`, so `‖[S, P_n]‖ = 1`, and a
       quasidiagonal isometry is unitary;
     - both clauses are needed: without the vector clause `P = 0` witnesses every set, and
       without injectivity the zero representation would make every algebra, the Toeplitz
       algebra included, quasidiagonal.
3. **§8.2: locator.** brown2006 Proposition 4.3.7 (line 1952) is stated for tracial states; the
   generalization to every state is in its proof (line 1956). The locator now says so.
4. **§6.2: open question.** "Whether `AT_QD(A)` is a face is not asserted" now reads that
   brown2006 (line 1269) leaves it open and that this roadmap makes no claim about it. The source
   says: "We are not sure about the other four sets".
5. **§1.7: *Needs:* line.** Trimmed as described above.
6. **Summary: link to the Lean file.** The Summary now links [Suggested.lean], as main's roadmaps
   do, and says which two end theorems lack carriers at the pins.

I spot-checked 46 brown2006 line locators against the cached source text, along with
schafhauser2020 lines 66–85 and tikuisis-white-winter2017 lines 53, 359, 362, 376, 431, 456,
458, 461 and 471. Apart from item 3, every locator says what the README attributes to it.

## Adversarial mathematics pass

Values computed this round, together with the values in the package's red-team record that I
recomputed.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| `IsTracialState` | `A = 0`; `M_2`, `x ↦ x₁₁`; `Tr` on `M_2` | norm `0 ≠ 1`; `e₁₂e₂₁ ↦ 1`, `e₂₁e₁₂ ↦ 0`; `‖Tr‖ = 2` | all excluded; none |
| `IsFaithfulTrace` | `ℂ ⊕ ℂ`, `pr₁`; `M_2`, `tr_2` | `N = 0 ⊕ ℂ`; `tr_2(x*x) = Σ|x_ij|²/2` | discriminates; none |
| `matrixTrace`, `matrixTwoNorm` | `e₁₁ ∈ M_2`; `k = 0` | `1/2`, `2^{-1/2}` vs Frobenius `1`; `0⁻¹·0 = 0` | junk value harmless; none |
| `gnsVonNeumannAlgebra` | `(c₀, Σ2^{-n}δ_n)` | `‖1̂ − ê_m‖² = 2^{-m}`; `M_τ = ℓ∞ ∋ 1 ∉ π_τ(c₀)` | nonunital case right; none |
| `IsAmenableTrace` normalization | `φ_m(a) = τ(a)1_m/m` on `M_2`, `(e₁₂, e₂₁)` | defects `1/(2m)` (norm, normalized 2-norm), `1/(2√m)` (HS); recovery error `1 − 1/m` | normalized definition rejects it; none |
| `IsUniformAmenableTrace` | `C(𝕋)`, roots of unity | `‖tr∘φ_n − λ‖ = 2` (mutually singular) | separates from AT witnesses; none |
| `isAmenableTrace_unitization_iff` | `A = ℂ`, `φ = (1−δ)id` | functional value `−δ` at `(1/2, −1/2)`, norm `1/2`: factor `2` | true, constant sharp; none |
| hypertrace form | `ℂ²` diagonal, `(t, 1−t)`; vector state at `(1,1)/√2` | `ψ = tT₁₁ + (1−t)T₂₂` central; `ψ′(e₁₁e₁₂) = 1/2 ≠ 0` | true; none |
| extension form | `(ℂ², pr₁)` on `ℂ²` | `Φ(T) = T₁₁`, `Φ(1) = 1`, `Φ|_A = pr₁` | true; none |
| tensor form `ρ` of `Aᵐᵒᵖ` | `M_n`, `(e_ij, e_ji)`, `ρ(b) = bᵀ` | `Σ τ = n²/n = n`; `Σ e_ij⊗e_ij = n·P`, norm `n`; flip norm `1 < n` | convention pinned; none |
| `IsFoelnerTrace` | `P = e₁₁`, `T = e₁₂`; `L²(𝕋)`, `P_n`, `M_z` | `‖e₁₂‖²_HS = 1 = 0 + 1`; `‖[M_z,P_n]‖²_HS = 2 < εn` for `n > 2/ε` | formula right; none |
| Følner iff, general position | `ℂ²` diagonal, `(1/3, 2/3)` | rank one: `2·(1/3)(2/3) = 4/9`; rank two: `1/2 ≠ 1/3` | `hess` needed, present; none |
| `IsInjective` | `H = 0`; `M_n` | zero map, norm `0`; identity, norm `1` | no norm-one claim; none |
| `IsNormalState` | `ℓ∞`: `Σ2^{-n-1}x_n`, `lim_U` | `1 − 2^{-m-1} → 1`; `0 ↛ 1` | discriminates; none |
| `isAmenableTrace_iff_isInjective` | `L(F₂) ⊕ ℂ`, `τ = pr₂` | amenable, not injective, `τ((1,0)) = 0` | `hf` needed, present; none |
| `…_iff_isAmenableTrace_gns` | `c₀`; `σ′ = τ″ + lim_U` | `σ′(p_m) = 1 − 2^{-m} → 1 ≠ 2 = σ′(1)`; `|tr φ(1) − 2| ≥ 1` | `hn` needed, present; none |
| `IsNuclearMap` | zero map, `n = 0`; `id_{B(ℓ²)}` | holds; fails (weakly nuclear only) | as intended; none |
| commuting-range lemma (§5.1) | `β = id_{M_2}`, `y_kl = e_lk` | `Σ e_kl e_lk = 2·1` against flip norm `1` | commutation needed; none |
| exact TFAE | `C*_r(F₂)`; `C*(F₂)` | all four false; regular trace amenable, `L(F₂)` not injective | exactness needed; none |
| face theorems | `C*_r(F₂) ⊕ ℂ`; `ℂ²`, `(1/2,1/2)` | `AT = {χ∘pr₂}`; `P = e₁₁` | true; none |
| normalized restriction | corner `M_3 → M_4`; `c = 1/2` | `(3/4)·(tr_3)~ + (1/4)χ₀`, at `1_{M_3}`: `3/4`; `(3/2)tr_3` not a state | `c` forced; none |
| `isAmenableTrace_of_comp_surjective` | `ℂ → C*_r(F₂)`; `ℂ³ → ℂ²`, `τ = (1,0,0)` | `id_ℂ` UAT vs `τ_{F₂}` not AT; `ker q ⊊ N_τ`, `γ = (1,0)` AT | surjectivity needed, faithfulness not; none |
| ideal extension | `c₀ ⊆ c`; `C*(F₂) → C*_r(F₂)` | truncation mass `2^{-m}`; amenable ↦ non-amenable | `hι` needed, present; none |
| commutative, AF | `C[0,1]`, `f = x`; `M_2 ⊕ ℂ`; `C[0,1]` not AF | `(n+1)/(2n) → 1/2`; `(Tr x + 2λ)/4`; stages ⊆ `ℂ1` | true; added the non-AF Check (§7.2) |
| `IsQuasidiagonalSet` | `diag(d_n)`; unilateral shift | `[D, P_n] = 0`; `(SP_n − P_nS)e_{n−1} = e_n`, norm `1` | discriminates; added Checks (§8.1) |
| `IsQuasidiagonal` | zero representation | range `{0}` quasidiagonal | injectivity needed; added Check |
| group TFAE, Rosenberg | `1`, `ℤ`, `S₃`, `F₂` | `Tr(λ_g) = 6, 0` on `S₃`; `τ_ℤ = ∫z^n dm`; `F₂` all false | true; none |
| `of_lpTop` hypotheses | uncountable discrete `Γ` | needs `IsMulLeftInvariant` only, real `L∞`, no σ-finiteness (`Linfty.lean:159`) | §7.3 route valid; none |
| translation convention | `ℤ`; `S₃`, `(12)`, `(23)` | `λ_1M_{δ_0}λ_1* = M_{δ_1}`; `λ_gδ_h = δ_{(123)}`, `r_gδ_h = δ_{(132)}` | matches Tau Ceti `(L_g f)(x) = f(g⁻¹x)`; none |
| QD ⇒ QD trace | `SO₂`; Toeplitz | no trace (unit needed); QD traces, algebra not QD | true; none |
| faithful QD trace ⇒ QD | Toeplitz; `ℂ²`, `(1/2,1/2)` | traces not faithful; `‖a‖ = ‖diag(a,b)‖` | `hf` needed; none |
| `subalgebra_isAF_simple` | `M_3 ⊆ M_4 ⊆ CAR`; `ℂ ⊕ ℂ`; `C(𝕋) ⊆ C(2^ℕ)` | `c = 3/4`, `tr_3`; `pr₁` not faithful; Bernoulli ↦ Lebesgue | simplicity needed; none |
| §2.1 2-norm unitalization | `(1−h)² ≤ 1 − h²` for `0 ≤ h ≤ 1` | iff `h² ≤ h`; defect constant `2 + 2 + 2 = 6` | sound; none |
| §2.1 norm unitalization | `δ ≤ 1/8`; `V = diag(1, 1/10)` | small eigenvalues `≤ (1−√(1−4δ))/2 ≤ 2δ` (`0.146 ≤ 0.25`); `‖D − Q‖ ≤ 0.155`; `1 ≤ 0.99 + 17·0.0099 = 1.158` | sound; none |
| §2.2 defect bound | `x ↦ x₁₁`, `(e₁₂, e₂₁)` | both sides `1` (`d₂(φ, e₂₁) = φ(e₁₁) = 1`) | attained; none |
| §2.3 identity | `P = e₁₁`, `T = e₁₂` | `d₂(φ_P,T) = 0` (`T*(1−P)T = 0`), `d₂(φ_P,T*) = 1` | sound; none |
| §2.4 Ozawa, `min` vs `max` | `diag(1/3, 2/3)`; rank one | `min`: `1/3 = tr φ(e₁₁)`; `max`: `2/3 > 1/3`; `2(1−c²) ≤ 2(1−c²)^{1/2}` | sound; none |
| §4.2 Mazur step | `Tr((uh_λu* − h_λ)T) = Tr(h_λ(u*Tu − T)) → ψ(u*Tu) − ψ(T) = 0` | weak null in `S₁(H)` | sound; none |
| §5.2 variance Check | `C[0,1]`, `f = t`, interval `1/n` | `1/(12n²)` | sound; none |
| §8.4 stable finiteness | isometry `v ∈ M_n(C*_r(F₂))` | `(τ⊗tr_n)(1 − vv*) = 0` | sound; none |

## Ownership and open pull requests

- **Open roadmap pull requests.** Ownership against them was checked through the `roadmaps`
  tools (grep at their heads, overlaps). No open pull request adds an owner of amenable,
  quasidiagonal or uniform amenable traces, of Connes–Kirchberg, or of tracial states of
  C*-algebras.
- **Overlap report.** `scratch/overlaps.md` lists no pull request that changes this roadmap, no
  dropped id this README cites, and no id defined only by an open revision.
- **Downward moves.** Nothing moved down from a later roadmap.

## Unresolved

- **brown2006 numbering.** The README cites the arXiv v2 numbering, as the manifest records. I
  did not compare it with the published Memoir.
- **Background sources.** `kirchberg1993` is uncertified and `connes1976`, `brown-ozawa2008`,
  `paulsen2002` and `pedersen2018` are waived. The README cites them by locator, as background
  only.
- **Script blocked by the hook.** During editing, one local text-reflow script was refused by the
  PreToolUse hook ("Raw network tools and remote shells are not allowed"). The script used no
  network. I made the same edits with the editor instead.
- **Untrusted text.** No suspicious instructions were found in the package, the reviews or the
  roadmaps I read.


Pull request: #2260 (roadmap/amenable-traces-on-c-star-algebras at da19de9)
