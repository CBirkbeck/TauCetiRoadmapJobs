# Review of SmoothBanachRepresentations (pull request #1145 at 18e94ff)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** needs changes

The folder has not changed since `18e94ff` (0 lines), and its files stand as accepted there. All five findings are about the pull request's title and description, which were written for an earlier head (`a1c513cc`, 477 commits back).

## R01 (P3) — Title and opening sentence present the pull request as a revision, but it adds the roadmap
**Location:** Title "Share real/complex smooth tensors and correct seminorm comparisons"; description: "This retains the complete SB0–SB8 smooth Banach representation programme while giving the generic G-finite and locally convex tensor constructions one owner and correcting the torus seminorm comparison."
**Claim:** The roadmap is not on main and this pull request adds it, so nothing is retained, shared or corrected. The later sentence "Arbitrary strongly continuous real/complex Banach actions, … all-matrix inverse/holomorphic closure remain." has the same revision framing.
**Witness:** `git diff --stat origin/main...HEAD` lists only `README.md` (+577) and `Suggested.lean` (+251), with 0 deletions. Main has no `RepresentationTheory/SmoothBanachRepresentations`.
**Repair:** Title: "Add roadmap: smooth vectors in real and complex Banach representations". Opening sentence: "This adds the roadmap SmoothBanachRepresentations, which is not on main: README.md with Layers 0–8, and Suggested.lean with nine headline theorems." In the later sentence, replace "… remain." with "The roadmap plans arbitrary strongly continuous real and complex Banach actions, mixed generator domains, the full smooth Fréchet topology, support-controlled finite-sum Dixmier–Malliavin, exactness, contragredients, and all-matrix inverse and holomorphic closure."

## R02 (P3) — The torus paragraph describes content this head does not have
**Location:** Description: "The torus rapid-decay and derivative seminorm families define the same Fréchet topology through finite-order estimates Q_k≤C_k P_k and P_m≤D_m Q_(m+3), with the fixed 2πi normalization. Individual seminorms need not agree: at θ=0, 1+U₁ gives Q₀=1 and P₀=2."
**Claim:** The head states no torus seminorm comparison and gives that comparison to NoncommutativeGeometry N6. So this paragraph, and "correcting the torus seminorm comparison" in the opening, describe something this pull request does not add.
**Witness:** `README.md:13` says N6 owns "the two-sided finite-order comparison of its rapid-decay and derivative seminorms", and that "Layer 8 states the generic smooth-algebra theorems and no torus estimate". No other README line mentions the torus.
**Repair:** Replace the paragraph with: "The smooth noncommutative torus, with the comparison of its rapid-decay and derivative seminorms, belongs to NoncommutativeGeometry N6; Layer 8 states only the generic smooth-algebra theorems."

## R03 (P3) — The ownership paragraph contradicts the head's supplier contracts
**Location:** Description: "AFRG §2.1 owns the topology-free G-finite API and generic complex Banach density; CompactGroups supplies compact-group application witnesses" … "with its universal property, Banach comparison and Fréchet scalar-extension/balancing maps" … "SB8 → N6 is explicit."
**Claim:** Three statements contradict the head. The G-finite API and Banach density come from CompactGroups through a declared gap. The scalar-extension and balancing maps belong to §7.2a, not N1.Tensor. And Layer 8 does not supply N6.
**Witness:** `README.md:9`, :78: CompactGroups provides `gap:banach-gfinite-density` and AFRG §2.1 consumes it. :9, :84: §7.2a owns both maps (main NoncommutativeGeometry `README.md:19–22` agrees). Main NoncommutativeGeometry :104–106: Layer 8 is "not an input".
**Repair:** Replace the paragraph from "AFRG §2.1 owns" to "is explicit." with: "CompactGroups Layer 5 supplies, through the declared gap banach-gfinite-density, the topology-free finite-orbit-span API and complex Banach density. AutomorphicFormsOnReductiveGroups §2.1 extends them to complete locally convex spaces, and Layers 1–4 extend the complex smooth-vector theory of its §2.7. Layer 4 adds the real complexification and projection adapter, which carries density to the smooth topology. Tau Ceti's `CompletedProjectiveTensorProduct` carries the universal property, and NoncommutativeGeometry N1.Tensor owns the remaining tensor laws over ℝ and ℂ, including the comparison with BanachSpaceTheory B4. §7.2a owns the complexification isomorphism and the balancing quotient between real and complex tensors. §7.3 owns the diagonal action, the shuffle derivatives, the jointly continuous smooth-tensor map and its dense range. Supply runs from N1.Tensor to §§7.2a–7.3. N6 owns the torus and takes nothing from Layer 8."

