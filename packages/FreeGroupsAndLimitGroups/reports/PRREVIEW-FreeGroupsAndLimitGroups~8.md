# Review of FreeGroupsAndLimitGroups (pull request #2221 at 2838433)

**Verdict:** accepted

No finding at this head.

## Previous findings

- The previous review, of `e193732`, had no finding; there is nothing to carry.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §7.2 word `x x⁻¹`, unused variable | empty system, `X={x}` | words: `x x⁻¹`; members: empty table (`x=1`), `(z,z⁻¹)` with `U=(w,w⁻¹)`, `P_x(U)=w` for every reduced `w≠1` | `x` takes every value of `F(A)`; §7.3(3) holds where it failed before | none |
| §7.2 "`P_x(U)` reduced as written" | `x y z⁻¹` with table `(z₁, z₂, z₂⁻¹z₁⁻¹)` plus `z z⁻¹`, `U=(a,a⁻¹,…)` | word of `z` in `z z⁻¹` is `()` or one item; `()` against two items needs a base with `α=β`, excluded by §7.1 (`α(μ)<β(μ)`); one item `h` forces `h=a a⁻¹` graphically, impossible | the uncancelled tuple is no longer a solution | none |
| §7.2 total length `N` | `x=a`; `x≠1`; empty system with `X={x}` | `2+0+2=4` (`x a⁻¹`, `x x⁻¹`); `1+3+2=6` (`x z⁻¹`, `z z⁻¹`, `x x⁻¹`); `0+0+2=2` | equals word length plus `3|T|+2|X|`; `z_t` not counted twice | none |
| §7.2 bounds in `N` | IFT lines 888–891 | `|V_ij|≤l_i−1`, so items `≤∑l_i(l_i−1)≤N²` and `|P_x|≤|H|`; table count needs `|A|`: `(a,a⁻¹)` per letter | as stated | none |
| §7.2 Check `x=a` | tables `(a,a⁻¹)`, `(a,a⁻¹)` | items `h₁…h₄=a,a⁻¹,a,a⁻¹`; `V₁₂=a⁻¹` forced by IFT condition 3), `V₁₁=a` by condition 1); `P_x=h₁`, value `a` | four items, word map `x=h₁` | none |
| §7.2 Checks `x≠1`, `x²=a` | `x=1`; `x=a` in `x x a⁻¹` | `x=1` gives empty `z_t`, excluded; `x²=a` has no solution, so by §7.3(2) no member has one, with or without `x x⁻¹` | hold with the new words | none |
| §7.3(2), (3) for every variable | `x≠1` with `W(x)=a`; `x y=a b` with `W=(1,ab)` | six items `(a,a⁻¹,a,a⁻¹,a,a⁻¹)`, `P_x(U)=a`; `x`-words all empty, `P_x=1`, `P_y(U)=ab` | `W=P(U)`; matches IFT Lemma 14(2)–(4), lines 975–983 | none |
| §7.3 constrained solutions, "exactly when" | constrained `x` occurring once, items `(a,a⁻¹)`, sub-basis `{b}` | without `x x⁻¹`: value `1∈⟨b⟩`, items use `a`. With it: the word is a base side, reduced, and a reduced word of `⟨B⟩` uses letters of `B` only | equivalence holds; the negative control is correct | none |
| §7.3 `π_Ω : F_{R(S)} → F_{R(Ω)}` | member `(z,z⁻¹)` of the empty system | `F_{R(S)}=F∗⟨x⟩`, `F_{R(Ω)}=F∗⟨h₁⟩` (`h₂=h₁⁻¹`), `x↦h₁` | an `F`-homomorphism on all of `X`; no `X₀` left in §§7.2–7.3 | none |
| §7.10 sketch (cites the item count of the family) | `n_i >` maximum item count times `|S|` | the count is taken over the family, so it includes the items of the words `x x⁻¹`, `z_t z_t⁻¹` | still sufficient | none |

The rows for statements this change leaves untouched stand as in the previous review, of `e193732`.

- Source locators checked against the text: 3, in IFT: §4.2 partition tables (lines 884–891, p. 20), Lemma 13 (lines 897–904, p. 21), Lemma 14 (lines 970–983, pp. 22–23). No sampled target falls in the changed passages (§§7.2, 7.3); §7.8 does not cite them.
- Passages citing the changed text read at this head: README:1723 (§7.1, `α(μ)<β(μ)` and "reduced as written"), :1878 (§7.10), :2125, :2675; no `X₀` of §7.3 or "no word map" remains.
- `Suggested.lean` is unchanged since `e193732`; `lake env lean` gives 12 `sorry` warnings and no other diagnostic.
- Gate rerun at this head: every check 0, OK (the worker's run also built the module, `build=0`). Depcheck: `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`.
- No file outside the folder changed; `d31b59b` is an ancestor of this head.
- Pull request text read against this head: the summary sentence on `x x⁻¹`, items 1–3 (trivial words for every variable, `N` = word length plus `3|T|+2|X|`, the four-item Check, the constrained equivalence) and "§7.3 (2), (3) and `π_Ω` read as in IFT Lemma 14" agree with it.
- Overlap check: read SurfaceTopology, RandomGraphs, GraphConnectivityAndFlows; nothing shared with the changed passages (no other roadmap, open or on main, states generalised equations or partition tables). #2205 changes the same folder and merges first, as the description states.

## Not verifiable

- [JSJ] Lemma 4.7, [RECOMP] and [MAK], on the unchanged Sources line of §7.2: not reopened this round; the changed sentences were checked through IFT §4.2.

## Source issues

- **Error** in IFT at Lemma 13(1), p. 21: the source says the number of partition tables depends only on `|S(X,A)|`; it should also depend on `|A|`, since `x x⁻¹=1` has a table `(a,a⁻¹)` for each letter `a`; affects a stated result.
- **Gap** in IFT at Lemma 14(2)–(3), pp. 22–23: the source gives a word map `P_x` and `W=P(U)` for every `x∈X`; it should treat variables with no occurrence, since the empty system with `X={x}` has one member without items; affects a stated result.
- **Gap** in IFT at §4.2, construction of `Ω_T`, p. 21: the source gives constant bases only to the constant letters of the system; it should also fix each letter of `A` inside a variable's table word (`x a⁻¹=1`, table `(a,a⁻¹)`, `U=(b,a⁻¹)`); affects a stated result.
