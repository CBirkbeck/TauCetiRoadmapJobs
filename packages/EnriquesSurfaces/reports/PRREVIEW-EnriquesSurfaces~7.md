# Review of EnriquesSurfaces (pull request #1286 at e852f4d)

**Verdict:** needs changes

:robot: Independent AI-assisted incremental re-review: 0 changed lines in the folder since e852f4d, which the previous review accepted. This round reads the pull request's title and description against the head. The title and the summary block agree with the head; three sentences of the description's prose do not. Nothing in the roadmap folder needs to change.

## R01 (P3) — the description counts files the head does not have

**Location:** pull request description: "The four Lean files give illustrative interfaces with prospective proofs admitted. This PR contains only the six files in EnriquesSurfaces."

**Claim:** The folder holds three files, one of them Lean, and that file is an acceptance test stating two headline theorems, not a set of illustrative interfaces.

**Witness:** `git ls-tree` at e852f4d: `README.md`, `Suggested.lean`, `metadata.toml`. `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean` has 10 declarations; the two with `sorry` are `reyeReductionImage` (`:81`) and `reyeCongruenceKernels` (`:97`).

**Repair:** Replace both sentences with: "`Suggested.lean` states the two headline theorems statable at the pins, the full image of the mod-two T246 reflection action and Cossec–Dolgachev's normal-closure description of its two congruence kernels, each with `sorry`; its docstring names the headlines that are not statable. This PR contains only `README.md`, `Suggested.lean` and `metadata.toml` in EnriquesSurfaces."

## R02 (P3) — the description names the wrong supplier of polarized formal effectivity

**Location:** pull request description: "Use SchemeAndStackFoundations #1276 for polarized formal effectivity and RootSystems #1278 for the generic Coxeter geometric representation."

**Claim:** At the head the polarized algebraization used by the Witt lift comes from AbelianSchemesAndArithmeticModuli A4.8, not from SchemeAndStackFoundations.

**Witness:** `TauCetiRoadmap/EnriquesSurfaces/README.md:9` and `:44` ("AbelianSchemesAndArithmeticModuli A4.8 supplies general polarized formal algebraization"); `:147` Needs. SchemeAndStackFoundations on main, `README.md:80–81`, puts polarized algebraization outside its scope.

**Repair:** "Use AbelianSchemesAndArithmeticModuli A4.8 for polarized formal effectivity, and RootSystems §§1.1–1.4 and §2.1 (on main) for the faithfulness, parabolic transport and integral realization of the native Coxeter geometric representation. The README names the other supplier contracts and their hypotheses."

## R03 (P3) — the K3 paragraph describes an exchange the head excludes

**Location:** pull request description: "K3 K7.C consumes the resulting E1 numerical lattice before supplying E6.U; its successor source links back to this exact Enriques edition."

**Claim:** At the head K3Surfaces consumes nothing from this roadmap, there is no K7.C, and the supplier is the K3Surfaces roadmap as cited in the README, not a commit-pinned "immutable source".

**Witness:** `TauCetiRoadmap/EnriquesSurfaces/README.md:11`: "no result consumed from K3Surfaces may use an Enriques numerical-lattice or automorphism theorem"; `:42` consumes "K0.A, K1–K6, K7.A–B and §7.3". K3Surfaces at its open head a23ff3a: Layer 7 is 7.1 (K7.A), 7.2 (K7.B), 7.3 only.

**Repair:** Replace the paragraph with: "K3Surfaces K0.A and K1–K2 supply the early inputs of Layer 1 (vanishing of global one-forms on the canonical cover, simple connectivity). K3Surfaces K6, K7.A–B and §7.3 supply Torelli, the independent integral involution model and the free/nodal period criteria to §6.2. K3Surfaces consumes nothing from this roadmap: the canonical-cover comparison is §6.2 U0 here, so the supply runs one way."

## Previous findings

- none: the previous report, of e852f4d, was an acceptance with no finding; its five repaired findings of the round before stand (the folder is unchanged).

## Verified sound