## R04 (P3) — The build paragraph reports an earlier head, the wrong number of admissions, and files this pull request does not change
**Location:** "eight intended prototype admissions remain implementation targets. GitHub build passed for submitted head `a1c513cc…` … (12,298 Lake jobs, 8 intended admissions in this prototype, no errors). The tested README, prototype, topic and four build-configuration files match the recorded inputs."
**Claim:** The build it reports is for a head 477 commits older than this one. It gives the wrong count of `sorry` theorems, and it names files (a prototype, a topic, four build-configuration files) that the pull request does not change.
**Witness:** This head is `18e94ff`. `Suggested.lean` has nine `sorry` theorems (:119, :135, :144, :156, :175, :188, :205, :223, :240); `a1c513cc` had 11. `git diff --stat origin/main...HEAD` lists two files.
**Repair:** Replace everything from "The prototype and parent topic are unchanged" to "These admissions remain implementation targets." with: "`Suggested.lean` states nine headline theorems, each with `sorry`. At this head the targeted build of `TauCetiRoadmap.RepresentationTheory.SmoothBanachRepresentations.Suggested` passes, with `sorry` its only warning."

## R05 (P3) — The companion sentence calls NoncommutativeGeometry #1143 pending, but it has merged
**Location:** Description: "The companion N1.Tensor specification is in NCG #1143, exact 84190a1."
**Claim:** That pull request has merged and N1.Tensor is on main, so it is no longer a companion change.
**Witness:** Content main has commit `d770acc7`, "Resolve Hardy product orientation and share locally convex tensors (#1143)". Main NoncommutativeGeometry `README.md:481` has "### N1.Tensor". #1143 is not among the open roadmap pull requests.
**Repair:** Replace with: "NoncommutativeGeometry N1.Tensor, which §§7.2a–7.3 consume, is on main."

## Previous findings

- none: the review of `18e94ff` raised no finding of its own. The R01 it closed (from the review of `d7717e6`) stays repaired, since the folder has changed by 0 lines.

## Verified sound

| # | Statement | Instances and values computed | Result | Change |
|---|---|---|---|---|
| 1 | Description's torus claim (R02) against `README.md:13` | θ=0, a=1+U₁: Fourier coefficients 1, 1, so sup Q₀=1 (ℓ¹ sum 2); P₀=sup_x\|1+e^(2πix)\|=2 at x=0. The head states no Q_k or P_m. | True of N6; absent here | R02 |
| 2 | §7.2a balancing map (R03: the description gives it to N1.Tensor) | ℂ_ℝ⊗ℝℂ_ℝ (dim 4) → ℂ (dim 2): i⊗1, 1⊗i ↦ i; 1⊗1 ↦ 1; i⊗i ↦ −1. Kernel is span{i⊗1−1⊗i, 1⊗1+i⊗i}, dim 2. | True; owned by §7.2a | R03 |
| 3 | §7.2a complexification isomorphism | E=ℝ², F=ℝ³: dim_ℂ (ℝ²⊗ℝ³)_ℂ = 6 = dim_ℂ ℂ²⊗ℂ³. E=F=ℝ: (1⊗1)⊗1 ↦ 1⊗1; a rescaling by c≠1 gives c. | True | — |
| 4 | `gap:banach-gfinite-density` (R03) | K=∏C₂ on C(K,ℂ): f of r coordinates has orbit span of dim ≤2^r. K is not Lie, so only the CompactGroups gap applies. AFRG head :304, :310–311 agree. | Head consistent; description wrong | R03 |
| 5 | `smooth_lift` (summary: "lifting through surjective intertwiners") | Trivial actions, T=projection ℝ²→ℝ, w=1: v=(1,0) and Tv=1. F=0: v=0. Non-surjective T: ℝ→ℝ², w=(0,1): no preimage, and `hT` excludes this case. | True | — |
| 6 | `smooth_inverse` (summary) | Conjugation by diag(e^t,1) on M₂(ℂ), a=I+E₁₂: a⁻¹=I−E₁₂, orbit I−e^tE₁₂, smooth. The action is not star-preserving and no star hypothesis is used. Trivial action: every element is smooth. | True | — |
| 7 | `dixmierMalliavin` (summary: "support-controlled") | v=0: n=0, empty sum. One-point G, μ=m·δ, m>0: smear f w = m·f(1)·w; take f=1 and w=v/m, so tsupport f={1}⊆U. | True | — |
| 8 | Admission count (R04) | 9 `sorry`s in `Suggested.lean` and 9 sorry warnings when elaborated. The description says 8; `a1c513cc` had 11. | Description wrong | R04 |