Adversarial table (the diff changes no statement; rows are for the statements the findings touch, recomputed in `scratch/compute.py` or by hand).

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 Witt lift through A4.8 (R02) | thickening W(k)/pⁿ⁺¹→W(k)/pⁿ; ample L on S | I=pⁿW/pⁿ⁺¹W≅k, square-zero; obstruction in H²(O_S)⊗I, h²(O)=p_g=0; W(k) p-adically complete Noetherian, as A4.8 requires | holds; none |
| §6.2 U0 one-way supply (R03) | e·f=1 in Num(S); A of M(2) | (π*e,π*f)=2; discriminant group (ℤ/2)¹⁰, order 1024=\|M/2M\|; needs only E1's lattice and K7.A's gluing criterion | holds; none |
| `reyeReductionImage` (R01) | all 1024 vectors, 10 generators | 9 edges; radical {0, {0,5,7,9}, {1,3,5,7,9}, {0,1,3}} with q=0,0,1,1; 512 vectors with q=1, 510 nonradical; orbit of e₀ has 510 elements; every generator preserves q and fixes the radical | consistent; none |
| `reyeCongruenceKernels`, existence of ρ (R01) | 90 ordered pairs i≠j | mod-two sᵢsⱼ has order 3 on the 18 adjacent ordered pairs, 2 on the 72 others; b(eᵢ,eᵢ)=0 so sᵢ²=1 | relations hold, ρ exists; none |

Every other row stands as in the previous review, of e852f4d.

- Description against the head: title and summary block agree with `README.md` (U⊕E₈(−1) outside characteristic 2 at §1.5; primes {2,3,5,7,17} at `:21`; T237 kernel at `:666`, `:691–697`; counts 34,780 and 136 at `:757`); the Chapter X sentence agrees with `:757`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean` gives exactly two `sorry` warnings (lines 81 and 97), nothing else; the ten signatures in `scratch/signatures.md` have no `variable` block to lose binders from.
- Gate: the worker's gate at e852f4d passes every check. The dependency check against the candidate order printed `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The gate rerun without the candidate order reports only `depcheck: NOT IN ORDER: EnriquesSurfaces (insert it after its last supplier)`, which is not a defect.
- Changes outside the folder: none (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Cross-roadmap citations re-resolved where a head moved: K3Surfaces is now at a23ff3a; K0.A (`:265`), Layer 1 (`:415`), §2.1 simple connectivity (`:535`), K6.A–B (`:774`, `:816`), K7.A (`:863`, swap Check `:899`), K7.B (`:1016`), §7.3 (`:1107`) all exist; AbelianSchemesAndArithmeticModuli A4.8 at its open head (`:2341`).
- Overlaps: the worker's file lists no other pull request changing this roadmap, no dropped id, no second copy (the roadmap is not on main).
- Overlap check: read EnriquesSurfacesAndIntegralNonexistence, K3Surfaces, RootSystems (main); nothing shared (K3Surfaces `:267` forbids itself any Enriques lattice input; RootSystems assigns the T246 application to this roadmap).
- Source independence: changed passages only; the diff changes no passage, 0 passages compared; arrangement not compared again (no layer added, removed or reordered).
- Sources: no locator changed; the seeded sample falls in no changed passage. The previous review's locator table stands.

## Not verifiable

- Averbukh, Chapter X of Shafarevich (ed.), *Algebraic surfaces* (1964): no legal text; the README keeps the relation behind 34,780 and 136 as a reconstruction target.
- Cossec–Dolgachev 1985, Proposition 1 (i): announced without proof in the text read; checked only as far as finite computation reaches.

## Source issues

- **Error** in stacks-0BXJ at Lemma 31.29.5 (tag 0BXJ), printed p. 70: the source says the Picard group of projective n-space over a UFD is ℤ with no restriction on n; it should require n ≥ 1, since projective 0-space is the base with trivial Picard group; affects a stated result.
- **Misprint** in stacks-0C5R at the proof of Lemma 54.17.1 (tag 0C5R), printed p. 52: the source says the maximal open V contains all codimension-one points of V; it should say of Y; affects the proof.

## For the human reviewers

- **Scope.** `reyeCongruenceKernels` (`TauCetiRoadmap/EnriquesSurfaces/Suggested.lean:97`) rests on Proposition 1 of `cossec-dolgachev-1985`, a research announcement that states it without proof (lines 62–72).