The rows for statements this re-review did not touch stand as in the previous review, of `18e94ff`.

- **Gate.** The worker's gate at `18e94ff` is OK. My rerun with `--order` set to the candidate merge order and `--build` gives `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. Without `--order`, the configured order does not list the roadmap yet ("NOT IN ORDER … insert it after its last supplier"). By the brief that is not a finding: the candidate order lists it at line 61, after AutomorphicFormsOnReductiveGroups (60) and LocallyAnalyticDistributions (45).
- **Dependency check** (`--depcheck … --movable`, candidate order): `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives exactly 9 warnings, all "declaration uses `sorry`", at :119, :135, :144, :156, :175, :188, :205, :223, :240, and nothing else.
- **Diff.** The folder changed by 0 lines since `18e94ff`. Across the whole pull request, `git diff --stat origin/main...HEAD` lists only the two files of the folder, so the description's "changes only SmoothBanachRepresentations/" is true.
- **Summary block** (`roadmap-summary`). Checked sentence by sentence against `README.md:3`, :7, :19–23, :100, :324, :462, :495, :535–537, :561–567 and against the names in `Suggested.lean`. No contradiction found; "remaining tensor laws come from NoncommutativeGeometry" agrees with :60, which says the pinned tensor API enters through N1.
- **Cross-roadmap facts resolved.** NoncommutativeGeometry on main at `3cf7342`: :15–25, :98–106, :481, :1849–1853. AutomorphicFormsOnReductiveGroups at its open head: :54, :84, :304, :310–311, :523, :1312. `roadmaps grep` for this roadmap's name: its consumers (NoncompactQuantumSymmetry, CompactQuantumMetricSpaces, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, CompactGroupsPartII, BanachAlgebras on main) cite Layers and sections that exist at this head.
- Remark: the generated `revision-deps` block still names #1143, which has merged. Generated blocks are outside the text check.
- Overlap check: I read NoncommutativeGeometry (main), AutomorphicFormsOnReductiveGroups (open), CompactGroupsPartII (open; the passages citing this roadmap) and NoncompactQuantumSymmetry (open; the passages citing this roadmap). Shared objects and their owners: compact-finite density belongs to CompactGroups Layer 5 through the gap, with the locally convex extension in AutomorphicFormsOnReductiveGroups §2.1. The locally convex projective tensor belongs to Tau Ceti plus NoncommutativeGeometry N1.Tensor. The real–complex tensor comparisons belong to this roadmap's §7.2a, which main NoncommutativeGeometry :19–22 confirms. The torus seminorm comparison belongs to NoncommutativeGeometry N6. The Hilbert-adjoint statements belong to NoncompactQuantumSymmetry M0.
- Source independence: changed passages only. The diff changes no passage, so 0 passages were compared. The largest share is `casselman2016`, with 13 of 33 source mentions in the README. Contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- "Closes #1144" and "a separate independent review": the issue and that review are not among the texts this brief provides.
- The GitHub build of `a1c513cc` it reports was not rerun. This head was built instead (above).
- Dixmier–Malliavin, Bull. Sci. Math. 102 (1978) is uncertified in the manifest and was not read; no changed text cites it.

## Source issues

- none

## For the human reviewers

- The source with the largest share, `casselman2016` (`README.md:571`), is an expository note on its author's page, revision of 2016, and is not refereed. The refereed primary source, Dixmier–Malliavin 1978 (`README.md:577`), is recorded uncertified and was not read.
